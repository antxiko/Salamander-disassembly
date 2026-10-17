#!/usr/bin/env python3
"""Las armas y los objetos de Salamander, dibujados desde la ROM.

El marcador de armas (p00:5D8E) son 7 casillas y una ventana de 5 caracteres
(0x16-0x1A el jugador 1, 0x1B-0x1F el 2). p00:5DF1 pinta en la ventana una
pieza de la tabla p14:8849: cada caracter es una fila a 0 y 7 bytes de la
pieza (35 en total), y el byte 36 es el color de los 40. La pieza de cada
casilla sale de su lista (p00:5E52 + 2 x casilla) con su nivel.

Los objetos que suelta un enemigo (p01:7C36, 0xEC20 = el tipo, 0xEC21-22 su
sitio) son 2 x 2 caracteres, 0x24-0x27 (p02:8B97). p00:4882 trae sus dibujos y
colores con las rachas de la tabla p09:A331 (cuatro bytes por tipo) a 0x2120 y
0x0120, en los tres tercios. Al cogerlo, p02:991B: el tipo 1 pone el reloj en
S.STOP, el 2 en O.HOLD, el 3 en SPARK, el 5 se lo da al otro jugador y el 6 en
O.CHAIN; el 4 no hace nada.

Uso: armas.py png <carpeta>         piezas.png y objetos.png
     armas.py coteja                las piezas y los objetos contra la VRAM
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.dirname(AQUI)
import bloques as B      # noqa: E402
import dibuja as D       # noqa: E402
import vram as V         # noqa: E402

PIEZAS = 0x8849          # banco 14
N_PIEZAS = 22            # 0x8849 + 2 x 22 son dos 0xFFFF
LISTAS = 0x5E52          # banco 0
OBJETOS = 0xA331         # banco 9
TIPOS = range(1, 7)


def pieza(k):
    """Los 40 bytes de dibujo de la ventana (5 caracteres) y su color."""
    v = B.ventana_de(14)
    a = v.w(PIEZAS + 2 * k)
    d = [v(a + i) for i in range(35)]
    dib = []
    for c in range(5):
        dib += [0] + d[7 * c:7 * c + 7]
    return dib, v(a + 35)


def listas():
    """La pieza de cada nivel de cada casilla (p00:5E54..5E79)."""
    v = B.ventana_de(0)
    p = [v.w(LISTAS + 2 * c) for c in range(1, 8)] + [0x5E79]
    return [[v(a) for a in range(p[i], p[i + 1])] for i in range(7)]


def objeto(tipo):
    """Los dibujos (0x2120) y colores (0x0120) de los caracteres 0x24-0x27."""
    vr = bytearray(0x4000)
    v = B.ventana_de(9)
    e = OBJETOS + 4 * tipo
    V.rachas_3(vr, v, v.w(e), 0x2120)
    V.rachas_3(vr, v, v.w(e + 2), 0x0120)
    return vr


def pinta_caracteres(img, x0, y0, dib, col):
    px = img.load()
    for y in range(8):
        for x in range(8):
            k = col[y] >> 4 if dib[y] & (0x80 >> x) else col[y] & 0x0F
            px[x0 + x, y0 + y] = D.PALETA[k] if k else (0, 0, 0)


def png(dest, escala=4):
    from PIL import Image
    img = Image.new("RGB", (4 * 48, 6 * 12), (0, 0, 0))
    for k in range(N_PIEZAS):
        dib, c = pieza(k)
        for ch in range(5):
            pinta_caracteres(img, (k % 4) * 48 + 4 + 8 * ch, (k // 4) * 12 + 2,
                             dib[8 * ch:8 * ch + 8], [c] * 8)
    img.resize((img.width * escala, img.height * escala), Image.NEAREST).save(
        os.path.join(dest, "piezas.png"))
    img = Image.new("RGB", (len(TIPOS) * 24, 24), (0, 0, 0))
    for i, t in enumerate(TIPOS):
        vr = objeto(t)
        for n in range(4):
            ch = 0x24 + n
            pinta_caracteres(img, i * 24 + 4 + 8 * (n % 2), 4 + 8 * (n // 2),
                             vr[0x2000 + 8 * ch:0x2008 + 8 * ch], vr[8 * ch:8 * ch + 8])
    img.resize((img.width * escala, img.height * escala), Image.NEAREST).save(
        os.path.join(dest, "objetos.png"))


def coteja():
    malos = 0
    # las ventanas: work/ventanas, una partida en la que la sonda pone una
    # capsula 0x29 encima de la nave cada 2 s (24, 26... 36): cada una avanza
    # la casilla (p02:97C9) y el juego repinta el marcador; volcado 1 s despues
    ls = listas()
    for t in range(25, 38, 2):
        d = os.path.join(RAIZ, "work", "ventanas")
        ram = open(os.path.join(d, "ram-%d.bin" % t), "rb").read()
        vr = open(os.path.join(d, "vram-%d.bin" % t), "rb").read()
        k = ram[0xE311]
        nivel = ram[0xE311 + k]
        p = 0 if nivel == 0xFF else ls[k - 1][nivel]
        dib, c = pieza(p)
        ok = list(vr[0x30B0:0x30D8]) == dib and set(vr[0x10B0:0x10D8]) == {c}
        malos += not ok
        print("casilla %d (nivel %02X): la pieza %2d %s" % (k, nivel, p, "igual" if ok else "DISTINTA"))
    # los objetos: los volcados de partidas con 0xEC20 puesto
    for d, et in (("f1", "160"), ("f4", "130")):
        ram = open(os.path.join(RAIZ, "work", d, "ram-%s.bin" % et), "rb").read()
        vr = open(os.path.join(RAIZ, "work", d, "vram-%s.bin" % et), "rb").read()
        mio = objeto(ram[0xEC20])
        zonas = [(t + 0x2120, t + 0x2140) for t in (0, 0x800, 0x1000)] + \
                [(t + 0x0120, t + 0x0140) for t in (0, 0x800, 0x1000)]
        dist = sum(1 for a, b in zonas for i in range(a, b) if mio[i] != vr[i])
        malos += dist != 0
        print("objeto %d (%s, %s s): %d bytes distintos" % (ram[0xEC20], d, et, dist))
    return malos


def main(argv):
    if len(argv) >= 3 and argv[1] == "png":
        png(argv[2])
    elif len(argv) >= 2 and argv[1] == "coteja":
        return 1 if coteja() else 0
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
