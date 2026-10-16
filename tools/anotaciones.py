#!/usr/bin/env python3
"""Lo que tools/anota.py sabe de Salamander: rutinas con nombre, RAM y los
campos de las fichas. Solo datos; la maquinaria esta en anota.py.

CADA ENTRADA SALE DE LEER SU RUTINA en el listado (la direccion es la fuente).
Lo que no se sabe no esta en la tabla.
"""

# Los bancos con codigo (los demas son datos de punta a punta).
BANCOS = (0, 1, 2, 3, 4, 10, 11, 12)

# Los registros del mapper Konami con SCC (tools/paginas.py).
REGISTROS_MAPPER = {0x5000: "0x4000", 0x7000: "0x6000", 0x9000: "0x8000", 0xB000: "0xA000"}


# Que banco se ve en cada ventana al empezar una rutina del banco b: el juego
# corre con 1-2-3 (y el 11 o el 12 en 0xA000 para los jefes), el sonido con
# 4-5-6 (p00:4D6E) y la presentacion con 1-10-15 (p00:4199).
def trio(b):
    if b == 0:
        return {}
    if b == 4:
        return {0x6000: 4, 0x8000: 5, 0xA000: 6}
    if b == 10:
        return {0x6000: 1, 0x8000: 10, 0xA000: 15}
    if b in (11, 12):
        return {0x6000: 1, 0x8000: 2, 0xA000: b}
    return {0x6000: 1, 0x8000: 2, 0xA000: 3}


# Las rutinas del banco 0 que cambian lo que se ve (cartucho.PONE_BANCOS).
CAMBIOS_DE_BANCO = {
    0x416E: {0x6000: 1, 0x8000: 2, 0xA000: 3},
    0x4173: {0x6000: 4, 0x8000: 5, 0xA000: 6},
    0x4178: {0x6000: 7, 0x8000: 8, 0xA000: 9},
    0x417D: {0x6000: 13, 0x8000: 14, 0xA000: 15},
    0x4199: {0x8000: 10, 0xA000: 15},
    0x41AC: {0x8000: 14},
    0x41B0: {0x8000: 10},
    0x41BB: {0xA000: 6},
    0x41BF: {0xA000: 11},
    0x41C3: {0xA000: 15},
    0x41C7: {0xA000: 9},
    0x41CB: {0xA000: 12},
    0x41D0: {0x8000: 2, 0xA000: 3},
    0x41D4: {0x8000: 8, 0xA000: 9},
    0x41D8: {0x8000: 14, 0xA000: 15},
    0x41EA: {0x6000: 1, 0x8000: 2},
    0x41EE: {0x6000: 7, 0x8000: 8},
}

_PONE = {0x416E: ("bancos_1_2_3", "los bancos 1-2-3"), 0x4173: ("bancos_4_5_6", "los bancos 4-5-6"),
         0x4178: ("bancos_7_8_9", "los bancos 7-8-9"), 0x417D: ("bancos_13_14_15", "los bancos 13-14-15"),
         0x4199: ("bancos_10_15", "el banco 10 en 0x8000 y el 15 en 0xA000"),
         0x41AC: ("banco_14_en_8000", "el banco 14 en 0x8000"), 0x41B0: ("banco_10_en_8000", "el banco 10 en 0x8000"),
         0x41BB: ("banco_6_en_a000", "el banco 6 en 0xA000"), 0x41BF: ("banco_11_en_a000", "el banco 11 en 0xA000"),
         0x41C3: ("banco_15_en_a000", "el banco 15 en 0xA000"), 0x41C7: ("banco_9_en_a000", "el banco 9 en 0xA000"),
         0x41CB: ("banco_12_en_a000", "el banco 12 en 0xA000"), 0x41D0: ("bancos_2_3", "los bancos 2-3 en 0x8000-0xA000"),
         0x41D4: ("bancos_8_9", "los bancos 8-9 en 0x8000-0xA000"), 0x41D8: ("bancos_14_15", "los bancos 14-15 en 0x8000-0xA000"),
         0x41EA: ("bancos_1_2", "los bancos 1-2 en 0x6000-0x8000"), 0x41EE: ("bancos_7_8", "los bancos 7-8 en 0x6000-0x8000")}

