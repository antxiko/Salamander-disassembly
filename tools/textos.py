#!/usr/bin/env python3
"""Los textos de Salamander, leidos de la ROM.

Formato (p10:9497): [columna] y letras; 0xFF acaba, 0xFE [columna] linea
nueva, 0xFD [columna] pagina nueva (con 120 cuadros de pausa) y 0xFC mete el
nombre del jugador (p10:954D). Las letras son numeros de caracter y dependen de
la fuente que haya en la VRAM:

  fuente 1 (p11:B8D7: p11:B9F9 a 0x2080 y p11:BA61 a 0x2100): 0x10-0x19 las
     cifras, 0x1A el (C), 0x20 el guion y 0x21-0x3A de la A a la Z (ASCII - 0x20)
  fuente 2 (p11:B9BF, la de las ventanas: p11:B9F9 a +0x70 y p11:BA69 a +0xC0):
     0x10-0x17 las cifras, 0x18-0x31 de la A a la Z, 0x32 el punto, 0x33 la
     coma, 0x34 los puntos suspensivos, 0x35 la exclamacion, 0x36 la
     interrogacion, 0x37 y 0x38 las comillas japonesas y 0x39 el guion

Las tablas (por el byte 0x002B de la BIOS, p10:944C): p15:B002 (japonesa) y
p15:B4B6 (inglesa), 22 textos cortos; p15:B725 y p15:B90A, 6 largos. Las
japonesas usan los caracteres de kana y kanji de la VRAM: aqui salen como
numeros.

Uso: textos.py [--md]
     textos.py --rotulos          los rotulos de las 7 fases (p10:8A20)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402

FUENTE1 = {0x00: " ", 0x1A: "(C)", 0x20: "-"}
FUENTE1.update({0x10 + i: str(i) for i in range(10)})
FUENTE1.update({0x21 + i: chr(0x41 + i) for i in range(26)})
FUENTE2 = {0x00: " ", 0x32: ".", 0x33: ",", 0x34: "...", 0x35: "!", 0x36: "?",
           0x37: "「", 0x38: "」", 0x39: "-"}
FUENTE2.update({0x10 + i: str(i) for i in range(8)})
FUENTE2.update({0x18 + i: chr(0x41 + i) for i in range(26)})

TABLAS = ((0xB002, 22, "cortos, japones"), (0xB4B6, 22, "cortos, ingles"),
          (0xB725, 6, "largos, japones"), (0xB90A, 6, "largos, ingles"))


def lee(v, a, fuente, limite=800):
    """[(linea)] del texto de a; las paginas empiezan por '\\f'."""
    lineas, linea = [], ""
    i = a + 1
    while i < a + limite:
        b = v(i)
        i += 1
        if b == 0xFF:
            break
        if b in (0xFE, 0xFD):
            lineas.append(linea)
            linea = "\f" if b == 0xFD else ""
            i += 1
            continue
        if b == 0xFC:
            linea += "<NOMBRE>"
            continue
        linea += fuente.get(b, "{%02X}" % b)
    lineas.append(linea)
    return lineas


def fuente_de(lineas_1, lineas_2):
    """La que da menos caracteres sin traducir."""
    m1 = sum(l.count("{") for l in lineas_1)
    m2 = sum(l.count("{") for l in lineas_2)
    return lineas_1 if m1 < m2 else lineas_2


# los que van con la fuente 1 aunque esten en la tabla de las ventanas
CON_FUENTE1 = {0xB02E}       # EMERGENCY


def todos():
    v = B.ventana_de(15)
    out = []
    for tabla, n, nom in TABLAS:
        for k in range(n):
            p = v.w(tabla + 2 * k)
            if p in CON_FUENTE1:
                l = lee(v, p, FUENTE1)
            else:
                l = fuente_de(lee(v, p, FUENTE1), lee(v, p, FUENTE2))
            out.append((nom, k, p, l))
    return out


def solo(v, a, fuente=FUENTE1):
    """Letras hasta un 0xFF."""
    t = ""
    while v(a) != 0xFF:
        t += fuente.get(v(a), "{%02X}" % v(a))
        a += 1
    return t


def lista(v, a, fuente=FUENTE1):
    """p00:4CF5: [destino] y letras; 0xFE otro destino; 0xFF acaba."""
    lineas, t = [], ""
    a += 2
    while True:
        b = v(a)
        a += 1
        if b == 0xFF:
            lineas.append(t)
            return lineas
        if b == 0xFE:
            lineas.append(t)
            t = ""
            a += 2
            continue
        t += fuente.get(b, "{%02X}" % b)


def rotulos():
    """p10:8A20: OPERATION (p10:8A8F) + el numero (p10:8A6A + 2 x fase), el
    subtitulo (p15:BF0B ingles / p15:BEFD japones) y, en las fases 3-5, el
    planeta (p10:8AA4) detras de PLANET (p10:8A9B)."""
    v10, v15 = B.ventana_de(10), B.ventana_de(15)
    out = []
    for f in range(1, 8):
        n = solo(v10, v10.w(0x8A6A + 2 * f))
        sub = " ".join(lista(v15, v15.w(0xBF0B + 2 * f)))
        pl = solo(v10, v10.w(0x8AA4 + 2 * (f - 3))) if 3 <= f <= 5 else ""
        out.append((f, " ".join(lista(v10, 0x8A8F)) + " " + n, sub, pl))
    return out


def main(argv):
    if "--rotulos" in argv:
        for f, op, sub, pl in rotulos():
            print("%d  %-16s %s%s" % (f, op, sub, ("  PLANET " + pl) if pl else ""))
        return 0
    md = "--md" in argv
    for nom, k, p, l in todos():
        texto = " / ".join(x.replace("\f", "[pagina] ").strip() for x in l if x.strip())
        if md:
            print("| %s | %d | p15:%04X | %s |" % (nom, k, p, texto))
        else:
            print("%-16s %2d %04X  %s" % (nom, k, p, texto))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
