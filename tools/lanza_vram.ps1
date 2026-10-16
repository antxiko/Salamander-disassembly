# lanza_vram.ps1 <dir> "<tiempos>" "<teclas>" "<pokes>": UN openMSX con tools/omsx_vram.tcl,
# fuera del sandbox, y espera a que acabe.
param([string]$dir, [string]$tiempos = "30 45 60", [string]$teclas = "", [string]$pokes = "", [string]$bp = "", [string]$wp = "", [string]$fase = "", [string]$fijo = "", [string]$rom = "salamander.rom", [string]$vecino = "", [string]$traza = "", [string]$enemigos = "")
$env:VRAM_BP = $bp
$env:VRAM_WP = $wp
$env:VRAM_FASE = $fase
$env:VRAM_FIJO = $fijo
$env:VRAM_TRAZA = $traza
$env:VRAM_ENEMIGOS = $enemigos
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:VRAM_SALIDA = "work/$dir"
$env:VRAM_TIEMPOS = $tiempos
$env:VRAM_TECLAS = $teclas
$env:VRAM_POKES = $pokes
$args_ = @("-machine", "C-BIOS_MSX1", "-carta", $rom, "-romtype", "KonamiSCC")
if ($vecino -ne "") { $args_ += @("-cartb", $vecino, "-romtype", "KonamiSCC") }
$args_ += @("-script", "tools/omsx_vram.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
