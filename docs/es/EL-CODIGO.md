# El código

## Las cifras

El **100 %** de los 131.072 bytes está explicado: 52.996 de código y 78.076
de datos. Los nueve bancos con código tienen 3.429 rutinas y etiquetas, y
11.342 de sus 25.417 instrucciones llevan comentario: el **44,6 %**, sin
ninguna rutina por debajo del 10 %.

## Dónde está cada cosa

- banco 0: la interrupción, los repartos de bancos, la carga de gráficos
  (`p00:438C`), los mapas en la RAM (`p00:49BB`, `p00:4A88`) y los estados
  del juego;
- bancos 1, 2 y 3: los enemigos, la nave, sus armas, los choques y el guion
  de cada fase (`p02:8525`-`p02:86EF`);
- banco 4: el sonido;
- banco 10: la presentación, el despegue, la elección de planeta, las
  escenas y los finales;
- banco 11: los ocho jefes (tabla `p01:6E89`) y el fundido de pantalla;
- banco 12: los enemigos especiales, los objetos que se recogen y la
  pantalla SELECTION;
- bancos 5, 7, 8, 9, 13, 14 y 15: solo datos (formas de onda, gráficos,
  mapas y textos).

## Los nombres

Los nombres de las rutinas y de la RAM están en `tools/anotaciones.py`, y
`tools/anota.py` los lleva a cada llamada y a cada acceso del listado.
