#!/usr/bin/env python3
"""Los lectores de datos de Salamander y sus formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado:

  p00:4D16  rachas a la VRAM (HL = destino, DE = origen): n == 0 acaba;
            n < 0x80 repite el byte siguiente n veces; n == 0x80 trae otro
            destino (2 bytes, p00:4D10); n > 0x80 copia n & 0x7F bytes.
            p00:4CE5 lo mismo tres veces (los tres tercios, +0x800).
  p00:4D10  igual, con el destino delante (2 bytes).
  p00:4CF5  lista a la VRAM: [destino lo hi] y bytes; 0xFE trae otro destino
            (2 bytes); 0xFF acaba. p00:4D0C lo mismo escribiendo ceros
            (C = 0: borra lo que la lista dibujaria). p00:4CFD sin el
            destino delante (lo pone quien llama en HL).
  p00:4540  lista de caracteres (IX, de la tabla HL[A] por p00:4E28): fichas
            de 6 bytes [tercios][dibujos lo hi][caracter][colores lo hi],
            cada puntero a unas rachas de p00:4D16 (los dibujos van a
            0x2000 + 8 x caracter y los colores a 0x0000 + 8 x caracter, en
            cada tercio marcado); 0 en el primer byte acaba.
  p00:44F3  lista de copias VRAM -> VRAM (IX, de la tabla HL[A]): fichas de
            4 bytes, o de 3 si los dos bits altos del tercer byte no son
            cero; 0 acaba.
"""
import bloques as B


# ---------------------------------------------------------------- formatos

