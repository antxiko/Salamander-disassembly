#!/usr/bin/env python3
"""La musica de Salamander (PSG y SCC), ejecutando su motor de sonido
(tools/motor_musica.py, el mismo que Nemesis 2).

El arranque (p00:410B) deja toda la RAM del juego (0xE000-0xEFFF) a cero.
`pide_sonido` (p00:4D6E) pone los bancos 4, 5 y 6 y llama a arranca_sonido
(p04:6472) con el numero en A; cada cuadro la interrupcion (p00:4085) pone
los mismos bancos y llama a sonido_cuadro (p04:6978), que lleva los ocho
canales (0xE000 + 0x2C x k: tres del PSG y cinco del SCC). La cabecera de
cada sonido (p04:663E + 2 x numero) dice que canales usa: los efectos, dos
(mascara 0x30); las musicas, seis u ocho (0xCF o 0xFF).

Uso:  musica.py registros 0x23 [cuadros] | mp3 0x23 f.mp3 | todas docs/audio
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
from motor_musica import P  # noqa: E402

# Las de seis u ocho canales (p04:663E). La 0x01 y las de dos cuadros (0x1A,
# 0x23, 0x26, 0x29-0x2D, 0x49) callan: no se publican.
CANDIDATAS = list(range(0x19, 0x33)) + [0x34, 0x48, 0x49, 0x4E]

PIEZAS = [
    P(0x4E, "El logotipo de Konami (y cae un jefe: la 0x25 suena igual)", "The Konami logo (and a boss falls: 0x25 sounds the same)", "p10:82D7; la 0x25, p02:9CB8 y p11:B575"),
    P(0x2E, "El titulo", "The title", "p10:83B3"),
    P(0x28, "El despegue", "The take-off", "p10:887B"),
    P(0x48, "La nave sale", "The ship leaves", "p10:88A0 y p10:88E3"),
    P(0x1B, "Fase 1", "Stage 1", "p02:876A, la lista de la fase 1"),
    P(0x1C, "Fase 2", "Stage 2", "p02:876A, la lista de la fase 2"),
    P(0x1E, "Fase 3", "Stage 3", "p02:876A, la lista de la fase 3"),
    P(0x1D, "Fase 4", "Stage 4", "p02:876A, la lista de la fase 4"),
    P(0x1F, "Fase 5", "Stage 5", "p02:876A, la lista de la fase 5"),
    P(0x20, "Fase 6", "Stage 6", "p02:876A, la lista de la fase 6"),
    P(0x19, "Fase 7 (OPERATION X)", "Stage 7 (OPERATION X)", "p02:876A, la lista de la fase 7"),
    P(0x21, "Los jefes", "The bosses", "p02:876A, al final de cada lista"),
    P(0x24, "Cae un jefe", "A boss falls", "p02:9CFE, p11:A372 y p11:B580"),
    P(0x27, "La nave estalla", "The ship blows up", "p02:96A4"),
    P(0x2F, "Entre fases", "Between stages", "p10:8C36 y p10:8DB3"),
    P(0x22, "La pieza de p00:56C4", "The tune at p00:56C4", "p00:56C4"),
    P(0x30, "El final, sin el cartucho de Nemesis 2", "The ending, without Nemesis 2", "p10:8FEA"),
    P(0x31, "El final bueno", "The good ending", "p10:8FE6 y p03:A3DB"),
    P(0x32, "Fin de la partida", "Game over", "p00:551F"),
    P(0x34, "La ventana de la presentacion", "The intro window", "p10:82C5"),
]

PAGINA = None

CFG = dict(rom="salamander.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 6)),
           bancos_frame=((0x6000, 4), (0x8000, 5), (0xA000, 6)),
           ram0=[], init=[], frame=0x6978, pide=0x4D6E, banco_frame=4,
           banco_pide=0, ram=(0xE000, 0xE200), hz=60, psg0={7: 0xB8},
           romtype="KonamiSCC", max_s=180, piezas=PIEZAS, pagina=PAGINA,
           maquina="C-BIOS_MSX1")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
