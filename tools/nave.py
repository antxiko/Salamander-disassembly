#!/usr/bin/env python3
"""La nave de Salamander, desde sus fichas, con codigo nuestro.

La nave son dos sprites de 16 x 16. Cada cuadro p02:82A1 elige su postura con
los mandos (0 quieta, 1 y 2 las dos direcciones; en vertical, arriba/abajo son
los bits 2-3) y copia la ficha de 9 bytes de la tabla del estado (p02:831C):

  p09:A145  en horizontal, el estado 1: posturas 0-2
  p09:A160  en horizontal, los demas: posturas 3-6 (la 3, quieta en el estado 2
            uno de cada dos cuadros)
  p09:A184  en vertical, el estado 1: posturas 7-9
  p09:A19F  en vertical, los demas: posturas 10-13

Ficha: [dibujo (IY+27)] y dos sprites [dy][dx][numero][color] (p02:8309 les
suma la y y la x de IY+24/IY+26). p01:6060 manda cada cuadro los dos dibujos
de la postura (dos punteros de p14:95F7 + 4 x IY+27) a 0x1800 (el jugador 1)
o 0x1840 (el 2).

Uso: nave.py png <salida.png> [--escala N]
     nave.py coteja <dir> <etiqueta> ...    contra un volcado de omsx_vram.tcl
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402
import dibuja as D       # noqa: E402

TABLAS = ((0xA145, 3), (0xA160, 4), (0xA184, 3), (0xA19F, 4))
DIBUJOS = 0x95F7         # banco 14


def fichas():
    v = B.ventana_de(9)
    out = []
    for t, n in TABLAS:
        for k in range(n):
            a = t + 9 * k
            out.append((v(a), [tuple(v(a + 1 + 4 * s + i) for i in range(4)) for s in range(2)]))
    return out


def dibujos(postura):
    """Los dos dibujos de 32 bytes de la postura (p14:95F7)."""
    v = B.ventana_de(14)
    a = DIBUJOS + 4 * postura
    return [bytes(v(v.w(a + 2 * s) + i) for i in range(32)) for s in range(2)]


def pinta_sprite(px, x0, y0, dib, color):
    for y in range(16):
        for x in range(16):
            if dib[16 * (x // 8) + y] >> (7 - x % 8) & 1:
                px[x0 + x, y0 + y] = D.PALETA[color]


def png(salida, escala=3):
    from PIL import Image
    fs = fichas()
    img = Image.new("RGB", (len(fs) * 24 + 4, 26), (0, 0, 0))
    px = img.load()
    for k, (postura, sprites) in enumerate(fs):
        dib = dibujos(postura)
        # el orden de los atributos: el primero delante
        for s in (1, 0):
            dy, dx, n, color = sprites[s]
            pinta_sprite(px, 4 + 24 * k + dx, 4 + dy, dib[s], color)
    img.resize((img.width * escala, img.height * escala), Image.NEAREST).save(salida)


def coteja(dir_, et):
    vr = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    ram = open(os.path.join(dir_, "ram-%s.bin" % et), "rb").read()
    postura = ram[0xE327]
    dib = dibujos(postura)
    ok_dib = vr[0x1800:0x1820] == dib[0] and vr[0x1820:0x1840] == dib[1]
    ficha = [f for f in fichas() if f[0] == postura][0]
    y, x = ram[0xE324], ram[0xE326]
    esperado = []
    for dy, dx, n, color in ficha[1]:
        esperado += [(y + dy) & 0xFF, (x + dx) & 0xFF, n, color]
    real = list(ram[0xE328:0xE330])
    print("%s: postura %d, dibujos %s, atributos %s (ram %s, nuestros %s)"
          % (et, postura, "iguales" if ok_dib else "DISTINTOS",
             "iguales" if real == esperado else "DISTINTOS", bytes(real).hex(" "), bytes(esperado).hex(" ")))


def main(argv):
    if len(argv) >= 3 and argv[1] == "png":
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 3
        png(argv[2], esc)
    elif len(argv) >= 4 and argv[1] == "coteja":
        for et in argv[3:]:
            coteja(argv[2], et)
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
