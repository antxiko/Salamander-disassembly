#!/usr/bin/env python3
"""Coteja un volcado de openMSX (tools/omsx_vram.tcl) con lo que dibujamos
desde la ROM: los caracteres del decorado (dibujo y color en el tercio de
cada fila) y la tabla de nombres contra el mapa de tools/dibuja.py.

Las estrellas (0x50 y 0x51) se mueven y no cuentan. Lo que el codigo pinta
encima de un hueco del mapa (canones, compuertas) se cuenta aparte. En la fase
4, entre los scrolls 0x100 y 0x150, p00:5FC5 vuelca el mapa sin el decorado
(p01:6016) salvo un cuadro de cada 64.

Uso: coteja_vram.py <dir> <etiqueta> [...]   p. ej. coteja_vram.py work/f4 30
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import dibuja as D   # noqa: E402
import vram as V     # noqa: E402

ENEMIGOS = {0x50, 0x51}   # las estrellas


def lee_vdp(ruta):
    d = {}
    for ln in open(ruta):
        k, v = ln.split("=")
        d[k.strip()] = int(v, 16)
    return d


def coteja(dir_, et):
    vr = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    info = lee_vdp(os.path.join(dir_, "vdp-%s.txt" % et))
    fase = info["fase"]
    scroll = info["scroll_l"] | info["scroll_h"] << 8
    if not 1 <= fase <= 7:
        print("%s: fase %d, nada que cotejar" % (et, fase))
        return
    tramos = V.tramos(fase)
    mio = [x for desde, x in tramos if scroll >= desde][-1]
    pant = [[vr[0x3800 + 32 * r + c] for c in range(32)] for r in range(21)]
    malos, usados = set(), set()
    for r in range(21):
        t = 0x800 * (r // 8)
        for c in range(32):
            ch = pant[r][c]
            if ch in ENEMIGOS:
                continue
            usados.add((t, ch))
    for t, ch in usados:
        a = slice(t + ch * 8, t + ch * 8 + 8)
        b = slice(0x2000 + t + ch * 8, 0x2000 + t + ch * 8 + 8)
        if vr[a] != mio[a] or vr[b] != mio[b]:
            malos.add((t // 0x800, ch))
    filas = D.filas_del_mapa(fase)
    ini, fin, vert = D.recorrido(fase)
    # Donde deberia estar: la columna (o fila) que entra con el scroll s es la
    # s - principio del mapa, en el borde derecho (o arriba).
    o = scroll - ini - (31 if not vert else 0)
    animados = {p[0] for p in V.animacion(fase)}
    iguales = distintas = encima = corridas = 0
    ejemplos = []

    def casilla(r, c, d):
        if vert:
            y = len(filas) - 1 - (scroll - ini) + r + d   # la fila nueva entra arriba
            return filas[y][c] if 0 <= y < len(filas) else 0
        x = o + c + d
        return filas[r][x] if 0 <= x < len(filas[0]) else 0

    for r in range(21):
        # el volcado puede pillar el refresco a medias: una fila corrida una casilla
        mejor = None
        for d in (0, -1, 1):
            cuenta = [0, 0, 0, []]
            for c in range(32):
                ch, m = pant[r][c], casilla(r, c, d)
                if ch in ENEMIGOS or m in (0x50, 0x51) or m in animados:
                    continue
                if ch == m:
                    cuenta[0] += 1
                elif m == 0:
                    cuenta[2] += 1       # algo pintado por el codigo sobre un hueco
                else:
                    cuenta[1] += 1
                    cuenta[3].append("f%d c%d pant %02X mapa %02X" % (r, c, ch, m))
            if mejor is None or cuenta[1] < mejor[1][1]:
                mejor = (d, cuenta)
        d, cuenta = mejor
        corridas += d != 0
        iguales += cuenta[0]
        distintas += cuenta[1]
        encima += cuenta[2]
        ejemplos += cuenta[3][:max(0, 6 - len(ejemplos))]
    malos = {m for m in malos if m[1] not in animados}
    print("%s: fase %d, scroll 0x%03X: %d caracteres en pantalla, %d distintos de los nuestros %s; "
          "mapa: %d casillas iguales, %d distintas %s, %d pintadas encima de huecos, %d filas corridas"
          % (et, fase, scroll, len(usados), len(malos),
             sorted("%d:%02X" % m for m in malos)[:12], iguales, distintas, ejemplos, encima, corridas))


def main(argv):
    if len(argv) < 3:
        sys.exit(__doc__)
    for et in argv[2:]:
        coteja(argv[1], et)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
