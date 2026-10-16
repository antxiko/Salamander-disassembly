#!/usr/bin/env python3
"""Los jefes de Salamander en su pantalla, pintados con los graficos de la ROM.

Un jefe esta hecho de caracteres (piezas de p07:6079 que p11 pone en el mapa
de la RAM) y de sprites. Aqui la disposicion (que caracter va en cada casilla
y que sprite en cada sitio) se toma de un volcado de openMSX del momento
(tools/omsx_vram.tcl con VRAM_JEFE), y los dibujos y colores de lo que carga
el cartucho: los caracteres de la fase y los del jefe (vram.del_jefe, p00:4DC8)
y los dibujos de sprite de la fase (vram.sprites_de_la_fase). `coteja` dice que
caracteres y dibujos del volcado no son los nuestros.

Que jefe sale en cada fase (p02:8525-86EF): 1 en la 1, 2 en la 2, 8 y luego 3
en la 3, 4 en la 4, 5 en la 5, 7 y luego 6 en la 6; la 7 acaba con el objeto
fijo de 0xE6C8 (p12:A000) en dos tramos.

Uso: jefes.py coteja <dir> <etiqueta> ...
     jefes.py png <dir> <etiqueta> <salida.png> [--escala N]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import dibuja as D       # noqa: E402
import vram as V         # noqa: E402


def lee(dir_, et):
    vr = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    ram = open(os.path.join(dir_, "ram-%s.bin" % et), "rb").read()
    return vr, ram


def modelo(ram):
    fase, jefe = ram[0xE301], ram[0xE640]
    s = ram[0xE302] | ram[0xE303] << 8
    vr = bytearray([x for desde, x in V.tramos(fase) if s >= desde][-1])
    if jefe:
        V.del_jefe(fase, jefe, vr)
    V.sprites_de_la_fase(fase, vr)
    import nave
    d0, d1 = nave.dibujos(ram[0xE327])      # la nave, que p01:6060 vuelca cada cuadro
    vr[0x1800:0x1820], vr[0x1820:0x1840] = d0, d1
    return vr


def atributos(vr):
    out = []
    for k in range(32):
        y, x, n, c = vr[0x3B00 + 4 * k:0x3B04 + 4 * k]
        if y == 0xD0:
            break
        out.append((y, x, n, c))
    return out


def coteja(dir_, et):
    real, ram = lee(dir_, et)
    mio = modelo(ram)
    usados, malos = set(), set()
    for r in range(21):
        t = 0x800 * (r // 8)
        for c in range(32):
            ch = real[0x3800 + 32 * r + c]
            usados.add((t, ch))
    for t, ch in usados:
        a = slice(t + ch * 8, t + ch * 8 + 8)
        b = slice(0x2000 + t + ch * 8, 0x2000 + t + ch * 8 + 8)
        if real[a] != mio[a] or real[b] != mio[b]:
            malos.add((t // 0x800, ch))
    spr = {n & 0xFC for y, x, n, c in atributos(real) if y not in (0xE0,)}
    smalos = [n for n in sorted(spr) if real[0x1800 + 8 * n:0x1820 + 8 * n] != mio[0x1800 + 8 * n:0x1820 + 8 * n]]
    print("%s: fase %d, jefe %d, objeto 0x%02X: %d caracteres, %d distintos %s; %d dibujos de sprite, %d distintos %s"
          % (et, ram[0xE301], ram[0xE640], ram[0xE6C8], len(usados), len(malos),
             sorted("%d:%02X" % m for m in malos)[:16], len(spr), len(smalos), ["%02X" % n for n in smalos]))
    return malos, smalos


def png(dir_, et, salida, escala=2):
    from PIL import Image
    real, ram = lee(dir_, et)
    mio = modelo(ram)
    img = Image.new("RGB", (256, 168), (0, 0, 0))
    px = img.load()
    for r in range(21):
        t = 0x800 * (r // 8)
        for c in range(32):
            ch = real[0x3800 + 32 * r + c]
            for y in range(8):
                dib = mio[0x2000 + t + ch * 8 + y]
                col = mio[t + ch * 8 + y]
                for x in range(8):
                    k = col >> 4 if dib & (0x80 >> x) else col & 0x0F
                    if k:
                        px[c * 8 + x, r * 8 + y] = D.PALETA[k]
    for y0, x0, n, c in reversed(atributos(real)):
        if y0 in (0xE0, 0xD0) or not c & 0x0F:
            continue
        y0 = (y0 + 1) & 0xFF
        if y0 > 0xD0:
            y0 -= 256
        x0 -= 32 if c & 0x80 else 0
        base = 0x1800 + 8 * (n & 0xFC)
        for y in range(16):
            for x in range(16):
                if mio[base + 16 * (x // 8) + y] >> (7 - x % 8) & 1:
                    xx, yy = x0 + x, y0 + y
                    if 0 <= xx < 256 and 0 <= yy < 168:
                        px[xx, yy] = D.PALETA[c & 0x0F]
    img.resize((256 * escala, 168 * escala), Image.NEAREST).save(salida)


def main(argv):
    if len(argv) >= 4 and argv[1] == "coteja":
        for et in argv[3:]:
            coteja(argv[2], et)
    elif len(argv) >= 5 and argv[1] == "png":
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 2
        png(argv[2], argv[3], argv[4], esc)
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
