#!/usr/bin/env python3
"""Todas las imagenes de la web, en docs/imagenes, cada una con su cotejo.

  recorrido_fN   tools/mundo.py (la ROM; cotejado con el mapa de la RAM)
  nave           tools/nave.py (la ROM; cotejado con la RAM y la VRAM)
  enemigos_fN    tools/enemigos.py (los dibujos de la ROM; los fotogramas,
                 medidos en openMSX)
  jefe_N         tools/jefes.py (los caracteres y dibujos de la ROM sobre la
                 disposicion de un volcado)
  pantallas      tools/repite.py: la VRAM rehecha con los bytes de la ROM y las
                 escrituras trazadas; aqui se exige que la pantalla pintada sea
                 identica, pixel a pixel, a la de la VRAM volcada en ese momento

Uso: imagenes.py [docs/imagenes]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
RAIZ = os.path.dirname(AQUI)

import enemigos as E     # noqa: E402
import jefes as J        # noqa: E402
import mundo as M        # noqa: E402
import nave as N         # noqa: E402
import pantalla as P     # noqa: E402
import repite as R       # noqa: E402

JEFES = [("1", "k1", "jefe0100_14"), ("2", "j2", "jefe0200_8"), ("3", "j3", "jefe0300_8"),
         ("4", "k4", "jefe0400_20"), ("5", "j5", "jefe0500_8"), ("6", "m6", "jefe0600_30"),
         ("7", "m6", "jefe0700_16"), ("8", "j3", "jefe0800_8"), ("nucleo", "j7", "jefe0002_8")]

# (nombre, directorio de la traza, segundo)
PANTALLAS = [
    ("konami", "epres", 5), ("titulo", "epres", 10), ("saga", "epres", 14),
    ("presents", "epres", 20), ("titulo_solo", "epres", 28),
    ("despegue", "rot1", 15), ("rotulo", "rot1", 17),
    ("eleccion_aviso", "fin2", 40), ("eleccion", "fin2", 48),
    ("final_malo_1", "final", 272), ("final_malo_2", "final", 304),
    ("final_malo_3", "final", 316), ("final_malo_4", "final", 320),
    ("final_malo_5", "final", 336),
    ("final_bueno_1", "bueno", 276), ("final_bueno_2", "bueno", 292),
    ("final_bueno_3", "bueno", 316),
]


def pantallas(dest, escala=2):
    for nom, d, t in PANTALLAS:
        dir_ = os.path.join(RAIZ, "work", d)
        real = open(os.path.join(dir_, "vram-%s.bin" % (str(t))), "rb").read()
        mio, _ = R.rehace(dir_, float(t))
        a = P.pinta(real, real).tobytes()
        b = P.pinta(real, mio)
        distintos = sum(1 for i in range(0, len(a), 3) if a[i:i + 3] != b.tobytes()[i:i + 3])
        P.pinta(mio, mio, escala).save(os.path.join(dest, nom + ".png"))
        print("%-16s %s %3d s: %s" % (nom, d, t, "igual pixel a pixel" if distintos == 0
                                       else "%d PIXELES DISTINTOS" % distintos))


def main(argv):
    dest = argv[1] if len(argv) > 1 else os.path.join(RAIZ, "docs", "imagenes")
    os.makedirs(dest, exist_ok=True)
    for f in range(1, 8):
        M.png(f, os.path.join(dest, "recorrido_f%d.png" % f))
        E.png(f, os.path.join(dest, "enemigos_f%d.png" % f))
    N.png(os.path.join(dest, "nave.png"))
    for n, d, et in JEFES:
        J.png(os.path.join(RAIZ, "work", d), et, os.path.join(dest, "jefe_%s.png" % n))
    pantallas(dest)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
