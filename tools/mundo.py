#!/usr/bin/env python3
"""El recorrido entero de cada fase de Salamander: el mapa principal y los
tramos en el otro eje ("los altos"), montados como los va metiendo el juego en
el mapa de la RAM.

Cada fase es una lista de tramos (p02:8525-86EF, por 0xE309). Un tramo de
scroll normal avanza hasta el alto de 0xE625 (el primero es la tercera palabra
del recorrido de p02:88F2) y mete columnas (p00:49BF, horizontal) o filas
(p00:4A8C, vertical) del mapa de la fase (tools/dibuja.py). Un tramo de altos
(0xE610 distinto de 0, p00:4BE6) para ese scroll y mueve la vista por otro
mapa de p14 con el contador 0xE612 hasta 0xE614, de dos en dos cuadros:
  1  hacia abajo: la fila nueva entra por abajo (p00:4C55), sacada con
     p00:4A8C de p14:80FC (fase 1) o p14:815C (las demas), con 0xE612 como
     scroll: el bloque 0xE612 / 4 de 8 de ancho, su fila 3 - (0xE612 & 3)
  3  a la izquierda y 4 a la derecha: la columna nueva entra por ese lado
     (p00:4C19 / p00:4C01), sacada con p00:49BF de p14:818C: la columna de
     bloques 0xE612 / 4 (6 de alto), su columna 0xE612 & 3
Los tramos de jefe y de suceso no mueven nada.

Las coordenadas son las del mundo: x a la derecha e y hacia abajo, en
caracteres; la vista son 32 columnas por 24 filas en horizontal (se ven 21)
y 32 por 21 en vertical.

Uso: mundo.py png <carpeta> [--escala N]     recorrido_fN.png
     mundo.py coteja <dir> <etiqueta> ...    la vista contra el mapa de la RAM
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402
import dibuja as D       # noqa: E402
import vram as V         # noqa: E402

# (que, ...): ("h", alto) scroll normal hasta alto; ("abajo", mapa, desde,
# hasta), ("izquierda"/"derecha", mapa, desde, hasta): altos con 0xE612
GUION = {
    1: [("h", 0x11F), ("abajo", 0x80FC, 0x18, 0x00), ("h", 0x1FF),
        ("abajo", 0x80FC, 0x30, 0x18), ("h", 0x21F)],          # p02:8525-858C
    2: [("h", 0x20F)],                                          # p02:85A5
    3: [("h", 0x20F)],                                          # p02:85B5
    4: [("h", 0x1BF), ("abajo", 0x815C, 0x18, 0x00), ("h", 0x25F)],   # p02:85D2-85F9
    5: [("h", 0x1DF)],                                          # p02:8626
    6: [("h", 0x14F), ("izquierda", 0x818C, 0x20, 0x00), ("h", 0x167),
        ("derecha", 0x818C, 0x1F, 0x3F), ("h", 0x227)],         # p02:8636-86A0
    7: [("h", 0x1BF), ("h", 0x1DF)],                            # p02:86B4-86D2
}
SCROLL_INICIAL = 0x20     # p02:8707


def mapa_principal(fase):
    m = B.Ventana((13, 14, 15))
    return m.w(0x6F4C + 2 * fase)


def fila_vertical(fase, mapa, e, m):
    """La fila de 32 caracteres de p00:4A8C con el scroll e."""
    base = mapa + 8 * (e // 4)
    k = 3 - (e & 3)
    out = []
    for b in range(8):
        bl = D.bloque(fase, m(base + b))
        out.extend(bl[4 * k:4 * k + 4])
    return out


def columna_horizontal(fase, mapa, e, m):
    """La columna de 24 caracteres de p00:49BF con el scroll e."""
    base = mapa + 6 * (e // 4)
    x = e & 3
    out = []
    for r in range(6):
        bl = D.bloque(fase, m(base + r))
        out.extend(bl[4 * k + x] for k in range(4))
    return out


def simula(fase, parar=None):
    """{(x, y): (caracter, scroll)} y la vista (vx, vy) al acabar (o al llegar
    al estado parar = (tramo, scroll, e612): la vista justo despues)."""
    ini, fin, vert = D.recorrido(fase)
    m = B.Ventana((13, 14, 15))
    mp = mapa_principal(fase)
    w14 = B.ventana_de(14)
    mundo = {}
    s = SCROLL_INICIAL
    vx, vy = 0, 0
    if not vert:
        vx = s - ini - 31
    else:
        vy = -(s - ini)
    for t, tramo in enumerate(GUION[fase]):
        if tramo[0] == "h":
            while s < tramo[1]:
                s += 1
                c = s - ini
                if not vert:
                    vx = c - 31
                    if 0 <= c and s < fin:
                        col = columna_horizontal(fase, mp, c, m)
                        for r in range(24):
                            mundo[(c, vy + r)] = (col[r], s)
                else:
                    vy = -c
                    if 0 <= c and s < fin:
                        fila = fila_vertical(fase, mp, c, m)
                        for i in range(32):
                            mundo[(vx + i, vy)] = (fila[i], s)
                if parar and parar[0] == t and parar[1] == s:
                    return mundo, (vx, vy)
        else:
            que, mapa, desde, hasta = tramo
            paso = -1 if desde > hasta else 1
            for e in range(desde + paso, hasta + paso, paso):
                if que == "abajo":
                    vy += 1
                    fila = fila_vertical(fase, mapa, e, w14)
                    for i in range(32):
                        mundo[(vx + i, vy + 23)] = (fila[i], s)
                else:
                    vx += -1 if que == "izquierda" else 1
                    x = vx if que == "izquierda" else vx + 31
                    col = columna_horizontal(fase, mapa, e, w14)
                    for r in range(24):
                        mundo[(x, vy + r)] = (col[r], s)
                if parar and parar[0] == t and parar[2] == e:
                    return mundo, (vx, vy)
    return mundo, (vx, vy)


def png(fase, salida, escala=1):
    from PIL import Image
    mundo, _ = simula(fase)
    tramos = V.tramos(fase)
    vert = D.recorrido(fase)[2]
    xs = [x for x, y in mundo]
    ys = [y for x, y in mundo]
    x0, y0 = min(xs), min(ys)
    ancho, alto = max(xs) - x0 + 1, max(ys) - y0 + 1
    img = Image.new("RGB", (ancho * 8, alto * 8), (0, 0, 0))
    px = img.load()
    for (x, y), (ch, sc) in mundo.items():
        if not ch:
            continue
        vr = [v for desde, v in tramos if sc >= desde][-1]
        tercio = 0 if vert else (y % 24) // 8
        base = tercio * 0x800 + ch * 8
        for yy in range(8):
            dib = vr[V.DIBUJOS + base + yy]
            col = vr[V.COLORES + base + yy]
            for xx in range(8):
                c = col >> 4 if dib & (0x80 >> xx) else col & 0x0F
                if c:
                    px[(x - x0) * 8 + xx, (y - y0) * 8 + yy] = D.PALETA[c]
    if escala != 1:
        img = img.resize((img.width * escala, img.height * escala), Image.NEAREST)
    img.save(salida)
    return ancho, alto


def coteja(dir_, et):
    """El mapa de la RAM (0xCA00, 64 por fila) contra la vista del mundo en el
    mismo punto del guion (0xE309 el tramo, 0xE302 el scroll, 0xE612 los altos)."""
    ram = open(os.path.join(dir_, "ram-%s.bin" % et), "rb").read()
    fase = ram[0xE301]
    t = ram[0xE309]
    s = ram[0xE302] | ram[0xE303] << 8
    e = ram[0xE612] | ram[0xE613] << 8
    vert = D.recorrido(fase)[2]
    if t >= len(GUION[fase]):
        t = len(GUION[fase]) - 1
    tramo = GUION[fase][t]
    if tramo[0] != "h" and ram[0xE610] == 0:
        t += 1                   # el tramo de altos ya acabo: sigue el normal
    parar = (t, s, e) if GUION[fase][min(t, len(GUION[fase]) - 1)][0] == "h" else (t, None, e)
    mundo, (vx, vy) = simula(fase, parar)
    filas = 21
    iguales = distintas = 0
    ej = []
    for r in range(filas):
        for c in range(32):
            real = ram[0xCA00 + 64 * r + c]
            mio = mundo.get((vx + c, vy + r), (0, 0))[0]
            if real in (0x50, 0x51) or mio in (0x50, 0x51):
                continue
            if real == mio:
                iguales += 1
            elif mio == 0 or real == 0 or real >= 0xC0:
                pass                 # objetos pintados encima o decorado roto
            else:
                distintas += 1
                if len(ej) < 5:
                    ej.append("f%d c%d ram %02X nuestro %02X" % (r, c, real, mio))
    print("%s: fase %d, tramo %d, scroll 0x%03X, altos 0x%02X: %d iguales, %d distintas %s"
          % (et, fase, t, s, e, iguales, distintas, ej))


def main(argv):
    if len(argv) >= 3 and argv[1] == "png":
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
        os.makedirs(argv[2], exist_ok=True)
        for fase in range(1, 8):
            a, h = png(fase, os.path.join(argv[2], "recorrido_f%d.png" % fase), esc)
            print("fase %d: %d x %d caracteres" % (fase, a, h))
    elif len(argv) >= 4 and argv[1] == "coteja":
        for et in argv[3:]:
            coteja(argv[2], et)
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
