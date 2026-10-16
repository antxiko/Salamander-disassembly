; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 12 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
la7ech:	equ 0x0a7ec

; ======================================================================
; CODIGO 0xa000..0xa009  (9 bytes)
; ======================================================================


L_A000:
	ld hl,0e6c8h		;a000   ; el objeto fijo de 0xE6C8: el paso
	ld a,(hl)			;a003
	dec a			;a004   ; 0: nada
	ret m			;a005
	call 040ceh		;a006   ; por la tabla de detras

; ----------------------------------------------------------------------
; DATOS tabla_A009: 4 destinos del despachador p00:40CE (call en p12:A006, el
;   indice en A): A011, A04C, A0A3, A0D8; lo leen p12:A006 (8 bytes)
;   0xa009..0xa011  (8 bytes)
DATA_tabla_A009:
	defw 0a011h,0a04ch,0a0a3h,0a0d8h	; a009  -> L_A011 L_A04C L_A0A3 L_A0D8

; ======================================================================
; CODIGO 0xa011..0xa044  (51 bytes)
; ======================================================================


L_A011:
	ld hl,0e6c8h		;a011   ; el paso siguiente
	inc (hl)			;a014
	inc l			;a015   ; 0x50 en 0xE6C9
	ld (hl),050h		;a016
L_A018:
	inc l			;a018
	ld (hl),0a0h		;a019   ; 0xA0 en 0xE6CA
	inc l			;a01b
	ld (hl),001h		;a01c   ; 1 en 0xE6CB
	inc l			;a01e
	ld (hl),000h		;a01f   ; 0 en 0xE6CC
	inc l			;a021
	inc l			;a022
	inc l			;a023
	ld (hl),064h		;a024   ; 0x64 en 0xE6CF
	xor a			;a026   ; sin tocar (0xE644 y 0xE648 a 0)
	ld (0e644h),a		;a027
	ld (0e648h),a		;a02a
L_A02D:
	ld hl,0a044h		;a02d   ; el dibujo entero de p12:A044...
L_A030:
	ld de,0cc97h		;a030   ; ...dos caracteres en 0xCC97...
	ldi		;a033
	ldi		;a035
	ld de,0ccd7h		;a037   ; ...y dos debajo (0xCCD7)
	ldi		;a03a
	ldi		;a03c
	ret			;a03e
L_A03F:
	ld hl,0a048h		;a03f   ; el dibujo roto de p12:A048
	jr L_A030		;a042

; ----------------------------------------------------------------------
; DATOS resto_A044: lo apuntan con el banco puesto p12:A02D (0xA044), p12:A03F
;   (0xA048); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:A02D, p12:A03F (8 bytes)
;   0xa044..0xa04c  (8 bytes)
DATA_resto_A044:
	defb 06ch,078h,084h,090h,06bh,077h,083h,08fh	; a044  lx..kw..

; ======================================================================
; CODIGO 0xa04c..0xa0f7  (171 bytes)
; ======================================================================


L_A04C:
	ld a,(0e644h)		;a04c   ; tocado (0xE644)?
	or a			;a04f
	jr nz,L_A065		;a050
	call L_A084		;a052   ; si no, dispara
	ld a,(0e6cfh)		;a055   ; 0xE6CF de 0x20 en adelante...
	cp 020h		;a058
	jr nc,$-45		;a05a
	ld a,(0e203h)		;a05c   ; ...si no, cada 4 cuadros
	bit 2,a		;a05f
	jr z,$-52		;a061
	jr $-36		;a063
L_A065:
	ld de,00500h		;a065   ; roto: 500 puntos
	call 05936h		;a068
	call L_A03F		;a06b   ; el dibujo roto
	xor a			;a06e   ; 0xE644 = 0
	ld (0e644h),a		;a06f
	ld a,078h		;a072   ; 120 cuadros
	ld (0e6cdh),a		;a074
	ld a,015h		;a077   ; el sonido 0x15
	call 04d6eh		;a079   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_A0E2		;a07c   ; los enemigos fuera
L_A07F:
	ld hl,0e6c8h		;a07f   ; el paso siguiente
	inc (hl)			;a082
	ret			;a083
L_A084:
	ld hl,0e6cbh		;a084   ; la espera de los disparos
	dec (hl)			;a087
	ret nz			;a088
	ld a,(0e6cfh)		;a089   ; 0xE6CF de 0x20 en adelante...
	cp 020h		;a08c
	ld a,012h		;a08e   ; ...cada 0x12 cuadros...
	jr nc,L_A094		;a090
	ld a,009h		;a092   ; ...si no, cada 9
L_A094:
	ld (hl),a			;a094
	inc l			;a095   ; la cuenta de los disparos + 1
	inc (hl)			;a096
	bit 1,(hl)		;a097   ; su bit 1: desde arriba (0x38)...
	ld de,09c38h		;a099
	jr z,L_A0A0		;a09c
	ld e,063h		;a09e   ; ...o desde abajo (0x63), en la x 0x9C
L_A0A0:
	jp 074c5h		;a0a0   ; un disparo al jugador
L_A0A3:
	ld hl,0e6cdh		;a0a3   ; la espera
	dec (hl)			;a0a6
	jr z,L_A0B1		;a0a7
	ld a,(hl)			;a0a9   ; el bit 1 de la cuenta...
	rra			;a0aa
	and 001h		;a0ab
	ld (0e645h),a		;a0ad   ; ...en 0xE645
	ret			;a0b0
L_A0B1:
	xor a			;a0b1   ; acabada: 0xE645 = 0
	ld (0e645h),a		;a0b2
	ld hl,0ca94h		;a0b5   ; borra 0x12 filas de 8 en el mapa desde 0xCA94
	ld a,012h		;a0b8
L_A0BA:
	ld d,h			;a0ba
	ld e,l			;a0bb
	inc de			;a0bc
	ld bc,00007h		;a0bd
	ld (hl),000h		;a0c0   ; una fila
	ldir		;a0c2
	ld de,00039h		;a0c4   ; la siguiente (64)
	add hl,de			;a0c7
	dec a			;a0c8
	jr nz,L_A0BA		;a0c9
	ld de,0b048h		;a0cb   ; la explosion en (0x48, 0xB0)
	call 08ec6h		;a0ce
	ld a,03ch		;a0d1   ; 60 cuadros
	ld (0e6cdh),a		;a0d3
	jr L_A07F		;a0d6   ; y el paso siguiente
L_A0D8:
	ld hl,0e6cdh		;a0d8   ; la espera...
	dec (hl)			;a0db
	ret nz			;a0dc
	xor a			;a0dd   ; ...acabada: 0xE6C8 = 0
	ld (0e6c8h),a		;a0de
	ret			;a0e1
L_A0E2:
	ld hl,0e700h		;a0e2   ; borra los enemigos y los disparos (0xE700, 0x380)
	ld de,0e701h		;a0e5
	ld bc,0037fh		;a0e8
	ld (hl),000h		;a0eb
	ldir		;a0ed
	xor a			;a0ef   ; y sus cuentas
	ld (0e652h),a		;a0f0
	ld (0e655h),a		;a0f3
	ret			;a0f6