RUTINAS = {(0, a): (n, "pone %s (y su copia en 0xF0F1-3)" % q) for a, (n, q) in _PONE.items()}
RUTINAS.update({
    # --- banco 0: ayudantes ---
    (0, 0x40C4): ("hl_mas_a", "HL = HL + A"),
    (0, 0x40C9): ("de_mas_a", "DE = DE + A"),
    (0, 0x40CE): ("despacha", "salta a la entrada A de la tabla que va detras del call"),
    (0, 0x40DA): ("init", "el arranque del cartucho (INIT de la cabecera AB)"),
    (0, 0x4069): ("interrupcion", "la interrupcion (H.KEYI): cuenta el cuadro, el sonido con 4-5-6 y el cuadro del juego"),
    (0, 0x4CA4): ("borra_nombres", "borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM"),
    (0, 0x4CB1): ("puerto_vdp", "C' = el puerto de datos del VDP (0x0007 de la BIOS) tras fijar la direccion (0x0053)"),
    (0, 0x4CBD): ("copia_a_vram", "copia BC bytes de DE a la VRAM HL (LDIRVM)"),
    (0, 0x4CC1): ("copia_a_vram_3", "copia BC bytes de DE a la VRAM HL en los tres tercios"),
    (0, 0x4CE5): ("rachas_3", "las rachas de DE en la VRAM HL, en los tres tercios"),
    (0, 0x4CF5): ("lista_a_vram", "la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)"),
    (0, 0x4CFD): ("lista_a_vram_aqui", "la lista de DE en la VRAM HL (sin destino delante)"),
    (0, 0x4D0C): ("borra_lista", "borra lo que pintaria la lista de DE (C = 0)"),
    (0, 0x4D10): ("rachas_con_destino", "[destino] y rachas de DE a la VRAM"),
    (0, 0x4D16): ("rachas", "descomprime las rachas de DE en la VRAM HL"),
    (0, 0x4D6E): ("pide_sonido", "pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes"),
    (0, 0x4DA1): ("cuadros_desde", "compara la cuenta de cuadros (0xF0F7) con DE"),
    (0, 0x4DA6): ("otro_jugador", "IY a la ficha del otro jugador (0xE300 <-> 0xE380)"),
    (0, 0x4E21): ("palabra_de_de", "DE = la palabra DE + 2 x A"),
    (0, 0x4E28): ("palabra_de_hl", "DE = la palabra HL + 2 x A"),
    (0, 0x4E31): ("palabra_a_hl", "HL = la palabra HL + 2 x A"),
    (0, 0x4E3A): ("hay_enemigos", "NZ si queda algun enemigo (0xE700) o disparo (0xEA00) vivo"),
    (0, 0x4E58): ("azar", "mezcla R en 0xE606 (el azar)"),
    (0, 0x4E66): ("suceso_de_fase", "la ficha A de la lista de sucesos de la fase y compara su posicion con el scroll"),
    (0, 0x4EAF): ("borra_atributos", "los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla"),
    (0, 0x44F3): ("copias_de_tabla", "la lista de copias VRAM -> VRAM de la entrada A de la tabla HL"),
    (0, 0x44F9): ("copias", "la lista de copias VRAM -> VRAM de IX"),
    (0, 0x4540): ("caracteres_de_tabla", "la lista de caracteres de la entrada A de la tabla HL"),
    (0, 0x4546): ("caracteres", "la lista de caracteres de IX (dibujos y colores por rachas)"),
    (0, 0x4835): ("bit_de_fase", "acarreo = el bit de la fase en 0x26 (fases 1, 2 y 5)"),
    (0, 0x5A99): ("hl_a_nombre", "convierte las coordenadas de HL en una direccion de la tabla de nombres"),
    (0, 0x5AD8): ("byte_de_tabla", "A = el byte HL + A"),
    (0, 0x5ADF): ("menos_de", "DE = -DE"),
    (0, 0x5AE7): ("menos_hl", "HL = -HL"),
    (0, 0x5B91): ("fase7_copia", "la fase 7: copia p00:5BA5 a 0xC000 y la ejecuta (trae graficos del otro cartucho)"),
    # --- banco 1: los enemigos ---
    (1, 0x65AB): ("azar_r", "un numero al azar: R girado y mezclado con la cuenta de cuadros (0xE203)"),
    (1, 0x65B5): ("crea_enemigo_ix", "crea un enemigo de tipo A guardando IX"),
    (1, 0x65BD): ("crea_enemigo", "crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700"),
    (1, 0x6591): ("anima_c", "cada (B+1) cuadros avanza IX+26 de 0 a C-1"),
    (1, 0x6BD5): ("anima_6", "cada 4 cuadros avanza IX+26 de 0 a 5 y pone el dibujo de la tabla HL"),
    (1, 0x6856): ("pon_ix07", "IX+07/08 = DE"),
    (1, 0x685D): ("pon_ix09", "IX+09/0A = DE"),
    (1, 0x7139): ("suceso", "la ficha A (de 4 bytes) de la lista de la fase de la tabla HL; Z si se acabo"),
    # --- banco 4: el sonido ---
    (4, 0x6472): ("arranca_sonido", "arranca el sonido A: cabecera de 0x663E y una partitura por canal"),
    (4, 0x6978): ("sonido_cuadro", "el sonido de un cuadro: los 8 canales (0xE000 + 0x2C x k)"),
    (4, 0x69FA): ("canal", "un cuadro del canal IX si suena"),
    (4, 0x6A23): ("canal_paso", "baja la cuenta del canal y, si llega a 0, lee la partitura"),
    (4, 0x6CF7): ("guarda_partitura", "IX+02/03 = HL + 1: por donde va la partitura"),
    (4, 0x6DD4): ("orden", "la orden 0xE0-0xFE de la partitura por la tabla de 0x6DE9"),
    (4, 0x702E): ("orden_d", "la orden 0xD0-0xDF de la partitura"),
    (4, 0x704A): ("mezcla_psg", "el registro 7 del PSG con lo que piden los canales"),
    # --- banco 10: la presentacion y los menus ---
    (10, 0x8044): ("ventana_menu", "pinta la ventana del menu B"),
    (10, 0x80DC): ("graficos_menu", "con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)"),
    (10, 0x8107): ("caracteres_menu", "la lista de caracteres de la entrada B & 0x0F de 0xA4BF"),
    (10, 0x87F5): ("borra_c700", "borra 0xC700-0xCFFF"),
    (10, 0x9470): ("empieza_texto", "prepara el texto A de la tabla HL para escribirlo letra a letra"),
    (10, 0x95C1): ("abre_ventana", "copia la cabecera de ventana de HL (7 bytes) a 0xEE10"),
})

