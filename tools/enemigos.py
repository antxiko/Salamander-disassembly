#!/usr/bin/env python3
"""Los enemigos de cada fase de Salamander, pintados con los dibujos de la ROM.

Un enemigo vive en una de las 12 fichas de 0x40 bytes de 0xE700. p01:6178
pone sus sprites: el primero con la y y la x (IX+04/IX+06), el dibujo IX+30 y
el color IX+31; los demas (IX+0B & 0x3F en total) de IX+34 en adelante, cuatro
bytes cada uno [y][x][dibujo][color]. Los que llevan el bit 6 de IX+0B se
pintan con caracteres en el mapa (p01:61B6): la forma IX+32 de la tabla
p14:90A1, de IX+13 filas por IX+14 columnas.

El dibujo que lleva cada tipo no esta en su ficha (p01:6C5D + 7 x tipo): lo
pone su rutina de arranque (la tabla de p01:66C1) o su animacion. Aqui se
toma de lo que hacen los propios enemigos en openMSX: tools/omsx_vram.tcl con
VRAM_ENEMIGOS guarda la RAM de las 12 fichas cada 0,1 s (work/eN/enemigos.bin)
y de ahi salen, por tipo, los fotogramas distintos (dibujos, colores y el
sitio de cada sprite). Los dibujos y los caracteres son los de la ROM
(tools/vram.py); `coteja` comprueba que cada dibujo usado es el de la VRAM
volcada.

Los tipos 0x31 y 0x3F usan esos campos para otra cosa (largos y direcciones) y
no se pintan aqui.

Uso: enemigos.py lista                       los tipos de cada fase
     enemigos.py coteja                      los dibujos usados contra la VRAM
     enemigos.py png <carpeta> [--escala N]  enemigos_fN.png
"""
import collections
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402
import dibuja as D       # noqa: E402
import vram as V         # noqa: E402

RAIZ = os.path.dirname(AQUI)
REG = 0x410              # 0xE700 (0x300) + 0xEA00 (0x80) + 0xEC80 (0x80) + 0xE300 (0x10)
APARTE = {0x31, 0x3F}
FORMAS = 0x90A1          # banco 14


def registro(fase):
    return open(os.path.join(RAIZ, "work", "e%d" % fase, "enemigos.bin"), "rb").read()


