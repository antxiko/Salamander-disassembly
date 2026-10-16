#!/usr/bin/env python3
"""Dibuja desde la ROM los mapas de las fases de Salamander.

El mapa de una fase sale de las mismas tablas que leen p00:49BB (en
horizontal) y p00:4A88 (en vertical, las fases 2, 3 y 6) al meter cada
columna o fila nueva en el mapa de la RAM (0xCA00, 64 por fila):
  - p13:6F4C[fase]: el mapa, un byte por bloque de 4 x 4 caracteres; en
    horizontal cada columna son 6 bloques (24 filas, de las que se ven 21:
    p01:6016 vuelca 21 a 0x3800) y en vertical cada fila son 8 (32 columnas),
    y las filas nuevas entran por arriba;
  - el recorrido de la fase (p02:88F2, 6 bytes por fase: principio, final y
    otra palabra) dice desde donde se lee: (scroll - principio) / 4 es la
    columna o la fila de bloques;
  - los bloques 0-3 son los comunes de p13:600E y los demas, menos 4, los de
    la fase (p13:5FFE + 2 x fase, p00:4A34): 16 bytes, cuatro filas de cuatro.
Los caracteres son los que deja en la VRAM p00:44B7 (tools/vram.py), y los
cambios de p00:5C77 a mitad de fase se aplican a las columnas (o filas) que
entran en la pantalla con ese scroll o despues. En
horizontal el tercio de cada fila es el de la pantalla; en vertical las filas
pasan por los tres tercios y se pintan con el de arriba (ver --tercios).

Uso: dibuja.py mapa <fase> <salida.png> [--escala N]
     dibuja.py mapas <directorio>      las 7
     dibuja.py tercios                 cuantos caracteres del mapa cambian de tercio a tercio
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402
import vram as V         # noqa: E402

# La paleta del TMS9918. El color 0 (transparente) deja ver el fondo, negro.
PALETA = [
    (0, 0, 0), (0, 0, 0), (33, 200, 66), (94, 220, 120),
    (84, 85, 237), (125, 118, 252), (212, 82, 77), (66, 235, 245),
    (252, 85, 84), (255, 121, 120), (212, 193, 84), (230, 206, 128),
    (33, 176, 59), (201, 91, 186), (204, 204, 204), (255, 255, 255),
]

FASES = range(1, 8)
FILAS_VISIBLES = 21


def recorrido(fase):
    v = B.Ventana((1, 2, 3))
    return v.w(0x88F2 + 6 * fase), v.w(0x88F4 + 6 * fase), bool(v(0x8921 + fase))


def bloque(fase, n):
    m = B.Ventana((13, 14, 15))
    if n < 4:
        base = 0x600E + 16 * n
    else:
        base = m.w(0x5FFE + 2 * fase) + 16 * (n - 4)
    return [m(base + i) for i in range(16)]


def filas_del_mapa(fase, con_scroll=False):
    """Las filas de numeros de caracter, de arriba abajo; con con_scroll, cada
    casilla es (caracter, scroll con el que entra en la pantalla)."""
    m = B.Ventana((13, 14, 15))
    mapa = m.w(0x6F4C + 2 * fase)
    ini, fin, vert = recorrido(fase)
    pasos = (fin - 1 - ini) // 4 + 1
    if not vert:
        filas = [[] for _ in range(24)]
        for c in range(pasos):
            col = [m(mapa + 6 * c + i) for i in range(6)]
            for x in range(4):
                for r, n in enumerate(col):
                    b = bloque(fase, n)
                    for k in range(4):
                        ch = b[4 * k + x]
                        filas[4 * r + k].append((ch, ini + 4 * c + x) if con_scroll else ch)
        return filas[:FILAS_VISIBLES]
    filas = []
    for r in range(pasos):
        fila = [m(mapa + 8 * r + i) for i in range(8)]
        trozo = [[] for _ in range(4)]
        for n in fila:
            b = bloque(fase, n)
            for k in range(4):
                for ch in b[4 * k:4 * k + 4]:
                    trozo[k].append((ch, ini + 4 * r + 3 - k) if con_scroll else ch)
        filas = trozo + filas          # entran por arriba
    return filas


def pinta(filas, tramos, vertical=False, escala=1):
    """filas con (caracter, scroll); tramos de vram.tramos()."""
    from PIL import Image
    alto, ancho = len(filas), len(filas[0])
    img = Image.new("RGB", (ancho * 8, alto * 8))
    px = img.load()
    for f in range(alto):
        tercio = 0 if vertical else f // 8
        for c in range(ancho):
            ch, sc = filas[f][c]
            vram = [vr for desde, vr in tramos if sc >= desde][-1]
            base = tercio * 0x800 + ch * 8
            for y in range(8):
                dib = vram[V.DIBUJOS + base + y]
                col = vram[V.COLORES + base + y]
                tinta, fondo = PALETA[col >> 4], PALETA[col & 0x0F]
                for x in range(8):
                    px[c * 8 + x, f * 8 + y] = tinta if dib & (0x80 >> x) else fondo
    if escala != 1:
        img = img.resize((img.width * escala, img.height * escala), Image.NEAREST)
    return img


def tercios():
    for fase in FASES:
        vr = V.de_la_fase(fase)
        usados = sorted({c for f in filas_del_mapa(fase) for c in f})
        dist = 0
        for ch in usados:
            a = [vr[t * 0x800 + ch * 8 + i] for t in range(3) for i in range(8)]
            d = [vr[0x2000 + t * 0x800 + ch * 8 + i] for t in range(3) for i in range(8)]
            if a[0:8] != a[8:16] or a[0:8] != a[16:24] or d[0:8] != d[8:16] or d[0:8] != d[16:24]:
                dist += 1
        print("fase %d (%s): %d caracteres usados, %d distintos entre tercios"
              % (fase, "vertical" if recorrido(fase)[2] else "horizontal", len(usados), dist))


def main(argv):
    if len(argv) >= 4 and argv[1] == "mapa":
        fase = int(argv[2])
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
        pinta(filas_del_mapa(fase, True), V.tramos(fase), recorrido(fase)[2], esc).save(argv[3])
    elif len(argv) >= 3 and argv[1] == "mapas":
        os.makedirs(argv[2], exist_ok=True)
        for fase in FASES:
            filas = filas_del_mapa(fase, True)
            pinta(filas, V.tramos(fase), recorrido(fase)[2]).save(
                os.path.join(argv[2], "fase_%d.png" % fase))
            print("fase %d: %d x %d caracteres" % (fase, len(filas[0]), len(filas)))
    elif len(argv) >= 2 and argv[1] == "tercios":
        tercios()
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