RAM = {
    0xE000: ("los 8 canales de sonido (0x2C bytes cada uno)", "p04:699B"),
    0xE1B8: ("el estado del sonido (bits: pausa, SCC...)", "p04:697E"),
    0xE1B9: ("el sonido que se esta arrancando", "p04:6496"),
    0xE1BA: ("la cabecera del sonido que se arranca (18 bytes)", "p04:64A7"),
    0xE1D0: ("la copia del registro 7 del PSG", "p04:710E"),
    0xE1D1: ("el bit del canal que se interpreta (1, 2, 4... 0x80)", "p04:6996"),
    0xE203: ("la cuenta de cuadros del juego", "p01:65B0"),
    0xE21B: ("la fase en curso", "p02:870D"),
    0xE227: ("cuantos jugadores (o el modo de dos)", "p00:5A12"),
    0xE300: ("la ficha del jugador 1 (IY, 0x80 bytes)", "p00:5A19"),
    0xE301: ("la fase (de 1 a 7; 0 en la presentacion)", "p02:8710, p10:8878"),
    0xE302: ("la posicion del scroll (16 bits)", "p00:4973"),
    0xE380: ("la ficha del jugador 2 (IY, 0x80 bytes)", "p03:A80E"),
    0xE605: ("el byte de 0x88E2 de la fase (y el del jefe)", "p02:8894"),
    0xE606: ("el azar (lo mezcla p00:4E58)", "p00:4E5E"),
    0xE620: ("1 si la fase va en vertical", "p02:88B9"),
    0xE621: ("el principio del recorrido del mapa (16 bits)", "p02:88A8"),
    0xE623: ("el final del recorrido del mapa (16 bits)", "p02:88A8"),
    0xE625: ("el siguiente alto del scroll (16 bits)", "p02:855C"),
    0xE63A: ("el menu o pantalla de la presentacion (0xE63A & 0x0F)", "p10:801E"),
    0xE640: ("el jefe (1 a 8)", "p02:8598"),
    0xE650: ("el tipo del enemigo que se crea", "p01:65BD"),
    0xE658: ("la cuenta de los sucesos de 0x84BA", "p01:6E35"),
    0xE659: ("la cuenta de los sucesos de 0x9205", "p01:78F8"),
    0xE677: ("la cuenta de las apariciones de 0x85DF", "p01:7122"),
    0xE67C: ("la cuenta de las apariciones de 0x85D1", "p01:70B4"),
    0xE688: ("la cuenta de los sucesos de 0x9213", "p01:792F"),
    0xE6D1: ("el resultado que enseña p01:7B06", "p01:7B12"),
    0xE700: ("los enemigos (12 fichas de 0x40 bytes)", "p00:4E3A"),
    0xEA00: ("los disparos (8 fichas de 0x10 bytes)", "p00:4E48"),
    0xEF80: ("los atributos de sprite en la RAM (32 x 4)", "p00:4EAF"),
    0xF0F0: ("la copia del banco de 0x4000 (0)", "p00:40F2"),
    0xF0F1: ("la copia del banco de 0x6000", "p00:4182"),
    0xF0F2: ("la copia del banco de 0x8000", "p00:418A"),
    0xF0F3: ("la copia del banco de 0xA000", "p00:4190"),
    0xF0F4: ("el slot del cartucho vecino", "p00:5BB5"),
    0xF0F5: ("lo que hay en el vecino (bit 0: CD 07 51, bit 1: Nemesis 2 de verdad)", "p03:B5F0, p03:B601"),
    0xF0F6: ("el slot de este cartucho", "p00:5BC9"),
    0xF0F7: ("la cuenta de interrupciones (16 bits)", "p00:406D"),
}

