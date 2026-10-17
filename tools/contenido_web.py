#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

md2html.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui.

Todas las cifras de aqui estan medidas sobre este cartucho, con las
herramientas de tools/: CODIGO y DATOS los imprime tools/presupuesto.py
(make sanity) y RUTINAS, INSTRUCCIONES y COMENTARIOS los da
tools/densidad_total.py.
"""

NOMBRE = "Salamander - Operation X"
CATALOGO = "RC-758"
ANIO = 1987
REPOSITORIO = "https://github.com/antxiko/Salamander-disassembly"

CODIGO = 52996
DATOS = 78076
RUTINAS = 3429
INSTRUCCIONES = 25417
COMENTARIOS = 11342

BANCOS_CON_CODIGO = ("00", "01", "02", "03", "04", "06", "10", "11", "12")


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


PIE_LEGAL = {
    "es": "<em>Salamander - Operation X</em> lo public&oacute; Konami para MSX "
          "en 1987; su n&uacute;mero de cat&aacute;logo es RC-758 y son 128 KB. "
          "Todos los derechos sobre el juego siguen siendo de sus titulares. "
          "Este trabajo es de preservaci&oacute;n, estudio y documentaci&oacute;n, "
          "y la imagen del cartucho no se distribuye.",
    "en": "<em>Salamander - Operation X</em> was published by Konami for the "
          "MSX in 1987; its catalogue number is RC-758 and it is 128 KB. All "
          "rights in the game remain with their holders. This is preservation, "
          "study and documentation work, and the cartridge image is not "
          "distributed.",
}

PORTADA = {
    "es": dict(
        titulo="Salamander - desensamblado comentado",
        claim="Las siete fases con sus recorridos enteros, los ocho jefes, la "
              "nave, los enemigos, la elecci&oacute;n de planeta, los dos "
              "finales, la fase 7 que solo existe con <em>Nemesis 2</em> al lado "
              "y la m&uacute;sica sacada de su propio motor.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "Cartucho <b>RC-758</b>, MegaROM de 128 KB (Konami con SCC)",
               "<b>MSX</b>", "Volcado <b>0d459788...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Los recorridos, la "
              "nave y los caracteres est&aacute;n <b>dibujados desde los bytes "
              "de la ROM</b>; los enemigos y los jefes, con los dibujos de la ROM "
              "sobre lo que hacen en openMSX; y las pantallas de la "
              "presentaci&oacute;n y los finales, <b>rehechas con los bytes de "
              "la ROM e iguales p&iacute;xel a p&iacute;xel a la VRAM de "
              "openMSX</b>. El listado se reensambla <b>byte a byte</b> con "
              "<code>make</code>.",
    ),
    "en": dict(
        titulo="Salamander - a commented disassembly",
        claim="The seven stages with their whole routes, the eight bosses, the "
              "ship, the enemies, the planet choice, both endings, the stage 7 "
              "that only exists with <em>Nemesis 2</em> alongside and the music "
              "taken from its own engine.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "An <b>RC-758</b> cartridge, a 128 KB MegaROM (Konami with SCC)",
               "<b>MSX</b>", "Dump <b>0d459788...</b>"],
        aviso="<b>Not one capture here.</b> The routes, the ship and the "
              "characters are <b>drawn from the bytes of the ROM</b>; the "
              "enemies and the bosses, with the ROM's patterns over what they do "
              "in openMSX; and the intro and ending screens are <b>rebuilt from "
              "the ROM's bytes and identical, pixel for pixel, to the openMSX "
              "VRAM</b>. The listing reassembles <b>byte for byte</b> with "
              "<code>make</code>.",
    ),
}

HALLAZGOS = {
    "es": [
        ("La fase 7 sale de otro cartucho",
         "<p>OPERATION X, -WRATH OF VENOM-, solo existe con <em>Nemesis 2</em> "
         "en la otra ranura: el juego cambia de slot y trae 1.137 bytes de sus "
         "bancos 7, 8 y 9 a la RAM (<code>p00:5B91</code>). Con ese cartucho, y "
         "con el cristal, el final es el bueno.</p>"),
        ("El recorrido da la vuelta",
         "<p>En la fase 1 el scroll se para dos veces y la pantalla baja por "
         "otro mapa; en la 4, una; la 6, que sube, se desv&iacute;a a la "
         "izquierda y vuelve (<code>p00:4BE6</code>).</p>"),
        ("Una base casi invisible",
         "<p>En la fase 4, entre los scrolls 0x100 y 0x150, la base solo se "
         "dibuja un cuadro de cada 64 (<code>p00:5FC5</code>).</p>"),
        ("T&uacute; eliges el orden de los planetas",
         "<p>Tras la fase 2, un radar con reloj deja elegir el orden de "
         "EIONEUS, LAVINIA y KIERKE (<code>p10:988A</code>); si el tiempo se "
         "acaba, elige el juego.</p>"),
        ("Leek y Crush Blow",
         "<p>El subt&iacute;tulo de las fases 3, 4 y 5 es -SET THE LEEK SYSTEM- "
         "en la versi&oacute;n japonesa y -SET THE CRUSH BLOW SYSTEM- en la "
         "inglesa (<code>p15:BF5A</code>).</p>"),
    ],
    "en": [
        ("Stage 7 comes from another cartridge",
         "<p>OPERATION X, -WRATH OF VENOM-, only exists with <em>Nemesis 2</em> "
         "in the other slot: the game switches slot and brings 1,137 bytes of "
         "its banks 7, 8 and 9 into RAM (<code>p00:5B91</code>). With that "
         "cartridge, and with the crystal, the ending is the good one.</p>"),
        ("The route turns",
         "<p>In stage 1 the scroll stops twice and the screen goes down through "
         "another map; in stage 4, once; stage 6, which goes up, turns left and "
         "comes back (<code>p00:4BE6</code>).</p>"),
        ("A base you can barely see",
         "<p>In stage 4, between scrolls 0x100 and 0x150, the base is drawn only "
         "one frame in 64 (<code>p00:5FC5</code>).</p>"),
        ("You choose the order of the planets",
         "<p>After stage 2, a radar with a clock lets you choose the order of "
         "EIONEUS, LAVINIA and KIERKE (<code>p10:988A</code>); if time runs "
         "out, the game chooses.</p>"),
        ("Leek and Crush Blow",
         "<p>The subtitle of stages 3, 4 and 5 is -SET THE LEEK SYSTEM- in the "
         "Japanese version and -SET THE CRUSH BLOW SYSTEM- in the English one "
         "(<code>p15:BF5A</code>).</p>"),
    ],
}

LOGOTIPO = "titulo_solo.png"
GALERIA = [
    ("titulo_solo.png",
     "El t&iacute;tulo, rehecho con los bytes de la ROM (<code>p10:80B9</code>).",
     "The title, rebuilt from the ROM's bytes (<code>p10:80B9</code>)."),
    ("recorrido_f1.png",
     "La fase 1 entera, con sus dos bajadas (<code>p13:6F4C</code>, "
     "<code>p14:80FC</code>).",
     "Stage 1 in full, with its two descents (<code>p13:6F4C</code>, "
     "<code>p14:80FC</code>)."),
    ("jefe_1.png",
     "El jefe 1, el cerebro de la fase 1 (<code>p11:A870</code>).",
     "Boss 1, the stage 1 brain (<code>p11:A870</code>)."),
    ("enemigos_f1.png",
     "Los enemigos de la fase 1 con los fotogramas que usan.",
     "The stage 1 enemies with the frames they use."),
    ("nave.png",
     "Las catorce posturas de la nave (<code>p09:A145</code>).",
     "The fourteen poses of the ship (<code>p09:A145</code>)."),
    ("eleccion.png",
     "El radar para elegir planeta (<code>p10:988A</code>).",
     "The radar to choose a planet (<code>p10:988A</code>)."),
    ("final_bueno_3.png",
     "El final bueno (<code>p10:8F7F</code>).",
     "The good ending (<code>p10:8F7F</code>)."),
]