def rachas(v, a):
    """p00:4D16. Devuelve el final (detras del 0)."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n == 0x80:
            a += 2
        else:
            a += n & 0x7F


def rachas_con_destino(v, a):
    """p00:4D10: [destino lo hi] y rachas."""
    return rachas(v, a + 2)


def lista_vram(v, a, con_destino=True):
    """p00:4CF5 / p00:4D0C / p00:4CFD."""
    if con_destino:
        a += 2
    while True:
        x = v(a)
        a += 1
        if x == 0xFF:
            return a
        if x == 0xFE:
            a += 2


def lista_caracteres(v, a, sitio):
    """p00:4540: fichas de 6 bytes hasta un 0; declara las rachas de cada una."""
    ini = a
    k = 0
    while v(a) != 0:
        dib, col = v.w(a + 1), v.w(a + 4)
        for q, que in ((dib, "dibujos"), (col, "colores")):
            B.declara(v, q, rachas(v, q), "%s_%04X" % (que, q),
                      "rachas (p00:4D16) con los %s de los caracteres desde el %d, "
                      "ficha %d de la lista 0x%04X (p00:4540)" % (que, v(a + 3), k, ini),
                      sitio)
        a += 6
        k += 1
    return a + 1


def lista_copias(v, a):
    """p00:44F3: fichas de 4 bytes (3 si (ix+2) >> 6 no es cero) hasta un 0."""
    while v(a) != 0:
        a += 3 if (v(a + 2) >> 6) else 4
    return a + 1


# ----------------------------------------------------------- automaticos

def automaticos():
    """Los punteros que el trazador ve llegar a cada lector."""
    B.por_lector(0x4D16, "DE", rachas, "rachas",
                 "rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino, >0x80 copia, 0 acaba)")
    B.por_lector(0x4CE5, "DE", rachas, "rachas3",
                 "rachas a la VRAM en los tres tercios (p00:4CE5 -> p00:4D16)")
    B.por_lector(0x4D10, "DE", rachas_con_destino, "rachas_d",
                 "[destino en la VRAM] y rachas (p00:4D10 -> p00:4D16)")
    for lec in (0x4CF5, 0x4D0C):
        B.por_lector(lec, "DE", lista_vram, "lista",
                     "lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro destino; 0xFF acaba)")
    B.por_lector(0x4CFD, "DE", lambda v, a: lista_vram(v, a, False), "lista_s",
                 "lista a la VRAM sin destino delante (p00:4CFD; 0xFE otro destino; 0xFF acaba)")


# ------------------------------------------------------------- el sonido
#
# p04:6472 arranca el sonido A (del 1 al 0x59; 0xF0-0xF6 son ordenes): la
# tabla de p04:663E da su cabecera [canales][prioridad] y una palabra por
# cada bit de canales (de 7 a 0: los tres del PSG y los cinco del SCC), que es
# donde empieza la partitura de ese canal (p04:6543 la pone en IX+02). Cada
# cuadro p04:6A23 la interpreta (bancos 4-5-6 puestos):
#   0xFF          acaba el canal (p04:6D9B)
#   0xD0-0xDF     p04:702E: 1 byte; la cifra < 6 es la octava (IX+16), 0xDE
#                 lee uno mas (IX+01) y 0xDF quita el bit 7 de IX+0E
#   0xE0-0xFE     por la tabla de p04:6DE9 (p04:6DD4); su largo en
#                 LARGO_ORDEN, leido en cada destino (los `inc hl`). 0xF9
#                 [lo hi] llama a una subpartitura y 0xFA vuelve; 0xFB/0xFC
#                 [veces][lo hi] repiten; 0xFD [lo hi] salta; 0xFE [modo] pone
#                 IX+09; 0xF8 [n] la forma de onda del SCC (tabla p04:6000);
#                 0xE0-0xE3 ponen IX+0D = orden & 3, con un byte mas si no es 0.
#   < 0xD0        una nota (p04:6A40), cuyo largo depende del modo (IX+09):
#                 con el bit 0, 1 byte (p04:6A57); con el bit 1, 1 byte, o 2 si
#                 IX+0D & 3 >= 2 y IX+0E no lleva los bits 6 ni 5 (p04:6ABC);
#                 con los bits 2-4 (bateria), 1 byte y la cifra alta elige un
#                 guion de la tabla p04:73C8 (p04:6B35), que se lee con el bit 1
#                 hasta un 0xFF (p04:6BD1).

LARGO_ORDEN = {0xE4: 2, 0xE5: 2, 0xE6: 2, 0xE7: 2, 0xE8: 1, 0xE9: 2, 0xEA: 2,
               0xEB: 3, 0xEC: 1, 0xED: 2, 0xEE: 2, 0xEF: 1, 0xF0: 1, 0xF1: 2,
               0xF2: 2, 0xF3: 1, 0xF4: 1, 0xF5: 1, 0xF6: 1, 0xF7: 2, 0xF8: 2,
               0xF9: 3, 0xFA: 1, 0xFB: 4, 0xFC: 4, 0xFD: 3, 0xFE: 2}


def largo_nota(modo, d, e):
    """Bytes de una nota con el estado del canal; None si el modo no lee."""
    if modo & 1:
        return 1
    if modo & 2:
        return 2 if (d & 3) >= 2 and not (e & 0x60) else 1
    if modo & 0x1C:
        return 1
    return None


def orden(x, q, modo, d, e):
    """(largo, modo, d, e) tras la orden x (0xD0-0xFE) con operando q."""
    if 0xD0 <= x < 0xE0:
        if x & 0x0F == 0x0F:
            e &= 0x7F
        return (2 if x & 0x0F == 0x0E else 1), modo, d, e
    if x <= 0xE3:
        d = x & 3
        return (1 if d == 0 else 2), modo, d, e & ~0x40 & 0xFF
    n = LARGO_ORDEN[x]
    if x == 0xE5:
        d &= ~8
    elif x == 0xE7:
        d |= 4
    elif x == 0xE8:
        d &= 0xF3
    elif x == 0xEE:
        e |= 2
    elif x == 0xEF:
        e &= ~2
    elif x == 0xF0:
        e &= 0xE2
    elif x == 0xF1:
        e |= 0x14
    elif x == 0xF2:
        e |= 0x0C
    elif x == 0xF3:
        e &= ~8
    elif x == 0xF4:
        e |= 0x40
    elif x == 0xF5:
        e |= 0x20
    elif x == 0xF6:
        e &= 0x9F
    elif x == 0xF7:
        e |= 0x80
    elif x == 0xFE:
        modo = q
        if q >= 4:
            e = (e | 1) & 0x11
    return n, modo, d & 0xFF, e & 0xFF


class Partituras:
    """Recorre canales apuntando cada byte leido (y con que largo)."""

    def __init__(self, v):
        self.v = v
        self.usados = {}           # direccion -> (inicio de la instruccion, largo)
        self.dos = set()           # bytes leidos con dos largos distintos
        self.golpes = set()
        self.ondas = set()
        self.avisos = []
        self.memo = {}

    def apunta(self, a, n):
        for k in range(n):
            if a + k in self.usados and self.usados[a + k] != (a, n):
                self.dos.add(a + k)
            self.usados[a + k] = (a, n)

    def recorre(self, a, estado, hondo=0):
        """Estados con los que se sale por un 0xFA (vacio si acaba en 0xFF)."""
        clave = (a, estado)
        if clave in self.memo:
            return self.memo[clave]
        self.memo[clave] = set()
        salidas = set()
        pila = [(a, estado)]
        vistos = set()
        v = self.v
        while pila:
            a, (modo, d, e) = pila.pop()
            while True:
                if (a, (modo, d, e)) in vistos:
                    break
                vistos.add((a, (modo, d, e)))
                x = v(a)
                if x == 0xFF:
                    self.apunta(a, 1)
                    break
                if x == 0xFA:
                    self.apunta(a, 1)
                    salidas.add((modo, d, e))
                    break
                if x >= 0xD0:
                    q = v(a + 1)
                    n, modo, d, e = orden(x, q, modo, d, e)
                    self.apunta(a, n)
                    if x == 0xF8:
                        self.ondas.add(q)
                    if x == 0xFD:
                        a = v.w(a + 1)
                        continue
                    if x == 0xF9:
                        tras = self.recorre(v.w(a + 1), (modo, d, e), hondo + 1) if hondo < 8 else set()
                        for est in tras:
                            pila.append((a + 3, est))
                        break
                    a += n
                    continue
                n = largo_nota(modo, d, e)
                if n is None:
                    self.avisos.append("%04X: nota con el modo %02X" % (a, modo))
                    break
                if modo & 0x1C and not modo & 3:
                    self.golpes.add(x >> 4)
                self.apunta(a, n)
                a += n
        self.memo[clave] = salidas
        return salidas


def tramos(conjunto):
    """[(ini, fin)] de un conjunto de direcciones."""
    out = []
    for x in sorted(conjunto):
        if out and out[-1][1] == x:
            out[-1][1] = x + 1
        else:
            out.append([x, x + 1])
    return [tuple(t) for t in out]


N_SONIDOS = 0x59
N_GOLPES = 10


def sonido():
    v = B.Ventana((4, 5, 6))
    lec = "p04:649A"
    B.declara(v, 0x6640, 0x66F2, "sonidos", "%d punteros, uno por sonido del 1 al 0x%02X (A en "
              "p04:6472, tabla en 0x663E + 2 x A): su cabecera [canales][prioridad][una palabra "
              "por canal]. La entrada 0 serian los bytes B0 C9 de `ldir / ret` (p04:663D): no hay "
              "sonido 0" % (N_SONIDOS, N_SONIDOS), lec, F="w8")
    cab = [v.w(0x663E + 2 * k) for k in range(N_SONIDOS + 1)]
    P = Partituras(v)
    de_quien = {}
    for k, c in enumerate(cab):
        if k == 0:
            continue
        m = v(c)
        canales = [b for b in range(7, -1, -1) if m >> b & 1]
        B.declara(v, c, c + 2 + 2 * len(canales), "cabecera_%02X" % k,
                  "cabecera del sonido 0x%02X: canales 0x%02X, prioridad 0x%02X y %d "
                  "partituras (p04:64A7 copia 18 bytes a 0xE1BA)" % (k, m, v(c + 1), len(canales)),
                  lec, F=2 + 2 * len(canales))
        for j, b in enumerate(canales):
            ini = v.w(c + 2 + 2 * j)
            antes = set(P.usados)
            P.recorre(ini, (0, 0, 0))
            for x in set(P.usados) - antes:
                de_quien[x] = k
    dir_golpes = [v.w(0x73C8 + 2 * k) for k in range(N_GOLPES)]
    B.declara(v, 0x73C8, 0x73DC, "golpes", "%d punteros a los guiones de bateria (p04:6B3C: "
              "la cifra alta de la nota en los modos de bateria)" % N_GOLPES, "p04:6B44", F="w10")
    for k, g in enumerate(dir_golpes):
        antes = set(P.usados)
        P.recorre(g, (0x02, 0, 0))
        for x in set(P.usados) - antes:
            de_quien[x] = "golpe %d" % k
    usados, avisos, golpes, ondas = P.usados, P.avisos, P.golpes, P.ondas
    for ini, fin in tramos(usados):
        ks = sorted({de_quien[x] for x in range(ini, fin)}, key=str)
        q = ", ".join("0x%02X" % x if isinstance(x, int) else x for x in ks[:6])
        dos = [x for x in P.dos if ini <= x < fin]
        B.declara(v, ini, fin, "partitura_%04X" % ini,
                  "partitura (p04:6A23: ordenes 0xD0-0xFF y notas) de %s%s%s" % (
                      "los sonidos " if isinstance(ks[0], int) else "", q + (" y otros" if len(ks) > 6 else ""),
                      "; %d bytes los leen dos canales con distinto largo de nota" % len(set(dos))
                      if dos else ""),
                  "p04:6A2F", F=16)
    tr = tramos(usados)
    for (i0, f0), (i1, f1) in zip(tr, tr[1:]):
        if f0 >= i1 or v.banco(f0) != v.banco(i1 - 1):
            continue
        bs = [v(x) for x in range(f0, i1)]
        if all(x == 0xFF for x in bs):
            txt = ("%d byte%s 0xFF de cierre que no se alcanza: la partitura de delante acaba "
                   "saltando con 0xFD" % (len(bs), "" if len(bs) == 1 else "s"))
            if v(f0 - 3) != 0xFD:
                txt = "%d bytes 0xFF sueltos entre partituras: no los lee nadie" % len(bs)
        elif bs[-1] == 0xFA:
            txt = ("subpartitura de %d bytes que acaba en 0xFA, como las que se llaman con "
                   "0xF9, pero no la llama ninguna: sin lector a la vista" % len(bs))
        else:
            txt = "%d bytes entre partituras que no lee nadie" % len(bs)
        B.declara(v, f0, i1, "suelto_%04X" % f0, txt, "nadie", F=16)
    ptr_ondas = [v.w(0x6000 + 2 * n) for n in range(41)]
    usadas = sorted({ptr_ondas[n] for n in ondas if n < 41})
    B.declara(v, 0x6000, 0x6052, "ondas", "41 punteros a las formas de onda del SCC (orden 0xF8 "
              "de la partitura, p04:6FAF: 0x6000 + 2 x n); apuntan a las 33 ondas de detras",
              "p04:6FB8", F="w8")
    for k in range(33):
        a = 0x6052 + 0x20 * k
        B.declara(v, a, a + 0x20, "onda_%02d" % k, "forma de onda del SCC: 32 muestras con signo%s"
                  % ("" if a in usadas else " (ninguna partitura la pide)"), "p04:6FB8", F=16)
    B.declara(v, 0x6DE9, 0x6E27, "ordenes", "31 destinos, uno por orden de la partitura de 0xE0 "
              "a 0xFE (p04:6DD4: HL = 0x6DE9 + 2 x (orden & 0x1F); jp (hl) en p04:6DE8); el 0xFF "
              "no llega aqui (lo mira antes p04:6A30)", "p04:6DE8", F="w8")
    B.declara(v, 0x6563, 0x656F, "canal_nuevo", "12 bytes que p04:655A copia a un canal al "
              "arrancarlo (detras de la cuenta, el sonido y la partitura): todo a 0", "p04:655A", F=12)
    B.declara(v, 0x6AAF, 0x6ABC, "notas_psg", "13 bytes: el divisor de cada nota (de do a do) que "
              "p04:6A7A lee con el indice < 12 (p04:6A76) y dobla por la octava; el 13 no lo lee "
              "nadie", "p04:6A7A", F=13)
    B.declara(v, 0x711E, 0x712A, "mezclador", "tres tablas de 4 bytes, una por canal del PSG, con "
              "los bits del registro 7 (tono/ruido) segun IX+0D & 3; p04:70EE/70F9/7104 las "
              "juntan y lo escriben con WRTPSG", "p04:7117", F=4)
    for c in avisos:
        B.AVISOS.append("sonido: " + c)
    print("sonido: %d bytes de partitura, golpes %s, ondas %s, %d leidos de dos maneras" % (
        len(usados), sorted(golpes), sorted(ondas), len(P.dos)))
    return usados


# ------------------------------------------------------------- el mapa
#
# p00:49BB (horizontal) y p00:4A88 (vertical, 0xE620 = 1) sacan de p13:6F4C
# el mapa de la fase (0xE301, de 1 a 7). Cada byte es un bloque de 4 x 4
# caracteres: del 0 al 3 los comunes de p13:600E, del 4 en adelante los de la
# fase, que p00:4A34 saca de 0x5FFE + 2 x fase (o sea p13:6000). Un bloque
# son 16 bytes, cuatro filas de cuatro. En horizontal cada columna del mapa
# son 6 bytes (6 bloques de alto) y en vertical cada fila son 8 (8 de ancho).
# El recorrido va de 0xE621 a 0xE623, que p02:88A2 copia de p02:88F2 (6 bytes
# por fase); 0xE620 lo pone p02:88B3 de p02:8921.

FASES = range(1, 8)


def mapa():
    m = B.Ventana((13, 14, 15))
    v = B.Ventana((1, 2, 3))
    ps = [m.w(0x6F4C + 2 * s) for s in range(8)] + [0x84BC]
    bl = [None] + [m.w(0x6000 + 2 * k) for k in range(7)] + [0x6F4E]
    B.declara(m, 0x6F4E, 0x6F5C, "mapas", "7 punteros, uno por fase (0xE301 de 1 a 7): el "
              "mapa de cada fase; la palabra de la fase 0 (0x6F4C) no la lee nadie y son "
              "los dos ultimos bytes del ultimo bloque de la fase 7", ["p00:49BB", "p00:4A88"], F="w7")
    B.declara(m, 0x6000, 0x600E, "bloques_por_fase", "7 punteros, uno por fase: los bloques "
              "de 4 x 4 caracteres de cada fase (p00:4A34 lee 0x5FFE + 2 x fase)", ["p00:4A37"], F="w7")
    B.declara(m, 0x600E, 0x604E, "bloques_comunes", "los bloques 0 a 3, comunes a todas las "
              "fases: 16 bytes cada uno, cuatro filas de cuatro caracteres (p00:4A2B)",
              ["p00:4A2B"], F=16)
    for s in FASES:
        ini, fin = v.w(0x88F2 + 6 * s), v.w(0x88F4 + 6 * s)
        vert = v(0x8921 + s)
        paso = 8 if vert else 6
        leido = ((fin - 1 - ini) // 4 + 1) * paso
        que = ("en vertical: cada fila son 8 bloques" if vert
               else "en horizontal: cada columna son 6 bloques")
        lec = ["p00:4A88"] if vert else ["p00:49BB"]
        B.declara(m, ps[s], ps[s] + leido, "mapa_fase%d" % s,
                  "mapa de la fase %d, %s; el recorrido va de 0x%04X a 0x%04X (p02:88F2)"
                  % (s, que, ini, fin), lec, F=paso)
        if ps[s] + leido < ps[s + 1]:
            B.declara(m, ps[s] + leido, ps[s + 1], "mapa_fase%d_cola" % s,
                      "%d bytes mas del mapa de la fase %d (el mismo formato, %d %s), "
                      "detras de donde acaba el recorrido medido (0xE623 = 0x%04X): "
                      "SIN LECTOR a la vista" % (ps[s + 1] - ps[s] - leido, s,
                                                  (ps[s + 1] - ps[s] - leido) // paso,
                                                  "filas" if vert else "columnas", fin),
                      ["nadie"], F=paso)
        datos = [m(a) for a in range(ps[s], ps[s + 1])]
        n = max(datos) - 3
        B.declara(m, bl[s], bl[s] + 16 * n, "bloques_fase%d" % s,
                  "los %d bloques de la fase %d (del 4 al %d del mapa): 16 bytes cada uno, "
                  "cuatro filas de cuatro caracteres" % (n, s, n + 3), ["p00:4A37"], F=16)


def todo():
    automaticos()
    sonido()
    mapa()
