# omsx_vram.tcl - Vuelca la VRAM (16 KB), los registros del VDP, la RAM y una
# captura de Salamander en un MSX1 (C-BIOS_MSX1), para cotejar los dibujos de
# tools/dibuja.py y compania (tools/coteja_vram.py).
#
#   "C:/Program Files/openMSX/openmsx.exe" -machine C-BIOS_MSX1 \
#       -cart salamander.rom -romtype KonamiSCC -script tools/omsx_vram.tcl
#
# Variables: VRAM_SALIDA (work/omsx), VRAM_TIEMPOS ("30 45 60": segundos
# emulados de cada volcado; sale despues del ultimo), VRAM_TECLAS
# "t:fila:mascara[:segundos] ..." (fila 8: 0x01 espacio, 0x10 izquierda, 0x20
# arriba, 0x40 abajo, 0x80 derecha), VRAM_POKES "t:direccion:valor ...".
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion VRAM_SALIDA {work/omsx}]
set ::TIEMPOS [opcion VRAM_TIEMPOS {30 45 60}]
file mkdir $::SALIDA
set throttle off

proc vuelca {etiqueta} {
    set f [open [file join $::SALIDA "vram-$etiqueta.bin"] wb]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block VRAM 0 16384]
    close $f
    set g [open [file join $::SALIDA "vdp-$etiqueta.txt"] w]
    for {set i 0} {$i < 8} {incr i} {
        puts $g [format "R%d = 0x%02X" $i [debug read "VDP regs" $i]]
    }
    foreach {nombre d} {fase 0xE301 scroll_l 0xE302 scroll_h 0xE303 estado 0xE200 paso 0xE201 jefe 0xE640 vertical 0xE620} {
        puts $g [format "%s = 0x%02X" $nombre [debug read memory $d]]
    }
    close $g
    set h [open [file join $::SALIDA "ram-$etiqueta.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
    screenshot [file join $::SALIDA "ver-$etiqueta.png"]
}
foreach k [opcion VRAM_TECLAS {}] {
    lassign [split $k :] t f m d
    if {$d eq ""} { set d 0.15 }
    after time $t "keymatrixdown $f $m; after time $d {keymatrixup $f $m}"
}
foreach k [opcion VRAM_POKES {}] {
    lassign [split $k :] t d v
    after time $t "poke $d $v"
}
# VRAM_BP "pc:direccion:valor ...": cada vez que se ejecuta pc se escribe ese
# byte (p. ej. "0x8703:0xE21B:4": p02:8703 empieza la fase 0xE21B)
foreach k [opcion VRAM_BP {}] {
    lassign [split $k :] pc d v
    set ::BPLOG [open [file join $::SALIDA "bp.txt"] w]
    debug breakpoint create -address $pc -command "poke $d $v; puts \$::BPLOG {bp $pc}; flush \$::BPLOG"
}
# VRAM_WP "direccion ...": apunta en wp.txt el PC de cada escritura
set ::WPLOG [open [file join $::SALIDA "wp.txt"] w]
foreach d [opcion VRAM_WP {}] {
    debug set_watchpoint write_mem $d {} "puts \$::WPLOG \[format {%s pc=%04X v=%02X t=%s} $d \[reg PC\] \$::wp_last_value \[machine_info time\]\]; flush \$::WPLOG"
}
# VRAM_FASE n: cuando p00:5855 copia la ficha del jugador (la fase 1 en 0xE301),
# un momento despues se pone la fase n
set ::FASE [opcion VRAM_FASE {}]
if {$::FASE ne ""} {
    debug set_watchpoint write_mem 0xE301 {[reg PC] == 0x5856} {after time 0.0005 {poke 0xE301 $::FASE; poke 0xE21B $::FASE}}
}
# VRAM_FIJO "direccion:valor ...": se escribe cada 0.1 s (p. ej. 0xE6D0:1, que
# p02:9684 no mate a la nave)
set ::FIJO [opcion VRAM_FIJO {}]
proc fija {} {
    foreach k $::FIJO { lassign [split $k :] d v; poke $d $v }
    after time 0.1 fija
}
if {$::FIJO ne ""} { after time [opcion VRAM_FIJO_DESDE 21] fija }
foreach t $::TIEMPOS { after time $t "vuelca $t" }
after time [expr {[lindex $::TIEMPOS end] + 1}] exit
