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
            if q >= 0xC000:
                continue        # en la RAM: lo que la fase 7 copia del otro cartucho (0xC100)
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


# ------------------------------------------------- los bancos 7, 8 y 9
#
# Con 7-8-9 puestos (p00:4178), al empezar la fase (p00:438C) y al llegar un
# jefe (p00:4DC8, con 0xE640 = 1, 2 o 7; p02:8591-86AF lo ponen a 1, 2, 3,
# 6, 7 u 8):
#   p00:44D9  HL = 0x6C37, A = fase: lista de caracteres (p00:4540)
#   p00:44E3  HL = 0x6C45, A = fase: copias VRAM -> VRAM (p00:44F0 -> 44F3),
#             con 0xF000 = 0; p00:44ED HL = 0x6C53 lo mismo con 0xF000 = 1
#   p00:4DDE/4DEB/4DF8  igual con 0x67D6/0x67E4/0x67F2 y A = 0xE640
#   p00:439B  HL = 0x8BD3, A = fase: fichas de 4 bytes [tipo][cuantos][a][b]
#             hasta un tipo 0 (p00:43A7)
#   p00:4497  HL = 0x8B26, A = fase: fichas [caracter][rachas lo hi] hasta un
#             0 (p00:449E); las rachas van a 0x1800 + 8 x caracter
# Todas las tablas se indexan con A de 1 en adelante: su palabra 0 son los
# dos ultimos bytes de lo que haya delante y nadie la lee.

def tabla_indice(v, tabla, idx, nom, que, lector, sitio, recorre=None, texto_bloque=None, F_bloque=None):
    """Una tabla de punteros leida con A en idx (palabra tabla + 2 x A)."""
    lo, hi = min(idx), max(idx)
    B.declara(v, tabla + 2 * lo, tabla + 2 * hi + 2, nom,
              "%d punteros (%s %d a %d; tabla en 0x%04X + 2 x A): %s" % (hi - lo + 1, que, lo, hi, tabla, texto_bloque or ""),
              sitio, F="w%d" % (hi - lo + 1))
    out = {}
    for k in idx:
        p = v.w(tabla + 2 * k)
        out.setdefault(p, []).append(k)
    for p, ks in sorted(out.items()):
        if recorre:
            recorre(v, p, ks)
    return out


def fichas4(v, a):
    """p00:43A7: fichas de 4 bytes hasta un primer byte 0."""
    while v(a) != 0:
        a += 4
    return a + 1


def caracter_y_rachas(v, a, sitio):
    """p00:449E: [caracter][rachas lo hi] hasta un 0; declara las rachas."""
    ini = a
    while v(a) != 0:
        q = v.w(a + 1)
        if q >= 0xC000:         # en la RAM (fase 7: lo copiado del otro cartucho)
            a += 3
            continue
        B.declara(v, q, rachas(v, q), "rachas_%04X" % q,
                  "rachas (p00:4D16) con los dibujos de sprite desde el %d (0x1800 + 8 x %d), "
                  "de la lista 0x%04X (p00:449E)" % (v(a), v(a), ini), sitio)
        a += 3
    return a + 1


def banco789():
    v = B.Ventana((7, 8, 9))

    def car(sitio, que):
        def f(v, p, ks):
            B.declara(v, p, lista_caracteres(v, p, sitio), "caracteres_%04X" % p,
                      "lista de caracteres (p00:4540) de %s %s: fichas de 6 bytes [tercios]"
                      "[dibujos][caracter][colores], 0 acaba" % (que, ", ".join(map(str, ks))), sitio, F=6)
        return f

    def cop(sitio, que, modo):
        def f(v, p, ks):
            B.declara(v, p, lista_copias(v, p), "copias_%04X" % p,
                      "lista de copias de caracteres VRAM -> VRAM %s (p00:44F3) de %s %s: 4 bytes, "
                      "3 si el tercero lleva los bits altos; 0 acaba" % (modo, que, ", ".join(map(str, ks))),
                      sitio, F=4)
        return f

    fases = list(FASES)
    tabla_indice(v, 0x6C37, fases, "caracteres_por_fase", "fase", 0x4540, "p00:44DC",
                 car("p00:44DC", "la fase"), "las listas de caracteres de cada fase (p00:4540)")
    tabla_indice(v, 0x6C45, fases, "copias_por_fase_a", "fase", 0x44F3, "p00:44E6",
                 cop("p00:44E6", "la fase", "en espejo (0xF000 = 0)"), "copias en espejo de cada fase (p00:44F3)")
    tabla_indice(v, 0x6C53, fases, "copias_por_fase_b", "fase", 0x44F3, "p00:44F0",
                 cop("p00:44F0", "la fase", "cabeza abajo (0xF000 = 1)"), "copias cabeza abajo de cada fase (p00:44F3)")
    jefes = list(range(1, 8))
    tabla_indice(v, 0x67D6, jefes, "caracteres_jefe", "0xE640 =", 0x4540, "p00:4DE1",
                 car("p00:4DE1", "0xE640 ="), "listas de caracteres al llegar el jefe; p00:4DC8 las "
                 "pide con 0xE640 = 1, 2 o 7; con 3 y 6 p00:4E08 pone 0x6822 en 0xE220 (la misma "
                 "lista que las entradas 3 y 6), con 8 no carga nada, y 4 y 5 no los pone nadie "
                 "(p02:8591-86AF)")
    tabla_indice(v, 0x67E4, jefes, "copias_jefe_a", "0xE640 =", 0x44F3, "p00:4DEE",
                 cop("p00:4DEE", "0xE640 =", "en espejo"), "copias en espejo al llegar el jefe")
    tabla_indice(v, 0x67F2, jefes, "copias_jefe_b", "0xE640 =", 0x44F3, "p00:4DFB",
                 cop("p00:4DFB", "0xE640 =", "cabeza abajo"), "copias cabeza abajo al llegar el jefe")
    tabla_indice(v, 0x8BD3, fases, "fichas_por_fase", "fase", 0x43A7, "p00:43A1",
                 lambda v, p, ks: B.declara(v, p, fichas4(v, p), "fichas_%04X" % p,
                                            "fichas de 4 bytes [tipo][cuantos][a][b] de la fase %s "
                                            "(p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, "
                                            "los demas p00:442B); un tipo 0 acaba"
                                            % ", ".join(map(str, ks)), "p00:43A1", F=4),
                 "fichas de dibujos de sprite de cada fase (p00:43A7)")
    tabla_indice(v, 0x8B26, fases, "sprites_por_fase", "fase", 0x449E, "p00:449A",
                 lambda v, p, ks: B.declara(v, p, caracter_y_rachas(v, p, "p00:449A"), "sprites_%04X" % p,
                                            "lista [caracter][rachas] de la fase %s (p00:449E): los "
                                            "dibujos de sprite que se cargan; 0 acaba" % ", ".join(map(str, ks)),
                                            "p00:449A", F=3),
                 "las listas de dibujos de sprite de cada fase (p00:449E)")
    for ix, sitio, que in ((0x6C63, "p00:44BB", "de todas las fases (p00:44B7)"),
                           (0x6C8E, "p00:44CB", "si p00:4835 no da acarreo (bit fase de 0x26: fases 1, 4, 5 y 7)"),
                           (0x6C95, "p00:44CB", "si p00:4835 da acarreo (fases 2, 3 y 6, las verticales)")):
        B.declara(v, ix, lista_caracteres(v, ix, sitio), "caracteres_%04X" % ix,
                  "lista de caracteres (p00:4546) %s: fichas de 6 bytes, 0 acaba" % que, sitio, F=6)


