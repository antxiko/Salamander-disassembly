# Hallazgos

## La fase 7 sale de otro cartucho

OPERATION X, -WRATH OF VENOM-, solo existe con *Nemesis 2* puesto en la
otra ranura. Sus gráficos no están en *Salamander*: el juego cambia de slot,
lee 1.137 bytes de los bancos 7, 8 y 9 de *Nemesis 2* y los copia a la RAM
(`p00:5B91`). Con ese cartucho, y con el cristal, el final es el bueno.

## El recorrido da la vuelta

Las fases no son una tira recta. En la 1 el scroll se para dos veces y la
pantalla baja por otro mapa; en la 4, una; la 6, que sube, se desvía a la
izquierda y vuelve (`p00:4BE6`, mapas de `p14:80FC`, `p14:815C` y
`p14:818C`).

## Una base casi invisible

En la fase 4, entre los scrolls 0x100 y 0x150, la base solo se dibuja un
cuadro de cada 64; los demás se vuelcan sin su decorado (`p00:5FC5`,
`p01:6016`).

## Tú eliges el orden de los planetas

Tras la fase 2, un radar con reloj deja elegir el orden de EIONEUS, LAVINIA
y KIERKE (`p10:988A`); si el tiempo se acaba, elige el juego.

## Leek y Crush Blow

El subtítulo de las fases 3, 4 y 5 es -SET THE LEEK SYSTEM- en la versión
japonesa y -SET THE CRUSH BLOW SYSTEM- en la inglesa (`p15:BF5A`,
`p15:BF9A`).

## Konami y un jefe suenan igual

La pieza del logotipo de Konami (0x4E) y la de cuando cae un jefe (0x25)
tienen cabeceras distintas pero tocan lo mismo, cuadro a cuadro.

## La música de la fase se pide cada cuadro

`p02:8720` mira cada cuadro qué música toca según el scroll (`p02:876A`) y,
si no es la que suena, la pide otra vez.
