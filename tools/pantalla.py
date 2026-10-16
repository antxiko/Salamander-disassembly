#!/usr/bin/env python3
"""Pinta una pantalla entera de SCREEN 2 (24 filas de caracteres y los
sprites) a partir de una VRAM de 16 KB: la de un volcado de openMSX o la que
monta nuestro codigo con los datos de la ROM.

pinta(vram_nombres, vram_dibujos) usa la tabla de nombres (0x3800) y los
atributos (0x3B00) de la primera y los dibujos y colores (0x0000, 0x2000,
0x1800) de la segunda, para pintar con los graficos de la ROM la disposicion
de un volcado.

Uso: pantalla.py <dir> <etiqueta> <salida.png> [--escala N]   con la VRAM del volcado
     pantalla.py hoja <dir> <etiqueta> <salida.png>        varias de un vistazo
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import dibuja as D       # noqa: E402


def atributos(vr):
    out = []
    for k in range(32):
        y, x, n, c = vr[0x3B00 + 4 * k:0x3B04 + 4 * k]
        if y == 0xD0:
            break
        out.append((y, x, n, c))
    return out


def pinta(nombres, dibujos, escala=1, filas=24, fondo=0):
    from PIL import Image
    img = Image.new("RGB", (256, 8 * filas), D.PALETA[fondo])
    px = img.load()
    for r in range(filas):
        t = 0x800 * (r // 8)
        for c in range(32):
            ch = nombres[0x3800 + 32 * r + c]
            for y in range(8):
                dib = dibujos[0x2000 + t + ch * 8 + y]
                col = dibujos[t + ch * 8 + y]
                for x in range(8):
                    k = col >> 4 if dib & (0x80 >> x) else col & 0x0F
                    if k:
                        px[c * 8 + x, r * 8 + y] = D.PALETA[k]
    for y0, x0, n, c in reversed(atributos(nombres)):
        if not c & 0x0F:
            continue
        y0 = (y0 + 1) & 0xFF
        if y0 > 0xD0:
            y0 -= 256
        x0 -= 32 if c & 0x80 else 0
        base = 0x1800 + 8 * (n & 0xFC)
        for y in range(16):
            for x in range(16):
                if dibujos[base + 16 * (x // 8) + y] >> (7 - x % 8) & 1:
                    xx, yy = x0 + x, y0 + y
                    if 0 <= xx < 256 and 0 <= yy < 8 * filas:
                        px[xx, yy] = D.PALETA[c & 0x0F]
    if escala != 1:
        img = img.resize((img.width * escala, img.height * escala), Image.NEAREST)
    return img


def lee(dir_, et):
    return open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()


def main(argv):
    if len(argv) >= 5 and argv[1] == "hoja":
        from PIL import Image
        ets = argv[3].split(",")
        out = Image.new("RGB", (4 * 260, ((len(ets) + 3) // 4) * 196), (60, 0, 60))
        for k, et in enumerate(ets):
            vr = lee(argv[2], et)
            out.paste(pinta(vr, vr), ((k % 4) * 260, (k // 4) * 196))
        out.save(argv[4])
    elif len(argv) >= 4:
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
        vr = lee(argv[1], argv[2])
        pinta(vr, vr, esc).save(argv[3])
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