# ------------------------------------------------------------ el banco 14
#
# Con 1-14-15 puestos (p00:41D8), los sucesos de cada fase, que se van
# gastando segun avanza el scroll (0xE302):
#   p01:6E35  HL = 0x84BA, A = 0xE658: p00:4E66 elige la lista de la fase y
#             la ficha A de 3 bytes [posicion lo hi][dato]; posicion FFFF
#             acaba (nunca se alcanza)
#   p01:78EF  HL = 0x9205, A = 0xE659, y p01:7926 HL = 0x9213, A = 0xE688:
#             p01:793C, fichas de 3 bytes [lo][hi: 3 bits de posicion y 5 de
#             dato][dato]; la posicion 0x7FF acaba
#   p01:6ED7  DE = 0x8550 + 2 x fase: un byte por cada tramo de 32 del
#             scroll ((0xE302 >> 5) & 0x1F), dos cifras que p01:6F18 lanza
#             por la tabla de p01:6F1D

def lista_sucesos(v, p, mascara):
    k = 0
    while (v.w(p + 3 * k) & mascara) != mascara:
        k += 1
    return p + 3 * (k + 1)


def banco14():
    v = B.Ventana((1, 14, 15))
    w = B.Ventana((1, 2, 3))
    fases = list(FASES)
    for tabla, mascara, sitio, cuenta in ((0x84BA, 0xFFFF, "p01:6E3B", "0xE658"),
                                          (0x9205, 0x7FF, "p01:78F5", "0xE659"),
                                          (0x9213, 0x7FF, "p01:792C", "0xE688")):
        def f(v, p, ks, mascara=mascara, sitio=sitio, cuenta=cuenta):
            B.declara(v, p, lista_sucesos(v, p, mascara), "sucesos_%04X" % p,
                      "sucesos de la fase %s: fichas de 3 bytes que se gastan con %s segun "
                      "avanza el scroll; la posicion %s acaba (la lista vacia es solo la marca)"
                      % (", ".join(map(str, ks)), cuenta, "FFFF" if mascara == 0xFFFF else "0x7FF"),
                      sitio, F=3)
        tabla_indice(v, tabla, fases, "sucesos_por_fase_%04X" % tabla, "fase", None, sitio, f,
                     "las listas de sucesos de cada fase (%s)" % cuenta)

    def tramos32(v, p, ks):
        for s in ks:
            fin = w.w(0x88F4 + 6 * s)
            n = ((fin - 1) >> 5) + 1
            B.declara(v, p, p + n, "tramos_fase%d" % s,
                      "un byte por tramo de 32 del scroll de la fase %d (de 0 a 0x%02X: el "
                      "recorrido acaba en 0x%04X, p02:88F2); las dos cifras son oleadas que "
                      "p01:6F18 lanza por la tabla de p01:6F1D" % (s, n - 1, fin), "p01:6EF5", F=16)
    tabla_indice(v, 0x8550, fases, "tramos_por_fase", "fase", None, "p01:6EE0", tramos32,
                 "un puntero por fase (p01:6ED7: DE = 0x8550 + 2 x fase)")

    # p01:70B1 (HL = 0x85D1, A = 0xE67C) y p01:711F (HL = 0x85DF, A = 0xE677),
    # las dos por p01:7139: fichas de 4 bytes [lo][hi][c][b] de la fase; FF FF
    # acaba (p01:714A). La palabra de la fase 7 de 0x85D1 es la 0 de 0x85DF.
    def fichas_ffff(v, p, ks, cuenta, sitio):
        a = p
        while not (v(a) == 0xFF and v(a + 1) == 0xFF):
            a += 4
        B.declara(v, p, a + 2, "apariciones_%04X" % p,
                  "fichas de 4 bytes [posicion lo][hi (2 bits)][c][b] de la fase %s, que "
                  "p01:7139 gasta con %s; FF FF acaba (p01:714A)" % (", ".join(map(str, ks)), cuenta),
                  sitio, F=4)
    for tabla, cuenta, sitio in ((0x85D1, "0xE67C", "p01:70BA"), (0x85DF, "0xE677", "p01:7128")):
        tabla_indice(v, tabla, fases, "apariciones_%04X" % tabla, "fase", None, sitio,
                     lambda v, p, ks, cuenta=cuenta, sitio=sitio: fichas_ffff(v, p, ks, cuenta, sitio),
                     "las listas de p01:7139 (HL = 0x%04X, A = %s)" % (tabla, cuenta))
    de_puntero_en_puntero(v, 0x8849, 22, 0x8B8D, "pieza_8849", "22 punteros que p00:5E0B lee "
                          "con B (p00:4E28): piezas de 5 filas de 7 caracteres",
                          "pieza de 36 bytes de las entradas %s de 0x8849: 5 filas de 7 "
                          "caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas que "
                          "lee p00:5E20", "p00:5E0B", "p00:5E17", F_bloque=7)
    de_puntero_en_puntero(v, 0x8B8D, 89, 0x90A1, "fichas_8B8D", "89 punteros que p01:6308 lee "
                          "con IX+07 (p00:4E21)", "lo que p01:630B lee de las entradas %s de "
                          "0x8B8D (acaba donde empieza la siguiente)", "p01:6308", "p01:630B")
    de_puntero_en_puntero(v, 0x90A1, 56, 0x9205, "formas_90A1", "56 punteros que p01:61C3 lee "
                          "con IX+32 (p00:4E21): formas que p01:61E9 copia con ldir (IX+14 de "
                          "ancho, IX+13 filas)", "forma de caracteres de las entradas %s de 0x90A1 "
                          "(acaba donde empieza la siguiente)", "p01:61C3", "p01:61E9", F_bloque=8)
    for tabla, n, por, que, sitio in ((0x95F7, 14, 2, "IY+27 x 4", "p01:6078"),
                                      (0x962F, 18, 4, "(IY+27 & 0x7F) x 8", "p01:60B2")):
        B.declara(v, tabla, tabla + 2 * por * n, "dibujos_%04X" % tabla,
                  "%d fichas de %d punteros (%s): cada uno a 32 bytes de dibujo de sprite que "
                  "p01:608F manda a la VRAM con outi" % (n, por, que), sitio, F="w%d" % por)
        for a in sorted({v.w(tabla + 2 * k) for k in range(por * n)}):
            B.declara(v, a, a + 32, "sprite_%04X" % a, "32 bytes de dibujo de sprite (16 x 16) "
                      "de la tabla 0x%04X (p01:6094: outi x 0x20)" % tabla, "p01:6096", F=16)
    for a, jug, sitio in ((0x9419, 1, "p03:BF92"), (0x94DA, 2, "p03:BFB4")):
        f = a
        while v(f) != 0xFF:
            f += 2
        B.declara(v, a, f + 2, "demo_jugador%d" % jug, "los mandos del jugador %d en la "
                  "demostracion: %d pares [cuadros][teclas] que p03:BFE7 gasta uno a uno "
                  "(0xE20D / 0xE239 + 2, con el 14 en 0x8000 por p00:41AC); una cuenta 0xFF "
                  "acaba la demo (p03:BF9E)" % (jug, (f + 2 - a) // 2), sitio, F=16)
    for a, que in ((0x96BF, "en las fases 1 a 3"), (0x9DDF, "de la fase 4 en adelante")):
        B.declara(v, a, a + 0x40, "sprites_%04X" % a, "64 bytes de dibujo de sprite %s: p00:5599 "
                  "los copia a la VRAM 0x1800 y otra vez a 0x1840 (LDIRVM, p00:4CBD)" % que,
                  "p00:55A9", F=16)
    for a, sitio, que in ((0x9E1F, "p00:4ADA", "p00:4AD5 y p00:4B97 (21 filas)"),
                          (0x9E3F, "p00:4AFE", "p00:4AF9 (32 columnas)")):
        B.declara(v, a, a + 0x20, "estrellas_%04X" % a, "32 bytes, uno por (0xE302 & 0x1F), que "
                  "leen %s para poner los caracteres 0x50/0x51 del fondo" % que, sitio, F=16)


def rachas_sd(v, a):
    """p00:47F7: como p00:4D16 pero sin el 0x80 de destino (n & 0x7F == 0
    copiaria 256 bytes con el djnz)."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        else:
            a += (n & 0x7F) or 256


def lista_caracteres_sd(v, a, sitio):
    """p00:4763: fichas de 6 bytes como las de p00:4540, con las rachas de p00:47F7."""
    ini, k = a, 0
    while v(a) != 0:
        for q, que in ((v.w(a + 1), "dibujos"), (v.w(a + 4), "colores")):
            if q < 0xC000:
                B.declara(v, q, rachas_sd(v, q), "%s_%04X" % (que, q),
                          "rachas (p00:47F7, sin destino) con los %s de los caracteres desde el "
                          "%d, ficha %d de la lista 0x%04X (p00:4763)" % (que, v(a + 3), k, ini), sitio)
        a += 6
        k += 1
    return a + 1


def lista_caracteres5(v, a, sitio):
    """p10:8107: fichas de 5 bytes [dibujos][caracter][colores]; un 0 en el
    primer byte acaba (IX va un byte por detras: `dec ix`)."""
    ini, k = a, 0
    while v(a) != 0:
        for q, que in ((v.w(a), "dibujos"), (v.w(a + 3), "colores")):
            B.declara(v, q, rachas(v, q), "%s_%04X" % (que, q),
                      "rachas (p00:4D16, por p00:456D) con los %s de los caracteres desde el %d, "
                      "ficha %d de la lista 0x%04X (p10:8107)" % (que, v(a + 2), k, ini), sitio)
        a += 5
        k += 1
    return a + 1


def banco9():
    v = B.Ventana((7, 8, 9))
    for a, sitio, que in ((0xA042, "p00:446F", "0x18C0"), (0xA0D8, "p00:4480", "0x1900"),
                          (0xA113, "p00:4491", "0x18A0")):
        B.declara(v, a, rachas(v, a), "rachas_%04X" % a, "rachas a la VRAM %s (p00:4D16): la otra "
                  "rama del `jr nc` de p00:4835 (bit fase de 0x26), que el trazador no ve" % que, sitio)
    t = B.Ventana((1, 10, 9))
    idx = list(range(1, 7))
    tabla_indice(t, 0xA4BF, idx, "caracteres_menu", "0xE63A & 0x0F =", None, "p10:810C",
                 lambda v, p, ks: B.declara(v, p, lista_caracteres5(v, p, "p10:8107"), "caracteres5_%04X" % p,
                                            "lista de caracteres de p10:8107 (0xE63A & 0x0F = %s): fichas "
                                            "de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, "
                                            "de los bits 4-6 de B" % ", ".join(map(str, ks)), "p10:810C", F=5),
                 "las listas de caracteres de p10:8107")
    for tabla, sitio, modo in ((0xA4CB, "p10:80F2", "en espejo (0xF000 = 0)"),
                               (0xA4D7, "p10:8101", "cabeza abajo (0xF000 = 1)")):
        tabla_indice(t, tabla, idx, "copias_menu_%04X" % tabla, "0xE63A & 0x0F =", None, sitio,
                     lambda v, p, ks, sitio=sitio, modo=modo: B.declara(
                         v, p, lista_copias(v, p), "copias_%04X" % p,
                         "lista de copias VRAM -> VRAM %s (p00:44F3) con 0xE63A & 0x0F = %s"
                         % (modo, ", ".join(map(str, ks))), sitio, F=4),
                     "las listas de copias de p00:44F3")
    # la presentacion (p10:8009-8018) y el jefe 3/6 (p00:4E0E-4E1A) ponen en
    # 0xE220-0xE224 lo que leen p00:4763 (caracteres) y p00:47E5/47F0 (copias)
    B.declara(t, 0xA505, lista_caracteres5(t, 0xA505, "p10:8009"), "caracteres5_A505",
              "lista de caracteres de la presentacion (p10:8009 -> 0xE220): p00:4763 la lee con "
              "0xE63A distinto de 0 por p00:4794, fichas de 5 bytes, 0 acaba; es tambien la "
              "entrada 3 de 0xA4BF", "p10:8009", F=5)
    for a, sitio in ((0xA572, "p10:800F"), (0xA593, "p10:8015")):
        B.declara(t, a, lista_copias(t, a), "copias_%04X" % a, "lista de copias VRAM -> VRAM de "
                  "la presentacion (%s -> 0xE222/0xE224, p00:44F9)" % sitio, sitio, F=4)
    w = B.Ventana((7, 8, 9))
    B.declara(w, 0x6822, lista_caracteres_sd(w, 0x6822, "p00:4E0E"), "caracteres_6822",
              "lista de caracteres del jefe con 0xE640 = 3 o 6 (p00:4E0E -> 0xE220, p00:4763; "
              "tambien las entradas 3 y 6 de 0x67D6)", "p00:4E0E", F=6)
    for a, sitio in ((0x6895, "p00:4E14"), (0x68C0, "p00:4E1A")):
        B.declara(w, a, lista_copias(w, a), "copias_%04X" % a, "lista de copias VRAM -> VRAM del "
                  "jefe con 0xE640 = 3 o 6 (%s -> 0xE222/0xE224, p00:44F9)" % sitio, sitio, F=4)
    # p00:4882: C x 4 en 0xA331: dos punteros a rachas en los tres tercios
    # (p00:4CE5), a 0x2120 (dibujos) y 0x0120 (colores)
    u = B.Ventana((1, 2, 9))
    B.declara(u, 0xA331, 0xA34D, "pares_A331", "7 fichas de 4 bytes (C x 4, p00:4882): dos "
              "punteros a rachas en los tres tercios, dibujos a 0x2120 y colores a 0x0120; la "
              "primera es 0000 0000", "p00:488A", F=4)
    for k in range(1, 7):
        for j, que in ((0, "dibujos (0x2120)"), (2, "colores (0x0120)")):
            q = u.w(0xA331 + 4 * k + j)
            B.declara(u, q, rachas(u, q), "rachas3_%04X" % q, "rachas en los tres tercios "
                      "(p00:4CE5) con los %s de la ficha %d de 0xA331" % (que, k), "p00:4895", F=16)
    B.declara(u, 0xA2F5, 0xA335, "valores_A2F5", "16 fichas de 4 bytes [lo hi][lo hi] que "
              "p02:8447 elige con (IY+0F) & 0x0F (x 4); la ultima son los cuatro ceros con que "
              "empieza 0xA331", "p02:8454", F=4)
    for a, n, sitio, cual in ((0xA145, 3, "p02:8326", "IY+20 = 1, en horizontal"),
                              (0xA160, 4, "p02:832A", "IY+20 distinto de 1, en horizontal"),
                              (0xA184, 3, "p02:832F", "IY+20 = 1, en vertical (0xE620)"),
                              (0xA19F, 4, "p02:8333", "IY+20 distinto de 1, en vertical")):
        B.declara(u, a, a + 9 * n, "fichas9_%04X" % a, "%d fichas de 9 bytes que p02:82C7 elige "
                  "con B x 9 (la tabla la da p02:831C: %s): un byte que va a IY+27 (ldi) y dos "
                  "grupos de 4 que p02:8309 copia sumando IY+24 e IY+26 a los dos primeros"
                  % (n, cual), sitio, F=9)
    for a, n, sitio, cual in ((0xA1C3, 3, "p02:83BE", "IY+22 = 0, en horizontal"),
                              (0xA229, 4, "p02:83C2", "IY+22 distinto de 0, en horizontal"),
                              (0xA1F6, 3, "p02:83C8", "IY+22 = 0, en vertical (0xE620)"),
                              (0xA26D, 4, "p02:83CC", "IY+22 distinto de 0, en vertical")):
        B.declara(u, a, a + 17 * n, "fichas17_%04X" % a, "%d fichas de 17 bytes que p02:8375 "
                  "elige con A x 17 (la tabla la da p02:83B3: %s): un byte (ldi) y cuatro grupos "
                  "de 4 de p02:8309" % (n, cual), sitio, F=17)
    B.declara(u, 0xA2B1, 0xA2F5, "fichas_A2B1", "4 fichas de 17 bytes que p02:8375 elige con "
              "IY+38 < 4 (A x 17): un byte (ldi) y cuatro grupos que copia p02:8309", "p02:84F0", F=17)


# ------------------------------------------------------------ el banco 15
#
# Los textos (p10:9470 y p10:94B7, con 1-10-15): HL = tabla + 2 x A
# (p00:4E31); la japonesa o la inglesa segun el byte 0x002B de la BIOS
# (p10:944C). Un texto es [columna] y letras; 0xFF acaba, 0xFE [columna]
# salta de linea, 0xFD [columna] cambia de pagina y 0xFC mete un trozo de
# p10:959A/95AB/95B5 (p10:954D) y vuelve al siguiente 0xFC.

def texto(v, a):
    """p10:94B7: devuelve el final (detras del 0xFF)."""
    a += 1
    while True:
        x = v(a)
        a += 1
        if x == 0xFF:
            return a
        if x in (0xFE, 0xFD):
            a += 1


def banco15():
    v = B.Ventana((1, 10, 15))
    for tabla, n, sitio, que in ((0xB002, 22, "p10:9451", "japonesa"), (0xB4B6, 22, "p10:9456", "inglesa"),
                                 (0xB725, 6, "p10:9461", "japonesa"), (0xB90A, 6, "p10:9466", "inglesa")):
        B.declara(v, tabla, tabla + 2 * n, "textos_%04X" % tabla, "%d punteros a los textos (version "
                  "%s, por el byte 0x002B de la BIOS en p10:944C): p00:4E31 con A" % (n, que), sitio, F="w8")
        for p in sorted({v.w(tabla + 2 * k) for k in range(n)}):
            ks = [k for k in range(n) if v.w(tabla + 2 * k) == p]
            B.declara(v, p, texto(v, p), "texto_%04X" % p, "texto %s de la tabla 0x%04X (%s): "
                      "[columna] y letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, "
                      "0xFC mete el nombre del jugador (p10:954D)" % (", ".join(map(str, ks)), tabla, que),
                      "p10:94BA", F=16)
    w = B.Ventana((1, 10, 15))
    for a, n, sitio, que in ((0xAF9A, 0x68, "p01:7BB6", "0x2760"), (0xAE8A, 0x110, "p01:7BC2", "0x2560"),
                             (0xAC8A, 0x200, "p01:7BCF", "0x2560 (si 0xE6D1 = 5, en lugar de 0xAE8A)")):
        B.declara(w, a, a + n, "copia3_%04X" % a, "0x%X bytes que p00:4CC1 copia tal cual (LDIRVM) a "
                  "%s en los tres tercios" % (n, que), sitio, F=16)
    # ventanas: cabeceras de 7 bytes [modo][fila][filas][columnas][?][datos lo hi]
    # que p10:95C1 copia a 0xEE10; p10:95CE pinta filas x columnas de los datos
    def ventana(a, sitio, que):
        filas, cols, dato = v(a + 2), v(a + 3), v.w(a + 5)
        B.declara(v, a, a + 7, "ventana_%04X" % a, "cabecera de ventana %s: [modo][fila][%d filas]"
                  "[%d columnas][?][datos 0x%04X] que p10:95C1 copia a 0xEE10" % (que, filas, cols, dato),
                  sitio, F=7)
        B.declara(v, dato, dato + filas * cols, "ventana_datos_%04X" % dato, "%d x %d caracteres "
                  "de la ventana de 0x%04X (p10:9613 los copia fila a fila)" % (filas, cols, a),
                  "p10:9613", F=cols)
    for a, sitio in ((0xBCAA, "p10:83AD"), (0xBCB1, "p10:8409"), (0xBCB8, "p10:8491"),
                     (0xBCBF, "p10:85C5"), (0xBCC6, "p10:85D5"), (0xBCCD, "p10:84D6"),
                     (0xBCD4, "p10:854E")):
        ventana(a, sitio, "(HL fijo en %s)" % sitio)
    B.declara(v, 0xBB6F, 0xBB81, "ventanas_BB6F", "9 punteros a cabeceras de ventana que p10:95BD "
              "elige con A (p00:4E28; p10:82BF)", "p10:82C2", F="w9")
    for k in range(9):
        ventana(v.w(0xBB6F + 2 * k), "p10:95BD", "%d de 0xBB6F" % k)
    for tabla, sitio, que in ((0xBEFD, "p10:8A2C", "japonesa"), (0xBF0B, "p10:8A31", "inglesa")):
        tabla_indice(v, tabla, list(FASES), "rotulos_%04X" % tabla, "fase", None, sitio,
                     lambda v, p, ks, que=que: B.declara(
                         v, p, lista_vram(v, p), "rotulo_%04X" % p,
                         "lista a la VRAM (p00:4CF5) del rotulo de la fase %s, version %s"
                         % (", ".join(map(str, ks)), que), "p10:8A39", F=16),
                     "los rotulos de cada fase (p10:8A20 con A = 1, 0xE21B o 7)")
    B.declara(w, 0xA000, 0xA006, "destinos_jp", "3 direcciones de la VRAM, de 0xE6D1 = 2 a 4 "
              "(p01:7B39: 0x9FFC + 2 x B, version japonesa)", "p01:7B42", F="w3")
    B.declara(w, 0xA006, 0xA01E, "cifras_jp", "4 fichas de 6 bytes, de las que la version japonesa "
              "copia 3 (p01:7B58: 0xA006 + 6 x 0xE309[B], LDIRVM de 3)", "p01:7B6D", F=6)
    B.declara(w, 0xA01E, 0xA024, "destinos_en", "3 direcciones de la VRAM, de 0xE6D1 = 2 a 4 "
              "(p01:7B3E: 0xA01A + 2 x B, version inglesa); las dos palabras de delante son la "
              "ultima ficha japonesa", "p01:7B42", F="w3")
    B.declara(w, 0xA024, 0xA03C, "cifras_en", "4 fichas de 6 letras que copia la version inglesa "
              "(p01:7B5D: 0xA024 + 6 x 0xE309[B], LDIRVM de 6)", "p01:7B6D", F=6)


# ------------------------------------------- las piezas de los jefes (p07)
#
# Con 7-8-11 puestos (los jefes del banco 11): p11:B717/B793/B7D2 leen
# 0x6079 + 2 x A (p00:4E21). Las cuatro primeras son bloques de 2 x 2
# caracteres sin cabecera (p11:B799: B = C = 2); las demas, formas
# [columnas][filas] y filas x columnas caracteres (p11:B71E).

def jefes():
    v = B.Ventana((7, 8, 11))
    n = 38
    B.declara(v, 0x6079, 0x6079 + 2 * n, "formas_jefe", "%d punteros (p11:B717, B793, B7D2: "
              "0x6079 + 2 x A) a las piezas de los jefes" % n, "p11:B71A", F="w8")
    ps = sorted({v.w(0x6079 + 2 * k) for k in range(n)})
    for a in ps:
        ks = [k for k in range(n) if v.w(0x6079 + 2 * k) == a]
        if max(ks) < 4:
            B.declara(v, a, a + 4, "pieza2x2_%04X" % a, "bloque de 2 x 2 caracteres (entrada %s de "
                      "0x6079) que p11:B799 copia con B = C = 2" % ", ".join(map(str, ks)), "p11:B7A7", F=4)
        else:
            c, r = v(a), v(a + 1)
            B.declara(v, a, a + 2 + c * r, "forma_%04X" % a, "forma de %d columnas x %d filas (entrada "
                      "%s de 0x6079): [columnas][filas] y los caracteres (p11:B71E)"
                      % (c, r, ", ".join(map(str, ks))), "p11:B71E", F=max(2, c))
    B.declara(v, 0x641B, 0x6443, "bloques_giro", "20 punteros a bloques de 2 x 2: p11:AABA los "
              "elige con A = C / 2, y C = ((angulo + 8) >> 3) & 0x1E llega a 15; las palabras 16 a "
              "19 no las alcanza ese calculo", "p11:AABD", F="w8")
    for a in range(0x6443, 0x645F, 4):
        B.declara(v, a, a + 4, "bloque_%04X" % a, "bloque de 2 x 2 caracteres%s (B = C = 2, p11:AAC1)"
                  % (" de 0x641B" if a < 0x645B else " que p11:AAB3 pone en DE"), "p11:AAC1", F=4)
    B.declara(v, 0x645F, 0x647F, "giro_16", "16 pares (x, y) de desplazamiento, uno por direccion "
              "de las 16 de un circulo: p11:AA89 lee 0x6460 + C (y) y, con `dec hl`, 0x645F + C (x)",
              "p11:AA93", F=2)
    B.declara(v, 0x6487, 0x64A7, "piezas_6487", "16 punteros (p11:A829: A & 0x0F, p00:4E28) a "
              "piezas sin cabecera; sus columnas y filas las da la ficha de 0x6547 con el mismo "
              "indice", "p11:A82C", F="w8")
    for k in range(16):
        a = v.w(0x6487 + 2 * k)
        c, r = v(0x6547 + 4 * k), v(0x6547 + 4 * k + 1)
        B.declara(v, a, a + c * r, "pieza_%04X" % a, "pieza %d de 0x6487: %d columnas x %d filas "
                  "(de la ficha %d de 0x6547) que p11:B73A copia" % (k, c, r, k), "p11:A830", F=max(1, c))
    B.declara(v, 0x6547, 0x6587, "piezas_6547", "16 fichas de 4 bytes [columnas][filas][dx][dy] "
              "que p11:A84A elige con A x 4", "p11:A84F", F=4)


# p00:5C77 cambia graficos a mitad de fase: segun la fase y la posicion del
# scroll pone HL en 0x5CFA, 0x5D00, 0x5D06, 0x5D0C o 0x5D12 y p00:5CCB lee
# alli tres punteros (7-8-9 puestos): una lista de caracteres (p00:4546) y dos
# de copias (p00:44F9, en espejo y cabeza abajo).

def cambios_de_fase():
    v = B.Ventana((7, 8, 9))
    B.declara(v, 0x5CFA, 0x5D18, "cambios_de_fase", "5 fichas de 6 bytes: [caracteres][copias en "
              "espejo][copias cabeza abajo] que p00:5CCB lee con HL = 0x5CFA, 0x5D00, 0x5D06, 0x5D0C "
              "o 0x5D12 (p00:5C64-5CC8: segun la fase y la posicion del scroll)", "p00:5CCE", F=6)
    for k in range(5):
        a = 0x5CFA + 6 * k
        car, c1, c2 = v.w(a), v.w(a + 2), v.w(a + 4)
        B.declara(v, car, lista_caracteres(v, car, "p00:5CD5"), "caracteres_%04X" % car,
                  "lista de caracteres (p00:4546) del cambio %d de mitad de fase (0x%04X): fichas de "
                  "6 bytes, 0 acaba" % (k, a), "p00:5CD5", F=6)
        for c, modo in ((c1, "en espejo"), (c2, "cabeza abajo")):
            B.declara(v, c, lista_copias(v, c), "copias_%04X" % c, "lista de copias VRAM -> VRAM %s "
                      "(p00:44F9) del cambio %d de mitad de fase (0x%04X)" % (modo, k, a), "p00:5CE5", F=4)


# --------------------------------------- tablas cortas de los bancos de codigo
# (banco, ini, fin, nombre, que es y quien lo lee, lector, F); todas con 1-2-3.

TABLAS = [
    (0, 0x4000, 0x4010, "cabecera", "cabecera del cartucho: \"AB\", INIT = 0x40DA y STATEMENT, "
     "DEVICE y TEXT a cero; la lee la BIOS al arrancar", "BIOS", 16),
    (0, 0x4010, 0x4027, "cabecera_game_master", "la segunda cabecera de Konami: \"CD\", 0x07 0x58 "
     "(RC-758) y los 21 bytes que lee el Game Master (direcciones de la RAM del juego y, en "
     "0x4023, la rutina 0x4054); este cartucho busca la de Nemesis 2 en el vecino (p03:B5E3)",
     "Game Master", 16),
    (0, 0x4027, 0x4030, "detras_de_la_cabecera", "9 bytes entre los 21 de la cabecera \"CD\" y la "
     "tabla de saltos de 0x4030: ni el Game Master (21 bytes) ni este cartucho los leen a la "
     "vista", "nadie", 16),
    (0, 0x4B87, 0x4B8F, "pares_4B87", "4 pares [C][B] que p00:4B2F elige con 0xE203 & 6", "p00:4B36", 2),
    (0, 0x4B8F, 0x4B97, "pares_4B8F", "4 pares [C][B] que p00:4B51 elige con 0xE203 & 6", "p00:4B55", 2),
    (0, 0x4F3D, 0x4F5D, "velocidad_4F3D", "16 palabras con signo, una por direccion (A de 0 a 15, "
     "p00:4F32 con p00:4E28), que p00:4F38 suma B veces", "p00:4F32", "w8"),
    (0, 0x4F5D, 0x4F7D, "velocidad_4F5D", "16 palabras con signo, una por direccion (A de 0 a 15, "
     "p00:4F22 con p00:4E28), que p00:4F29 suma B veces", "p00:4F22", "w8"),
    (0, 0x4F97, 0x4F9B, "cuadros_4F97", "4 caracteres (0x90 0x94 0x98 0x94) que p00:4F7D pasa por "
     "turno con IX+24", "p00:4F7D", 4),
    (0, 0x5130, 0x5138, "registros_vdp", "los 8 registros del VDP (0 a 7) que p00:511F escribe con "
     "WRTVDP: SCREEN 2", "p00:5127", 8),
    (0, 0x58BE, 0x58C5, "estado_inicial", "7 bytes que p00:584C copia a 0xE300 (ldir)", "p00:5855", 7),
    (0, 0x58C5, 0x58E9, "fichas_58C5", "4 fichas de 9 bytes que p00:587A elige con (B & 3) x 9 y "
     "copia (ldir)", "p00:5883", 9),
    (0, 0x5BFE, 0x5C3A, "copia_del_vecino", "20 fichas [cuantos][origen lo hi] que la rutina "
     "copiada a 0xC03C (p00:5BE1) lee en 0xC059: los trozos que la fase 7 copia del cartucho "
     "de Nemesis 2 (bancos 7, 8 y 9 de ESE cartucho) a 0xC100, 1.137 bytes en total",
     "p00:5BE4", 3),
    (1, 0x60CD, 0x60D4, "tabla_60CD", "7 bytes (p01:60C1: 0x60CC + IY+68, de 1 a 7)", "p01:60C4", 7),
    (1, 0x67E1, 0x67F1, "tabla_67E1", "16 bytes que p01:67D4 elige con 0xE64F (y le suma R & 7)",
     "p01:67CB", 16),
    (1, 0x67F1, 0x6801, "tabla_67F1", "16 bytes que p01:67D4 elige con 0xE64F (y le suma R & 7)",
     "p01:67D1", 16),
    (1, 0x6C64, 0x6E2B, "fichas_por_tipo", "65 fichas de 7 bytes, una por tipo de enemigo de 1 "
     "a 65 (p01:65F2: 0x6C5D + 7 x tipo): crea_enemigo copia de ella lo que va en la ficha "
     "nueva; p02:8C9C lee su sexto byte (0x6C62 + 7 x tipo: la cifra alta es un sonido de "
     "0x8CE4)", "p01:6604", 7),
    (1, 0x704E, 0x7055, "tabla_por_fase_704E", "7 bytes, uno por fase (p01:6FD4: 0x704D + 0xE301)",
     "p01:6FD7", 7),
    (1, 0x7135, 0x7139, "tabla_7135", "4 bytes (p01:7110: 0x7134 + 0xE610, de 1 a 4)", "p01:7113", 4),
    (1, 0x71A7, 0x71AF, "tabla_71A7", "8 bytes que p01:7190 elige con R & 7", "p01:7193", 8),
    (1, 0x7235, 0x723D, "tabla_7235", "8 bytes que p01:71ED elige con (HL) & 7 en horizontal",
     "p01:71F1", 8),
    (1, 0x723D, 0x7245, "tabla_723D", "8 bytes que p01:71E4 elige con (HL) & 7 en vertical (0xE620)",
     "p01:71F1", 8),
    (1, 0x72B3, 0x72BB, "tabla_72B3", "8 bytes que p01:725E elige con (HL) & 7", "p01:7261", 8),
    (1, 0x73BB, 0x73C7, "tabla_73BB", "12 bytes que p01:73A6 elige con C & 0x0F", "p01:73A9", 12),
    (1, 0x7426, 0x7436, "tabla_7426", "8 palabras (p01:73E3: 0x7424 + 2 x B, B de 8 a 1)",
     "p01:73E6", "w8"),
    (1, 0x763A, 0x773A, "tabla_763A", "256 bytes que p01:75E7 elige con A (0x763A + A)", "p01:75EA", 16),
    (1, 0x773A, 0x777A, "tabla_773A", "64 bytes que p01:7565 elige con DE (0x773A + DE)", "p01:7569", 16),
    (2, 0x818E, 0x819E, "tabla_818E", "16 bytes que p02:8138 elige con 0xE64F en horizontal",
     "p02:8135", 16),
    (2, 0x819E, 0x81AE, "tabla_819E", "16 bytes que p02:8138 elige con 0xE64F en vertical (0xE620)",
     "p02:8130", 16),
    (2, 0x81AE, 0x81CE, "tabla_81AE", "32 bytes que p02:80D0 elige con IX+26", "p02:80D0", 16),
    (2, 0x81EE, 0x81F6, "pares_81EE", "4 pares que p02:8219 elige con A & 6 y copia a IX+30 e IX+31",
     "p02:821C", 2),
    (2, 0x8853, 0x885B, "pares_8853", "4 palabras que p02:8843 elige con 0xE620 y B y copia a IY+24 "
     "(e IY+26)", "p02:8846", 2),
    (2, 0x88E3, 0x88EA, "e605_por_fase", "7 bytes, uno por fase, que p02:888E copia a 0xE605 "
     "(0x88E2 + fase)", "p02:8891", 7),
    (2, 0x88EA, 0x88F8, "posicion_por_fase", "7 palabras, una por fase (p02:88BF: 0x88E8 + 2 x "
     "fase, p00:4E28), que se comparan con el scroll", "p02:88C2", "w7"),
    (2, 0x88F8, 0x8922, "recorrido_por_fase", "7 fichas de 6 bytes, una por fase (p02:88A2: 0x88F2 "
     "+ 6 x fase): principio y final del recorrido del mapa (0xE621, 0xE623) y 0xE625", "p02:88AE", 6),
    (2, 0x8922, 0x8929, "vertical_por_fase", "7 bytes, uno por fase (p02:88B3: 0x8921 + fase): "
     "0xE620, 1 si la fase va en vertical", "p02:88B6", 7),
    (2, 0x8CE4, 0x8CE9, "sonidos_8CE4", "5 numeros de sonido que p02:8CB9 pide (p00:4D6E) con la "
     "cifra alta de la ficha del tipo (< 5)", "p02:8CBC", 5),
    (2, 0x8F9C, 0x8FA0, "bloque_8F9C", "bloque de 2 x 2 caracteres (p02:8F96: DE = 0x8F9C, BC = "
     "0x0202, p00:5042)", "p02:8F99", 4),
    (2, 0x90EE, 0x90F8, "tabla_90EE", "10 bytes que p02:90C8 lee de dos en dos con 0xE227 x 2",
     "p02:90CB", 2),
    (2, 0x9295, 0x92C5, "fichas_9295", "3 fichas de 16 bytes que p02:9272 elige con IX+06 x 16",
     "p02:927C", 16),
    (2, 0x9322, 0x9326, "cuadros_9322", "4 bytes que p02:9300 pasa a p03:A01D (HL)", "p02:9303", 4),
    (2, 0x946B, 0x9473, "tabla_946B", "8 bytes que p02:943D elige con IX+26 (de 0 a 7)", "p02:9440", 8),
    (2, 0x9C73, 0x9C7B, "tabla_9C73", "8 bytes (p02:9A51: 0x9C72 + A)", "p02:9A54", 8),
    (2, 0x9D21, 0x9D29, "tabla_9D21", "8 bytes que p02:9CCE elige con (HL) & 7", "p02:9CD1", 8),
    (2, 0x9D44, 0x9D47, "tabla_9D44", "3 bytes (p02:9D3A: 0x9D44 + IX+19)", "p02:9D3D", 3),
    (2, 0x9DB4, 0x9DB8, "cuadros_9DB4", "4 bytes que p02:9D4D pasa a p02:9DA7 (HL)", "p02:9D50", 4),
    (2, 0x9DB8, 0x9DBC, "cuadros_9DB8", "4 bytes que p02:9D47 pasa a p03:A01D (HL)", "p02:9D4A", 4),
    (2, 0x9FEB, 0x9FF1, "cuadros_9FEB", "6 caracteres de una animacion que p02:9FE5 pasa a p01:6BD5",
     "p02:9FE8", 6),
    (3, 0xA029, 0xA02D, "cuadros_A029", "4 bytes que p02:9FB8 pasa a p03:A01D (HL)", "p02:9FBB", 4),
    (3, 0xA0C4, 0xA0C8, "tabla_A0C4", "4 bytes que p03:A0B9 elige con A (p00:5AD8)", "p03:A0BC", 4),
    (3, 0xA0C8, 0xA0D8, "tabla_A0C8", "8 palabras que p03:A051 elige con un numero al azar & 7 "
     "(p01:65AB, p00:4E28)", "p03:A054", "w8"),
    (3, 0xA0D8, 0xA0E8, "tabla_A0D8", "8 palabras que p03:A05F elige con un numero al azar & 7",
     "p03:A062", "w8"),
    (3, 0xA0EE, 0xA0F4, "cuadros_A0EE", "6 caracteres de una animacion que p03:A0E8 pasa a p01:6BD5",
     "p03:A0EB", 6),
    (3, 0xA154, 0xA160, "pares_A154", "6 pares que p03:A12C elige con IX+26 x 2 y suma a IX+06",
     "p03:A12F", 2),
    (3, 0xA171, 0xA177, "cuadros_A171", "6 cuadros (0 1 2 3 2 1) que p03:A166 pasa a p01:6591 con "
     "BC = 0x0306", "p03:A169", 6),
    (3, 0xA1CC, 0xA1D2, "cuadros_A1CC", "6 caracteres de una animacion que p03:A1C6 pasa a p01:6BD5",
     "p03:A1C9", 6),
    (3, 0xA237, 0xA23A, "tabla_A237", "3 bytes (p03:A1F6: 0xA237 + B - 1)", "p03:A1F9", 3),
    (3, 0xA2E2, 0xA2E6, "cuadros_A2E2", "4 caracteres que p03:A2DC pasa a p00:4F80", "p03:A2DF", 4),
    (3, 0xA499, 0xA49F, "tabla_A499", "6 bytes que p03:A483 elige con IX+27 (de 0 a 5)", "p03:A486", 6),
    (3, 0xA684, 0xA68C, "palabras_A684", "4 palabras que p03:A67A elige (p00:4E28) con IY+21 a 0 "
     "y copia a IX+07", "p03:A672", "w4"),
    (3, 0xA68C, 0xA694, "palabras_A68C", "4 palabras que p03:A67A elige con IY+21 a 1", "p03:A677", "w4"),
    (3, 0xA701, 0xA709, "palabras_A701", "4 palabras (p03:A6A3: 0xA6FF + 2 x IX+02) en horizontal",
     "p03:A694", "w4"),
    (3, 0xA709, 0xA711, "palabras_A709", "4 palabras (p03:A6A3: 0xA707 + 2 x IX+02) en vertical",
     "p03:A69D", "w4"),
    (3, 0xABAA, 0xABB1, "fichas_ABAA", "7 bytes que p03:ABB8 apunta en 0xE64B (con A = 9) en "
     "horizontal", "p03:ABB8", 7),
    (3, 0xABB1, 0xABB8, "fichas_ABB1", "7 bytes que p03:ABC1 apunta en 0xE64B (con A = 9) en "
     "vertical", "p03:ABC1", 7),
    (3, 0xAC42, 0xAC49, "fichas_AC42", "7 bytes que p03:AC50 apunta en 0xE64B (con A = 8) en "
     "horizontal", "p03:AC50", 7),
    (3, 0xAC49, 0xAC50, "fichas_AC49", "7 bytes que p03:AC59 apunta en 0xE64B (con A = 8) en "
     "vertical", "p03:AC59", 7),
    (3, 0xB494, 0xB498, "tabla_B494", "4 bytes que p03:B465 y p03:B473 eligen con A & 3", "p03:B468", 4),
    (3, 0xB621, 0xB625, "firma_nemesis2", "\"CD\" 0x07 0x51: la segunda cabecera de Nemesis 2 "
     "(RC-751), que p03:B5E3 compara con la de 0x4010 del cartucho vecino (RDSLT, p03:B60C)",
     "p03:B5EB", 4),
    (3, 0xB625, 0xB62B, "firma_nemesis2_7ffa", "6 bytes que p03:B5F5 compara con los de 0x7FFA del "
     "vecino; si cuadran, 0xF0F5 bit 1 y 0xFFA7 = 0xC9", "p03:B5FD", 6),
    (3, 0xB9F6, 0xB9FC, "cuadros_B9F6", "6 caracteres de una animacion que p03:B9F0 pasa a p01:6BD5",
     "p03:B9F3", 6),
    (3, 0xBC89, 0xBC91, "palabras_BC89", "4 palabras que p03:BC46 elige con B (p00:4E28)", "p03:BC49", "w4"),
    (3, 0xBDB9, 0xBDBF, "palabras_BDB9", "3 palabras que p03:BDA4 elige con C (p00:4E28)", "p03:BDA8", "w3"),
    (3, 0xBEAE, 0xBEB6, "pares_BEAE", "2 fichas de 4 bytes que p03:BE7A elige con (IX+19 & 2) x 2",
     "p03:BE7D", 4),
    (3, 0xBEB6, 0xBEBC, "palabras_BEB6", "3 palabras que p03:BE3A elige con IX+19 (p00:4E28)",
     "p03:BE41", "w3"),
]


TABLAS_OTROS = [
    # (reparto, ini, fin, nombre, texto, lector, F)
    ((1, 2, 3), 0x7007, 0x700E, "tabla_por_fase_7007", "7 bytes, uno por fase (p01:6FAD: 0x7006 + "
     "0xE301)", "p01:6FB3", 7),
    ((1, 2, 3), 0x92E9, 0x92F9, "fichas_92E9", "4 fichas de 4 bytes (p02:92DE: 0x92E5 + 4 x A, A "
     "de 1 a 4: los cuatro bytes de 0x92E5 son el propio `call`/`jp`) que sigue p01:6C2D", "p02:92E3", 4),
    ((1, 2, 3), 0xBFFF, 0xC000, "relleno_bfff", "el ultimo byte del banco, 0xFF: relleno", "nadie", 1),
    ((7, 8, 11), 0x647F, 0x6487, "detras_de_giro_16", "8 bytes entre los 16 pares de 0x645F y la "
     "tabla de 0x6487: p11:AA89 solo llega a 0x647E (C <= 0x1E) y nadie mas los apunta: SIN LECTOR "
     "a la vista", "nadie", 8),
    ((7, 8, 9), 0x7A32, 0x7A56, "sin_lector_7A32", "36 bytes entre listas de caracteres que no "
     "apunta ninguna instruccion con el banco 7 puesto: SIN LECTOR a la vista", "nadie", 16),
    ((7, 8, 9), 0x89D0, 0x8A0D, "sin_lector_89D0", "61 bytes entre bloques de rachas que no apunta "
     "ninguna instruccion con el banco 8 puesto: SIN LECTOR a la vista", "nadie", 16),
    ((1, 2, 11), 0xA605, 0xA608, "tabla_A605", "3 bytes (p11:A5E7 y p11:A622: 0xA604 + IX+25, de 1 "
     "a 3)", "p11:A5EA", 3),
    ((1, 2, 11), 0xA802, 0xA80A, "e605_por_jefe", "8 bytes, uno por jefe (p11:A7F6: 0xA801 + "
     "0xE640, de 1 a 8), que van a 0xE605", "p11:A7F9", 8),
    ((1, 2, 12), 0xA86B, 0xA871, "pares_A86B", "3 pares (p12:A851: 0xA869 + 2 x B, B de 1 a 3) que "
     "se suman a E y D", "p12:A855", 2),
    ((1, 2, 12), 0xB789, 0xB7C9, "fichas_B789", "4 fichas de 16 bytes (p12:B763: 0xB779 + 16 x A, A "
     "de 1 a 4: los 16 de 0xB779 son codigo) que p12:B776 copia de 4 en 4", "p12:B766", 16),
    ((1, 14, 15), 0x85B1, 0x85B3, "entre_tramos_85B1", "2 bytes entre la lista de tramos de la fase "
     "5 (acaba en 0x85B1) y la de la fase 6: no los lee nadie", "nadie", 2),
    ((1, 14, 15), 0x85D2, 0x85D3, "entre_tramos_85D2", "1 byte entre la lista de tramos de la fase 7 "
     "y la tabla de 0x85D1 (su palabra 0, que no se lee)", "nadie", 1),
]


def tablas_de_codigo():
    v = B.Ventana((1, 2, 3))
    for b, ini, fin, nom, texto, lector, F in TABLAS:
        B.declara(v, ini, fin, nom, texto, lector, F=F)
    for rep, ini, fin, nom, texto, lector, F in TABLAS_OTROS:
        B.declara(B.Ventana(rep), ini, fin, nom, texto, lector, F=F)
    w = B.Ventana((1, 10, 15))
    tabla_indice(w, 0x8A6A, list(FASES), "rotulos2_8A6A", "fase", None, "p10:8A47",
                 lambda v, p, ks: B.declara(v, p, lista_vram(v, p, False), "rotulo2_%04X" % p,
                                            "lista a la VRAM sin destino delante (p00:4CFD, HL = "
                                            "0x3933) de la fase %s" % ", ".join(map(str, ks)),
                                            "p10:8A4F", F=16),
                 "la segunda linea del rotulo de cada fase (p10:8A44 con A = 1, 0xE21B o 7)")
    u = B.Ventana((1, 2, 12))
    de_puntero_en_puntero(u, 0xA531, 7, 0xA5CE, "listas_A52F", "7 punteros, uno por fase (p12:A4CF: "
                          "0xA52F + 2 x fase, p00:4E21); 0 = la fase no tiene lista", "lista de "
                          "la fase %s que p12:A4D9 recorre (acaba donde empieza la siguiente)",
                          "p12:A4D2", "p12:A4D9", F_bloque=8, primero=1)
    # p00:5DE2: 0x5E52 + 2 x B (de 1 a 7) apunta a listas de bytes que p00:5DEC
    # lee con C
    de_puntero_en_puntero(v, 0x5E54, 7, 0x5E79, "listas_5E52", "7 punteros (B de 1 a 7: "
                          "p00:5DE2 lee 0x5E52 + 2 x B con p00:4E28)", "lista de bytes de las "
                          "entradas %s de 0x5E54 que p00:5DEC lee con C (acaba donde empieza la "
                          "siguiente)", "p00:5DE6", "p00:5DEC", F_bloque=8, primero=1)
    de_puntero_en_puntero(v, 0x876C, 7, 0x87A4, "listas_876A", "7 punteros, uno por fase "
                          "(p02:873D: 0x876A + 2 x fase, p00:4E28)", "lista de la fase %s que "
                          "p02:8748 lee de dos en dos (acaba donde empieza la siguiente)",
                          "p02:8740", "p02:8748", F_bloque=6, primero=1)
    for a, sitio in ((0xB62B, "p00:5A21"), (0xB63C, "p00:5A26"), (0xB64D, "p00:534C"),
                     (0xB657, "p00:5351"), (0xB662, "p00:5357"), (0xB670, "p00:5822"),
                     (0xB67B, "p00:5827")):
        B.declara(v, a, lista_vram(v, a), "lista_%04X" % a, "lista a la VRAM (p00:4CF5: [destino] y "
                  "letras; 0xFE otro destino; 0xFF acaba) de %s, una de las ramas que el trazador "
                  "no sigue" % sitio, sitio, F=16)


def de_puntero_en_puntero(v, tabla, n, hasta, nom, texto_tabla, texto_bloque, lector,
                          lector_bloque, F_tabla="w8", F_bloque=16, primero=0):
    """Tabla de n punteros a bloques que van seguidos: cada uno acaba donde
    empieza el siguiente (ordenados) y el ultimo en `hasta`. primero: el
    numero de la primera entrada (1 si la tabla se lee con A desde 1)."""
    B.declara(v, tabla, tabla + 2 * n, nom, texto_tabla, lector, F=F_tabla)
    ps = sorted({v.w(tabla + 2 * k) for k in range(n)} - {0})
    for a, f in zip(ps, ps[1:] + [hasta]):
        ks = [k + primero for k in range(n) if v.w(tabla + 2 * k) == a]
        B.declara(v, a, f, "%s_%04X" % (nom, a), texto_bloque % ", ".join(map(str, ks)),
                  lector_bloque, F=F_bloque)


def todo():
    automaticos()
    sonido()
    mapa()
    banco789()
    banco14()
    banco9()
    banco15()
    jefes()
    cambios_de_fase()
    tablas_de_codigo()