; ----------------------------------------------------------------------
; DATOS resto_A0F7: lo apuntan con el banco puesto p01:7C0C (0xA181); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7C0C (203 bytes)
;   0xa0f7..0xa1c2  (203 bytes)
DATA_resto_A0F7:
	defb 010h,008h,018h,010h,010h,018h,018h,010h,000h,008h,008h,010h,008h,008h,008h,010h	; a0f7  ................
	defb 010h,008h,008h,010h,018h,008h,008h,010h,008h,000h,010h,008h,008h,008h,010h,008h	; a107  ................
	defb 008h,010h,010h,010h,020h,018h,010h,010h,030h,000h,010h,010h,020h,000h,010h,010h	; a117  .... ...0... ...
	defb 008h,020h,010h,010h,010h,010h,010h,010h,010h,018h,010h,010h,000h,000h,010h,010h	; a127  . ..............
	defb 010h,000h,010h,010h,010h,020h,010h,010h,020h,010h,010h,010h,040h,008h,010h,010h	; a137  ..... .. ...@...
	defb 050h,018h,010h,010h,030h,010h,010h,010h,000h,010h,010h,010h,000h,000h,010h,010h	; a147  P...0...........
	defb 008h,000h,010h,010h,010h,000h,010h,010h,018h,000h,010h,010h,020h,000h,010h,010h	; a157  ............ ...
	defb 028h,000h,010h,010h,030h,000h,010h,010h,038h,000h,010h,010h,040h,000h,010h,010h	; a167  (...0...8...@...
	defb 008h,000h,010h,008h,000h,000h,018h,010h,008h,008h,010h,008h,091h,0a1h,099h,0a1h	; a177  ................
	defb 0a1h,0a1h,0afh,0a1h,0c0h,0a1h,0bah,0a1h,0c0h,0a1h,012h,001h,041h,037h,001h,082h	; a187  ............A7..
	defb 0ffh,0ffh,0a6h,000h,0eah,099h,001h,015h,0ffh,0ffh,076h,000h,025h,0e7h,000h,016h	; a197  ..........v.%...
	defb 0f8h,000h,01dh,074h,001h,0d2h,0ffh,0ffh,099h,000h,085h,01dh,001h,023h,088h,001h	; a1a7  ...t.........#..
	defb 01ah,0ffh,0ffh,0bdh,000h,046h,0d6h,001h,025h,0ffh,0ffh	; a1b7  .....F..%..

; ======================================================================
; CODIGO 0xa1c2..0xa347  (389 bytes)
; ======================================================================


L_A1C2:
	ld a,(0e6aah)		;a1c2   ; lo que tapan los enemigos grandes: en el fundido, nada
	or a			;a1c5
	ret nz			;a1c6
	ld de,0ee00h		;a1c7   ; a 0xEE00
	ld ix,0e700h		;a1ca   ; los 12 enemigos
	ld b,00ch		;a1ce
L_A1D0:
	push bc			;a1d0
	call L_A1DF		;a1d1   ; uno
	exx			;a1d4
	ld de,00040h		;a1d5   ; el siguiente (0x40)
	add ix,de		;a1d8
	exx			;a1da
	pop bc			;a1db   ; los 12
	djnz L_A1D0		;a1dc
	ret			;a1de
L_A1DF:
	bit 6,(ix+00bh)		;a1df   ; de los que se pintan en el mapa (IX+0B bit 6)
	ret z			;a1e3
	ld a,(ix+000h)		;a1e4   ; el tipo...
	and a			;a1e7
	ret z			;a1e8
	cp 024h		;a1e9   ; ...0x24: no
	ret z			;a1eb
	cp 03fh		;a1ec   ; 0x3F: p12:A24A
	jp z,L_A24A		;a1ee
	sub 039h		;a1f1   ; 0x39 a 0x3C: p12:A230
	cp 004h		;a1f3
	jr c,L_A230		;a1f5
	ld a,(ix+006h)		;a1f7   ; la posicion (y en IX+04, x en IX+06)...
	ld h,a			;a1fa
	ld l,(ix+004h)		;a1fb
	call 05a99h		;a1fe   ; ...en el mapa...
	ld (ix+011h),l		;a201   ; ...guardada en IX+11/12
	ld (ix+012h),h		;a204
	ld b,(ix+013h)		;a207   ; el alto
	ld c,(ix+006h)		;a20a   ; el ancho que cabe: lo que queda hasta el borde...
	xor a			;a20d
	sub c			;a20e
	jr nz,L_A213		;a20f   ; ...(con x 0, 0xF8)...
	ld a,0f8h		;a211
L_A213:
	rra			;a213   ; ...en caracteres...
	rra			;a214
	rra			;a215
	and 01fh		;a216
	ld c,(ix+014h)		;a218   ; ...como mucho IX+14
	cp c			;a21b
	jr nc,L_A21F		;a21c
	ld c,a			;a21e
L_A21F:
	push bc			;a21f   ; una fila...
	ld b,000h		;a220
	ldir		;a222   ; ...a 0xEE00
	pop bc			;a224
	ld a,040h		;a225   ; la siguiente del mapa (64 - el ancho)
	sub c			;a227
	add a,l			;a228
	ld l,a			;a229
	jr nc,L_A22D		;a22a
	inc h			;a22c
L_A22D:
	djnz L_A21F		;a22d   ; las B
	ret			;a22f
L_A230:
	ld a,(ix+014h)		;a230   ; los 0x39-0x3C: una fila de IX+14
	or a			;a233
	ret z			;a234
	ld c,a			;a235
	ld l,(ix+004h)		;a236   ; la posicion
	ld h,(ix+006h)		;a239
	call 05a99h		;a23c   ; en el mapa
	ld (ix+011h),l		;a23f   ; guardada
	ld (ix+012h),h		;a242
	ld b,000h		;a245
	ldir		;a247   ; a 0xEE00
	ret			;a249
L_A24A:
	ld a,(ix+006h)		;a24a   ; el 0x3F: con la posicion alta (IX+20/21)
	push de			;a24d
	ld e,a			;a24e
	ld d,(ix+021h)		;a24f
	ld l,(ix+004h)		;a252
	ld h,(ix+020h)		;a255
	call 05aadh		;a258   ; en el mapa (+0x40)
	pop de			;a25b
	ld (ix+011h),l		;a25c   ; guardada
	ld (ix+012h),h		;a25f
	ld b,(ix+013h)		;a262   ; el alto y el ancho
	ld c,(ix+014h)		;a265
	jr L_A21F		;a268
L_A26A:
	ld a,(0e6aah)		;a26a   ; y de vuelta al mapa: en el fundido, nada
	or a			;a26d
	ret nz			;a26e
	ld hl,0ee00h		;a26f   ; desde 0xEE00
	ld ix,0e700h		;a272   ; apunta a los enemigos (12 fichas de 0x40 bytes)
	ld b,00ch		;a276   ; los 12
L_A278:
	push bc			;a278
	bit 6,(ix+00bh)		;a279   ; de los del mapa
	jr z,L_A2C1		;a27d
	ld a,(ix+000h)		;a27f   ; vivo?
	and a			;a282
	jr z,L_A2C1		;a283
	sub 039h		;a285   ; 0x39 a 0x3C: p12:A2D2
	cp 004h		;a287
	jr c,L_A2D2		;a289
	ld e,(ix+011h)		;a28b   ; la posicion guardada
	ld d,(ix+012h)		;a28e
	ld a,(ix+000h)		;a291   ; el 0x3F: p12:A2CA
	cp 03fh		;a294
	jp z,L_A2CA		;a296
	ld b,(ix+013h)		;a299   ; el alto
	ld c,(ix+006h)		;a29c   ; el ancho que cabe
	xor a			;a29f
	sub c			;a2a0
	jr nz,L_A2A5		;a2a1
	ld a,0f8h		;a2a3
L_A2A5:
	rra			;a2a5   ; la x en caracteres
	rra			;a2a6
	rra			;a2a7
	and 01fh		;a2a8
	ld c,(ix+014h)		;a2aa   ; como mucho IX+14
	cp c			;a2ad
	jr nc,L_A2B1		;a2ae
	ld c,a			;a2b0   ; lo que cabe
L_A2B1:
	push bc			;a2b1   ; una fila...
	ld b,000h		;a2b2
	ldir		;a2b4   ; ...al mapa
	pop bc			;a2b6
	ld a,040h		;a2b7   ; la siguiente del mapa
	sub c			;a2b9
	add a,e			;a2ba
	ld e,a			;a2bb
	jr nc,L_A2BF		;a2bc
	inc d			;a2be
L_A2BF:
	djnz L_A2B1		;a2bf   ; las B
L_A2C1:
	pop bc			;a2c1
	ld de,00040h		;a2c2   ; el siguiente (0x40)
	add ix,de		;a2c5
	djnz L_A278		;a2c7   ; los 12
	ret			;a2c9
L_A2CA:
	ld b,(ix+013h)		;a2ca   ; el 0x3F: alto y ancho enteros
	ld c,(ix+014h)		;a2cd
	jr L_A2B1		;a2d0
L_A2D2:
	ld a,(ix+014h)		;a2d2   ; los 0x39-0x3C: una fila
	or a			;a2d5
	jr z,L_A2C1		;a2d6
	ld c,a			;a2d8
	ld b,000h		;a2d9
	ld e,(ix+011h)		;a2db
	ld d,(ix+012h)		;a2de
	ldir		;a2e1
	jr L_A2C1		;a2e3
L_A2E5:
	ld hl,00000h		;a2e5   ; la cuenta 0xE20E a 0
	ld (0e20eh),hl		;a2e8
	ld de,0a347h		;a2eb   ; las rachas de p12:A347
	call 04d10h		;a2ee   ; rachas_con_destino: [destino] y rachas de DE a la VRAM
	ld hl,00a00h		;a2f1   ; borra 0x3F0 bytes desde 0x0A00
	ld bc,003f0h		;a2f4
	xor a			;a2f7
	call 00056h		;a2f8   ; BIOS FILVRM - Fills VRAM with value | FILVRM
	ld hl,03907h		;a2fb   ; 6 filas de 21 caracteres desde 0x3907...
	ld a,040h		;a2fe   ; ...del 0x40 en adelante
	ld c,006h		;a300
	ld de,0000bh		;a302
L_A305:
	ld b,015h		;a305
L_A307:
	call 0004dh		;a307   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	inc hl			;a30a
	inc a			;a30b   ; el siguiente
	djnz L_A307		;a30c
	add hl,de			;a30e   ; la fila siguiente (+11)
	dec c			;a30f
	jr nz,L_A305		;a310
	ret			;a312
L_A313:
	ld bc,(0e20eh)		;a313   ; una linea de color mas: la cuenta (0xE20E)
	ld a,0ebh		;a317   ; la fila (0xE20F)...
	inc b			;a319
L_A31A:
	add a,015h		;a31a   ; ...x 21 + 0x40...
	djnz L_A31A		;a31c
	ld l,a			;a31e   ; ...x 8...
	ld h,b			;a31f
	add hl,hl			;a320
	add hl,hl			;a321
	add hl,hl			;a322
	ld de,00a00h		;a323   ; ...+ 0x0A00...
	add hl,de			;a326
	ld a,c			;a327   ; ...+ la linea
	call 040c4h		;a328   ; hl_mas_a: HL = HL + A
	ld b,015h		;a32b   ; los 21 caracteres
	ld de,00008h		;a32d
	ld a,0f0h		;a330   ; el color 0xF0
L_A332:
	call 0004dh		;a332   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	add hl,de			;a335   ; el siguiente caracter (8)
	djnz L_A332		;a336
	ld hl,0e20eh		;a338   ; la linea + 1...
	ld a,(hl)			;a33b
	inc a			;a33c
	and 007h		;a33d   ; ...de 8...
	ld (hl),a			;a33f
	ret nz			;a340
	inc hl			;a341   ; ...la fila + 1
	inc (hl)			;a342
	ld a,(hl)			;a343
	cp 006h		;a344   ; Z con las 6
	ret			;a346

; ----------------------------------------------------------------------
; DATOS rachas_d_A347: [destino en la VRAM] y rachas (p00:4D10 -> p00:4D16);
;   lo leen p12:A2EE (354 bytes)
;   0xa347..0xa4a9  (354 bytes)
DATA_rachas_d_A347:
	defb 000h,02ah,018h,000h,002h,007h,003h,00fh,002h,01fh,081h,03fh,008h,0ffh,002h,0f8h	; a347  .*.........?....
	defb 003h,0f0h,003h,0e0h,07fh,000h,00dh,000h,087h,001h,003h,00fh,07fh,03fh,07fh,07fh	; a357  .............?..
	defb 00ah,0ffh,082h,0fch,0f0h,003h,0c0h,002h,080h,07fh,000h,083h,001h,003h,007h,003h	; a367  ................
	defb 00fh,081h,03fh,009h,0ffh,087h,0feh,0fch,0f8h,0f8h,0f0h,0f8h,0c0h,00bh,000h,002h	; a377  ..?.............
	defb 001h,083h,003h,07fh,07fh,00bh,0ffh,002h,0feh,083h,0fch,080h,080h,006h,000h,002h	; a387  ................
	defb 03ch,002h,078h,092h,079h,0f3h,0f7h,0ffh,01fh,03eh,07ch,0f9h,0f3h,0e3h,0c3h,087h	; a397  <.x.y....>|.....
	defb 01fh,07fh,0f8h,0f0h,0e0h,0e0h,003h,0c0h,084h,0f0h,0f8h,078h,078h,003h,079h,002h	; a3a7  ...........xx.y.
	defb 07fh,083h,0ffh,0f7h,0f7h,003h,0e7h,002h,00fh,003h,01eh,003h,03ch,088h,003h,007h	; a3b7  ............<...
	defb 00fh,00eh,01eh,03ch,038h,078h,005h,0e0h,003h,0e1h,002h,07eh,083h,0feh,0f6h,0f6h	; a3c7  ...<8x.....~....
	defb 003h,0eeh,002h,00fh,088h,01fh,01dh,03dh,03bh,07bh,073h,0f1h,0f1h,003h,0e3h,003h	; a3d7  .......=.{s.....
	defb 0c7h,002h,0e0h,003h,0c0h,003h,080h,008h,000h,003h,01fh,003h,03fh,002h,07fh,008h	; a3e7  ............?...
	defb 0ffh,083h,0f0h,0e0h,0e0h,003h,0c0h,002h,080h,007h,000h,087h,007h,003h,007h,007h	; a3f7  ................
	defb 00fh,01fh,03fh,009h,0ffh,089h,0f8h,0fch,0f8h,0f8h,0f0h,0e0h,0c0h,000h,000h,003h	; a407  ..?.............
	defb 001h,003h,003h,002h,007h,088h,0efh,0e7h,0e7h,0c7h,0c7h,0c3h,083h,083h,003h,087h	; a417  ................
	defb 003h,0c7h,092h,0e3h,0e0h,080h,080h,081h,081h,083h,0c7h,0ffh,0feh,0fbh,0f3h,0f3h	; a427  ................
	defb 0f7h,0e7h,0c7h,08fh,00fh,003h,0c7h,003h,087h,002h,007h,002h,078h,088h,079h,0f1h	; a437  ............x.y.
	defb 0f3h,0f7h,0e7h,0efh,070h,0f0h,003h,0ffh,002h,081h,081h,001h,003h,0e3h,003h,0e7h	; a447  ....p...........
	defb 002h,0efh,002h,0ceh,081h,0cfh,003h,08fh,002h,00fh,088h,0f7h,0e7h,0c7h,0cfh,08fh	; a457  ................
	defb 08fh,01eh,01eh,003h,08fh,003h,01eh,002h,03ch,090h,007h,008h,017h,014h,017h,014h	; a467  ........<.......
	defb 008h,007h,080h,040h,020h,0a0h,020h,0a0h,040h,080h,011h,000h,085h,003h,00fh,01fh	; a477  ...@ . .@.......
	defb 03fh,07fh,00bh,0ffh,086h,0fch,0f0h,0e0h,0c0h,080h,080h,07fh,000h,00ah,000h,003h	; a487  ?...............
	defb 001h,003h,003h,002h,007h,009h,0ffh,002h,0feh,003h,0fch,002h,0f8h,07fh,000h,009h	; a497  ................
	defb 000h,000h	; a4a7

; ======================================================================
; CODIGO 0xa4a9..0xa531  (136 bytes)
; ======================================================================


L_A4A9:
	ld a,(0e640h)		;a4a9   ; los caracteres animados de la fase: con jefe, no
	or a			;a4ac
	ret nz			;a4ad
	ld a,(0e6aah)		;a4ae   ; en el fundido, no
	and a			;a4b1
	ret nz			;a4b2
	ld a,(0e301h)		;a4b3   ; la fase...
	ld b,a			;a4b6
	cp 009h		;a4b7   ; ...hasta la 8
	ret nc			;a4b9
	ld c,00fh		;a4ba   ; en la 4, cada 16 cuadros...
	cp 004h		;a4bc
	jr z,L_A4C7		;a4be
	ld c,003h		;a4c0   ; ...en las 1-7, cada 4...
	dec a			;a4c2
	cp 007h		;a4c3
	jr c,L_A4CC		;a4c5
L_A4C7:
	ld a,(0e203h)		;a4c7   ; la cuenta de cuadros
	and c			;a4ca
	ret nz			;a4cb
L_A4CC:
	ld a,(0e301h)		;a4cc   ; la lista de la fase (p12:A52F)
	ld de,0a52fh		;a4cf
	call 04e21h		;a4d2   ; palabra_de_de: DE = la palabra DE + 2 x A
	ex de,hl			;a4d5
	ld a,l			;a4d6   ; sin lista: nada
	or h			;a4d7
	ret z			;a4d8
	ld a,(hl)			;a4d9   ; el primer byte: cuantos (bits 0-6)...
	ld (0f000h),a		;a4da   ; ...y la tabla (bit 7)
	and 07fh		;a4dd
	ld c,a			;a4df
	inc hl			;a4e0
	ld a,(0e6bbh)		;a4e1   ; el paso (0xE6BB) + 1...
	inc a			;a4e4
	cp c			;a4e5   ; ...vuelve a 0
	jr c,L_A4E9		;a4e6
	xor a			;a4e8
L_A4E9:
	ld (0e6bbh),a		;a4e9   ; guardado
	push hl			;a4ec
	ld l,a			;a4ed   ; el paso x 10
	ld h,000h		;a4ee
	add hl,hl			;a4f0
	ld c,l			;a4f1
	ld b,h			;a4f2
	add hl,hl			;a4f3
	add hl,hl			;a4f4
	add hl,bc			;a4f5
	ld c,l			;a4f6
	ld b,h			;a4f7
	pop hl			;a4f8
	add hl,bc			;a4f9   ; su entrada
	ld a,(hl)			;a4fa   ; el caracter
	ex de,hl			;a4fb
	inc de			;a4fc
	ld l,a			;a4fd
	ld a,(0f000h)		;a4fe   ; el bit 7...
	add a,a			;a501
	ld h,004h		;a502   ; ...dibujos en 0x0000 o en 0x2000
	jr nc,L_A508		;a504
	ld h,000h		;a506
L_A508:
	add hl,hl			;a508   ; el caracter x 8
	add hl,hl			;a509
	add hl,hl			;a50a
	ld a,(00007h)		;a50b   ; el puerto del VDP
	ld c,a			;a50e
	ld a,(de)			;a50f   ; los tercios (bits)
	inc de			;a510
	exx			;a511
	ld b,003h		;a512   ; 3
	ld e,a			;a514
L_A515:
	rr e		;a515   ; este tercio?
	exx			;a517
	jr nc,L_A529		;a518
	call 00053h		;a51a   ; BIOS SETWRT - Enables VDP to write | SETWRT
	push de			;a51d
	push hl			;a51e
	ex de,hl			;a51f
	ld b,008h		;a520   ; 8 bytes
L_A522:
	outi		;a522   ; al VDP
	jp nz,L_A522		;a524
	pop hl			;a527
	pop de			;a528
L_A529:
	ld a,008h		;a529   ; el tercio siguiente (+0x800)
	add a,h			;a52b
	ld h,a			;a52c
	exx			;a52d
	djnz L_A515		;a52e   ; los 3
	ret			;a530

; ----------------------------------------------------------------------
; DATOS listas_A52F: 7 punteros, uno por fase (p12:A4CF: 0xA52F + 2 x fase,
;   p00:4E21); 0 = la fase no tiene lista; lo leen p12:A4D2 (14 bytes)
;   0xa531..0xa53f  (14 bytes)
DATA_listas_A52F:
	defw 00000h,00000h,00000h,0a53fh,0a55eh,0a5afh,00000h	; a531

; ----------------------------------------------------------------------
; DATOS listas_A52F_A53F: lista de la fase 4 que p12:A4D9 recorre (acaba donde
;   empieza la siguiente); lo leen p12:A4D9 (31 bytes)
;   0xa53f..0xa55e  (31 bytes)
DATA_listas_A52F_A53F:
	defb 003h,052h,007h,000h,000h,000h,018h,018h	; a53f  .R......
	defb 000h,000h,000h,052h,007h,000h,024h,042h	; a547  ...R..$B
	defb 018h,018h,042h,024h,000h,052h,007h,018h	; a54f  ..B$.R..
	defb 000h,000h,099h,099h,000h,000h,018h	; a557

; ----------------------------------------------------------------------
; DATOS listas_A52F_A55E: lista de la fase 5 que p12:A4D9 recorre (acaba donde
;   empieza la siguiente); lo leen p12:A4D9 (81 bytes)
;   0xa55e..0xa5af  (81 bytes)
DATA_listas_A52F_A55E:
	defb 008h,06ah,007h,001h,002h,004h,010h,020h	; a55e  .j.....
	defb 020h,000h,040h,06bh,007h,080h,040h,020h	; a566   .@k..@
	defb 008h,004h,004h,000h,002h,06ch,007h,001h	; a56e  .....l..
	defb 001h,002h,004h,004h,002h,000h,001h,06dh	; a576  .......m
	defb 007h,080h,080h,040h,020h,020h,040h,000h	; a57e  ...@  @.
	defb 080h,06ah,007h,001h,01ch,020h,040h,080h	; a586  .j... @.
	defb 080h,000h,080h,06bh,007h,080h,038h,004h	; a58e  ...k..8.
	defb 002h,001h,001h,000h,001h,06ch,007h,001h	; a596  .....l..
	defb 006h,008h,010h,018h,004h,000h,001h,06dh	; a59e  .......m
	defb 007h,080h,060h,010h,008h,018h,020h,000h	; a5a6  ..`... .
	defb 080h	; a5ae

; ----------------------------------------------------------------------
; DATOS listas_A52F_A5AF: lista de la fase 6 que p12:A4D9 recorre (acaba donde
;   empieza la siguiente); lo leen p12:A4D9 (31 bytes)
;   0xa5af..0xa5ce  (31 bytes)
DATA_listas_A52F_A5AF:
	defb 003h,05ah,007h,000h,000h,02ah,000h,02ah	; a5af  .Z...*.*
	defb 000h,000h,000h,05ah,007h,000h,02ah,000h	; a5b7  ...Z..*.
	defb 000h,000h,02ah,000h,000h,05ah,007h,01ch	; a5bf  ..*..Z..
	defb 000h,000h,02ah,000h,000h,01ch,000h	; a5c7

; ======================================================================
; CODIGO 0xa5ce..0xa6fa  (300 bytes)
; ======================================================================


L_A5CE:
	ld a,(0e6c0h)		;a5ce   ; el objeto que se recoge: en la pausa, no
	or a			;a5d1
	ret nz			;a5d2
	ld a,(0e6d0h)		;a5d3   ; recogido?
	and a			;a5d6
	jr z,L_A5E4		;a5d7
	ld hl,0e6d5h		;a5d9   ; la espera...
	dec (hl)			;a5dc
	ret nz			;a5dd
	ld a,002h		;a5de   ; ...acabada: 0xE6D0 = 2
	ld (0e6d0h),a		;a5e0
	ret			;a5e3
L_A5E4:
	call L_A6C6		;a5e4   ; se mueve
	call L_A633		;a5e7   ; aparece
	ld a,(0e6d2h)		;a5ea   ; hay?
	and a			;a5ed
	ret z			;a5ee
	ld iy,0e300h		;a5ef   ; el jugador 1...
	call L_A5FA		;a5f3
	ld iy,0e380h		;a5f6   ; ...y el 2
L_A5FA:
	ld a,(iy+020h)		;a5fa   ; vivo?
	dec a			;a5fd
	ret m			;a5fe
	ld a,(0e6d0h)		;a5ff   ; ya recogido?
	or a			;a602
	ret nz			;a603
	ld hl,0e6d3h		;a604   ; la y del jugador + 4 - la del objeto...
	ld a,(iy+024h)		;a607
	add a,004h		;a60a
	sub (hl)			;a60c
	add a,008h		;a60d
	cp 011h		;a60f   ; ...a menos de 9?
	ret nc			;a611
	inc l			;a612
	ld a,(iy+026h)		;a613   ; la x igual
	add a,004h		;a616
	sub (hl)			;a618
	add a,008h		;a619
	cp 011h		;a61b
	ret nc			;a61d
	ld hl,0e6d2h		;a61e   ; recogido: su numero...
	ld a,(hl)			;a621
	ld (hl),000h		;a622   ; ...fuera de 0xE6D2...
	dec l			;a624
	ld (hl),a			;a625   ; ...a 0xE6D1...
	dec l			;a626
	ld (hl),001h		;a627   ; ...y 0xE6D0 = 1
	ld a,040h		;a629   ; 64 cuadros
	ld (0e6d5h),a		;a62b
	ld a,056h		;a62e   ; el sonido 0x56
	jp 04d6eh		;a630   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_A633:
	ld hl,(0e627h)		;a633   ; el recorrido avanza (0xE627)?
	ld a,h			;a636
	or l			;a637
	ret z			;a638
L_A639:
	ld a,(0e301h)		;a639   ; la fase 3: 4 sitios (0xE350)...
	ld b,004h		;a63c
	sub 003h		;a63e
	jr z,L_A64C		;a640
	ld b,004h		;a642   ; ...la 5: 4 (0xE355)...
	sub 002h		;a644
	jr z,L_A64C		;a646
	ld b,001h		;a648   ; ...la 6: 1 (0xE359)...
	dec a			;a64a
	ret nz			;a64b   ; ...las demas, nada
L_A64C:
	ld a,(0e620h)		;a64c   ; en vertical, desde arriba (0); en horizontal, desde la derecha (0xF8)
	or a			;a64f
	ld a,0f8h		;a650
	jr z,L_A655		;a652
	xor a			;a654
L_A655:
	ld (0f004h),a		;a655
	ld de,0e350h		;a658
	ld a,(0e301h)		;a65b   ; lee la fase (de 1 a 7; 0 en la presentacion)
	sub 003h		;a65e
	jr z,L_A66A		;a660
	ld e,055h		;a662
	sub 002h		;a664
	jr z,L_A66A		;a666
	ld e,059h		;a668
L_A66A:
	ld c,000h		;a66a   ; el sitio 0
L_A66C:
	ld a,(de)			;a66c   ; ya recogido?
	or a			;a66d
	jr nz,L_A675		;a66e
L_A670:
	inc c			;a670   ; el siguiente
	inc e			;a671
	djnz L_A66C		;a672
	ret			;a674
L_A675:
	push de			;a675   ; el recorrido donde sale
	ex af,af'			;a676
	ld hl,0a6fah		;a677   ; de p12:A6FA (fase 3)...
	ld a,(0e301h)		;a67a   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 003h		;a67d
	jr z,L_A68B		;a67f
	ld hl,0a702h		;a681   ; ...A702 (fase 5)...
	cp 005h		;a684
	jr z,L_A68B		;a686
	ld hl,0a70ah		;a688   ; ...o A70A (fase 6)
L_A68B:
	ld a,c			;a68b
	call 04e28h		;a68c   ; su punto
	ld hl,(0e302h)		;a68f   ; el recorrido llega?
	rst 20h			;a692
	pop de			;a693
	jr nz,L_A670		;a694   ; aun no: el siguiente
	ld hl,0a70ch		;a696   ; la altura de p12:A70C...
	ld a,(0e301h)		;a699   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 003h		;a69c
	jr z,L_A6AA		;a69e
	ld hl,0a710h		;a6a0   ; ...A710...
	cp 005h		;a6a3
	jr z,L_A6AA		;a6a5
	ld hl,0a714h		;a6a7   ; ...o A714
L_A6AA:
	ld a,c			;a6aa
	call 05ad8h		;a6ab   ; byte_de_tabla: A = el byte HL + A
	ld e,a			;a6ae   ; la altura
	ld a,(0f004h)		;a6af   ; la entrada
	ld d,a			;a6b2
	ld a,(0e620h)		;a6b3   ; en vertical, al reves
	or a			;a6b6
	jr z,L_A6BC		;a6b7
	ld a,d			;a6b9
	ld d,e			;a6ba
	ld e,a			;a6bb
L_A6BC:
	ex af,af'			;a6bc   ; el objeto en 0xE6D2...
	ld hl,0e6d2h		;a6bd
	ld (hl),a			;a6c0
	inc l			;a6c1
	ld (hl),e			;a6c2   ; ...con su y...
	inc l			;a6c3
	ld (hl),d			;a6c4   ; ...y su x
	ret			;a6c5
L_A6C6:
	ld a,(0e6d2h)		;a6c6   ; el objeto: hay?
	or a			;a6c9
	ret z			;a6ca
	ld a,(0e627h)		;a6cb   ; el recorrido avanza en horizontal?
	and a			;a6ce
	jr z,L_A6E9		;a6cf
	ld hl,0e6d4h		;a6d1
	jp m,L_A6E4		;a6d4   ; la x...
	ld a,(hl)			;a6d7   ; ...- 8
	sub 008h		;a6d8
L_A6DA:
	ld (hl),a			;a6da   ; nueva
	ret nc			;a6db   ; sale: fuera
	dec l			;a6dc
L_A6DD:
	xor a			;a6dd   ; se acaba
	dec l			;a6de
	ld (hl),a			;a6df
	dec l			;a6e0
	dec l			;a6e1
	ld (hl),a			;a6e2
	ret			;a6e3
L_A6E4:
	ld a,(hl)			;a6e4   ; + 8
	add a,008h		;a6e5
	jr L_A6DA		;a6e7
L_A6E9:
	ld a,(0e628h)		;a6e9   ; en vertical?
	or a			;a6ec
	ret z			;a6ed
	ld hl,0e6d3h		;a6ee   ; la y + 8...
	ld a,(hl)			;a6f1
	add a,008h		;a6f2
	ld (hl),a			;a6f4
	cp 0a8h		;a6f5   ; ...pasada 0xA8: fuera
	ret c			;a6f7
	jr L_A6DD		;a6f8

; ----------------------------------------------------------------------
; DATOS resto_A6FA: lo apuntan con el banco puesto p12:A677 (0xA6FA), p12:A681
;   (0xA702), p12:A688 (0xA70A), p12:A696 (0xA70C), p12:A6A0 (0xA710),
;   p12:A6A7 (0xA714); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:A677, p12:A681, p12:A688, p12:A696, p12:A6A0,
;   p12:A6A7 (27 bytes)
;   0xa6fa..0xa715  (27 bytes)
DATA_resto_A6FA:
	defb 0f4h,000h,05eh,001h,085h,001h,0c6h,001h,002h,001h,032h,001h,05eh,001h,096h,001h	; a6fa  ..^.......2.^...
	defb 04eh,001h,0c8h,028h,0d0h,028h,048h,068h,028h,048h,090h	; a70a  N..(.(Hh(H.

; ======================================================================
; CODIGO 0xa715..0xa75c  (71 bytes)
; ======================================================================


L_A715:
	call 04eaah		;a715   ; el enemigo nuevo: con el bit 4 de IX+10
	inc (ix+006h)		;a718   ; la x + 1
	ld a,(0e301h)		;a71b   ; en la fase 3...
	cp 003h		;a71e
	jr nz,L_A726		;a720
	ld (ix+032h),006h		;a722   ; ...IX+32 = 6
L_A726:
	ld (ix+028h),000h		;a726   ; sin golpe
	ld (ix+013h),004h		;a72a   ; 4 x 4
	ld (ix+014h),004h		;a72e
	ld a,(ix+006h)		;a732   ; la x / 8...
	rra			;a735
	rra			;a736
	rra			;a737   ; ...su espera de p12:A764
	and 01fh		;a738
	ld hl,0a764h		;a73a
	call 05ad8h		;a73d   ; byte_de_tabla: A = el byte HL + A
	ld (ix+025h),a		;a740
	ld (ix+002h),a		;a743
	ld a,(ix+019h)		;a746   ; por IX+19...
	res 2,(ix+010h)		;a749   ; ...sin el bit 2...
	ld hl,0a75ch		;a74d   ; ...la velocidad x de p12:A75C
	call 04e28h		;a750   ; palabra_de_hl: DE = la palabra HL + 2 x A
	call 0685dh		;a753   ; pon_ix09: IX+09/0A = DE
	ld de,00800h		;a756   ; y 8 en y
	jp 06856h		;a759   ; pon_ix07: IX+07/08 = DE

; ----------------------------------------------------------------------
; DATOS resto_A75C: lo apuntan con el banco puesto p12:A74D (0xA75C), p12:A73A
;   (0xA764); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:A74D, p12:A73A (40 bytes)
;   0xa75c..0xa784  (40 bytes)
DATA_resto_A75C:
	defb 000h,000h,000h,000h,000h,0f8h,000h,008h,004h,007h,005h,003h,004h,006h,003h,005h	; a75c  ................
	defb 004h,007h,005h,003h,004h,006h,003h,005h,004h,007h,005h,003h,004h,006h,003h,005h	; a76c  ................
	defb 004h,007h,005h,003h,004h,006h,003h,005h	; a77c  ........

; ======================================================================
; CODIGO 0xa784..0xa7ee  (106 bytes)
; ======================================================================


L_A784:
	call 04eaah		;a784   ; el enemigo nuevo
	ld (ix+028h),000h		;a787   ; sin golpe
	call 04e58h		;a78b   ; la rapidez: 0x40 a 0xBF al azar
	and 07fh		;a78e
	add a,040h		;a790
	ld c,a			;a792
	ld a,(ix+019h)		;a793   ; IX+19 distinto de 0: p12:A7E0
	and a			;a796
	jr nz,L_A7E0		;a797
	call 04e58h		;a799   ; al azar: el bit 4...
	bit 4,a		;a79c
	jr z,L_A7B1		;a79e
	ld a,(0e227h)		;a7a0   ; ...con dos jugadores...
	cp 002h		;a7a3
	jr L_A7B1		;a7a5
L_A7A7:
	ld a,(0e3a4h)		;a7a7   ; el jugador 2 (y, x)
	ld h,a			;a7aa
	ld a,(0e3a6h)		;a7ab
	ld l,a			;a7ae
	jr L_A7B9		;a7af
L_A7B1:
	ld a,(0e324h)		;a7b1   ; el jugador 1
	ld h,a			;a7b4
	ld a,(0e326h)		;a7b5
	ld l,a			;a7b8
L_A7B9:
	call 04e58h		;a7b9   ; al azar uno de 8...
	and 007h		;a7bc
	push hl			;a7be
	ld hl,0a7f4h		;a7bf   ; ...desplazamientos de p12:A7F4
	call 04e28h		;a7c2   ; palabra_de_hl: DE = la palabra HL + 2 x A
	pop hl			;a7c5
	add hl,de			;a7c6   ; hacia ahi
	ld a,c			;a7c7   ; la velocidad
	call 06832h		;a7c8
	bit 7,(ix+008h)		;a7cb   ; la velocidad y negativa...
	call nz,06897h		;a7cf   ; ...p01:6897
	ld l,(ix+007h)		;a7d2   ; la velocidad y...
	ld h,(ix+008h)		;a7d5
	ld de,00300h		;a7d8   ; ...menos de 3: nada
	rst 20h			;a7db
	ret nc			;a7dc
L_A7DD:
	jp 06856h		;a7dd   ; 3 en y
L_A7E0:
	ld hl,la7ech		;a7e0   ; la x de p12:A7EC
	call 04e28h		;a7e3   ; palabra_de_hl: DE = la palabra HL + 2 x A
	call 0685dh		;a7e6   ; pon_ix09: IX+09/0A = DE
	ld de,00600h		;a7e9   ; 6 en y
L_A7EC:
	jr L_A7DD		;a7ec

; ----------------------------------------------------------------------
; DATOS resto_A7EE: lo apuntan con el banco puesto p12:A7BF (0xA7F4); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:A7BF (22 bytes)
;   0xa7ee..0xa804  (22 bytes)
DATA_resto_A7EE:
	defb 000h,0fch,000h,000h,000h,004h,005h,008h,020h,006h,0fch,040h,0edh,035h,025h,0e0h	; a7ee  ........ ..@.5%.
	defb 080h,024h,045h,0f8h,000h,000h	; a7fe

; ======================================================================
; CODIGO 0xa804..0xa86b  (103 bytes)
; ======================================================================


L_A804:
	call L_A784		;a804   ; como p12:A784...
	ld (ix+036h),0d0h		;a807   ; ...con los dos sprites de IX+34/IX+38
	ld (ix+03ah),0cch		;a80b
	ld a,00eh		;a80f
	ld (ix+037h),a		;a811   ; el color 14
	ld (ix+03bh),a		;a814
	jp 06c3fh		;a817   ; a su sitio
L_A81A:
	res 2,(ix+010h)		;a81a   ; el parpadeo: sin...
	ld a,(ix+025h)		;a81e   ; ...cada (IX+25) cuadros...
	and a			;a821
	ret z			;a822
	dec (ix+002h)		;a823
	ret nz			;a826   ; ...espera
	ld a,(ix+025h)		;a827   ; la cuenta otra vez
	ld (ix+002h),a		;a82a
	set 2,(ix+010h)		;a82d   ; y con el bit 2
	ret			;a831
L_A832:
	ld a,(ix+028h)		;a832   ; tocado?
	and a			;a835
	ret z			;a836
	ld (ix+028h),000h		;a837   ; 0
	ld a,(0e652h)		;a83b   ; 10 enemigos o mas: no
	cp 00ah		;a83e
	ret nc			;a840
	ld e,(ix+004h)		;a841   ; su posicion
	ld d,(ix+006h)		;a844
	push de			;a847
	call 06b62h		;a848   ; roto
	pop de			;a84b
	ld b,003h		;a84c   ; 3 trozos
L_A84E:
	push de			;a84e
	push bc			;a84f
	ld a,b			;a850   ; de p12:A869...
	ld hl,0a869h		;a851
	add a,a			;a854
	call 040c4h		;a855   ; hl_mas_a: HL = HL + A
	ld a,e			;a858   ; ...la y + el desplazamiento...
	add a,(hl)			;a859
	ld e,a			;a85a
	inc hl			;a85b
	ld a,d			;a85c   ; ...la x + el desplazamiento
	add a,(hl)			;a85d
	ld d,a			;a85e
	ld a,00fh		;a85f   ; el tipo 0x0F
	ld c,000h		;a861
	call 065b5h		;a863   ; el enemigo
	pop bc			;a866
	pop de			;a867
	djnz L_A84E		;a868   ; los 3
	ret			;a86a

; ----------------------------------------------------------------------
; DATOS pares_A86B: 3 pares (p12:A851: 0xA869 + 2 x B, B de 1 a 3) que se
;   suman a E y D; lo leen p12:A855 (6 bytes)
;   0xa86b..0xa871  (6 bytes)
DATA_pares_A86B:
	defb 010h,0f8h	; a86b
	defb 000h,000h	; a86d
	defb 010h,008h	; a86f

; ======================================================================
; CODIGO 0xa871..0xaae9  (632 bytes)
; ======================================================================


L_A871:
	ld a,(0e301h)		;a871   ; los golpes: en la fase 1, 3...
	dec a			;a874
	ld a,003h		;a875
	jr z,L_A880		;a877
	ld a,(0e692h)		;a879   ; ...si no, 5 - 0xE692
	ld b,a			;a87c
	ld a,005h		;a87d
	sub b			;a87f
L_A880:
	ld (ix+028h),a		;a880   ; en IX+28
	ld a,(0e620h)		;a883   ; en vertical...
	and a			;a886
	jr z,L_A894		;a887
	ld b,000h		;a889
	ld a,(ix+006h)		;a88b   ; ...la x pasada 0x80...
	cp 080h		;a88e
	jr c,L_A89E		;a890
	jr L_A89D		;a892
L_A894:
	ld b,000h		;a894   ; en horizontal: la y pasada 0x60...
	ld a,(ix+004h)		;a896
	cp 060h		;a899
	jr c,L_A89E		;a89b
L_A89D:
	inc b			;a89d   ; ...la direccion 1
L_A89E:
	ld (ix+025h),b		;a89e   ; en IX+25
	ld (ix+013h),002h		;a8a1   ; 2 x 2
	ld (ix+014h),002h		;a8a5
	res 2,(ix+010h)		;a8a9   ; sin el bit 2
	ld (ix+029h),001h		;a8ad   ; IX+29 = 1
L_A8B1:
	call 06872h		;a8b1   ; sin velocidad
	ld a,(0e620h)		;a8b4   ; en horizontal: -8 en x
	and a			;a8b7
	jr nz,L_A8C0		;a8b8
	ld de,0f800h		;a8ba
	jp 0685dh		;a8bd   ; pon_ix09: IX+09/0A = DE
L_A8C0:
	ld de,00800h		;a8c0   ; en vertical: +8 en y
	jp 06856h		;a8c3   ; pon_ix07: IX+07/08 = DE
L_A8C6:
	call L_A989		;a8c6   ; el paso
	ld a,(ix+001h)		;a8c9   ; 1...
	dec a			;a8cc
	jr z,L_A918		;a8cd
	dec a			;a8cf   ; 2...
	jr z,L_A92F		;a8d0
	dec a			;a8d2   ; 3...
	jr z,L_A93E		;a8d3
	dec a			;a8d5   ; 4: nada
	ret z			;a8d6
	ld a,(0e620h)		;a8d7   ; 0: en vertical...
	and a			;a8da
	jr z,L_A8F6		;a8db
	ld a,(ix+004h)		;a8dd   ; ...la y de 0x64 en adelante
	cp 064h		;a8e0
	ret c			;a8e2
	call L_A97B		;a8e3   ; el paso siguiente
L_A8E6:
	ld de,00800h		;a8e6   ; 8 en x...
	ld a,(ix+025h)		;a8e9   ; ...o -8
	and a			;a8ec
	call nz,05adfh		;a8ed   ; menos_de: DE = -DE
	call 0685dh		;a8f0   ; a IX+09
	jp L_A96F		;a8f3
L_A8F6:
	ld bc,0989ch		;a8f6   ; en horizontal: la x hasta 0x9C...
	ld a,(ix+025h)		;a8f9   ; ...o 0x98 por el otro lado
	and a			;a8fc
	jr z,L_A900		;a8fd
	ld b,c			;a8ff
L_A900:
	ld a,(ix+006h)		;a900   ; la x...
	cp b			;a903   ; ...aun no
	ret nc			;a904
	call L_A97B		;a905   ; el paso siguiente
L_A908:
	ld de,00800h		;a908   ; 8 en y...
	ld a,(ix+025h)		;a90b   ; ...o -8
	and a			;a90e
	call nz,05adfh		;a90f   ; menos_de: DE = -DE
	call 06856h		;a912   ; a IX+07
	jp L_A975		;a915   ; y sin velocidad x
L_A918:
	dec (ix+002h)		;a918   ; la espera
	ret nz			;a91b
	inc (ix+001h)		;a91c   ; el paso siguiente
	ld a,(0e620h)		;a91f   ; en horizontal 0x24 cuadros...
	and a			;a922
	ld a,024h		;a923
	jr z,L_A929		;a925
	ld a,012h		;a927   ; ...en vertical 0x12
L_A929:
	ld (ix+002h),a		;a929
	jp L_A8B1		;a92c   ; de vuelta
L_A92F:
	dec (ix+002h)		;a92f   ; la espera
	ret nz			;a932
	inc (ix+001h)		;a933   ; el paso siguiente
	ld a,(0e620h)		;a936   ; en vertical, de lado; en horizontal, en y
	and a			;a939
	jr nz,L_A8E6		;a93a
	jr L_A908		;a93c
L_A93E:
	ld a,(0e620h)		;a93e   ; en vertical...
	and a			;a941
	jr z,L_A94C		;a942
	ld a,(ix+004h)		;a944   ; ...hasta la y 0x30
	cp 030h		;a947
	ret nc			;a949
	jr L_A95B		;a94a
L_A94C:
	ld bc,0808ch		;a94c   ; en horizontal: la x 0x80...
	ld a,(ix+025h)		;a94f   ; ...o 0x8C por el otro lado
	and a			;a952
	jr z,L_A956		;a953
	ld b,c			;a955
L_A956:
	ld a,(ix+006h)		;a956
	cp b			;a959
	ret c			;a95a
L_A95B:
	ld a,(ix+004h)		;a95b   ; la y en su fila (& 0xF8)
	and 0f8h		;a95e
	ld (ix+004h),a		;a960
	inc (ix+001h)		;a963   ; el paso siguiente
	call 06872h		;a966   ; sin velocidad
	ld a,(0e620h)		;a969   ; en horizontal...
	and a			;a96c
	jr z,L_A975		;a96d
L_A96F:
	ld de,0f800h		;a96f   ; -8 en y
	jp 06856h		;a972   ; pon_ix07: IX+07/08 = DE
L_A975:
	ld de,00800h		;a975   ; 8 en x
	jp 0685dh		;a978   ; pon_ix09: IX+09/0A = DE
L_A97B:
	inc (ix+001h)		;a97b   ; el paso siguiente
	ld a,(ix+028h)		;a97e   ; la espera: los golpes x 4 + 4
	add a,a			;a981
	add a,a			;a982
	add a,004h		;a983
	ld (ix+002h),a		;a985
	ret			;a988
L_A989:
	dec (ix+029h)		;a989   ; cada (IX+29) cuadros...
	ret nz			;a98c
	ld (ix+029h),001h		;a98d   ; ...siempre 1...
	ld a,(ix+010h)		;a991   ; ...el bit 2 de IX+10 cambia
	xor 004h		;a994
	ld (ix+010h),a		;a996
	ret			;a999
L_A99A:
	call L_AACE		;a99a   ; el enemigo que gira hacia el jugador: la espera del disparo
	ld (ix+015h),a		;a99d
	ld a,(0e620h)		;a9a0   ; en vertical: p12:A9B6
	rra			;a9a3
	jr c,L_A9B6		;a9a4
	ld (ix+002h),00ah		;a9a6   ; en horizontal: 10 cuadros, la direccion 8...
	ld (ix+025h),008h		;a9aa
	call 06877h		;a9ae   ; ...sin velocidad y...
	ld d,0fch		;a9b1   ; ...-4 en x
	jp 0685dh		;a9b3   ; pon_ix09: IX+09/0A = DE
L_A9B6:
	ld (ix+002h),008h		;a9b6   ; en vertical: 8 cuadros, la direccion 12...
	ld (ix+025h),00ch		;a9ba
	call 0687ch		;a9be   ; ...sin velocidad x...
	ld d,004h		;a9c1   ; ...4 en y
	jp 06856h		;a9c3   ; pon_ix07: IX+07/08 = DE
L_A9C6:
	ld a,(0e620h)		;a9c6   ; en vertical: p12:AA46
	rra			;a9c9
	jp c,L_AA46		;a9ca
	bit 0,(ix+001h)		;a9cd   ; el paso 0...
	jr nz,L_A9E3		;a9d1
	ld a,(0e326h)		;a9d3   ; ...la x del jugador 1...
	cp (ix+006h)		;a9d6
	jr c,L_A9E3		;a9d9   ; ...mas a la izquierda: sigue
	inc (ix+001h)		;a9db   ; lo pasa: el paso 1...
	ld (ix+015h),002h		;a9de   ; ...y dispara en 2 cuadros
	ret			;a9e2
L_A9E3:
	call L_AAAF		;a9e3   ; dispara
	dec (ix+002h)		;a9e6   ; cada (IX+02) cuadros, gira
	ret nz			;a9e9
	ld a,(0e326h)		;a9ea   ; la distancia en x al jugador...
	add a,010h		;a9ed
	sub (ix+006h)		;a9ef
	cpl			;a9f2
	inc a			;a9f3
	ld b,a			;a9f4   ; ...en B
	ld e,003h		;a9f5   ; 3
	ld (ix+002h),004h		;a9f7   ; 4 cuadros
	jr c,L_AA10		;a9fb   ; delante: p12:AA10
	ld (ix+002h),018h		;a9fd   ; detras: 0x18 cuadros...
	ld a,(ix+025h)		;aa01   ; ...la direccion de 7 a 9...
	sub 007h		;aa04
	cp 003h		;aa06
	ld a,008h		;aa08   ; ...si no, hacia la 8
	jr nc,L_AA2E		;aa0a
	ld h,084h		;aa0c   ; el dibujo 0x84
	jr L_AA2B		;aa0e
L_AA10:
	ld a,(0e324h)		;aa10   ; la distancia en y...
	sub (ix+004h)		;aa13
	ld d,000h		;aa16   ; ...y su lado (D)
	jr nc,L_AA1D		;aa18
	neg		;aa1a
	inc d			;aa1c
L_AA1D:
	ld c,008h		;aa1d   ; la direccion por la distancia
	call L_AAD8		;aa1f
	dec d			;aa22   ; por arriba...
	ld a,c			;aa23
	jr z,L_AA2B		;aa24
	xor 00fh		;aa26   ; ...o por abajo
	inc a			;aa28
	ld h,088h		;aa29   ; el dibujo 0x88
L_AA2B:
	ld (ix+030h),h		;aa2b   ; el dibujo
L_AA2E:
	cp (ix+025h)		;aa2e   ; ya en esa direccion?
	ret z			;aa31
	ld a,(ix+025h)		;aa32   ; un paso hacia ella...
	inc a			;aa35
	jr nc,L_AA3A		;aa36
	dec a			;aa38   ; ...o al reves
	dec a			;aa39
L_AA3A:
	ld (ix+025h),a		;aa3a   ; la nueva
	and 00fh		;aa3d   ; de 16
	ld b,e			;aa3f
	call 04f1eh		;aa40   ; su velocidad (rapidez 3)
	jp 06881h		;aa43   ; a IX+07/09
L_AA46:
	call L_AA4F		;aa46   ; en vertical
	ld hl,0aae9h		;aa49   ; la animacion de p12:AAE9
	jp 09da7h		;aa4c
L_AA4F:
	bit 0,(ix+001h)		;aa4f   ; el paso 0...
	jr nz,L_AA65		;aa53
	ld a,(0e324h)		;aa55   ; ...la y del jugador 1...
	cp (ix+004h)		;aa58
	jr nc,L_AA65		;aa5b   ; ...mas arriba: sigue
	inc (ix+001h)		;aa5d   ; lo pasa: el paso 1...
	ld (ix+015h),002h		;aa60   ; ...y dispara en 2 cuadros
	ret			;aa64
L_AA65:
	call L_AAAF		;aa65   ; dispara
	dec (ix+002h)		;aa68   ; cada (IX+02) cuadros, gira
	ret nz			;aa6b
	ld a,(0e324h)		;aa6c   ; la distancia en y al jugador
	sub 008h		;aa6f
	sub (ix+004h)		;aa71
	ld b,a			;aa74
	ld e,003h		;aa75   ; 3
	ld (ix+002h),003h		;aa77   ; 3 cuadros
	jr nc,L_AA90		;aa7b   ; delante: p12:AA90
	ld (ix+002h),014h		;aa7d   ; detras: 0x14 cuadros...
	ld a,(ix+025h)		;aa81   ; ...la direccion de 11 a 13...
	sub 00bh		;aa84
	cp 003h		;aa86
	ld a,00ch		;aa88   ; ...si no, hacia la 12
	jr nc,L_AA2E		;aa8a
	ld h,084h		;aa8c   ; el dibujo 0x84
	jr L_AA2B		;aa8e
L_AA90:
	ld a,(0e326h)		;aa90   ; la distancia en x...
	sub (ix+006h)		;aa93
	ld d,000h		;aa96   ; ...y su lado
	jr nc,L_AA9D		;aa98
	neg		;aa9a
	inc d			;aa9c
L_AA9D:
	ld c,00ch		;aa9d   ; la direccion por la distancia
	call L_AAD8		;aa9f
	dec d			;aaa2   ; por un lado...
	ld a,c			;aaa3
	jr z,L_AA2B		;aaa4
	sub 018h		;aaa6   ; ...o por el otro (0x18 - eso)
	neg		;aaa8
	ld h,088h		;aaaa   ; el dibujo 0x88
	jp L_AA2B		;aaac
L_AAAF:
	dec (ix+015h)		;aaaf   ; la espera del disparo
	ret nz			;aab2
	ld a,(0e64fh)		;aab3   ; la nueva: 13 - la dificultad / 2...
	rra			;aab6
	sub 00dh		;aab7
	neg		;aab9
	bit 0,(ix+001h)		;aabb   ; ...en el paso 0, de p12:AACE
	call z,L_AACE		;aabf
	ld (ix+015h),a		;aac2   ; guardada
	ld e,(ix+004h)		;aac5   ; desde el enemigo...
	ld d,(ix+006h)		;aac8
	jp 074c5h		;aacb   ; ...un disparo al jugador
L_AACE:
	call 067cah		;aace   ; un numero de p01:67E1...
	ld b,a			;aad1
	srl b		;aad2   ; ...- un cuarto
	srl b		;aad4
	sub b			;aad6
	ret			;aad7
L_AAD8:
	sub b			;aad8   ; la distancia B en pasos: menos de B, C - 1 y el dibujo 0x84...
	dec c			;aad9
	ld h,084h		;aada
	ret c			;aadc
	sub b			;aadd   ; ...menos de 2B, C - 2 y 0x8C...
	dec c			;aade
	ld h,08ch		;aadf
	ret c			;aae1
	sub b			;aae2   ; ...menos de 3B, C - 2...
	ret c			;aae3
	sub b			;aae4   ; ...si no, C - 4
	dec c			;aae5
	ret c			;aae6
	dec c			;aae7
	ret			;aae8

; ----------------------------------------------------------------------
; DATOS resto_AAE9: lo apuntan con el banco puesto p12:AA49 (0xAAE9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:AA49 (4 bytes)
;   0xaae9..0xaaed  (4 bytes)
DATA_resto_AAE9:
	defb 090h,094h,098h,094h	; aae9

; ======================================================================
; CODIGO 0xaaed..0xabb9  (204 bytes)
; ======================================================================


L_AAED:
	ld a,(ix+004h)		;aaed   ; guarda su y...
	ld (ix+025h),a		;aaf0
	ld a,(ix+006h)		;aaf3   ; ...y la x
	ld (ix+026h),a		;aaf6
L_AAF9:
	ld a,(ix+00ch)		;aaf9   ; con IX+0C...
	or a			;aafc
	jr z,L_AB03		;aafd
	ld (ix+031h),006h		;aaff   ; ...el color 6
L_AB03:
	ld a,(0e620h)		;ab03   ; en vertical: p12:AC05
	rra			;ab06
	jp c,L_AC05		;ab07
	bit 0,(ix+019h)		;ab0a   ; IX+19 bit 0...
	jr nz,L_AB14		;ab0e
	ld (ix+030h),0a0h		;ab10   ; ...si no, el dibujo 0xA0
L_AB14:
	ld (ix+029h),000h		;ab14   ; IX+29 = 0
	call 04f9bh		;ab18   ; el bit 3 de IX+10
	call 06872h		;ab1b   ; sin velocidad
L_AB1E:
	call 067d0h		;ab1e   ; la espera del disparo: un numero de p01:67F1 / 2
	srl a		;ab21
	ld (ix+015h),a		;ab23
	ret			;ab26
L_AB27:
	ld a,(0e620h)		;ab27   ; en vertical: p12:AC1C
	rra			;ab2a
	jp c,L_AC1C		;ab2b
	call L_AB78		;ab2e   ; dispara
	bit 0,(ix+001h)		;ab31   ; el paso 1: p12:AB4C
	jr nz,L_AB4C		;ab35
	call L_ABC4		;ab37   ; un objeto de 0xE470 cerca?
	ret nc			;ab3a   ; no: nada
	inc (ix+001h)		;ab3b   ; si: el paso 1...
	bit 0,(ix+019h)		;ab3e   ; ...sube: -3 en y...
	ld de,0fd00h		;ab42
	jr z,L_AB49		;ab45
	ld d,003h		;ab47   ; ...o +3
L_AB49:
	jp 06856h		;ab49   ; pon_ix07: IX+07/08 = DE
L_AB4C:
	bit 0,(ix+019h)		;ab4c   ; el paso 1: la aceleracion 0x30...
	ld bc,00030h		;ab50
	jr z,L_AB58		;ab53
	ld bc,0ffd0h		;ab55   ; ...o -0x30
L_AB58:
	ld a,(ix+004h)		;ab58   ; la y - la guardada...
	sub (ix+025h)		;ab5b
	add a,002h		;ab5e
	cp 005h		;ab60   ; ...lejos: vuelve (p01:6BF3)
	jp nc,06bf3h		;ab62
	ld a,(ix+025h)		;ab65   ; cerca: en su sitio...
	ld (ix+004h),a		;ab68
	dec (ix+001h)		;ab6b   ; ...el paso 0...
	jp 06877h		;ab6e   ; ...sin velocidad y
L_AB71:
	ld a,(0e620h)		;ab71   ; en vertical: p12:AC5F
	rra			;ab74
	jp c,L_AC5F		;ab75
L_AB78:
	call L_ABF6		;ab78   ; el dibujo
	dec (ix+015h)		;ab7b   ; la espera del disparo
	ret nz			;ab7e
	call L_AB1E		;ab7f   ; la siguiente
	ld a,(ix+029h)		;ab82   ; IX+29: una vez 3...
	xor 001h		;ab85
	ld (ix+029h),a		;ab87
	ld b,003h		;ab8a
	ld hl,0abbbh		;ab8c   ; ...de p12:ABBB...
	jr z,L_AB95		;ab8f
	inc b			;ab91   ; ...otra 4 de p12:ABC0
	ld hl,0abc0h		;ab92
L_AB95:
	push bc			;ab95
	bit 0,(ix+019h)		;ab96   ; la direccion...
	ld a,(hl)			;ab9a
	jr z,L_ABA1		;ab9b   ; ...en IX+19 bit 0, al reves (0x10 - ella)
	sub 010h		;ab9d
	neg		;ab9f
L_ABA1:
	inc hl			;aba1
	push hl			;aba2
	ld b,004h		;aba3   ; rapidez 4
	call 04f1eh		;aba5   ; la velocidad
	ex de,hl			;aba8
	ld c,e			;aba9
	ld b,d			;abaa
	ld e,(ix+004h)		;abab   ; desde el enemigo
	ld d,(ix+006h)		;abae
	call 074a2h		;abb1   ; el disparo
	pop hl			;abb4
	pop bc			;abb5
	djnz L_AB95		;abb6   ; los B
	ret			;abb8

; ----------------------------------------------------------------------
; DATOS resto_ABB9: lo apuntan con el banco puesto p12:AC73 (0xABB9), p12:AB8C
;   (0xABBB), p12:AC79 (0xABBE), p12:AB92 (0xABC0); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p12:AC73, p12:AB8C,
;   p12:AC79, p12:AB92 (11 bytes)
;   0xabb9..0xabc4  (11 bytes)
DATA_resto_ABB9:
	defb 00ah,008h,006h,004h,002h,00bh,009h,007h,005h,003h,001h	; abb9  ...........

; ======================================================================
; CODIGO 0xabc4..0xad0f  (331 bytes)
; ======================================================================


L_ABC4:
	ld b,005h		;abc4   ; los 5 objetos de 0xE470 (0x48 cada uno)
	ld hl,0e470h		;abc6
	ld de,00048h		;abc9
L_ABCC:
	ld (ix+027h),l		;abcc   ; guardado en IX+27/28
	ld (ix+028h),h		;abcf
	ld a,(hl)			;abd2   ; vivo?
	or a			;abd3
	jr z,L_ABEC		;abd4
	ld a,(ix+004h)		;abd6   ; la y del enemigo - la suya...
	inc hl			;abd9
	inc hl			;abda
	inc hl			;abdb
	sub (hl)			;abdc
	add a,010h		;abdd
	cp 018h		;abdf   ; ...a menos de 8 o 16 de lado?
	jr nc,L_ABEC		;abe1
	ld a,(ix+006h)		;abe3   ; la x...
	inc hl			;abe6
	inc hl			;abe7
	sub (hl)			;abe8
	cp 021h		;abe9   ; ...a menos de 0x21: C
	ret c			;abeb
L_ABEC:
	ld l,(ix+027h)		;abec   ; el siguiente
	ld h,(ix+028h)		;abef
	add hl,de			;abf2
	djnz L_ABCC		;abf3
	ret			;abf5
L_ABF6:
	ld a,(0e203h)		;abf6   ; cada 8 cuadros...
	and 007h		;abf9
	ret nz			;abfb
	ld a,(ix+030h)		;abfc   ; ...el otro dibujo (bit 2)
	xor 004h		;abff
	ld (ix+030h),a		;ac01
	ret			;ac04
L_AC05:
	bit 0,(ix+019h)		;ac05   ; en vertical: IX+19 bit 0...
	jr z,L_AC0F		;ac09
	ld (ix+030h),0a0h		;ac0b   ; ...el dibujo 0xA0
L_AC0F:
	ld (ix+029h),000h		;ac0f   ; IX+29 = 0
	call 04f9bh		;ac13   ; el bit 3 de IX+10
	call 06872h		;ac16   ; sin velocidad
	jp L_AB1E		;ac19   ; la espera del disparo
L_AC1C:
	call L_AC5F		;ac1c   ; dispara
	bit 0,(ix+001h)		;ac1f   ; el paso 1: p12:AC3A
	jr nz,L_AC3A		;ac23
	call L_ACA2		;ac25   ; un objeto cerca?
	ret nc			;ac28
	inc (ix+001h)		;ac29   ; si: el paso 1...
	bit 0,(ix+019h)		;ac2c   ; ...-3 en x...
	ld de,0fd00h		;ac30
	jr z,L_AC37		;ac33
	ld d,003h		;ac35   ; ...o +3
L_AC37:
	jp 0685dh		;ac37   ; pon_ix09: IX+09/0A = DE
L_AC3A:
	bit 0,(ix+019h)		;ac3a   ; el paso 1: la aceleracion en x
	ld bc,00030h		;ac3e
	jr z,L_AC46		;ac41
	ld bc,0ffd0h		;ac43
L_AC46:
	ld a,(ix+006h)		;ac46   ; la x - la guardada...
	sub (ix+026h)		;ac49
	add a,002h		;ac4c
	cp 005h		;ac4e
	jp nc,06c01h		;ac50   ; ...lejos: vuelve (p01:6C01)
	ld a,(ix+026h)		;ac53   ; cerca: en su sitio...
	ld (ix+006h),a		;ac56
	dec (ix+001h)		;ac59   ; ...el paso 0...
	jp 0687ch		;ac5c   ; ...sin velocidad x
L_AC5F:
	call L_ABF6		;ac5f   ; el dibujo
	dec (ix+015h)		;ac62   ; la espera del disparo
	ret nz			;ac65
	call L_AB1E		;ac66
	ld a,(ix+029h)		;ac69   ; IX+29: una vez 3 de p12:ABB9...
	xor 001h		;ac6c
	ld (ix+029h),a		;ac6e
	ld b,003h		;ac71
	ld hl,0abb9h		;ac73
	jr z,L_AC7C		;ac76
	inc b			;ac78   ; ...otra 4 de p12:ABBE
	ld hl,0abbeh		;ac79
L_AC7C:
	push bc			;ac7c
	add a,(hl)			;ac7d   ; la direccion...
	bit 0,(ix+019h)		;ac7e   ; ...con IX+19 bit 0, al reves (0x18 - ella)
	jr z,L_AC8A		;ac82
	sub 018h		;ac84
	neg		;ac86
	and 00fh		;ac88
L_AC8A:
	inc hl			;ac8a
	push hl			;ac8b
	ld b,004h		;ac8c   ; rapidez 4
	call 04f1eh		;ac8e   ; la velocidad
	ex de,hl			;ac91
	ld c,e			;ac92
	ld b,d			;ac93
	ld e,(ix+004h)		;ac94   ; desde el enemigo
	ld d,(ix+006h)		;ac97
	call 074a2h		;ac9a   ; el disparo
	pop hl			;ac9d
	pop bc			;ac9e
	djnz L_AC7C		;ac9f   ; los B
	ret			;aca1
L_ACA2:
	ld b,005h		;aca2   ; los 5 objetos de 0xE470
	ld hl,0e470h		;aca4
	ld de,00048h		;aca7
L_ACAA:
	ld (ix+027h),l		;acaa   ; guardado en IX+27/28
	ld (ix+028h),h		;acad
	ld a,(hl)			;acb0   ; vivo?
	or a			;acb1
	jr z,L_ACCA		;acb2
	ld a,(ix+004h)		;acb4   ; la y del enemigo - la suya + 0x20...
	inc hl			;acb7
	inc hl			;acb8
	inc hl			;acb9
	sub (hl)			;acba
	add a,020h		;acbb
	jr nc,L_ACCA		;acbd   ; ...por encima: no
	ld a,(ix+006h)		;acbf   ; la x...
	inc hl			;acc2
	inc hl			;acc3
	sub (hl)			;acc4
	add a,010h		;acc5
	cp 018h		;acc7   ; ...a menos de 16: C
	ret c			;acc9
L_ACCA:
	ld l,(ix+027h)		;acca   ; el siguiente
	ld h,(ix+028h)		;accd
	add hl,de			;acd0
	djnz L_ACAA		;acd1
	ret			;acd3
L_ACD4:
	call 06877h		;acd4   ; el que anda por el suelo: sin velocidad y
	bit 0,(ix+019h)		;acd7   ; IX+19 bit 0: -2 en x...
	ld d,0feh		;acdb
	jr nz,L_ACE1		;acdd
	ld d,002h		;acdf   ; ...o +2
L_ACE1:
	ld (ix+025h),d		;ace1   ; en IX+25
	call 0685dh		;ace4   ; pon_ix09: IX+09/0A = DE
	ld a,(ix+004h)		;ace7   ; arriba (y < 0x60)...
	cp 060h		;acea
	ld a,001h		;acec   ; ...IX+29 = 1
	jr c,L_ACF1		;acee
	xor a			;acf0
L_ACF1:
	ld (ix+029h),a		;acf1   ; la aceleracion: 0x60...
	or a			;acf4
	ld hl,00060h		;acf5
	jr z,L_ACFD		;acf8
	ld hl,0ffa0h		;acfa   ; ...o -0x60 boca abajo
L_ACFD:
	ld (ix+027h),l		;acfd   ; en IX+27/28
	ld (ix+028h),h		;ad00
	jp 06bbeh		;ad03   ; la animacion
L_AD06:
	call L_AE05		;ad06   ; el dibujo
	ld a,(ix+001h)		;ad09   ; el paso, por la tabla de detras
	call 040ceh		;ad0c   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AD0F: 3 destinos del despachador p00:40CE (call en p12:AD0C, el
;   indice en A): AD15, AD7B, ADA5; lo leen p12:AD0C (6 bytes)
;   0xad0f..0xad15  (6 bytes)
DATA_tabla_AD0F:
	defw 0ad15h,0ad7bh,0ada5h	; ad0f  -> L_AD15 L_AD7B L_ADA5

; ======================================================================
; CODIGO 0xad15..0xae92  (381 bytes)
; ======================================================================


L_AD15:
	ld h,(ix+006h)		;ad15   ; el caracter de debajo...
	ld a,(ix+004h)		;ad18
	bit 0,(ix+029h)		;ad1b   ; ...boca abajo, el de encima
	jr z,L_AD23		;ad1f
	sub 018h		;ad21
L_AD23:
	add a,010h		;ad23
	ld l,a			;ad25
	call 07ed4h		;ad26   ; en el mapa
	jr c,L_AD37		;ad29   ; suelo: p12:AD37
	inc (ix+001h)		;ad2b   ; sin suelo: el paso siguiente...
	ld a,(ix+00ah)		;ad2e   ; ...a media velocidad
	sra a		;ad31
	ld (ix+00ah),a		;ad33
	ret			;ad36
L_AD37:
	ld hl,(0e6bch)		;ad37   ; la fila de encima (o la de debajo boca abajo)
	bit 0,(ix+029h)		;ad3a
	ld bc,0ffc0h		;ad3e
	jr z,L_AD46		;ad41
	ld bc,00040h		;ad43
L_AD46:
	add hl,bc			;ad46
	ld (0e6bch),hl		;ad47
	call 07edah		;ad4a   ; pared?
	jr c,L_AD56		;ad4d   ; si: p12:AD56
	dec (ix+002h)		;ad4f   ; la espera...
	ret nz			;ad52
	call 06bbeh		;ad53   ; ...acabada: la animacion
L_AD56:
	ld (ix+001h),002h		;ad56   ; el paso 2: salta
	ld (ix+015h),00dh		;ad5a   ; dispara en 13 cuadros
	ld a,(0e326h)		;ad5e   ; hacia el jugador 1 en x...
	cp (ix+006h)		;ad61
	ld de,00200h		;ad64   ; ...+2...
	jr nc,L_AD6B		;ad67
	ld d,0feh		;ad69   ; ...o -2
L_AD6B:
	call 0685dh		;ad6b   ; pon_ix09: IX+09/0A = DE
	bit 0,(ix+029h)		;ad6e   ; y en y: -5...
	ld d,0fbh		;ad72
	jr z,L_AD78		;ad74
	ld d,005h		;ad76   ; ...o +5 boca abajo
L_AD78:
	jp 06856h		;ad78   ; pon_ix07: IX+07/08 = DE
L_AD7B:
	dec (ix+002h)		;ad7b   ; la espera: acabada, la animacion
	jr nz,L_AD83		;ad7e
	call 06bbeh		;ad80
L_AD83:
	ld h,(ix+006h)		;ad83   ; el caracter de debajo
	ld a,(ix+004h)		;ad86
	bit 0,(ix+029h)		;ad89
	jr z,L_AD91		;ad8d
	sub 018h		;ad8f
L_AD91:
	add a,010h		;ad91
	ld l,a			;ad93
	call 07ed4h		;ad94   ; en el mapa
	ld a,(ix+025h)		;ad97   ; la velocidad x
	jr c,L_ADEC		;ad9a   ; suelo: p12:ADEC
L_AD9C:
	ld c,(ix+027h)		;ad9c   ; en el aire: cae (IX+27/28)
	ld b,(ix+028h)		;ad9f
	jp 06bf3h		;ada2
L_ADA5:
	dec (ix+015h)		;ada5   ; la espera del disparo...
	jr nz,L_ADB3		;ada8
	ld e,(ix+004h)		;adaa   ; ...acabada: dispara
	ld d,(ix+006h)		;adad
	call 074c5h		;adb0
L_ADB3:
	ld a,(ix+008h)		;adb3   ; subiendo?
	rla			;adb6
	rla			;adb7
	xor (ix+029h)		;adb8
	rra			;adbb
	jr c,L_AD9C		;adbc   ; si: sigue
	ld h,(ix+006h)		;adbe   ; bajando: el caracter de debajo
	ld a,(ix+004h)		;adc1
	bit 0,(ix+029h)		;adc4
	jr z,L_ADCC		;adc8
	sub 018h		;adca
L_ADCC:
	add a,010h		;adcc
	ld l,a			;adce
	call 07ed4h		;adcf   ; en el suelo?
	jr nc,L_AD9C		;add2   ; no: sigue cayendo
	ld e,(ix+004h)		;add4   ; al llegar, dispara...
	ld d,(ix+006h)		;add7
	call 074c5h		;adda
	ld a,(0e326h)		;addd   ; ...y anda hacia el jugador...
	cp (ix+006h)		;ade0
	ld a,002h		;ade3   ; ...+2...
	jr nc,L_ADE9		;ade5
	ld a,0feh		;ade7   ; ...o -2
L_ADE9:
	ld (ix+025h),a		;ade9
L_ADEC:
	ld (ix+00ah),a		;adec   ; la velocidad x
	call 06877h		;adef   ; sin velocidad y
	ld (ix+001h),000h		;adf2   ; el paso 0
	bit 0,(ix+029h)		;adf6
	ld a,(ix+004h)		;adfa
	jr z,L_ADFF		;adfd
L_ADFF:
	and 0f8h		;adff   ; la y en su fila
	ld (ix+004h),a		;ae01
	ret			;ae04
L_AE05:
	ld a,(0e203h)		;ae05   ; el dibujo: 0xE0 + la cuenta & 0x0C
	and 00ch		;ae08
	add a,0e0h		;ae0a
	ld (ix+030h),a		;ae0c
	ret			;ae0f
L_AE10:
	ld (ix+004h),098h		;ae10   ; el nuevo: la y 0x98
	ld hl,0e203h		;ae14   ; en los cuadros pares por la izquierda (0x30)...
	bit 0,(hl)		;ae17
	ld a,030h		;ae19
	jr z,L_AE1F		;ae1b
	ld a,0e0h		;ae1d   ; ...en los impares por la derecha (0xE0)
L_AE1F:
	ld (ix+006h),a		;ae1f   ; la x
	call 0687ch		;ae22   ; sin velocidad x
	ld d,0feh		;ae25   ; -2 en y
	call 06856h		;ae27   ; pon_ix07: IX+07/08 = DE
	bit 7,(ix+006h)		;ae2a   ; la x de 0x80 en adelante...
	ld a,001h		;ae2e   ; ...IX+19 = 0, si no 1
	jr z,L_AE33		;ae30
	xor a			;ae32
L_AE33:
	ld (ix+019h),a		;ae33
	ld l,(ix+004h)		;ae36   ; su posicion
	ld a,(ix+006h)		;ae39
	bit 0,(ix+019h)		;ae3c   ; con IX+19, 0x18 menos
	jr z,L_AE44		;ae40
	sub 018h		;ae42
L_AE44:
	add a,010h		;ae44   ; + 0x10
	ld h,a			;ae46
	call 07ebfh		;ae47   ; en el mapa
L_AE4A:
	ld hl,(0e6bch)		;ae4a   ; un caracter al lado
	bit 0,(ix+019h)		;ae4d
	dec hl			;ae51
	jr z,L_AE56		;ae52
	inc hl			;ae54
	inc hl			;ae55
L_AE56:
	ld (0e6bch),hl		;ae56
	call 07ec5h		;ae59   ; suelo?
	jr nc,L_AE77		;ae5c   ; si: p12:AE77
	bit 0,(ix+019h)		;ae5e   ; no: se corre 8...
	ld a,0f8h		;ae62
	jr z,L_AE68		;ae64   ; ...a un lado o al otro
	ld a,008h		;ae66
L_AE68:
	add a,(ix+006h)		;ae68   ; la x nueva
	ld (ix+006h),a		;ae6b
	sub 030h		;ae6e   ; sin salirse...
	cp 0a0h		;ae70
	jr c,L_AE4A		;ae72
	jp 06b62h		;ae74   ; ...si no, fuera
L_AE77:
	call L_AF85		;ae77   ; la espera del disparo
L_AE7A:
	ld a,r		;ae7a   ; de 0x1E a 0x3D cuadros al azar
	and 01fh		;ae7c
	add a,01eh		;ae7e
	ld (ix+002h),a		;ae80
	ret			;ae83
L_AE84:
	ld a,(ix+006h)		;ae84   ; de 0xF8 en adelante: fuera
	cp 0f8h		;ae87
	jp nc,06b62h		;ae89
	ld a,(ix+001h)		;ae8c   ; el paso, por la tabla de detras
	call 040ceh		;ae8f   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AE92: 4 destinos del despachador p00:40CE (call en p12:AE8F, el
;   indice en A): AE9A, AF0F, AF44, AF64; lo leen p12:AE8F (8 bytes)
;   0xae92..0xae9a  (8 bytes)
DATA_tabla_AE92:
	defw 0ae9ah,0af0fh,0af44h,0af64h	; ae92  -> L_AE9A L_AF0F L_AF44 L_AF64

; ======================================================================
; CODIGO 0xae9a..0xafec  (338 bytes)
; ======================================================================


L_AE9A:
	call L_AFD0		;ae9a   ; el dibujo
	ld l,(ix+004h)		;ae9d   ; su posicion
	ld a,(ix+006h)		;aea0
	bit 0,(ix+019h)		;aea3
	jr z,L_AEAB		;aea7
	sub 018h		;aea9
L_AEAB:
	add a,010h		;aeab
	ld h,a			;aead
	call 07ebfh		;aeae   ; en el mapa
	jr c,L_AEC9		;aeb1   ; suelo: p12:AEC9
	ld (ix+001h),002h		;aeb3   ; sin suelo: el paso 2...
	bit 0,(ix+019h)		;aeb7   ; ...8 a un lado...
	ld a,008h		;aebb
	jr z,L_AEC1		;aebd
	ld a,0f8h		;aebf   ; ...o -8
L_AEC1:
	ld (ix+027h),a		;aec1   ; en IX+27
	ld (ix+010h),011h		;aec4   ; los bits de IX+10
	ret			;aec8
L_AEC9:
	ld hl,(0e6bch)		;aec9   ; el caracter de al lado
	bit 0,(ix+019h)		;aecc
	dec hl			;aed0
	jr z,L_AED5		;aed1
	inc hl			;aed3
	inc hl			;aed4
L_AED5:
	ld (0e6bch),hl		;aed5
	call 07ec5h		;aed8   ; pared?
	jr nc,L_AEF6		;aedb   ; no: p12:AEF6
	inc (ix+001h)		;aedd   ; si: el paso siguiente...
	ld (ix+028h),002h		;aee0   ; ...2 cuadros...
	ld (ix+010h),00bh		;aee4
	bit 0,(ix+019h)		;aee8   ; ...-4 o +4
	ld a,0fch		;aeec
	jr z,L_AEF2		;aeee
	ld a,004h		;aef0
L_AEF2:
	ld (ix+027h),a		;aef2
	ret			;aef5
L_AEF6:
	dec (ix+002h)		;aef6   ; la espera...
	ret nz			;aef9
	ld (ix+001h),003h		;aefa   ; ...acabada: el paso 3, 0x28 cuadros
	ld (ix+002h),028h		;aefe
	call L_AFF4		;af02   ; mira al jugador
	call L_AF85		;af05   ; la espera del disparo
	ld (ix+010h),00bh		;af08   ; los bits de IX+10
	jp 06877h		;af0c   ; sin velocidad y
L_AF0F:
	call L_AFD0		;af0f   ; el dibujo
	ld a,(ix+006h)		;af12   ; la x + IX+27
	add a,(ix+027h)		;af15
	ld (ix+006h),a		;af18
	dec (ix+028h)		;af1b   ; cada 2 cuadros...
	ret nz			;af1e
	ld (ix+028h),002h		;af1f
	ld l,(ix+004h)		;af23   ; ...el caracter de debajo...
	bit 0,(ix+019h)		;af26
	jr nz,L_AF2E		;af2a
	add a,008h		;af2c
L_AF2E:
	ld h,a			;af2e
	call 07ebfh		;af2f   ; ...en el mapa
	ret c			;af32   ; suelo: sigue
L_AF33:
	ld (ix+010h),007h		;af33   ; si no: los bits de IX+10...
	ld (ix+001h),000h		;af37   ; ...el paso 0...
	ld a,(ix+006h)		;af3b   ; ...y la x en su columna
	and 0f8h		;af3e
	ld (ix+006h),a		;af40
	ret			;af43
L_AF44:
	ld a,(ix+006h)		;af44   ; la x + IX+27
	add a,(ix+027h)		;af47
	ld (ix+006h),a		;af4a
	ld l,(ix+004h)		;af4d   ; el caracter de al lado
	ld a,(ix+006h)		;af50
	bit 0,(ix+019h)		;af53
	jr z,L_AF5B		;af57
	sub 018h		;af59
L_AF5B:
	add a,010h		;af5b
	ld h,a			;af5d
	call 07ebfh		;af5e   ; en el mapa
	jr c,L_AF33		;af61   ; pared: el paso 0
	ret			;af63
L_AF64:
	dec (ix+002h)		;af64   ; la espera: si no, p12:AF90
	jp nz,L_AF90		;af67
	ld a,(0e324h)		;af6a   ; hacia el jugador 1 en y: +2...
	cp (ix+004h)		;af6d
	ld de,00200h		;af70
	jr nc,L_AF77		;af73
	ld d,0feh		;af75   ; ...o -2
L_AF77:
	call 06856h		;af77   ; pon_ix07: IX+07/08 = DE
	ld (ix+010h),007h		;af7a   ; los bits de IX+10
	ld (ix+001h),000h		;af7e   ; el paso 0
	jp L_AE7A		;af82   ; y otra espera
L_AF85:
	ld a,(0e64fh)		;af85   ; la espera del disparo: 0x20 - la dificultad
	sub 020h		;af88
	neg		;af8a
	ld (ix+015h),a		;af8c
	ret			;af8f
L_AF90:
	dec (ix+015h)		;af90   ; la espera del disparo...
	ret nz			;af93
	call L_AF85		;af94   ; ...acabada: otra
	call L_AFF4		;af97   ; mira al jugador
	bit 0,(ix+019h)		;af9a   ; el jugador 1 delante?
	jr nz,L_AFA9		;af9e
	ld a,(0e326h)		;afa0
	cp (ix+006h)		;afa3
	ret nc			;afa6   ; no: nada
	jr L_AFB0		;afa7
L_AFA9:
	ld a,(0e326h)		;afa9
	cp (ix+006h)		;afac
	ret c			;afaf
L_AFB0:
	ld e,(ix+004h)		;afb0   ; la direccion al jugador
	ld d,(ix+006h)		;afb3
	call 07594h		;afb6
	ld a,(0f018h)		;afb9   ; su angulo...
	cp 080h		;afbc
	jr c,L_AFC2		;afbe   ; ...plegado...
	neg		;afc0
L_AFC2:
	cp 040h		;afc2
	jr c,L_AFC8		;afc4
	sub 040h		;afc6
L_AFC8:
	sub 008h		;afc8   ; ...dentro del angulo?
	cp 030h		;afca
	ret nc			;afcc
	jp 081d2h		;afcd   ; si: dispara
L_AFD0:
	ld a,(ix+008h)		;afd0   ; la animacion: subiendo o bajando...
	or a			;afd3
	ld hl,0afech		;afd4   ; ...de p12:AFEC...
	jp p,L_AFDC		;afd7
	inc hl			;afda
	inc hl			;afdb
L_AFDC:
	bit 0,(ix+019h)		;afdc   ; ...y por el lado
	jr nz,L_AFE6		;afe0
	ld bc,00004h		;afe2
	add hl,bc			;afe5
L_AFE6:
	ld bc,00302h		;afe6   ; cada 4 cuadros, de 2
	jp 06591h		;afe9   ; anima_c: cada (B+1) cuadros avanza IX+26 de 0 a C-1

; ----------------------------------------------------------------------
; DATOS resto_AFEC: lo apuntan con el banco puesto p12:AFD4 (0xAFEC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:AFD4 (8 bytes)
;   0xafec..0xaff4  (8 bytes)
DATA_resto_AFEC:
	defb 0d0h,0d4h,0dch,0e0h,0e8h,0ech,0f4h,0f8h	; afec  ........

; ======================================================================
; CODIGO 0xaff4..0xb1c6  (466 bytes)
; ======================================================================


L_AFF4:
	bit 0,(ix+019h)		;aff4   ; el dibujo segun la y del jugador: por un lado 0xF0 o 0xFC...
	jr nz,L_B00A		;aff8
	ld b,0f0h		;affa
	ld a,(0e324h)		;affc
	cp (ix+004h)		;afff
	jr nc,L_B006		;b002
	ld b,0fch		;b004
L_B006:
	ld (ix+030h),b		;b006
	ret			;b009
L_B00A:
	ld b,0d8h		;b00a   ; ...por el otro 0xD8 o 0xE4
	ld a,(0e324h)		;b00c
	cp (ix+004h)		;b00f
	jr nc,L_B016		;b012
	ld b,0e4h		;b014
L_B016:
	ld (ix+030h),b		;b016
	ret			;b019
L_B01A:
	ld a,(ix+004h)		;b01a   ; arriba (y < 0x60): 0 y 0xD0...
	cp 060h		;b01d
	ld bc,000d0h		;b01f
	jr c,L_B027		;b022
	ld bc,001dch		;b024   ; ...abajo 1 y 0xDC
L_B027:
	ld (ix+027h),b		;b027   ; en IX+27 y el dibujo
	ld (ix+030h),c		;b02a
	ld (ix+025h),00ah		;b02d   ; la direccion 10
	call 06877h		;b031   ; sin velocidad y
	ld de,00200h		;b034   ; 2 en x
	call 0685dh		;b037   ; pon_ix09: IX+09/0A = DE
L_B03A:
	ld a,r		;b03a   ; la espera: de 0x2D a 0x4C al azar
	and 01fh		;b03c
	add a,02dh		;b03e
	ld (ix+002h),a		;b040
	ret			;b043
L_B044:
	call L_B1F4		;b044   ; en la fase 7, sobre los caracteres 0x9A-0x9B?
	jp c,08c9ch		;b047   ; si: p02:8C9C
	call L_B226		;b04a   ; en el decorado?
	jp c,06b62h		;b04d   ; si: fuera
	ld a,(ix+001h)		;b050   ; el paso: 1...
	dec a			;b053
	jr z,L_B08E		;b054
	jp p,L_B0C0		;b056   ; ...2 o mas: p12:B0C0
	call 06587h		;b059   ; 0: cada 32 cuadros...
	jr z,L_B080		;b05c   ; ...el paso 2
	dec (ix+002h)		;b05e   ; la espera
	jr z,L_B069		;b061   ; acabada: p12:B069
	call L_B0C9		;b063   ; se pega al suelo
	jp L_B1AA		;b066   ; y la animacion
L_B069:
	inc (ix+001h)		;b069   ; el paso 1, 0x5A cuadros
	ld (ix+002h),05ah		;b06c
	call L_B1CE		;b070   ; mira al jugador
	call L_B0C5		;b073   ; se pega con 0xE666 = 1
	call L_B15E		;b076   ; la espera del disparo
	ld (ix+010h),00bh		;b079   ; los bits de IX+10
	jp 0687ch		;b07d
L_B080:
	ld (ix+010h),007h		;b080   ; el paso 2: se va
	ld (ix+001h),002h		;b084
	ld de,0fe00h		;b088   ; -2 en x
	jp 0685dh		;b08b   ; pon_ix09: IX+09/0A = DE
L_B08E:
	call 06587h		;b08e   ; 1: cada 32 cuadros...
	jr z,L_B080		;b091   ; ...se va
	dec (ix+002h)		;b093   ; la espera
	jr z,L_B0A4		;b096   ; acabada: p12:B0A4
	call L_B16A		;b098   ; dispara
	ld a,(0e301h)		;b09b   ; en la fase 7...
	cp 007h		;b09e
	ret nz			;b0a0
	jp L_B0C9		;b0a1   ; ...se pega
L_B0A4:
	ld a,(0e326h)		;b0a4   ; hacia el jugador 1 en x: +2...
	cp (ix+006h)		;b0a7
	ld de,00200h		;b0aa
	jr nc,L_B0B2		;b0ad
	ld de,0fe00h		;b0af   ; ...o -2
L_B0B2:
	call 0685dh		;b0b2   ; pon_ix09: IX+09/0A = DE
L_B0B5:
	ld (ix+010h),007h		;b0b5   ; los bits de IX+10...
	ld (ix+001h),000h		;b0b9   ; ...el paso 0...
	jp L_B03A		;b0bd   ; ...y la espera
L_B0C0:
	call L_B1AA		;b0c0   ; la animacion
	jr L_B0C9		;b0c3
L_B0C5:
	ld a,001h		;b0c5   ; 0xE666 = 1: baja hasta el suelo...
	jr L_B0CA		;b0c7
L_B0C9:
	xor a			;b0c9   ; ...0: un paso
L_B0CA:
	ld (0e666h),a		;b0ca
	ld a,(ix+004h)		;b0cd   ; la y guardada
	ld (ix+028h),a		;b0d0
	bit 0,(ix+027h)		;b0d3   ; IX+27 bit 0: boca abajo
	jr z,L_B122		;b0d7
L_B0D9:
	ld h,(ix+006h)		;b0d9   ; boca abajo: el caracter de encima
	ld a,(ix+004h)		;b0dc
	add a,010h		;b0df
	ld l,a			;b0e1
	call 07ed4h		;b0e2
	jr nc,L_B110		;b0e5   ; libre: p12:B110
L_B0E7:
	ld hl,(0e6bch)		;b0e7   ; la fila de encima
	ld bc,0ffc0h		;b0ea
	add hl,bc			;b0ed
	ld (0e6bch),hl		;b0ee
	call 07edah		;b0f1   ; pared?
	ret nc			;b0f4
	ld a,(ix+004h)		;b0f5   ; si: 8 mas arriba...
	sub 008h		;b0f8
	ld (ix+004h),a		;b0fa
	cp 010h		;b0fd   ; ...hasta 0x10
	jr nc,L_B0E7		;b0ff
L_B101:
	call 06561h		;b101   ; sin sitio: la velocidad al reves...
	ld (ix+025h),005h		;b104   ; ...la direccion 5...
	ld a,(ix+028h)		;b108   ; ...la y de antes...
	ld (ix+004h),a		;b10b
	jr L_B0B5		;b10e   ; ...y el paso 0
L_B110:
	ld a,(ix+004h)		;b110   ; libre: 8 mas abajo...
	cp 090h		;b113   ; ...hasta 0x90
	ret nc			;b115
	add a,008h		;b116
	ld (ix+004h),a		;b118
	ld a,(0e666h)		;b11b   ; con 0xE666, hasta el suelo
	or a			;b11e
	jr nz,L_B0D9		;b11f
	ret			;b121
L_B122:
	ld h,(ix+006h)		;b122   ; el caracter de debajo
	ld l,(ix+004h)		;b125
	call 07ed4h		;b128
	jr nc,L_B13B		;b12b   ; libre: p12:B13B
	ld a,(ix+004h)		;b12d   ; 8 mas abajo...
	add a,008h		;b130
	ld (ix+004h),a		;b132
	cp 080h		;b135   ; ...hasta 0x80...
	jr c,L_B122		;b137
	jr L_B101		;b139   ; ...si no, sin sitio
L_B13B:
	ld hl,(0e6bch)		;b13b   ; la fila de encima
	ld bc,0ffc0h		;b13e
	add hl,bc			;b141
	ld (0e6bch),hl		;b142
	call 07edah		;b145   ; pared?
	ret c			;b148   ; si: ya
	ld a,(ix+004h)		;b149   ; la y de 9 en adelante...
	cp 009h		;b14c
	ret c			;b14e
	ld a,(ix+004h)		;b14f   ; ...8 mas arriba
	sub 008h		;b152
	ld (ix+004h),a		;b154
	ld a,(0e666h)		;b157   ; con 0xE666, hasta arriba
	or a			;b15a
	jr nz,L_B13B		;b15b
	ret			;b15d
L_B15E:
	ld a,(0e64fh)		;b15e   ; la espera del disparo: 0x3C - la dificultad x 2
	add a,a			;b161
	sub 03ch		;b162
	neg		;b164
	ld (ix+015h),a		;b166
	ret			;b169
L_B16A:
	dec (ix+015h)		;b16a   ; la espera del disparo...
	ret nz			;b16d
	call L_B15E		;b16e   ; ...acabada: otra...
	call L_B1CE		;b171   ; ...y mira al jugador
	bit 0,(ix+027h)		;b174   ; boca abajo: el jugador por debajo?
	jr z,L_B183		;b178
	ld a,(0e324h)		;b17a
	cp (ix+004h)		;b17d
	ret nc			;b180
	jr L_B18A		;b181
L_B183:
	ld a,(0e324h)		;b183   ; el jugador por encima?
	cp (ix+004h)		;b186
	ret c			;b189
L_B18A:
	ld e,(ix+004h)		;b18a   ; la direccion al jugador
	ld d,(ix+006h)		;b18d
	call 07594h		;b190
	ld a,(0f018h)		;b193   ; su angulo plegado...
	cp 080h		;b196
	jr c,L_B19C		;b198
	neg		;b19a
L_B19C:
	cp 040h		;b19c
	jr c,L_B1A2		;b19e
	sub 040h		;b1a0
L_B1A2:
	sub 008h		;b1a2   ; ...dentro del angulo?
	cp 030h		;b1a4
	ret nc			;b1a6
	jp 081d2h		;b1a7   ; si: dispara
L_B1AA:
	ld a,(ix+00ah)		;b1aa   ; la animacion: por la velocidad x...
	or a			;b1ad
	ld hl,0b1c6h		;b1ae   ; ...de p12:B1C6...
	jp p,L_B1B6		;b1b1
	inc hl			;b1b4
	inc hl			;b1b5
L_B1B6:
	bit 0,(ix+027h)		;b1b6   ; ...y boca abajo, 4 mas
	jr z,L_B1C0		;b1ba
	ld bc,00004h		;b1bc
	add hl,bc			;b1bf
L_B1C0:
	ld bc,00302h		;b1c0   ; cada 4 cuadros, de 2
	jp 06591h		;b1c3   ; anima_c: cada (B+1) cuadros avanza IX+26 de 0 a C-1

; ----------------------------------------------------------------------
; DATOS resto_B1C6: lo apuntan con el banco puesto p12:B1AE (0xB1C6); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B1AE (8 bytes)
;   0xb1c6..0xb1ce  (8 bytes)
DATA_resto_B1C6:
	defb 0e8h,0ech,0d0h,0d4h,0f4h,0f8h,0dch,0e0h	; b1c6  ........

; ======================================================================
; CODIGO 0xb1ce..0xb280  (178 bytes)
; ======================================================================


L_B1CE:
	bit 0,(ix+027h)		;b1ce   ; el dibujo: boca abajo 0xFC o 0xE4...
	jr z,L_B1E4		;b1d2
	ld b,0fch		;b1d4
	ld a,(0e326h)		;b1d6
	cp (ix+006h)		;b1d9
	jr nc,L_B1E0		;b1dc
	ld b,0e4h		;b1de
L_B1E0:
	ld (ix+030h),b		;b1e0
	ret			;b1e3
L_B1E4:
	ld b,0f0h		;b1e4   ; ...si no 0xF0 o 0xD8, segun la x del jugador
	ld a,(0e326h)		;b1e6
	cp (ix+006h)		;b1e9
	jr nc,L_B1F0		;b1ec
	ld b,0d8h		;b1ee
L_B1F0:
	ld (ix+030h),b		;b1f0
	ret			;b1f3
L_B1F4:
	ld a,(0e301h)		;b1f4   ; solo en la fase 7: sobre 0x9A-0x9B?
	sub 007h		;b1f7
	cp 001h		;b1f9
	ret nc			;b1fb
	ld l,(ix+004h)		;b1fc   ; su posicion...
	ld h,(ix+006h)		;b1ff
	call 05a99h		;b202   ; ...en el mapa...
	ld (0f000h),hl		;b205   ; ...guardada en 0xF000 y 0xF002
	ld (0f002h),hl		;b208
	ld de,0029ah		;b20b   ; los caracteres 0x9A a 0x9B
	ld bc,00040h		;b20e   ; dos filas
	call L_B21D		;b211   ; el de la columna
	ret c			;b214   ; encima: C
	ld hl,(0f000h)		;b215   ; el de al lado...
	ld a,l			;b218   ; ...en el borde de 32 no
	and 01fh		;b219
	ret z			;b21b
	inc hl			;b21c
L_B21D:
	ld a,(hl)			;b21d   ; el caracter - 0x9A...
	sub e			;b21e
	cp d			;b21f   ; ...menos de 2?
	ret nc			;b220
	add hl,bc			;b221   ; la fila de abajo
	ld a,(hl)			;b222
	sub e			;b223
	cp d			;b224
	ret			;b225
L_B226:
	ld a,(0e301h)		;b226   ; solo en la fase 7...
	sub 007h		;b229
	cp 001h		;b22b
	ret nc			;b22d
	ld a,(0e627h)		;b22e   ; ...con el recorrido parado
	or a			;b231
	ret nz			;b232
	ld a,(0e605h)		;b233   ; el primer caracter del decorado
	ld c,a			;b236
	ld hl,(0f002h)		;b237   ; la posicion guardada
	call L_B24C		;b23a   ; en el decorado?
	ret nc			;b23d
	inc hl			;b23e   ; el de al lado
	call L_B24C		;b23f
	ret nc			;b242
	ld de,0003fh		;b243   ; la fila de abajo
	add hl,de			;b246
	call L_B24C		;b247   ; y su vecino
	ret nc			;b24a
	inc hl			;b24b
L_B24C:
	ld a,(hl)			;b24c   ; C si el caracter es del decorado (de C en adelante)
	cp c			;b24d
	ccf			;b24e
	ret			;b24f
L_B250:
	call 06bcdh		;b250   ; la animacion desde el principio
	ld (ix+002h),028h		;b253   ; 0x28 cuadros
	ld a,(ix+006h)		;b257   ; la x - 0x50 en IX+25
	sub 050h		;b25a
	ld (ix+025h),a		;b25c
	ld a,(ix+004h)		;b25f   ; la y...
	bit 0,(ix+019h)		;b262   ; ...IX+19: + 0xD0...
	ld b,0d0h		;b266
	jr z,L_B26C		;b268
	ld b,030h		;b26a   ; ...o + 0x30
L_B26C:
	add a,b			;b26c
	ld (ix+027h),a		;b26d   ; en IX+27
	ld a,(ix+019h)		;b270   ; por IX+19...
	ld hl,0b280h		;b273   ; ...la velocidad de p12:B280
	call 04e28h		;b276   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld l,000h		;b279
	ld h,e			;b27b
	ld e,l			;b27c
	jp 06881h		;b27d   ; a IX+07/09

; ----------------------------------------------------------------------
; DATOS resto_B280: lo apuntan con el banco puesto p12:B273 (0xB280); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B273 (4 bytes)
;   0xb280..0xb284  (4 bytes)
DATA_resto_B280:
	defb 0fdh,0ffh,003h,0ffh	; b280

; ======================================================================
; CODIGO 0xb284..0xb318  (148 bytes)
; ======================================================================


L_B284:
	call L_B312		;b284   ; el dibujo
	call 07626h		;b287   ; dispara
	ld a,(ix+001h)		;b28a   ; el paso: 1...
	dec a			;b28d
	jr z,L_B2AF		;b28e
	dec a			;b290   ; ...2: nada
	ret z			;b291
	dec (ix+006h)		;b292   ; 0: la x - 1
	call L_B2DE		;b295   ; se curva
	call L_B301		;b298   ; y el dibujo
	dec (ix+002h)		;b29b   ; la espera...
	ret nz			;b29e
	ld (ix+002h),014h		;b29f   ; ...acabada: 0x14 cuadros...
	inc (ix+001h)		;b2a3   ; ...el paso siguiente...
	ld e,(ix+004h)		;b2a6   ; ...y un disparo al jugador
	ld d,(ix+006h)		;b2a9
	jp 074c5h		;b2ac
L_B2AF:
	dec (ix+006h)		;b2af   ; 1: la x - 1
	bit 0,(ix+019h)		;b2b2   ; la velocidad y + 0x10...
	ld bc,00010h		;b2b6
	jr nz,L_B2BE		;b2b9
	dec b			;b2bb   ; ...o - 0x10
	ld c,0f0h		;b2bc
L_B2BE:
	call 06bf3h		;b2be
	ld bc,0004dh		;b2c1   ; la x + 0x4D
	call 06c01h		;b2c4
	dec (ix+002h)		;b2c7   ; la espera
	ret nz			;b2ca
	inc (ix+001h)		;b2cb   ; acabada: el paso siguiente
	xor a			;b2ce   ; las partes bajas a 0
	ld (ix+003h),a		;b2cf
	ld (ix+005h),a		;b2d2
	call 06877h		;b2d5   ; sin velocidad y
	ld de,00600h		;b2d8   ; 6 en x
	jp 0685dh		;b2db   ; pon_ix09: IX+09/0A = DE
L_B2DE:
	bit 0,(ix+019h)		;b2de   ; la curva: IX+19...
	ld a,(ix+004h)		;b2e2
	ld b,000h		;b2e5
	jr nz,L_B2F4		;b2e7
	cp (ix+027h)		;b2e9   ; ...antes de IX+27: + 0x4D...
	ld c,04dh		;b2ec
	jr c,L_B2FE		;b2ee
	ld c,0c0h		;b2f0   ; ...despues: - 0x40
	jr L_B2FD		;b2f2
L_B2F4:
	cp (ix+027h)		;b2f4   ; por el otro lado: + 0x40...
	ld c,040h		;b2f7
	jr c,L_B2FE		;b2f9
	ld c,0b3h		;b2fb   ; ...o - 0x4D
L_B2FD:
	dec b			;b2fd
L_B2FE:
	jp 06bf3h		;b2fe   ; a la velocidad y
L_B301:
	ld a,(ix+006h)		;b301   ; la curva en x: antes de IX+25, - 0x37...
	cp (ix+025h)		;b304
	ld bc,0ffc9h		;b307
	jr nc,L_B30F		;b30a
	ld bc,00040h		;b30c   ; ...despues, + 0x40
L_B30F:
	jp 06c01h		;b30f   ; a la velocidad x
L_B312:
	ld hl,0b318h		;b312   ; la animacion de p12:B318
	jp 06bd5h		;b315   ; anima_6: cada 4 cuadros avanza IX+26 de 0 a 5 y pone el dibujo de la tabla HL

; ----------------------------------------------------------------------
; DATOS resto_B318: lo apuntan con el banco puesto p12:B312 (0xB318); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B312 (6 bytes)
;   0xb318..0xb31e  (6 bytes)
DATA_resto_B318:
	defb 060h,064h,068h,06ch,068h,064h	; b318

; ======================================================================
; CODIGO 0xb31e..0xb367  (73 bytes)
; ======================================================================


L_B31E:
	call 06bcdh		;b31e   ; la animacion desde el principio
	ld a,(ix+004h)		;b321   ; arriba (y < 0x54)...
	cp 054h		;b324
	ld a,001h		;b326   ; ...IX+29 = 1
	jr c,L_B32B		;b328
	xor a			;b32a
L_B32B:
	ld (ix+029h),a		;b32b
	ld a,(ix+029h)		;b32e   ; la aceleracion: 0x40...
	or a			;b331
	ld hl,00040h		;b332
	jr z,L_B33A		;b335
	ld l,0c0h		;b337   ; ...o -0x40
	dec h			;b339
L_B33A:
	ld (ix+027h),l		;b33a   ; en IX+27/28
	ld (ix+028h),h		;b33d
	call 06877h		;b340   ; sin velocidad y
	bit 0,(ix+019h)		;b343   ; IX+19 bit 0: -2 en x, 0x40 cuadros...
	ld d,0feh		;b347
	ld a,040h		;b349
	jr z,L_B355		;b34b
	ld (ix+001h),001h		;b34d   ; ...o el paso 1, +2 y 0x20
	ld d,002h		;b351
	ld a,020h		;b353
L_B355:
	ld (ix+002h),a		;b355   ; la espera
	ld (ix+025h),d		;b358   ; la x en IX+25
	jp 0685dh		;b35b   ; a IX+09
L_B35E:
	call L_B461		;b35e   ; la animacion
	ld a,(ix+001h)		;b361   ; el paso, por la tabla de detras
	call 040ceh		;b364   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B367: 5 destinos del despachador p00:40CE (call en p12:B364, el
;   indice en A): B371, B383, B3F1, B3F1, B426; lo leen p12:B364 (10 bytes)
;   0xb367..0xb371  (10 bytes)
DATA_tabla_B367:
	defw 0b371h,0b383h,0b3f1h,0b3f1h,0b426h	; b367

; ======================================================================
; CODIGO 0xb371..0xb470  (255 bytes)
; ======================================================================


L_B371:
	dec (ix+002h)		;b371   ; la espera...
	jr nz,L_B3B0		;b374
	call 06bbeh		;b376   ; ...acabada: la animacion...
	ld (ix+00ah),002h		;b379   ; ...+2 en x
	ld (ix+025h),002h		;b37d
	jr L_B3B0		;b381
L_B383:
	dec (ix+002h)		;b383   ; la espera
	jr nz,L_B3B0		;b386
	set 3,(ix+010h)		;b388   ; los bits de IX+10
	call 06bbeh		;b38c
	ld (ix+001h),004h		;b38f   ; el paso 4
	ld a,(0e326h)		;b393   ; hacia el jugador 1 en x: +2...
	cp (ix+006h)		;b396
	ld de,00200h		;b399
	jr nc,L_B3A0		;b39c
	ld d,0feh		;b39e   ; ...o -2
L_B3A0:
	call 0685dh		;b3a0   ; pon_ix09: IX+09/0A = DE
	bit 0,(ix+029h)		;b3a3   ; y en y: -4...
	ld d,0fch		;b3a7
	jr z,L_B3AD		;b3a9
	ld d,004h		;b3ab   ; ...o +4 boca abajo
L_B3AD:
	jp 06856h		;b3ad   ; pon_ix07: IX+07/08 = DE
L_B3B0:
	ld h,(ix+006h)		;b3b0   ; el caracter de debajo (o encima)
	ld a,(ix+004h)		;b3b3
	bit 0,(ix+029h)		;b3b6
	jr nz,L_B3BE		;b3ba
	add a,008h		;b3bc
L_B3BE:
	ld l,a			;b3be
	call 07ed4h		;b3bf   ; en el mapa
	jr nc,L_B3D5		;b3c2   ; libre: p12:B3D5
	bit 0,(ix+029h)		;b3c4   ; suelo: 8 mas arriba...
	ld a,0f8h		;b3c8
	jr z,L_B3CE		;b3ca
	ld a,008h		;b3cc   ; ...o mas abajo
L_B3CE:
	add a,(ix+004h)		;b3ce
	ld (ix+004h),a		;b3d1
	ret			;b3d4
L_B3D5:
	ld hl,(0e6bch)		;b3d5   ; la fila siguiente
	bit 0,(ix+029h)		;b3d8
	ld bc,00040h		;b3dc
	jr z,L_B3E4		;b3df
	ld bc,0ffc0h		;b3e1
L_B3E4:
	add hl,bc			;b3e4
	ld (0e6bch),hl		;b3e5
	call 07edah		;b3e8   ; pared?
	ret c			;b3eb
	ld (ix+001h),003h		;b3ec   ; no: el paso 3
	ret			;b3f0
L_B3F1:
	dec (ix+002h)		;b3f1   ; la espera...
	jr nz,L_B407		;b3f4
	call 06bbeh		;b3f6   ; ...acabada: la animacion...
	bit 7,(ix+025h)		;b3f9   ; ...y si iba al reves...
	jr z,L_B407		;b3fd
	ld (ix+00ah),002h		;b3ff   ; ...+2 en x
	ld (ix+025h),002h		;b403
L_B407:
	ld h,(ix+006h)		;b407   ; el caracter de debajo
	ld a,(ix+004h)		;b40a
	bit 0,(ix+029h)		;b40d
	jr z,L_B415		;b411
	sub 018h		;b413
L_B415:
	add a,010h		;b415
	ld l,a			;b417
	call 07ed4h		;b418   ; en el mapa
	jr c,L_B447		;b41b   ; suelo: p12:B447
L_B41D:
	ld c,(ix+027h)		;b41d   ; en el aire: la aceleracion (IX+27/28)
	ld b,(ix+028h)		;b420
	jp 06bf3h		;b423
L_B426:
	ld a,(ix+00ah)		;b426   ; subiendo?
	rla			;b429
	rla			;b42a
	xor (ix+029h)		;b42b
	rra			;b42e
	jr z,L_B41D		;b42f   ; si: sigue
	ld h,(ix+006h)		;b431   ; bajando: el caracter de debajo
	ld a,(ix+004h)		;b434
	bit 0,(ix+029h)		;b437
	jr z,L_B43F		;b43b
	sub 018h		;b43d
L_B43F:
	add a,010h		;b43f
	ld l,a			;b441
	call 07ed4h		;b442   ; en el mapa
	jr nc,L_B41D		;b445   ; libre: sigue
L_B447:
	call 06877h		;b447   ; en el suelo: sin velocidad y...
	ld a,(ix+025h)		;b44a   ; ...la x de IX+25
	ld (ix+00ah),a		;b44d
	cpl			;b450   ; el paso segun el lado
	rla			;b451
	rla			;b452
	and 001h		;b453
	ld (ix+001h),a		;b455
	ld a,(ix+004h)		;b458   ; la y en su fila
	and 0f8h		;b45b
	ld (ix+004h),a		;b45d
	ret			;b460
L_B461:
	bit 0,(ix+029h)		;b461   ; la animacion: de pie (p12:B470)...
	ld hl,0b470h		;b465
	jr z,L_B46D		;b468
	ld hl,0b476h		;b46a   ; ...o boca abajo (p12:B476)
L_B46D:
	jp 06bd5h		;b46d   ; anima_6: cada 4 cuadros avanza IX+26 de 0 a 5 y pone el dibujo de la tabla HL

; ----------------------------------------------------------------------
; DATOS resto_B470: lo apuntan con el banco puesto p12:B465 (0xB470), p12:B46A
;   (0xB476); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B465, p12:B46A (12 bytes)
;   0xb470..0xb47c  (12 bytes)
DATA_resto_B470:
	defb 0a0h,0a4h,0a8h,0ach,0a8h,0a4h,0d0h,0d4h,0d8h,0dch,0d8h,0d4h	; b470  ............

; ======================================================================
; CODIGO 0xb47c..0xb4c1  (69 bytes)
; ======================================================================


L_B47C:
	ld a,(0e301h)		;b47c   ; en la fase 4...
	cp 004h		;b47f
	jr nz,L_B48B		;b481
	ld (ix+00ch),002h		;b483   ; ...IX+0C = 2...
	ld (ix+031h),00ah		;b487   ; ...y el color 10
L_B48B:
	call 067cah		;b48b   ; la espera del disparo de p01:67E1
	ld (ix+015h),a		;b48e
	call 06877h		;b491   ; sin velocidad y
	bit 0,(ix+019h)		;b494   ; IX+19 bit 0: -2 en x...
	ld d,0feh		;b498
	jr nz,L_B49E		;b49a
	ld d,002h		;b49c   ; ...o +2
L_B49E:
	ld (ix+025h),d		;b49e   ; en IX+25
	call 0685dh		;b4a1   ; pon_ix09: IX+09/0A = DE
	ld a,(ix+004h)		;b4a4   ; arriba (y < 0x54): boca abajo, el dibujo 0x98...
	cp 054h		;b4a7
	ld a,001h		;b4a9
	ld b,098h		;b4ab
	jr c,L_B4B2		;b4ad
	xor a			;b4af   ; ...abajo, 0x90
	ld b,090h		;b4b0
L_B4B2:
	ld (ix+019h),a		;b4b2
	ld (ix+030h),b		;b4b5
	jp 06bbeh		;b4b8   ; la animacion
L_B4BB:
	ld a,(ix+001h)		;b4bb   ; el paso, por la tabla de detras
	call 040ceh		;b4be   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B4C1: 4 destinos del despachador p00:40CE (call en p12:B4BE, el
;   indice en A): B4C9, B55F, B593, B5BD; lo leen p12:B4BE (8 bytes)
;   0xb4c1..0xb4c9  (8 bytes)
DATA_tabla_B4C1:
	defw 0b4c9h,0b55fh,0b593h,0b5bdh	; b4c1  -> L_B4C9 L_B55F L_B593 L_B5BD

; ======================================================================
; CODIGO 0xb4c9..0xb6e5  (540 bytes)
; ======================================================================


L_B4C9:
	ld h,(ix+006h)		;b4c9   ; el caracter de debajo
	ld a,(ix+004h)		;b4cc
	bit 0,(ix+019h)		;b4cf
	jr z,L_B4D7		;b4d3
	sub 018h		;b4d5
L_B4D7:
	add a,010h		;b4d7
	ld l,a			;b4d9
	call 07ed4h		;b4da   ; en el mapa
	jr c,L_B4FC		;b4dd   ; suelo: p12:B4FC
	ld (ix+001h),002h		;b4df   ; sin suelo: el paso 2...
	bit 0,(ix+019h)		;b4e3   ; ...la aceleracion 0x80...
	ld hl,00080h		;b4e7
	jr z,L_B4ED		;b4ea
	dec h			;b4ec   ; ...o -0x80
L_B4ED:
	ld (ix+027h),l		;b4ed
	ld (ix+028h),h		;b4f0
	ld a,(ix+00ah)		;b4f3   ; y la mitad de velocidad x
	sra a		;b4f6
	ld (ix+00ah),a		;b4f8
	ret			;b4fb
L_B4FC:
	ld hl,(0e6bch)		;b4fc   ; la fila siguiente
	bit 0,(ix+019h)		;b4ff
	ld bc,0ffc0h		;b503
	jr z,L_B50B		;b506
	ld bc,00040h		;b508
L_B50B:
	add hl,bc			;b50b
	ld (0e6bch),hl		;b50c
	call 07edah		;b50f   ; pared?
	jr nc,L_B52F		;b512   ; no: p12:B52F
	inc (ix+001h)		;b514   ; si: el paso siguiente...
	set 3,(ix+010h)		;b517   ; ...los bits de IX+10...
	ld (ix+026h),001h		;b51b   ; ...cada cuadro...
	bit 0,(ix+019h)		;b51f   ; ...-4 o +4 en y
	ld a,0fch		;b523
	jr z,L_B529		;b525
	ld a,004h		;b527
L_B529:
	ld (ix+008h),a		;b529
	jp 0687ch		;b52c   ; sin velocidad x
L_B52F:
	dec (ix+002h)		;b52f   ; la espera
	ret nz			;b532
	call 06bbeh		;b533   ; la animacion
	ld (ix+030h),094h		;b536   ; el dibujo 0x94
	ld (ix+001h),003h		;b53a   ; el paso 3
	ld a,(0e326h)		;b53e   ; hacia el jugador 1 en x: +2...
	cp (ix+006h)		;b541
	ld de,00200h		;b544
	jr nc,L_B54B		;b547
	ld d,0feh		;b549   ; ...o -2
L_B54B:
	call 0685dh		;b54b   ; pon_ix09: IX+09/0A = DE
	ld a,(ix+019h)		;b54e   ; da la vuelta (IX+19)...
	xor 001h		;b551
	ld (ix+019h),a		;b553
	ld d,0fch		;b556   ; ...-4 o +4 en y
	jr nz,L_B55C		;b558
	ld d,004h		;b55a
L_B55C:
	jp 06856h		;b55c   ; pon_ix07: IX+07/08 = DE
L_B55F:
	dec (ix+026h)		;b55f   ; cada (IX+26) cuadros...
	ret nz			;b562
	ld (ix+026h),001h		;b563   ; ...1
	ld h,(ix+006h)		;b567   ; el caracter de debajo
	ld a,(ix+004h)		;b56a
	bit 0,(ix+019h)		;b56d
	jr nz,L_B575		;b571
	add a,008h		;b573
L_B575:
	ld l,a			;b575   ; en el mapa
	call 07ed4h		;b576
	ret c			;b579   ; suelo: sigue
	res 3,(ix+010h)		;b57a   ; sin los bits de IX+10
L_B57E:
	ld a,(ix+025h)		;b57e   ; la x guardada...
L_B581:
	ld (ix+00ah),a		;b581   ; ...en IX+0A
	call 06877h		;b584   ; sin velocidad y
	ld (ix+001h),d		;b587   ; el paso 0
	ld a,(ix+004h)		;b58a   ; la y en su fila
	and 0f8h		;b58d
	ld (ix+004h),a		;b58f
	ret			;b592
L_B593:
	ld h,(ix+006h)		;b593   ; el caracter de debajo
	ld a,(ix+004h)		;b596
	bit 0,(ix+019h)		;b599
	jr z,L_B5A1		;b59d
	sub 018h		;b59f
L_B5A1:
	add a,010h		;b5a1
	ld l,a			;b5a3
	call 07ed4h		;b5a4   ; en el mapa
	jr c,L_B57E		;b5a7   ; suelo: para
	ld c,(ix+027h)		;b5a9   ; en el aire: la velocidad y + IX+27/28
	ld b,(ix+028h)		;b5ac
	ld l,(ix+007h)		;b5af
	ld h,(ix+008h)		;b5b2
	add hl,bc			;b5b5
	ld (ix+007h),l		;b5b6
	ld (ix+008h),h		;b5b9
	ret			;b5bc
L_B5BD:
	call 07626h		;b5bd   ; dispara
	ld h,(ix+006h)		;b5c0   ; el caracter de debajo
	ld a,(ix+004h)		;b5c3
	bit 0,(ix+019h)		;b5c6
	jr z,L_B5CE		;b5ca
	sub 018h		;b5cc
L_B5CE:
	add a,010h		;b5ce
	ld l,a			;b5d0
	call 07ed4h		;b5d1   ; en el mapa
	ret nc			;b5d4   ; libre: nada
	bit 0,(ix+019h)		;b5d5   ; suelo: el dibujo 0x90...
	ld a,090h		;b5d9
	jr z,L_B5DF		;b5db
	ld a,098h		;b5dd   ; ...o 0x98
L_B5DF:
	ld (ix+030h),a		;b5df
	ld e,(ix+004h)		;b5e2   ; un disparo al jugador
	ld d,(ix+006h)		;b5e5
	call 074c5h		;b5e8
	ld a,(0e326h)		;b5eb   ; hacia el jugador 1: +2...
	cp (ix+006h)		;b5ee
	ld a,002h		;b5f1
	jr nc,L_B5F7		;b5f3
	ld a,0feh		;b5f5   ; ...o -2
L_B5F7:
	ld (ix+025h),a		;b5f7
	jr L_B581		;b5fa   ; y para
L_B5FC:
	bit 0,(ix+00bh)		;b5fc   ; el enemigo nuevo: IX+0B bit 0...
	ld a,02dh		;b600   ; ...el dibujo 0x2D...
	jr z,L_B606		;b602
	ld a,035h		;b604   ; ...o 0x35
L_B606:
	ld (ix+007h),a		;b606
	ld (ix+008h),008h		;b609   ; sus cuentas
	ld (ix+009h),002h		;b60d
	ld (ix+00ah),002h		;b611
	ld (ix+002h),018h		;b615
	ld (ix+00ch),003h		;b619
	ld a,(ix+004h)		;b61d   ; la y en IX+0E
	ld (ix+00eh),a		;b620
	ret			;b623
L_B624:
	dec (ix+00fh)		;b624   ; la x guardada - 1
	call 07af6h		;b627   ; en la pantalla?
	call 07ad2h		;b62a
	ret nz			;b62d
	ld a,(ix+001h)		;b62e   ; el paso 1: p12:B676
	dec a			;b631
	jr z,L_B676		;b632
	dec (ix+002h)		;b634   ; cada 8 cuadros...
	ret nz			;b637
	ld (ix+002h),008h		;b638
	ld a,(ix+00ah)		;b63c   ; ...la largura + 2
	add a,002h		;b63f
	ld (ix+00ah),a		;b641
	bit 0,(ix+00bh)		;b644   ; IX+0B bit 0...
	jr nz,L_B654		;b648
	ld a,(ix+004h)		;b64a   ; ...la y - 16...
	sub 010h		;b64d
	ld (ix+004h),a		;b64f
	jr L_B657		;b652
L_B654:
	inc (ix+007h)		;b654   ; ...o el dibujo + 1
L_B657:
	dec (ix+00ch)		;b657   ; los pasos...
	ret nz			;b65a
	ld (ix+00ch),002h		;b65b   ; ...acabados: 2...
	ld a,(ix+006h)		;b65f   ; ...la x guardada...
	ld (ix+00fh),a		;b662
	ld (ix+002h),004h		;b665   ; ...4 cuadros y el paso siguiente
	inc (ix+001h)		;b669
	bit 0,(ix+00bh)		;b66c   ; IX+0B bit 0: el dibujo 0x32
	ret z			;b670
	ld (ix+007h),032h		;b671
	ret			;b675
L_B676:
	dec (ix+002h)		;b676   ; cada 4 cuadros...
	ret nz			;b679
	ld (ix+002h),004h		;b67a
	ld a,(0e326h)		;b67e   ; ...la x del jugador 1 - la guardada...
	sub (ix+00fh)		;b681
	ld b,002h		;b684   ; ...a la derecha: 2...
	jr c,L_B694		;b686
	cp 010h		;b688   ; ...cerca (menos de 16)...
	jr c,L_B6A0		;b68a
	cp 030h		;b68c   ; ...menos de 0x30: 3...
	inc b			;b68e
	jr c,L_B6A0		;b68f
	inc b			;b691   ; ...si no, 4
	jr L_B6A0		;b692
L_B694:
	neg		;b694   ; a la izquierda...
	cp 010h		;b696
	jr c,L_B6A0		;b698
	cp 030h		;b69a   ; ...menos de 0x30: 1...
	dec b			;b69c
	jr c,L_B6A0		;b69d
	dec b			;b69f   ; ...si no, 0
L_B6A0:
	ld a,(ix+00ch)		;b6a0   ; ya ahi?
	cp b			;b6a3
	ret z			;b6a4
	dec a			;b6a5   ; un paso hacia ella
	jr nc,L_B6AA		;b6a6
	inc a			;b6a8
	inc a			;b6a9
L_B6AA:
	ld (ix+00ch),a		;b6aa   ; la nueva
	bit 0,(ix+00bh)		;b6ad   ; IX+0B bit 0: + 5
	jr z,L_B6B5		;b6b1
	add a,005h		;b6b3
L_B6B5:
	ld b,a			;b6b5   ; el dibujo: 0x2B + ella
	add a,02bh		;b6b6
	ld (ix+007h),a		;b6b8
	ld a,b			;b6bb   ; su entrada de p12:B6E5 (x 2)
	add a,a			;b6bc
	ld hl,0b6e5h		;b6bd
	call 04e28h		;b6c0   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld (ix+009h),e		;b6c3   ; el ancho y el alto
	ld (ix+00ah),d		;b6c6
	inc hl			;b6c9   ; el desplazamiento...
	ld c,(hl)			;b6ca
	inc hl			;b6cb
	ld b,(hl)			;b6cc
	ld a,c			;b6cd   ; ...+ la y guardada...
	add a,(ix+00eh)		;b6ce
	ld (ix+004h),a		;b6d1
	ld a,b			;b6d4   ; ...+ la x guardada, en su columna
	add a,(ix+00fh)		;b6d5
	and 0f8h		;b6d8
	ld (ix+006h),a		;b6da
	ld hl,0b70dh		;b6dd   ; los trozos de p12:B70D
	ld d,02bh		;b6e0
	jp 07aebh		;b6e2   ; su sitio

; ----------------------------------------------------------------------
; DATOS resto_B6E5: lo apuntan con el banco puesto p12:B6BD (0xB6E5), p12:B6DD
;   (0xB70D); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B6BD, p12:B6DD (59 bytes)
;   0xb6e5..0xb720  (59 bytes)
DATA_resto_B6E5:
	defb 008h,005h,0e8h,0d0h,005h,008h,0d0h,0e8h,002h,008h,0d0h,000h,005h,008h,0d0h,000h	; b6e5  ................
	defb 008h,005h,0e8h,000h,008h,005h,000h,0d0h,005h,008h,000h,0e8h,002h,008h,000h,000h	; b6f5  ................
	defb 005h,008h,000h,000h,008h,005h,000h,000h,009h,00ah,00bh,00ch,00dh,00eh,00fh,010h	; b705  ................
	defb 011h,012h,0ffh,0ffh,0ffh,013h,014h,015h,016h,012h,017h	; b715  ...........

; ======================================================================
; CODIGO 0xb720..0xb739  (25 bytes)
; ======================================================================


L_B720:
	ld (ix+00dh),0ffh		;b720   ; sin ancho
	ld (ix+002h),001h		;b724   ; 1 cuadro
	ld (ix+00ch),000h		;b728   ; el paso 0
	ld a,(ix+00bh)		;b72c   ; IX+0B: la x limite de p12:B739
	ld hl,0b739h		;b72f
	call 05ad8h		;b732   ; byte_de_tabla: A = el byte HL + A
	ld (ix+00bh),a		;b735
	ret			;b738

; ----------------------------------------------------------------------
; DATOS resto_B739: lo apuntan con el banco puesto p12:B72F (0xB739); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B72F (4 bytes)
;   0xb739..0xb73d  (4 bytes)
DATA_resto_B739:
	defb 071h,091h,0b1h,0d1h	; b739

; ======================================================================
; CODIGO 0xb73d..0xb789  (76 bytes)
; ======================================================================


L_B73D:
	ld a,(ix+005h)		;b73d   ; la x alta: fuera, nada
	or a			;b740
	ret nz			;b741
	ld a,(ix+006h)		;b742   ; la x antes del limite: nada
	cp (ix+00bh)		;b745
	ret nc			;b748
	dec (ix+002h)		;b749   ; la espera...
	ret nz			;b74c
	ld (ix+002h),018h		;b74d   ; ...0x18 cuadros...
	inc (ix+00ch)		;b751   ; ...el paso + 1...
	ld a,(ix+00ch)		;b754
	cp 004h		;b757   ; ...pasado el 3, se acaba
	jr c,L_B75F		;b759
	ld (ix+000h),000h		;b75b
L_B75F:
	add a,a			;b75f   ; x 16: el dibujo de p12:B779
	add a,a			;b760
	add a,a			;b761
	add a,a			;b762
	ld de,0b779h		;b763
	call 040c9h		;b766   ; de_mas_a: DE = DE + A
	ld l,(ix+004h)		;b769   ; su posicion...
	ld h,(ix+006h)		;b76c
	call 05a99h		;b76f   ; ...en el mapa
	ex de,hl			;b772
	exx			;b773
	ld b,004h		;b774   ; 4 filas
L_B776:
	exx			;b776
	ld bc,00004h		;b777   ; 4 caracteres
	ldir		;b77a
	ld a,03ch		;b77c   ; la fila siguiente (+0x3C)
	call 040c9h		;b77e   ; de_mas_a: DE = DE + A
	exx			;b781
	djnz L_B776		;b782   ; las 4
	ld a,046h		;b784   ; el sonido 0x46
	jp 04d6eh		;b786   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes

; ----------------------------------------------------------------------
; DATOS fichas_B789: 4 fichas de 16 bytes (p12:B763: 0xB779 + 16 x A, A de 1 a
;   4: los 16 de 0xB779 son codigo) que p12:B776 copia de 4 en 4; lo leen
;   p12:B766 (64 bytes)
;   0xb789..0xb7c9  (64 bytes)
DATA_fichas_B789:
	defb 09bh,09bh,09bh,09bh,000h,000h,000h,000h,000h,000h,000h,000h,09ch,09ch,09ch,09ch	; b789  ................
	defb 09ah,09ah,09ah,09ah,000h,000h,000h,000h,000h,000h,000h,000h,09ah,09ah,09ah,09ah	; b799  ................
	defb 09ah,09ah,09ah,09ah,09bh,09bh,09bh,09bh,09ch,09ch,09ch,09ch,09ah,09ah,09ah,09ah	; b7a9  ................
	defb 09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah	; b7b9  ................

; ======================================================================
; CODIGO 0xb7c9..0xb9b7  (494 bytes)
; ======================================================================


L_B7C9:
	ld a,(0e627h)		;b7c9   ; con el recorrido en marcha...
	or a			;b7cc
	ret z			;b7cd
	ld hl,0ca20h		;b7ce   ; ...borra 0x15 filas de 32 desde 0xCA20
	xor a			;b7d1
	ld de,00020h		;b7d2
	ld c,015h		;b7d5
L_B7D7:
	ld b,020h		;b7d7
L_B7D9:
	ld (hl),a			;b7d9   ; una fila
	inc hl			;b7da
	djnz L_B7D9		;b7db
	add hl,de			;b7dd   ; la siguiente (+0x20)
	dec c			;b7de
	jr nz,L_B7D7		;b7df
	ret			;b7e1
L_B7E2:
	ld a,(0e301h)		;b7e2   ; en la fase 1...
	dec a			;b7e5
	ret nz			;b7e6
	ld de,(0e302h)		;b7e7   ; ...con el recorrido en 0x1E4...
	ld hl,001e4h		;b7eb
	or a			;b7ee
	sbc hl,de		;b7ef
	jr z,L_B7C9		;b7f1   ; ...borra...
	ret nc			;b7f3   ; ...antes: nada
	ld hl,0021eh		;b7f4   ; ...pasado 0x21E: nada
	or a			;b7f7
	sbc hl,de		;b7f8
	ret c			;b7fa
	call L_B823		;b7fb   ; entre los dos: corre el mapa
	ld hl,0ca20h		;b7fe   ; 0x15 filas de 32 desde 0xCA20
	ld c,015h		;b801
L_B803:
	ld b,020h		;b803
L_B805:
	ld a,(hl)			;b805   ; el caracter...
	or a			;b806
	jr z,L_B818		;b807   ; ...0: nada
	dec a			;b809   ; ...- 1...
	ld (hl),a			;b80a
	jr nz,L_B818		;b80b   ; ...a 0: el de encima + 4
	ld de,00020h		;b80d
	or a			;b810
	sbc hl,de		;b811
	ld a,(hl)			;b813
	add a,004h		;b814
	ld (hl),a			;b816
	add hl,de			;b817
L_B818:
	inc hl			;b818   ; el siguiente
	djnz L_B805		;b819
	ld de,00020h		;b81b   ; la fila siguiente
	add hl,de			;b81e
	dec c			;b81f
	jr nz,L_B803		;b820
	ret			;b822
L_B823:
	ld a,(0e627h)		;b823   ; corre el mapa: el recorrido en horizontal?
	or a			;b826
	jr nz,L_B854		;b827
	ld a,(0e628h)		;b829   ; en vertical?
	or a			;b82c
	ret z			;b82d
	ld de,0ca20h		;b82e   ; en vertical: 0x14 filas...
	ld a,014h		;b831
L_B833:
	ld h,d			;b833   ; ...cada una toma la de abajo (+0x40)
	ld l,e			;b834
	ld bc,00040h		;b835
	add hl,bc			;b838
	ld bc,00020h		;b839
	ldir		;b83c
	ld hl,00020h		;b83e
	add hl,de			;b841
	ex de,hl			;b842
	dec a			;b843
	jr nz,L_B833		;b844
	ld hl,0cf20h		;b846   ; y la de abajo del todo a 0
	ld de,0cf21h		;b849
	ld (hl),000h		;b84c
	ld bc,0001fh		;b84e
	ldir		;b851
	ret			;b853
L_B854:
	ld de,0ca20h		;b854   ; en horizontal: 0x14 filas...
	ld a,014h		;b857
L_B859:
	ld h,d			;b859   ; ...cada una un caracter a la izquierda
	ld l,e			;b85a
	inc hl			;b85b
	ld bc,0001fh		;b85c
	ldir		;b85f
	ld hl,00021h		;b861
	add hl,de			;b864
	ex de,hl			;b865
	dec a			;b866
	jr nz,L_B859		;b867
	ld hl,0ca3fh		;b869   ; y la columna 0x1F a 0
	ld de,00040h		;b86c
	ld b,015h		;b86f
	xor a			;b871
L_B872:
	ld (hl),a			;b872   ; una fila
	add hl,de			;b873
	djnz L_B872		;b874
	ret			;b876
L_B877:
	ld a,(0e6a4h)		;b877   ; la pantalla SELECTION (JOINT GAME, YES/NO): el paso 0xE6A4
	dec a			;b87a
	jr z,L_B8C0		;b87b   ; 1: p12:B8C0
	dec a			;b87d
	jr z,L_B8DB		;b87e   ; 2: p12:B8DB
	dec a			;b880
	jp z,L_B9AC		;b881   ; 3: p12:B9AC
	ld a,001h		;b884   ; 0: la opcion 1 (YES)
	ld (0e6a5h),a		;b886
	ld de,0b9b7h		;b889   ; los textos de p12:B9B7
	call 04cf5h		;b88c   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld a,(0e227h)		;b88f   ; con dos jugadores...
	or a			;b892
	jr z,L_B89B		;b893
	ld de,0b9efh		;b895   ; ...los de p12:B9EF
	call 04cf5h		;b898   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
L_B89B:
	ld a,(0e3a1h)		;b89b   ; 0xE3A1...
	or a			;b89e
	jr z,L_B8A9		;b89f
	ld hl,0392bh		;b8a1   ; ...el caracter 0x12 en 0x392B
	ld a,012h		;b8a4
	call 0004dh		;b8a6   ; BIOS WRTVRM - Writes data in VRAM
L_B8A9:
	call L_B8B1		;b8a9   ; la flecha
L_B8AC:
	ld hl,0e6a4h		;b8ac   ; el paso siguiente
	inc (hl)			;b8af
	ret			;b8b0
L_B8B1:
	ld a,(0e6a5h)		;b8b1   ; la flecha en YES (p12:B9FA)...
	or a			;b8b4
	ld de,0b9fah		;b8b5
	jr nz,L_B8BD		;b8b8
	ld de,0ba05h		;b8ba   ; ...o en NO (p12:BA05)
L_B8BD:
	jp 04cf5h		;b8bd   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
L_B8C0:
	ld a,(0e30eh)		;b8c0   ; 1: el disparo?
	bit 4,a		;b8c3
	jr nz,L_B8D3		;b8c5
	and 00ch		;b8c7   ; izquierda o derecha...
	ret z			;b8c9
	ld hl,0e6a5h		;b8ca   ; ...la otra opcion
	ld a,(hl)			;b8cd
	xor 001h		;b8ce
	ld (hl),a			;b8d0
	jr L_B8B1		;b8d1
L_B8D3:
	ld de,0ba10h		;b8d3   ; el disparo: el texto de p12:BA10...
	call 04cf5h		;b8d6   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	jr L_B8AC		;b8d9   ; ...y el paso siguiente
L_B8DB:
	ld a,(0e30eh)		;b8db   ; 2: el disparo?
	bit 4,a		;b8de
	jr nz,L_B901		;b8e0
	and 00fh		;b8e2   ; otra tecla...
	jr nz,L_B8F4		;b8e4
	ld a,(0e203h)		;b8e6   ; nada: el texto de p12:BA10 parpadea
	bit 2,a		;b8e9
	ld de,0ba10h		;b8eb
	jp z,04cf5h		;b8ee   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	jp 04d0ch		;b8f1   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
L_B8F4:
	ld de,0ba10h		;b8f4   ; otra tecla: lo borra y vuelve al paso 1
	call 04d0ch		;b8f7   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
	ld a,001h		;b8fa
	ld (0e6a4h),a		;b8fc
	jr L_B8C0		;b8ff
L_B901:
	ld de,0ba10h		;b901   ; el disparo: lo borra
	call 04d0ch		;b904   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
	ld a,(0e6a5h)		;b907   ; NO: p12:B9A4
	or a			;b90a
	jp z,L_B9A4		;b90b
	ld a,003h		;b90e   ; YES: 0xE380 = 3
	ld (0e380h),a		;b910   ; guarda la ficha del jugador 2 (IY, 0x80 bytes)
	ld a,(0e227h)		;b913   ; con un jugador...
	or a			;b916
	jr nz,L_B92E		;b917
	ld a,(0e3a1h)		;b919   ; ...los puntos del 1 (0xE27A)...
	or a			;b91c
	ld hl,0e27ah		;b91d
	jr z,L_B924		;b920
	ld l,075h		;b922   ; ...o del 2 (0xE275)...
L_B924:
	ld d,h			;b924
	ld e,l			;b925
	inc de			;b926
	ld bc,00004h		;b927
	ld (hl),000h		;b92a   ; ...a 0
	ldir		;b92c
L_B92E:
	xor a			;b92e   ; 0xE3A0 = 0
	ld (0e3a0h),a		;b92f
	ld hl,0e301h		;b932   ; el jugador 2 toma la fase del 1...
	ld de,0e381h		;b935
	ld bc,00005h		;b938
	ldir		;b93b
	ld a,(0e30ah)		;b93d   ; ...0xE30A...
	ld (0e38ah),a		;b940
	ld hl,0e324h		;b943   ; ...la posicion...
	ld de,0e3a4h		;b946
	ld bc,00003h		;b949
	ldir		;b94c
	ld hl,0e35eh		;b94e   ; ...y 0xE35E-0xE366
	ld de,0e3deh		;b951
	ld bc,00009h		;b954
	ldir		;b957
	ld iy,0e300h		;b959   ; el jugador 1
	xor a			;b95d
	ld (0e430h),a		;b95e   ; sin la opcion 4 (0xE430)
	ld a,(0e60bh)		;b961   ; 0xE60B mas de 3...
	cp 003h		;b964
	jr c,L_B974		;b966
	ld a,003h		;b968   ; ...se queda en 3
	ld (0e60bh),a		;b96a
	ld (iy+030h),a		;b96d
	ld (iy+017h),0ffh		;b970
L_B974:
	ld a,(0e321h)		;b974   ; con 0xE321...
	or a			;b977   ; ...p00:549E
	call nz,0549eh		;b978
	ld de,0ba28h		;b97b   ; los textos de p12:BA28...
	call 04cf5h		;b97e   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld de,0ba2ah		;b981   ; ...y p12:BA2A en 0x3A48
	ld hl,03a48h		;b984
	call 04cfdh		;b987   ; lista_a_vram_aqui: la lista de DE en la VRAM HL (sin destino delante)
	ld hl,03a4eh		;b98a   ; el caracter 0x12 en 0x3A4E
	ld a,012h		;b98d
	call 0004dh		;b98f   ; BIOS WRTVRM - Writes data in VRAM
	ld hl,03a16h		;b992   ; los datos del jugador 1 en 0x3A16...
	ld de,0e300h		;b995   ; apunta a la ficha del jugador 1 (IY, 0x80 bytes)
	call 059deh		;b998
	ld hl,03a56h		;b99b   ; ...y los del 2 en 0x3A56
	ld de,0e380h		;b99e   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	call 059deh		;b9a1
L_B9A4:
	ld a,078h		;b9a4   ; 120 cuadros
	ld (0e6a6h),a		;b9a6
	jp L_B8AC		;b9a9
L_B9AC:
	ld hl,0e6a6h		;b9ac   ; 3: la espera...
	dec (hl)			;b9af
	ret nz			;b9b0
	ld a,001h		;b9b1   ; ...acabada: 0xE230 = 1
	ld (0e230h),a		;b9b3
	ret			;b9b6

; ----------------------------------------------------------------------
; DATOS lista_B9B7: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B88C (56 bytes)
;   0xb9b7..0xb9ef  (56 bytes)
DATA_lista_B9B7:
	defb 069h,038h,033h,025h,02ch,025h,023h,034h,029h,02fh,02eh,0feh,0c5h,038h,02eh,02fh	; b9b7  i83%,%#4)/...8./
	defb 037h,000h,029h,033h,000h,000h,02fh,02eh,02ch,039h,000h,000h,011h,000h,030h,02ch	; b9c7  7.)3../.,9....0,
	defb 021h,039h,0feh,025h,039h,030h,02ch,021h,039h,025h,032h,011h,000h,02ah,02fh,029h	; b9d7  !9.%90,!9%2..*/)
	defb 02eh,034h,000h,027h,021h,02dh,025h,0ffh	; b9e7  .4.'!-%.

; ----------------------------------------------------------------------
; DATOS lista_B9EF: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B898 (11 bytes)
;   0xb9ef..0xb9fa  (11 bytes)
DATA_lista_B9EF:
	defb 0cch,038h,025h,038h,023h,028h,021h,02eh,027h,025h,0ffh	; b9ef  .8%8#(!.'%.

; ----------------------------------------------------------------------
; DATOS resto_B9FA: lo apuntan con el banco puesto p12:B8B5 (0xB9FA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B8B5 (11 bytes)
;   0xb9fa..0xba05  (11 bytes)
DATA_resto_B9FA:
	defb 08ah,039h,059h,045h,053h,0feh,093h,039h,02eh,02fh,0ffh	; b9fa  .9YES..9./.

; ----------------------------------------------------------------------
; DATOS lista_BA05: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B8BD (11 bytes)
;   0xba05..0xba10  (11 bytes)
DATA_lista_BA05:
	defb 08ah,039h,039h,025h,033h,0feh,093h,039h,04eh,04fh,0ffh	; ba05  .99%3..9NO.

; ----------------------------------------------------------------------
; DATOS lista_BA10: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B8D6, p12:B8EE, p12:B8F1, p12:B8F7,
;   p12:B904 (24 bytes)
;   0xba10..0xba28  (24 bytes)
DATA_lista_BA10:
	defb 00eh,03ah,033h,035h,032h,025h,0feh,049h,03ah,030h,035h,033h,028h,000h,033h,030h	; ba10  .:352%.I:053(.30
	defb 021h,023h,025h,000h,02bh,025h,039h,0ffh	; ba20  !#%.+%9.

; ----------------------------------------------------------------------
; DATOS lista_BA28: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); se solapan 2 bloques: (lista_s_BA2A BA2A-BA37); lo
;   leen p12:B97E, p12:B987 (15 bytes)
;   0xba28..0xba37  (15 bytes)
DATA_lista_BA28:
	defb 008h,03ah,030h,02ch,021h,039h,025h,032h,011h,000h,032h,025h,033h,034h,0ffh	; ba28  .:0,!9%2..2%34.

; ======================================================================
; CODIGO 0xba37..0xba7e  (71 bytes)
; ======================================================================


L_BA37:
	ld (ix+026h),000h		;ba37   ; el enemigo nuevo: la animacion a 0
	call 04f9bh		;ba3b   ; el bit 3 de IX+10...
	res 2,(ix+010h)		;ba3e   ; ...sin el 2
	ld hl,(0f000h)		;ba42   ; su lista (0xF000) en IX+23/24
	ld (ix+023h),l		;ba45
	ld (ix+024h),h		;ba48
	ld a,(ix+019h)		;ba4b   ; por IX+19...
	ld hl,0ba7eh		;ba4e   ; ...dos bytes de p12:BA7E
	add a,a			;ba51
	call 040c4h		;ba52   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;ba55
	inc hl			;ba56
	ld (ix+019h),a		;ba57   ; el nuevo IX+19
	ld c,(hl)			;ba5a   ; el largo
	ld b,001h		;ba5b   ; 1 de alto
	bit 1,a		;ba5d   ; con el bit 1, al reves
	jr z,L_BA64		;ba5f
	ld a,b			;ba61
	ld b,c			;ba62
	ld c,a			;ba63
L_BA64:
	ld (ix+014h),b		;ba64   ; el ancho
	ld (ix+025h),b		;ba67
	ld (ix+032h),000h		;ba6a
	ld (ix+013h),c		;ba6e   ; y el alto
	ld (ix+022h),c		;ba71
	ld a,(ix+019h)		;ba74   ; IX+19 = 1...
	dec a			;ba77
	ret nz			;ba78
	ld (ix+013h),001h		;ba79   ; ...1 de alto
	ret			;ba7d

; ----------------------------------------------------------------------
; DATOS resto_BA7E: lo apuntan con el banco puesto p12:BA4E (0xBA7E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BA4E (34 bytes)
;   0xba7e..0xbaa0  (34 bytes)
DATA_resto_BA7E:
	defb 002h,007h,001h,009h,000h,009h,001h,005h,000h,005h,001h,008h,000h,008h,003h,00bh	; ba7e  ................
	defb 003h,007h,002h,007h,003h,003h,003h,007h,002h,019h,003h,009h,002h,017h,001h,00bh	; ba8e  ................
	defb 000h,00bh	; ba9e

; ======================================================================
; CODIGO 0xbaa0..0xbb36  (150 bytes)
; ======================================================================


L_BAA0:
	call 04fa0h		;baa0   ; p00:4FA0
	call L_BAB2		;baa3   ; la animacion
	ld l,(ix+023h)		;baa6   ; su lista...
	ld h,(ix+024h)		;baa9
	ld a,(hl)			;baac   ; ...acabada: fuera
	or a			;baad
	jp z,06b62h		;baae
	ret			;bab1
L_BAB2:
	inc (ix+026h)		;bab2   ; cada 2 cuadros...
	bit 0,(ix+026h)		;bab5
	ret z			;bab9
	inc (ix+032h)		;baba   ; ...el dibujo siguiente
	ret			;babd
L_BABE:
	ld c,000h		;babe   ; en la columna 0
	jp 07ae3h		;bac0
L_BAC3:
	ld (ix+008h),004h		;bac3   ; el enemigo nuevo: 4 en IX+08
	push ix		;bac7   ; se guarda en 0xF000
	pop hl			;bac9
	ld (0f000h),hl		;baca
	ld a,(ix+00bh)		;bacd   ; IX+0B...
	ld b,a			;bad0
	cp 002h		;bad1   ; ...menos de 2: 4 y 2...
	ld hl,00402h		;bad3
	jr c,L_BAE5		;bad6
	dec h			;bad8   ; ...en la fase 3: 3 y 2...
	ld a,(0e301h)		;bad9   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 003h		;badc
	jr z,L_BAE5		;bade
	ld hl,00101h		;bae0   ; ...si no 1 y 1, y 2 mas
	inc b			;bae3
	inc b			;bae4
L_BAE5:
	ld a,b			;bae5   ; el dibujo: 0x12 + eso
	add a,012h		;bae6
	ld (ix+007h),a		;bae8
	ld (ix+009h),h		;baeb   ; el tamano
	ld (ix+00ah),l		;baee
	ld hl,0e65eh		;baf1   ; uno mas (0xE65E)
	inc (hl)			;baf4
	ld a,(0e301h)		;baf5   ; la tabla de la fase (p12:BB36)
	ld b,(hl)			;baf8
	ld hl,0bb36h		;baf9
	call 04e28h		;bafc   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ex de,hl			;baff
	ld a,b			;bb00   ; el numero x 3
	add a,a			;bb01
	add a,b			;bb02
	call 040c4h		;bb03   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;bb06   ; el tipo
	inc hl			;bb07
	ld e,(hl)			;bb08   ; el desplazamiento en y, con signo
	inc hl			;bb09
	bit 7,e		;bb0a
	ld d,000h		;bb0c
	jr z,L_BB11		;bb0e
	dec d			;bb10
L_BB11:
	push hl			;bb11
	ld l,(ix+004h)		;bb12   ; la y + eso
	ld h,(ix+003h)		;bb15
	add hl,de			;bb18
	ex de,hl			;bb19
	pop hl			;bb1a
	push de			;bb1b
	ld e,(hl)			;bb1c   ; el de x, con signo
	bit 7,e		;bb1d
	ld d,000h		;bb1f
	jr z,L_BB24		;bb21
	dec d			;bb23
L_BB24:
	ld l,(ix+006h)		;bb24   ; la x + eso
	ld h,(ix+005h)		;bb27
	add hl,de			;bb2a
	pop de			;bb2b
	ld a,d			;bb2c   ; en (E, D)
	ld d,l			;bb2d
	ld l,a			;bb2e
	ld c,000h		;bb2f
	ld a,03fh		;bb31   ; el enemigo 0x3F
	jp 065b5h		;bb33   ; crea_enemigo_ix: crea un enemigo de tipo A guardando IX

; ----------------------------------------------------------------------
; DATOS resto_BB36: lo apuntan con el banco puesto p12:BAF9 (0xBB36); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BAF9 (86 bytes)
;   0xbb36..0xbb8c  (86 bytes)
DATA_resto_BB36:
	defb 041h,0bbh,041h,0bbh,041h,0bbh,041h,0bbh,059h,0bbh,071h,0bbh,071h,0bbh,00fh,0f8h	; bb36  A.A.A.A.Y.q.q...
	defb 018h,010h,010h,000h,000h,000h,018h,001h,0f8h,018h,002h,010h,000h,007h,008h,0a8h	; bb46  ................
	defb 00ch,000h,018h,00eh,000h,018h,008h,000h,0c8h,009h,000h,008h,008h,000h,0c8h,009h	; bb56  ................
	defb 000h,008h,008h,000h,0c8h,009h,000h,008h,00ah,000h,0e8h,00ah,000h,0e8h,000h,000h	; bb66  ................
	defb 008h,00bh,000h,0c8h,00bh,000h,0c8h,000h,000h,008h,000h,000h,008h,00bh,000h,0c8h	; bb76  ................
	defb 00bh,000h,0c8h,000h,000h,008h	; bb86

; ======================================================================
; CODIGO 0xbb8c..0xbbb2  (38 bytes)
; ======================================================================


L_BB8C:
	ld (ix+009h),006h		;bb8c   ; el enemigo nuevo: el tamano
	ld (ix+00ah),005h		;bb90
	ld (ix+00fh),080h		;bb94   ; IX+0F = 0x80
	ld a,(ix+00bh)		;bb98   ; IX+0B: el dibujo 0...
	and a			;bb9b
	ld b,000h		;bb9c
	jr nz,L_BBA2		;bb9e
	ld b,002h		;bba0   ; ...o 2
L_BBA2:
	ld (ix+007h),b		;bba2
	call L_BC0C		;bba5   ; la espera al azar
	ld (ix+008h),00ah		;bba8   ; IX+08 = 10
	ld a,008h		;bbac   ; 8 cuadros
	ld (ix+002h),a		;bbae
	ret			;bbb1

; ----------------------------------------------------------------------
; DATOS resto_BBB2: lo apuntan con el banco puesto p12:BBB6 (0xBBB2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BBB6 (4 bytes)
;   0xbbb2..0xbbb6  (4 bytes)
DATA_resto_BBB2:
	defb 0ffh,001h,0ffh,002h	; bbb2

; ======================================================================
; CODIGO 0xbbb6..0xbca1  (235 bytes)
; ======================================================================


L_BBB6:
	ld hl,0bbb2h		;bbb6   ; su sitio con los trozos de p12:BBB2
	ld d,000h		;bbb9
	call 07aebh		;bbbb
	ld a,(ix+00fh)		;bbbe   ; la fase (IX+0F & 3): 0...
	and 003h		;bbc1
	jr nz,L_BBD4		;bbc3
	res 0,(ix+007h)		;bbc5   ; ...el dibujo par...
	dec (ix+00eh)		;bbc9   ; ...la espera...
	ret nz			;bbcc
	call L_BBEC		;bbcd   ; ...acabada: la siguiente
	inc (ix+00fh)		;bbd0
	ret			;bbd3
L_BBD4:
	set 0,(ix+007h)		;bbd4   ; 1: el dibujo impar
	dec a			;bbd8
	jr nz,L_BBF1		;bbd9
	dec (ix+00eh)		;bbdb   ; la espera...
	ret nz			;bbde
	ld a,(ix+00ch)		;bbdf   ; ...acabada: IX+0C a 6...
	and 0f0h		;bbe2
	or 006h		;bbe4
	ld (ix+00ch),a		;bbe6
	inc (ix+00fh)		;bbe9   ; ...y la siguiente
L_BBEC:
	ld (ix+00eh),008h		;bbec   ; 8 cuadros
	ret			;bbf0
L_BBF1:
	dec (ix+00eh)		;bbf1   ; 2: la espera
	ret nz			;bbf4
	call L_BBEC		;bbf5   ; acabada: otra...
	call L_BCD0		;bbf8   ; ...dispara...
	dec (ix+00ch)		;bbfb   ; ...IX+0C - 1...
	ld a,(ix+00ch)		;bbfe
	and 007h		;bc01   ; ...a 0 en los bits 0-2: vuelta a la fase 0
	ret nz			;bc03
	ld a,(ix+00fh)		;bc04
	and 0fch		;bc07
	ld (ix+00fh),a		;bc09
L_BC0C:
	call 04e58h		;bc0c   ; de 0x10 a 0x17 cuadros al azar
	and 007h		;bc0f
	add a,010h		;bc11
	ld (ix+00eh),a		;bc13
	ret			;bc16
L_BC17:
	call L_BBB6		;bc17   ; se mueve
	ld a,(ix+001h)		;bc1a   ; el paso 1: p12:BC3F
	dec a			;bc1d
	jr z,L_BC3F		;bc1e
	dec (ix+002h)		;bc20   ; la espera...
	ret nz			;bc23
	ld a,(ix+00fh)		;bc24   ; ...acabada: IX+0F - 0x10...
	sub 010h		;bc27
	ld (ix+00fh),a		;bc29
	ld (ix+002h),00ah		;bc2c   ; ...10 cuadros y el paso 1
	ld (ix+001h),001h		;bc30
L_BC34:
	ld a,(ix+00ch)		;bc34   ; IX+0C: la cifra alta a 4
	and 00fh		;bc37
	or 040h		;bc39
	ld (ix+00ch),a		;bc3b
	ret			;bc3e
L_BC3F:
	ld a,(ix+00ch)		;bc3f   ; la cifra alta de IX+0C - 1...
	sub 010h		;bc42
	ld (ix+00ch),a		;bc44
	and 0f0h		;bc47
	ret nz			;bc49   ; ...a 0...
	call L_BC34		;bc4a   ; ...otra vez 4
	ld a,(ix+002h)		;bc4d   ; el paso de p12:BCA1 (por IX+02)
	dec a			;bc50
	and 00fh		;bc51
	ld hl,0bca1h		;bc53
	call 04e28h		;bc56   ; palabra_de_hl: DE = la palabra HL + 2 x A
	call L_BCC1		;bc59   ; en DE y BC con signo
	ld l,(ix+004h)		;bc5c   ; la y + DE
	ld h,(ix+003h)		;bc5f
	add hl,de			;bc62
	ld (ix+004h),l		;bc63
	ld (ix+003h),h		;bc66
	call L_BCB5		;bc69   ; fuera de la pantalla?
	jr c,L_BC9C		;bc6c   ; si: se acaba
	ld e,c			;bc6e   ; la x + BC...
	ld d,b			;bc6f
	ld a,(ix+00bh)		;bc70
	and a			;bc73
	call nz,05adfh		;bc74   ; ...al reves con IX+0B
	ld l,(ix+006h)		;bc77
	ld h,(ix+005h)		;bc7a
	add hl,de			;bc7d
	ld (ix+006h),l		;bc7e
	ld (ix+005h),h		;bc81
	dec (ix+002h)		;bc84   ; la espera...
	ret nz			;bc87
	ld a,03ch		;bc88   ; ...acabada: el sonido 0x3C...
	call 04d6eh		;bc8a   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call 04e58h		;bc8d   ; ...de 8 a 15 cuadros...
	and 007h		;bc90
	add a,008h		;bc92
	ld (ix+002h),a		;bc94
	ld (ix+001h),000h		;bc97   ; ...y el paso 0
	ret			;bc9b
L_BC9C:
	ld (ix+000h),000h		;bc9c   ; se acaba
	ret			;bca0

; ----------------------------------------------------------------------
; DATOS resto_BCA1: lo apuntan con el banco puesto p12:BC53 (0xBCA1); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BC53 (20 bytes)
;   0xbca1..0xbcb5  (20 bytes)
DATA_resto_BCA1:
	defb 000h,0f8h,008h,0f8h,000h,0f8h,008h,0f8h,008h,000h,008h,000h,008h,008h,000h,008h	; bca1  ................
	defb 008h,008h,000h,008h	; bcb1

; ======================================================================
; CODIGO 0xbcb5..0xbcfc  (71 bytes)
; ======================================================================


L_BCB5:
	ld a,(ix+003h)		;bcb5   ; la y: fuera (de 0xA8 en adelante): C
	and a			;bcb8
	ld a,(ix+004h)		;bcb9
	ret nz			;bcbc
	cp 0a8h		;bcbd
	ccf			;bcbf
	ret			;bcc0
L_BCC1:
	ld c,d			;bcc1   ; E y D con signo en DE y BC
	ld d,000h		;bcc2
	bit 7,e		;bcc4
	jr z,L_BCC9		;bcc6
	dec d			;bcc8
L_BCC9:
	ld b,000h		;bcc9
	bit 7,c		;bccb
	ret z			;bccd
	dec b			;bcce
	ret			;bccf
L_BCD0:
	ld a,(ix+003h)		;bcd0   ; dispara: la y alta...
	and a			;bcd3
	jr nz,L_BCEB		;bcd4
L_BCD6:
	call L_BCF3		;bcd6   ; el desplazamiento de p12:BCFC...
	ld a,(ix+004h)		;bcd9   ; ...+ la y...
	add a,e			;bcdc
	ld e,a			;bcdd
	ld a,(ix+006h)		;bcde   ; ...+ la x
	add a,d			;bce1
	ld d,a			;bce2
	ld a,025h		;bce3   ; el enemigo 0x25
	ld bc,00000h		;bce5
	jp 065b5h		;bce8   ; crea_enemigo_ix: crea un enemigo de tipo A guardando IX
L_BCEB:
	ld a,(ix+004h)		;bceb   ; la y alta: solo de 0xD8 en adelante
	cp 0d8h		;bcee
	ret c			;bcf0
	jr L_BCD6		;bcf1
L_BCF3:
	ld a,(ix+00bh)		;bcf3   ; por IX+0B, de p12:BCFC
	ld hl,0bcfch		;bcf6
	jp 04e28h		;bcf9   ; palabra_de_hl: DE = la palabra HL + 2 x A

; ----------------------------------------------------------------------
; DATOS resto_BCFC: lo apuntan con el banco puesto p12:BCF6 (0xBCFC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BCF6 (4 bytes)
;   0xbcfc..0xbd00  (4 bytes)
DATA_resto_BCFC:
	defb 020h,008h,020h,020h	; bcfc

; ======================================================================
; CODIGO 0xbd00..0xbddc  (220 bytes)
; ======================================================================


L_BD00:
	ld (ix+002h),01ah		;bd00   ; 26 cuadros
	ld a,(0e64fh)		;bd04   ; la rapidez: 2 x la dificultad + 0x50...
	add a,a			;bd07
	add a,050h		;bd08
	cp 060h		;bd0a
	jr c,L_BD10		;bd0c   ; ...como mucho 0x60
	ld a,060h		;bd0e
L_BD10:
	jp 06801h		;bd10   ; hacia el jugador
L_BD13:
	call L_BD46		;bd13   ; el color
	ld a,(ix+002h)		;bd16   ; la espera...
	and a			;bd19
	jr z,L_BD20		;bd1a
	dec (ix+002h)		;bd1c
	ret nz			;bd1f
L_BD20:
	call L_BD27		;bd20   ; ...acabada: en el decorado?
	ret nc			;bd23
	jp 06b62h		;bd24   ; si: fuera
L_BD27:
	ld l,(ix+004h)		;bd27   ; su posicion en el mapa
	ld h,(ix+006h)		;bd2a
	call 05a99h		;bd2d   ; hl_a_nombre: convierte las coordenadas de HL en una direccion de la tabla de nombres
	call L_BD41		;bd30   ; el caracter: del decorado?
	ret c			;bd33
	call L_BD40		;bd34   ; el de al lado
	ret c			;bd37
	ld de,0003fh		;bd38   ; el de abajo
	add hl,de			;bd3b
	call L_BD41		;bd3c
	ret c			;bd3f
L_BD40:
	inc hl			;bd40   ; el de al lado
L_BD41:
	ld a,(0e605h)		;bd41   ; C si es del decorado (menos que 0xE605)
	cp (hl)			;bd44
	ret			;bd45
L_BD46:
	ld a,(0e203h)		;bd46   ; cada 4 cuadros...
	and 003h		;bd49
	ret nz			;bd4b
	ld a,(ix+031h)		;bd4c   ; ...el color 5 o 0
	xor 005h		;bd4f
	ld (ix+031h),a		;bd51
	ret			;bd54
L_BD55:
	ld a,(0e301h)		;bd55   ; en la fase 5...
	cp 005h		;bd58
	ret nz			;bd5a
	call L_BD77		;bd5b   ; ...las piezas que tocan...
	jr z,L_BD55		;bd5e
	ret c			;bd60
	ld hl,0e669h		;bd61   ; ...la siguiente
	inc (hl)			;bd64
	jr L_BD55		;bd65
L_BD67:
	ld a,(0e301h)		;bd67   ; en la fase 5...
	cp 005h		;bd6a
	ret nz			;bd6c
	ld a,(0e627h)		;bd6d   ; ...con el recorrido en marcha...
	or a			;bd70
	ret z			;bd71
	ld a,0e0h		;bd72   ; ...desde 0xE0
	ld (0f004h),a		;bd74
L_BD77:
	ld hl,0bddch		;bd77   ; la entrada (0xE669) de p12:BDDC, 3 bytes
	ld a,(0e669h)		;bd7a
	ld b,a			;bd7d
	add a,a			;bd7e
	add a,b			;bd7f
	call 040c4h		;bd80   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;bd83   ; el punto del recorrido
	inc hl			;bd84
	ld d,(hl)			;bd85
	inc hl			;bd86
	ld a,(hl)			;bd87   ; la altura en 0xF005
	ld (0f005h),a		;bd88
	ld hl,(0e302h)		;bd8b   ; llega?
	or a			;bd8e
	sbc hl,de		;bd8f   ; aun no: NZ
	ret nz			;bd91
	ld hl,0e669h		;bd92   ; la siguiente
	inc (hl)			;bd95
	xor a			;bd96   ; un hueco en las 4 de 0xEB80
	ld hl,0eb80h		;bd97
	ld de,00010h		;bd9a
	ld b,004h		;bd9d
L_BD9F:
	cp (hl)			;bd9f   ; libre?
	jr z,L_BDA8		;bda0
	add hl,de			;bda2   ; la siguiente
	djnz L_BD9F		;bda3
	or 0ffh		;bda5   ; ninguno: NZ
	ret			;bda7
L_BDA8:
	ld a,001h		;bda8   ; viva
	ld (hl),a			;bdaa
	inc l			;bdab   ; la altura
	ld a,(0f005h)		;bdac
	ld c,a			;bdaf
	ld (hl),a			;bdb0
	inc l			;bdb1
	ld a,(0f004h)		;bdb2   ; la entrada
	ld b,a			;bdb5
	ld (hl),a			;bdb6
	inc l			;bdb7
	ld (hl),c			;bdb8
	inc l			;bdb9
	ld (hl),b			;bdba
	inc l			;bdbb
	ld a,(0f006h)		;bdbc   ; 0xF006
	ld (hl),a			;bdbf
	inc l			;bdc0
	inc l			;bdc1
	inc l			;bdc2
	inc l			;bdc3
	ld a,010h		;bdc4   ; sus cuentas
	ld (hl),a			;bdc6
	inc l			;bdc7
	ld a,0cdh		;bdc8
	ld (hl),a			;bdca
	inc l			;bdcb
	xor a			;bdcc
	ld (hl),a			;bdcd
	inc l			;bdce
	ld a,014h		;bdcf
	ld (hl),a			;bdd1
	inc l			;bdd2
	ld (hl),c			;bdd3
	inc l			;bdd4
	ld (hl),b			;bdd5
	inc l			;bdd6
	ld a,008h		;bdd7
	ld (hl),a			;bdd9
	xor a			;bdda   ; Z: puesta
	ret			;bddb

; ----------------------------------------------------------------------
; DATOS resto_BDDC: lo apuntan con el banco puesto p12:BD77 (0xBDDC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BD77 (32 bytes)
;   0xbddc..0xbdfc  (32 bytes)
DATA_resto_BDDC:
	defb 0d4h,000h,068h,018h,001h,068h,044h,001h,068h,06ch,001h,028h,074h,001h,068h,078h	; bddc  ..h..hD.hl.(t.hx
	defb 001h,028h,0a8h,001h,068h,0ach,001h,028h,0b8h,001h,068h,0bch,001h,028h,0ffh,0ffh	; bdec  .(..h..(..h..(..

; ======================================================================
; CODIGO 0xbdfc..0xbea5  (169 bytes)
; ======================================================================


L_BDFC:
	ld a,(0e301h)		;bdfc   ; en la fase 5, las 4 de 0xEB80
	cp 005h		;bdff
	ret nz			;be01
	ld ix,0eb80h		;be02
	ld b,004h		;be06
L_BE08:
	push bc			;be08
	call L_BE15		;be09   ; una
	pop bc			;be0c
	ld de,00010h		;be0d   ; la siguiente (16)
	add ix,de		;be10
	djnz L_BE08		;be12
	ret			;be14
L_BE15:
	ld a,(ix+000h)		;be15   ; viva?
	or a			;be18
	ret z			;be19
	call L_BF02		;be1a   ; se mueve con el recorrido
	ret c			;be1d   ; fuera: C
	ld a,(ix+000h)		;be1e   ; el estado 1...
	dec a			;be21
	jr nz,L_BE83		;be22   ; ...2 o mas: p12:BE83
	dec (ix+00ch)		;be24   ; la espera
	ret nz			;be27
	push ix		;be28   ; crece: desde IX+01
	exx			;be2a
	pop hl			;be2b
	ld b,001h		;be2c
	ld a,001h		;be2e
	call 040c4h		;be30   ; hl_mas_a: HL = HL + A
L_BE33:
	call L_BEB5		;be33   ; hacia el jugador: la direccion
	ld a,c			;be36   ; de 8...
	and 007h		;be37
	ld (ix+00bh),a		;be39   ; ...en IX+0B
	ld c,a			;be3c
	ld b,008h		;be3d   ; 8 intentos
L_BE3F:
	ld a,c			;be3f   ; el paso de la direccion de p12:BEA5
	and 007h		;be40
	ld hl,0bea5h		;be42
	call 04e28h		;be45   ; palabra_de_hl: DE = la palabra HL + 2 x A
	exx			;be48
	dec hl			;be49
	ld a,(hl)			;be4a
	exx			;be4b
	add a,e			;be4c   ; la y + el paso...
	cp 0a0h		;be4d   ; ...dentro (menos de 0xA0)?
	jp nc,L_BE9F		;be4f
	ld l,a			;be52
	exx			;be53
	inc hl			;be54
	ld a,(hl)			;be55
	exx			;be56
	add a,d			;be57   ; la x + el paso...
	cp 0f0h		;be58   ; ...dentro (menos de 0xF0)?
	jp nc,L_BE9F		;be5a
	ld h,a			;be5d
	push hl			;be5e
	push bc			;be5f
	call 07eebh		;be60   ; libre?
	pop bc			;be63
	pop hl			;be64
	jr nc,L_BE6D		;be65   ; si: p12:BE6D
	inc c			;be67   ; si no, la direccion siguiente
	djnz L_BE3F		;be68
	jp L_BE9F		;be6a   ; ninguna: se acaba
L_BE6D:
	ld a,l			;be6d   ; el nuevo trozo: la y...
	exx			;be6e
	dec hl			;be6f
	ld (hl),a			;be70
	exx			;be71
	ld a,h			;be72   ; ...y la x
	exx			;be73
	inc hl			;be74
	ld (hl),a			;be75
	inc hl			;be76
	djnz L_BE33		;be77   ; los B
	exx			;be79
	inc (ix+00ah)		;be7a   ; el caracter + 1
	inc (ix+000h)		;be7d   ; el estado siguiente
	jp L_BF1D		;be80   ; y al mapa
L_BE83:
	inc (ix+00ah)		;be83   ; el caracter + 1...
	ld a,(ix+00ah)		;be86
	cp 0d2h		;be89   ; ...hasta 0xD2...
	jr z,L_BE90		;be8b
	jp L_BF1D		;be8d   ; ...y al mapa
L_BE90:
	dec (ix+000h)		;be90   ; 0xD2: el estado anterior...
	ld (ix+00ch),001h		;be93   ; ...1 cuadro...
	ld (ix+00ah),0cdh		;be97   ; ...el caracter 0xCD...
	dec (ix+009h)		;be9b   ; ...IX+09 - 1
	ret nz			;be9e
L_BE9F:
	ld (ix+000h),000h		;be9f   ; se acaba: C
	scf			;bea3
	ret			;bea4

; ----------------------------------------------------------------------
; DATOS resto_BEA5: lo apuntan con el banco puesto p12:BE42 (0xBEA5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BE42 (16 bytes)
;   0xbea5..0xbeb5  (16 bytes)
DATA_resto_BEA5:
	defb 0f8h,000h,0f8h,0f8h,000h,0f8h,008h,0f8h,008h,000h,008h,008h,000h,008h,0f8h,008h	; bea5  ................

; ======================================================================
; CODIGO 0xbeb5..0xbf2b  (118 bytes)
; ======================================================================


L_BEB5:
	exx			;beb5   ; a cual de los dos jugadores...
	ld a,(0e227h)		;beb6   ; lee cuantos jugadores (o el modo de dos)
	cp 002h		;beb9
	jr nz,L_BECE		;bebb
	call 04e58h		;bebd   ; ...con dos, al azar...
	rra			;bec0
	rra			;bec1
	jr c,L_BECE		;bec2
	ld a,(0e3a4h)		;bec4   ; ...el 2
	ld e,a			;bec7
	ld a,(0e3a6h)		;bec8
	ld d,a			;becb
	jr L_BED6		;becc
L_BECE:
	ld a,(0e324h)		;bece   ; el 1
	ld e,a			;bed1
	ld a,(0e326h)		;bed2
	ld d,a			;bed5
L_BED6:
	exx			;bed6
	ld a,(hl)			;bed7   ; la y - la del jugador
	exx			;bed8
	sub e			;bed9
	ld b,a			;beda
	exx			;bedb   ; la x - la del jugador
	inc hl			;bedc
	ld a,(hl)			;bedd
	exx			;bede
	sub d			;bedf
	ld c,000h		;bee0
	bit 7,a		;bee2   ; las dos diferencias, positivas...
	jr z,L_BEF0		;bee4
	ld c,a			;bee6   ; ...y el cuadrante en C (0, 2, 4, 6)...
	ld a,b			;bee7
	neg		;bee8
	ld b,a			;beea
	ld a,c			;beeb
	ld c,004h		;beec
	neg		;beee
L_BEF0:
	bit 7,b		;bef0
	jr z,L_BEFE		;bef2   ; la y positiva...
	inc c			;bef4   ; ...+ 1 si la otra es mayor
	inc c			;bef5
	ld d,a			;bef6   ; ...negativa: el cuadrante 2 o 3...
	ld a,b			;bef7
	neg		;bef8
	cp d			;befa   ; ...la mayor de las dos...
	ret c			;befb
	inc c			;befc   ; ...+ 1
	ret			;befd
L_BEFE:
	cp b			;befe
	ret c			;beff
	inc c			;bf00
	ret			;bf01
L_BF02:
	ld a,(0e627h)		;bf02   ; se mueve con el recorrido?
	or a			;bf05
	ret z			;bf06
	ld a,(ix+002h)		;bf07   ; la x - 8...
	sub 008h		;bf0a
	jr c,$-109		;bf0c   ; ...sale: fuera
	ld (ix+002h),a		;bf0e
	ld a,(ix+00eh)		;bf11   ; la de la cabeza - 8...
	sub 008h		;bf14
	jp c,L_BE9F		;bf16   ; ...sale: fuera
	ld (ix+00eh),a		;bf19
	ret			;bf1c
L_BF1D:
	ld l,(ix+001h)		;bf1d   ; el caracter (IX+0A) en el mapa (IX+01/02)
	ld h,(ix+002h)		;bf20
	call 05a99h		;bf23   ; hl_a_nombre: convierte las coordenadas de HL en una direccion de la tabla de nombres
	ld a,(ix+00ah)		;bf26
	ld (hl),a			;bf29
	ret			;bf2a

; ----------------------------------------------------------------------
; DATOS relleno_ff: 213 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (213 bytes)
;   0xbf2b..0xc000  (213 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf2b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf3b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf4b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf5b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf6b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf7b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf8b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf9b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; bffb