def fotogramas(fase):
    """{tipo: [fotograma]}: de sprites, tuplas (dy, dx, dibujo, color) con el
    primero en (0, 0); de caracteres, ("car", forma, filas, columnas)."""
    d = registro(fase)
    out = collections.OrderedDict()
    for r in range(len(d) // REG):
        b = d[r * REG:r * REG + 0x300]
        if any(b[s * 0x40] > 0x41 for s in range(12)):
            break                            # el fundido usa 0xE700 de bufer (p11:A432)
        for s in range(12):
            e = b[s * 0x40:(s + 1) * 0x40]
            t = e[0]
            if not 1 <= t <= 0x41 or t in APARTE:
                continue                     # (en el fundido 0xE700 es un bufer: p11:A432)
            if e[0x0B] & 0x40:
                if not (e[0x32] < 56 and 0 < e[0x13] <= 8 and 0 < e[0x14] <= 12):
                    continue
                f = ("car", e[0x32], e[0x13], e[0x14])
            else:
                n = e[0x0B] & 0x3F
                if not n:
                    continue
                f = [(0, 0, e[0x30], e[0x31])]
                for k in range(min(n - 1, 3)):
                    q = e[0x34 + 4 * k:0x38 + 4 * k]
                    if q[0] in (0xD0, 0xE0):
                        continue
                    dy = (q[0] - e[4] + 128) % 256 - 128
                    dx = (q[1] - e[6] + 128) % 256 - 128
                    f.append((dy, dx, q[2], q[3]))
                f = tuple(f)
            lista = out.setdefault(t, [])
            if f not in lista:
                lista.append(f)
    return out


def coteja():
    """Cada dibujo de sprite usado, contra la VRAM de los volcados de la fase."""
    for fase in range(1, 8):
        mio = V.sprites_de_la_fase(fase)
        dir_ = os.path.join(RAIZ, "work", "e%d" % fase)
        reales = []
        for dd in (dir_, os.path.join(RAIZ, "work", "f%d" % fase if fase != 7 else "f7n")):
            for nom in sorted(os.listdir(dd)):
                if nom.startswith("vram-"):
                    reales.append(open(os.path.join(dd, nom), "rb").read())
        fs = fotogramas(fase)
        quien = collections.defaultdict(set)
        for t, l in fs.items():
            for f in l:
                if f[0] != "car":
                    for s in f:
                        quien[s[2] & 0xFC].add(t)
        malos = [n for n in sorted(quien)
                 if not any(mio[0x1800 + 8 * n:0x1820 + 8 * n] == r[0x1800 + 8 * n:0x1820 + 8 * n] for r in reales)]
        print("fase %d: %d dibujos usados, %d que no casan con ningun volcado %s"
              % (fase, len(quien), len(malos), ["%02X (tipos %s)" % (n, ",".join("%02X" % t for t in sorted(quien[n]))) for n in malos]))


def pinta_fotograma(px, x0, y0, f, spr, vr, fase):
    if f[0] == "car":
        _, forma, filas, cols = f
        v = B.ventana_de(14)
        a = v.w(FORMAS + 2 * forma)
        for r in range(filas):
            for c in range(cols):
                ch = v(a + r * cols + c)
                for y in range(8):
                    dib = vr[V.DIBUJOS + ch * 8 + y]
                    col = vr[V.COLORES + ch * 8 + y]
                    for x in range(8):
                        tinta = col >> 4 if dib & (0x80 >> x) else col & 0x0F
                        if tinta:
                            px[x0 + 8 * c + x, y0 + 8 * r + y] = D.PALETA[tinta]
        return
    for dy, dx, n, color in reversed(f):
        base = 0x1800 + 8 * (n & 0xFC)
        ec = -32 if color & 0x80 else 0
        for y in range(16):
            for x in range(16):
                if spr[base + 16 * (x // 8) + y] >> (7 - x % 8) & 1:
                    xx, yy = x0 + dx + x + ec, y0 + dy + y
                    if 0 <= xx < px.ancho and 0 <= yy < px.alto and color & 0x0F:
                        px[xx, yy] = D.PALETA[color & 0x0F]


class Lienzo:
    def __init__(self, img):
        self.px, self.ancho, self.alto = img.load(), img.width, img.height

    def __setitem__(self, k, v):
        self.px[k] = v


def caja(f):
    if f[0] == "car":
        return 0, 0, 8 * f[3], 8 * f[2]
    xs = [dx for dy, dx, n, c in f] + [dx + 16 for dy, dx, n, c in f]
    ys = [dy for dy, dx, n, c in f] + [dy + 16 for dy, dx, n, c in f]
    return min(xs), min(ys), max(xs), max(ys)


def sin_modelar(fase, spr):
    """Los dibujos que no carga p00:438C (los vuelca el juego mas tarde)."""
    return {n for n in range(0, 256, 4) if not any(spr[0x1800 + 8 * n:0x1820 + 8 * n])}


def png(fase, salida, escala=2, por_fila=16):
    from PIL import Image
    spr = V.sprites_de_la_fase(fase)
    fuera = sin_modelar(fase, spr)
    fs = collections.OrderedDict()
    for t, lista in fotogramas(fase).items():
        lista = [f for f in lista if f[0] == "car" or not any(sp[2] & 0xFC in fuera for sp in f)]
        if lista:
            fs[t] = lista
    vr = V.de_la_fase(fase)
    filas = []
    for t, lista in sorted(fs.items()):
        lista = lista[:por_fila]
        cajas = [caja(f) for f in lista]
        w = max(c[2] - c[0] for c in cajas)
        h = max(c[3] - c[1] for c in cajas)
        filas.append((t, lista, cajas, w, h))
    ancho = max(len(l) * (w + 4) for t, l, c, w, h in filas) + 4
    alto = sum(h + 6 for t, l, c, w, h in filas) + 4
    img = Image.new("RGB", (ancho, alto), (0, 0, 0))
    px = Lienzo(img)
    y = 4
    for t, lista, cajas, w, h in filas:
        for k, (f, c) in enumerate(zip(lista, cajas)):
            pinta_fotograma(px, 4 + k * (w + 4) - c[0], y - c[1], f, spr, vr, fase)
        y += h + 6
    img.resize((img.width * escala, img.height * escala), Image.NEAREST).save(salida)
    return [(t, len(l)) for t, l, c, w, h in filas]


def main(argv):
    if len(argv) >= 2 and argv[1] == "lista":
        for fase in range(1, 8):
            fs = fotogramas(fase)
            print("fase %d: %s" % (fase, " ".join("%02X(%d)" % (t, len(l)) for t, l in sorted(fs.items()))))
    elif len(argv) >= 2 and argv[1] == "coteja":
        coteja()
    elif len(argv) >= 3 and argv[1] == "png":
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 2
        os.makedirs(argv[2], exist_ok=True)
        for fase in range(1, 8):
            hechos = png(fase, os.path.join(argv[2], "enemigos_f%d.png" % fase), esc)
            print("fase %d: %s" % (fase, " ".join("%02X(%d)" % h for h in hechos)))
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