RAM16 = {}

# Los campos del canal de sonido (IX = 0xE000 + 0x2C x k), del interprete de
# p04:6A23 y de cada orden.
CAMPOS_CANAL = {
    0x00: "el canal en marcha (su sonido)",
    0x01: "el operando de la orden 0xDE",
    0x02: "por donde va la partitura (bajo)",
    0x03: "por donde va la partitura (alto)",
    0x04: "la cuenta de la nota",
    0x09: "el modo del canal (orden 0xFE)",
    0x0D: "IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)",
    0x0E: "IX+0E (marcas de las ordenes 0xEE-0xF7)",
    0x13: "la duracion de la nota (orden 0xE0-0xE3)",
    0x14: "el operando de la orden 0xE9",
    0x15: "el operando de la orden 0xEA",
    0x16: "la octava (ordenes 0xD0-0xD5)",
    0x17: "por donde va el guion de bateria (bajo)",
    0x18: "por donde va el guion de bateria (alto)",
    0x19: "la cuenta del guion de bateria",
    0x29: "la forma de onda del SCC (orden 0xF8)",
}
CARGAS_CANAL = tuple(0xE000 + 0x2C * k for k in range(8))
IX_CANAL_POR_DEFECTO = {4: ((0x69FA, 0x7117),)}

FICHAS = ((CARGAS_CANAL, IX_CANAL_POR_DEFECTO, CAMPOS_CANAL),)

# Los registros del SCC que escribe el motor de sonido (banco 4).
SCC_BANCOS = (4,)
SCC = {0x988A + k: "el volumen del canal %d del SCC" % (k + 1) for k in range(5)}
SCC.update({0x9880 + 2 * k: "el periodo del canal %d del SCC (bajo)" % (k + 1) for k in range(5)})
SCC.update({0x9881 + 2 * k: "el periodo del canal %d del SCC (alto)" % (k + 1) for k in range(5)})
SCC[0x988F] = "los canales del SCC que suenan (un bit cada uno)"
