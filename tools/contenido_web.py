#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

jekyll.py y make_web.py son la maquinaria y no llevan dentro el nombre de
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
              "openMSX</b>; las animaciones son la VRAM de cada cuadro de openMSX "
              "pintada como la pinta el TMS9918. El listado se reensambla <b>byte a byte</b> con "
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
              "VRAM</b>; the animations are the VRAM of every openMSX frame "
              "painted the way the TMS9918 paints it. The listing reassembles <b>byte for byte</b> with "
              "<code>make</code>.",
    ),
}

# Las paginas, en tres bloques: lo del juego, las curiosidades y lo tecnico.
# Cada una: (ingles, castellano, rotulo en, rotulo es, de que va en, de que va es).
PAGINAS = [
    [("THE-STAGES.html", "LAS-FASES.html", "The stages", "Las fases",
      "the seven stages, the planet choice and each route whole",
      "las siete fases, la elecci&oacute;n de planeta y cada recorrido entero"),
     ("THE-SHIP.html", "LA-NAVE.html", "The ship", "La nave",
      "the ship, every weapon firing, the capsules and the items",
      "la nave, cada arma disparando, las c&aacute;psulas y los objetos"),
     ("THE-ENEMIES.html", "LOS-ENEMIGOS.html", "The enemies", "Los enemigos",
      "the enemies of each stage with their frames",
      "los enemigos de cada fase con sus fotogramas"),
     ("THE-BOSSES.html", "LOS-JEFES.html", "The bosses", "Los jefes",
      "the eight bosses and the stage 7 core",
      "los ocho jefes y el n&uacute;cleo de la fase 7"),
     ("THE-SEQUENCES.html", "LAS-SECUENCIAS.html", "The sequences", "Las secuencias",
      "the intro, the story and both endings, animated",
      "la presentaci&oacute;n, la historia y los dos finales, animados"),
     ("THE-MUSIC.html", "LA-MUSICA.html", "The music", "La m&uacute;sica",
      "the 20 tunes, from its own sound engine",
      "las 20 m&uacute;sicas, de su propio motor de sonido"),
     ("THE-TEXTS.html", "LOS-TEXTOS.html", "The texts", "Los textos",
      "the texts of the cartridge, as they come",
      "los textos del cartucho, tal como vienen")],
    [("CURIOSITIES.html", "CURIOSIDADES.html", "Curiosities", "Curiosidades",
      "stage 7 with Nemesis 2, the hidden base, what is still open",
      "la fase 7 con Nemesis 2, la base invisible, lo que queda abierto")],
    [("UNDER-THE-HOOD.html", "POR-DENTRO.html", "Under the hood", "Por dentro",
      "rebuilding the ROM, the mapper, the interrupt, the RAM and the code",
      "rehacer la ROM, el mapper, la interrupci&oacute;n, la RAM y el c&oacute;digo")],
]

# Las paginas de antes y a donde llevan ahora (los feeds y otras webs las enlazan).
VIEJAS = {
    "GETTING-STARTED.html": "UNDER-THE-HOOD.html", "THE-GAME.html": "THE-STAGES.html",
    "THE-CARTRIDGE.html": "UNDER-THE-HOOD.html", "THE-CODE.html": "UNDER-THE-HOOD.html",
    "FINDINGS.html": "CURIOSITIES.html", "OPEN-QUESTIONS.html": "CURIOSITIES.html",
    "EMPEZAR.html": "POR-DENTRO.html", "EL-JUEGO.html": "LAS-FASES.html",
    "EL-CARTUCHO.html": "POR-DENTRO.html", "EL-CODIGO.html": "POR-DENTRO.html",
    "HALLAZGOS.html": "CURIOSIDADES.html", "PREGUNTAS-ABIERTAS.html": "CURIOSIDADES.html",
}

LOGOTIPO = "titulo_solo.png"
