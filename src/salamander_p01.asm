; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l7424h:	equ 0x07424

; ======================================================================
; CODIGO 0x6000..0x60cd  (205 bytes)
; ======================================================================


L_6000:
	call m,05adfh		;6000   ; negativo: le cambia el signo
	add hl,de			;6003   ; + DE
L_6004:
	ld a,015h		;6004   ; 21 filas
	ld de,00020h		;6006   ; 32 bytes de mas por fila (la RAM tiene 64)
L_6009:
	ld b,020h		;6009   ; 32 caracteres
L_600B:
	outi		;600b   ; al VDP
	jp nz,L_600B		;600d
	add hl,de			;6010   ; la fila siguiente
	dec a			;6011   ; las 21
	jp nz,L_6009		;6012
	ret			;6015
L_6016:
	ld hl,03800h		;6016   ; el mapa de la RAM a la tabla de nombres (0x3800)
	call 04cb1h		;6019   ; la direccion y el puerto
	exx			;601c
	ld hl,0ca00h		;601d   ; desde 0xCA00
	ld de,00020h		;6020   ; 32 de mas por fila
	exx			;6023
	ld b,015h		;6024   ; 21 filas
L_6026:
	exx			;6026
	ld b,020h		;6027   ; 32 caracteres
L_6029:
	ld a,(hl)			;6029   ; el caracter
	inc hl			;602a
	cp 052h		;602b   ; del 0x52...
	jr c,L_6034		;602d
	cp 0a2h		;602f   ; ...al 0xA1 (los de los enemigos)...
	jr nc,L_6034		;6031
	xor a			;6033   ; ...se pintan como hueco
L_6034:
	out (c),a		;6034   ; al VDP
	djnz L_6029		;6036   ; los 32
	add hl,de			;6038   ; la fila siguiente
	dec a			;6039
	exx			;603a
	djnz L_6026		;603b   ; las 21
	ret			;603d
L_603E:
	xor a			;603e   ; el reloj de 0xE630 a 0
	ld (0e630h),a		;603f
	ld a,(0e228h)		;6042   ; el jugador de 0xE228...
	ld iy,0e300h		;6045   ; ...el 1...
	xor (iy+021h)		;6049
	jr z,L_6052		;604c
	ld iy,0e380h		;604e   ; ...o el 2
L_6052:
	jp 05d62h		;6052   ; su marcador de armas (p00:5D62)
L_6055:
	ld iy,0e300h		;6055   ; los sprites de la nave: el jugador 1
	call L_6060		;6059
	ld iy,0e380h		;605c   ; y el 2
L_6060:
	ld a,(iy+020h)		;6060   ; IY+20: el estado del jugador
	or a			;6063
	ret z			;6064   ; 0: no esta
	cp 004h		;6065   ; 4: nada
	ret z			;6067
	cp 003h		;6068   ; 3: p01:60B9
	jr z,L_60B9		;606a
	cp 0ffh		;606c   ; 0xFF: p01:60A0 (explota)
	jr z,L_60A0		;606e
	ld a,(iy+027h)		;6070   ; el dibujo de la nave (IY+27)...
	add a,a			;6073   ; ...x 4
	add a,a			;6074
	ld hl,095f7h		;6075   ; en la tabla de p14:95F7: dos punteros
	call 040c4h		;6078   ; hl_mas_a: HL = HL + A
	push hl			;607b   ; se guarda
	bit 0,(iy+021h)		;607c   ; el jugador 1 en 0x1800...
	ld hl,01800h		;6080
	jr z,L_6088		;6083
	ld hl,01840h		;6085   ; ...el 2 en 0x1840
L_6088:
	call 04cb1h		;6088   ; la direccion de la VRAM y el puerto
	exx			;608b
	pop hl			;608c
	ld a,002h		;608d   ; dos sprites de 16 x 16
L_608F:
	ld e,(hl)			;608f   ; el puntero al dibujo
	inc hl			;6090
	ld d,(hl)			;6091
	inc hl			;6092
	ex de,hl			;6093   ; HL = el dibujo
	ld b,020h		;6094   ; 32 bytes
L_6096:
	outi		;6096   ; al VDP
	jp nz,L_6096		;6098
	ex de,hl			;609b   ; el siguiente puntero
	dec a			;609c   ; los dos
	jr nz,L_608F		;609d
	ret			;609f
L_60A0:
	ld hl,01a00h		;60a0   ; explotando: a 0x1A00
L_60A3:
	call 04cb1h		;60a3   ; la direccion y el puerto
	exx			;60a6
	ld a,(iy+027h)		;60a7   ; el dibujo (IY+27 & 0x7F)...
	and 07fh		;60aa
	add a,a			;60ac   ; ...x 8
	add a,a			;60ad
	add a,a			;60ae
	ld hl,0962fh		;60af   ; en la tabla de p14:962F: cuatro punteros
	call 040c4h		;60b2   ; hl_mas_a: HL = HL + A
	ld a,004h		;60b5   ; cuatro sprites
	jr L_608F		;60b7
L_60B9:
	ld hl,01800h		;60b9   ; el estado 3: a 0x1800
	jr L_60A3		;60bc
L_60BE:
	ld a,(iy+068h)		;60be   ; IY+68...
	ld hl,060cch		;60c1   ; ...en la tabla de p01:60CC
	call 05ad8h		;60c4   ; byte_de_tabla: A = el byte HL + A
	ld hl,028d8h		;60c7   ; la ventana de 0x28D8
	jp 05dfdh		;60ca   ; con esa pieza (p00:5DFD)

; ----------------------------------------------------------------------
; DATOS tabla_60CD: 7 bytes (p01:60C1: 0x60CC + IY+68, de 1 a 7); lo leen
;   p01:60C4 (7 bytes)
;   0x60cd..0x60d4  (7 bytes)
DATA_tabla_60CD:
	defb 004h,009h,008h,005h,00ch,00dh,00eh	; 60cd

; ======================================================================
; CODIGO 0x60d4..0x66c1  (1517 bytes)
; ======================================================================


L_60D4:
	ld de,00010h		;60d4   ; los atributos de sprite de los disparos: 16 bytes por ficha
	exx			;60d7
	ld ix,0ea00h		;60d8   ; los disparos (0xEA00)
	ld de,0efe0h		;60dc   ; a 0xEFE0
	ld b,008h		;60df   ; 8
L_60E1:
	ld a,(ix+000h)		;60e1   ; el disparo vivo?
	and a			;60e4
	jr z,L_6102		;60e5   ; no: fuera de la pantalla
	ld a,(ix+004h)		;60e7   ; la y
	ld (de),a			;60ea
	inc e			;60eb
	ld a,(ix+006h)		;60ec   ; la x
	ld (de),a			;60ef
	inc e			;60f0
	ld a,(ix+00bh)		;60f1   ; el dibujo
	ld (de),a			;60f4
	inc e			;60f5
	ld a,(ix+00ch)		;60f6   ; el color
	ld (de),a			;60f9
	inc e			;60fa
L_60FB:
	exx			;60fb   ; el siguiente
	add ix,de		;60fc
	exx			;60fe
	djnz L_60E1		;60ff   ; los 8
	ret			;6101
L_6102:
	ld a,0e0h		;6102   ; 0xE0: fuera de la pantalla
	ld (de),a			;6104
	inc e			;6105   ; y los otros tres bytes sin tocar
	inc e			;6106
	inc e			;6107
	inc e			;6108
	jp L_60FB		;6109
L_610C:
	ld a,(0e6aah)		;610c   ; 0xE6AA distinto de 0: nada
	or a			;610f
	ret nz			;6110
	call 041d8h		;6111   ; con el 14-15 en 0x8000-0xA000
	call L_611A		;6114   ; p01:611A
	jp 041d0h		;6117   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_611A:
	ld ix,0e700h		;611a   ; los atributos de sprite de los enemigos: 0xE700...
	ld de,0efb0h		;611e   ; ...a 0xEFB0
	ld b,00ch		;6121   ; 12
L_6123:
	push bc			;6123
	ld a,(ix+000h)		;6124   ; el tipo
	or a			;6127   ; vivo?
	jr z,L_615D		;6128   ; no: el siguiente
	bit 7,(ix+00bh)		;612a   ; IX+0B bit 7: se ve?
	jr z,L_615D		;612e   ; no: el siguiente
	cp 03fh		;6130   ; tipo 0x3F: p01:6217
	jp z,L_6217		;6132
	cp 03eh		;6135   ; 0x3E, 0x31, 0x32, 0x36: p01:620F
	jp z,L_620F		;6137
	cp 031h		;613a
	jp z,L_620F		;613c
	cp 032h		;613f
	jp z,L_620F		;6141
	cp 036h		;6144
	jp z,L_620F		;6146
	cp 040h		;6149   ; 0x40: p01:6170
	jp z,L_6170		;614b
	sub 039h		;614e   ; del 0x39 al 0x3D: p01:6168
	cp 005h		;6150
	jr c,L_6168		;6152
	bit 6,(ix+00bh)		;6154   ; IX+0B bit 6: con caracteres?
	jr z,L_6178		;6158   ; no: con sprites (p01:6178)
	call nz,L_61B6		;615a   ; si: p01:61B6
L_615D:
	exx			;615d
	ld de,00040h		;615e   ; 0x40 bytes por ficha
	add ix,de		;6161   ; la siguiente
	exx			;6163
	pop bc			;6164
	djnz L_6123		;6165   ; las 12
	ret			;6167
L_6168:
	push de			;6168
	call 04ebdh		;6169   ; p00:4EBD: en el mapa de la RAM
	pop de			;616c
	jp L_615D		;616d
L_6170:
	push de			;6170
	call 04f07h		;6171   ; p00:4F07
	pop de			;6174
	jp L_615D		;6175
L_6178:
	ld a,(ix+00bh)		;6178   ; cuantos sprites (IX+0B & 0x3F)
	and 03fh		;617b
	ld b,a			;617d
	jp z,L_615D		;617e   ; ninguno: el siguiente
	ld a,(ix+004h)		;6181   ; la y
	ld (de),a			;6184
	inc e			;6185
	ld a,(ix+006h)		;6186   ; la x
	ld (de),a			;6189
	inc e			;618a
	ld a,(ix+030h)		;618b   ; el dibujo (IX+30)
	ld (de),a			;618e
	inc e			;618f
	ld a,(ix+031h)		;6190   ; el color (IX+31)
	ld (de),a			;6193
	inc e			;6194
	dec b			;6195   ; uno menos
	jp z,L_615D		;6196   ; era el unico: el siguiente
	push ix		;6199   ; los demas, de IX+34 en adelante
	pop hl			;619b
	ld a,034h		;619c   ; + 0x34
	add a,l			;619e
	ld l,a			;619f
	jr nc,L_61A3		;61a0
	inc h			;61a2
L_61A3:
	push bc			;61a3
	ld a,(hl)			;61a4   ; la y
	ld (de),a			;61a5
	inc l			;61a6
	inc e			;61a7
	ld a,(hl)			;61a8   ; la x
	ld (de),a			;61a9
	inc l			;61aa
	inc e			;61ab
	ldi		;61ac   ; el dibujo y el color
	ldi		;61ae
	pop bc			;61b0
	djnz L_61A3		;61b1   ; todos
	jp L_615D		;61b3
L_61B6:
	ld a,(ix+004h)		;61b6   ; la y: de 0xB8 en adelante no se ve
	cp 0b8h		;61b9
	ret nc			;61bb   ; no se ve: fuera
	push de			;61bc
	ld de,090a1h		;61bd   ; la forma de IX+32 en la tabla de p14:90A1
	ld a,(ix+032h)		;61c0
	call 04e21h		;61c3   ; palabra_de_de: DE = la palabra DE + 2 x A
	ex de,hl			;61c6   ; HL = la forma
	ld e,(ix+011h)		;61c7   ; IX+11/12: su sitio en el mapa de la RAM
	ld d,(ix+012h)		;61ca
	ld b,(ix+013h)		;61cd   ; B = las filas (IX+13)
	ld c,(ix+006h)		;61d0   ; la x...
	xor a			;61d3   ; ...cuanto queda hasta el borde derecho
	sub c			;61d4
	jr nz,L_61D9		;61d5
	ld a,0f8h		;61d7   ; en 0: 0xF8
L_61D9:
	rra			;61d9   ; / 8: las columnas que caben
	rra			;61da
	rra			;61db
	and 01fh		;61dc
	ld c,(ix+014h)		;61de   ; el ancho (IX+14)
	cp c			;61e1   ; caben todas?
	jr nc,L_61E5		;61e2   ; si: el ancho
	ld c,a			;61e4   ; si no, las que caben
L_61E5:
	push bc			;61e5
	ld a,c			;61e6   ; una fila...
	ld b,000h		;61e7
	ldir		;61e9   ; ...a la RAM
	sub (ix+014h)		;61eb   ; lo que no ha cabido...
	jr z,L_61F7		;61ee
	neg		;61f0
	add a,l			;61f2   ; ...se salta de la forma
	ld l,a			;61f3
	jr nc,L_61F7		;61f4
	inc h			;61f6
L_61F7:
	pop bc			;61f7
	ld a,040h		;61f8   ; la fila siguiente de la RAM: 64 - lo copiado
	sub c			;61fa
	add a,e			;61fb
	ld e,a			;61fc
	jr nc,L_6200		;61fd
	inc d			;61ff
L_6200:
	djnz L_61E5		;6200   ; las filas
	pop de			;6202
	ret			;6203
L_6204:
	ld b,(ix+013h)		;6204   ; IX+13 filas...
L_6207:
	ld (hl),a			;6207   ; ...de A
	ld de,00040h		;6208   ; una por fila de la RAM
	add hl,de			;620b
	djnz L_6207		;620c
	ret			;620e
L_620F:
	push de			;620f
	call L_622B		;6210   ; p01:622B
	pop de			;6213
	jp L_615D		;6214
L_6217:
	push de			;6217
	call L_621F		;6218   ; p01:621F
	pop de			;621b
	jp L_615D		;621c
L_621F:
	ld a,(ix+020h)		;621f   ; IX+20 distinto de 0: se pinta
	and a			;6222
	jr nz,L_622B		;6223
	ld a,(ix+004h)		;6225   ; la y: de 0xB8 en adelante no
	cp 0b8h		;6228
	ret nc			;622a
L_622B:
	ld a,(ix+019h)		;622b   ; IX+19 bit 1: en horizontal o en vertical
	bit 1,a		;622e
	ld l,(ix+011h)		;6230   ; el sitio en el mapa de la RAM
	ld h,(ix+012h)		;6233
	jp z,L_6251		;6236   ; vertical: p01:6251
	ld a,(0e640h)		;6239   ; con jefe...
	and a			;623c
	ld b,0c8h		;623d   ; ...el caracter 0xC8...
	jr z,L_6243		;623f
	ld b,0a0h		;6241   ; ...o 0xA0
L_6243:
	ld a,(ix+032h)		;6243   ; y IX+32 bit 0
	and 001h		;6246
	add a,b			;6248
	ld b,(ix+014h)		;6249   ; el ancho
L_624C:
	ld (hl),a			;624c   ; a la RAM
	inc hl			;624d
	djnz L_624C		;624e   ; el ancho
	ret			;6250
L_6251:
	ld a,(0e640h)		;6251   ; en vertical: 0xCA...
	ld b,0cah		;6254
	and a			;6256
	jr z,L_625B		;6257
	ld b,0a2h		;6259   ; ...o 0xA2 con jefe
L_625B:
	ld a,(ix+032h)		;625b   ; y IX+32 bit 0
	and 001h		;625e
	add a,b			;6260
	jr L_6204		;6261   ; IX+13 filas
L_6263:
	call 041d8h		;6263   ; con el 14-15 puestos
	call L_626C		;6266   ; p01:626C
	jp 0416eh		;6269   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_626C:
	ld a,(0e6b2h)		;626c   ; cuantas piezas del decorado (0xE6B2)
	and a			;626f
	ret z			;6270   ; ninguna: fuera
	ld b,a			;6271   ; B = cuantas
	ld ix,0eb00h		;6272   ; las fichas de 0xEB00 (16 bytes)
L_6276:
	xor a			;6276   ; 0xF000 = 0: se pintan
	ld (0f000h),a		;6277
	ld a,(ix+000h)		;627a   ; el tipo
	and a			;627d
	jr z,L_62A5		;627e   ; 0: la siguiente
	cp 008h		;6280   ; los tipos 8, 0x0C, 0x13, 0x12 y 0x0E: p01:62B5
	jr z,L_62B5		;6282
	cp 00ch		;6284
	jr z,L_62B5		;6286
	cp 00bh		;6288   ; el 0x0B: la siguiente
	jr z,L_62A5		;628a
	cp 009h		;628c   ; el 9 y el 0x16: p01:62AD
	jr z,L_62AD		;628e
	cp 013h		;6290
	jr z,L_62B5		;6292
	cp 016h		;6294
	jr z,L_62AD		;6296
	cp 012h		;6298
	jr z,L_62B5		;629a
	cp 00eh		;629c
	jr z,L_62B5		;629e
L_62A0:
	push bc			;62a0
	call L_62C0		;62a1   ; p01:62C0: la pinta
	pop bc			;62a4
L_62A5:
	ld de,00010h		;62a5   ; 16 bytes por ficha
	add ix,de		;62a8   ; la siguiente
	djnz L_6276		;62aa   ; todas
	ret			;62ac
L_62AD:
	ld a,(ix+001h)		;62ad   ; IX+01 = 0xFF?
	inc a			;62b0
	jr nz,L_62A5		;62b1   ; no: la siguiente
	jr L_62BB		;62b3
L_62B5:
	ld a,(ix+001h)		;62b5   ; IX+01 = 0xFF?
	inc a			;62b8
	jr nz,L_62A0		;62b9   ; no: la pinta
L_62BB:
	call L_79FE		;62bb   ; p01:79FE
	jr L_62A5		;62be
L_62C0:
	jr L_62F4		;62c0
L_62C2:
	call 041d8h		;62c2   ; con el 14-15
	call L_62CB		;62c5   ; p01:62CB: las borra
	jp 0416eh		;62c8   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_62CB:
	ld a,(0e6b2h)		;62cb   ; cuantas piezas
	and a			;62ce
	ret z			;62cf
	ld b,a			;62d0
	ld ix,0eb00h		;62d1   ; 0xEB00
	ld a,0ffh		;62d5   ; 0xF000 = 0xFF: se borran
	ld (0f000h),a		;62d7
L_62DA:
	push bc			;62da
	ld a,(ix+000h)		;62db   ; el tipo 0x16...
	cp 016h		;62de
	jr nz,L_62E8		;62e0
	ld a,(ix+001h)		;62e2   ; ...con IX+01 = 0xFF no se borra
	inc a			;62e5
	jr nz,L_62EB		;62e6
L_62E8:
	call L_62F4		;62e8   ; p01:62F4
L_62EB:
	pop bc			;62eb
	ld de,00010h		;62ec   ; la siguiente
	add ix,de		;62ef
	djnz L_62DA		;62f1
	ret			;62f3
L_62F4:
	ld a,(ix+000h)		;62f4   ; el tipo
	and a			;62f7
	ret z			;62f8   ; 0: fuera
	cp 00bh		;62f9   ; 0x0B, 0x15, 0x14: fuera
	ret z			;62fb
	cp 015h		;62fc
	ret z			;62fe
	cp 014h		;62ff
	ret z			;6301
	ld a,(ix+007h)		;6302   ; la forma de IX+07 en la tabla de p14:8B8D
	ld de,08b8dh		;6305
	call 04e21h		;6308   ; palabra_de_de: DE = la palabra DE + 2 x A
	ld a,(ix+000h)		;630b   ; el tipo 2?
	cp 002h		;630e
	jr z,L_6330		;6310
	cp 004h		;6312   ; el 4?
	jr nz,L_6348		;6314
	ld a,(ix+001h)		;6316   ; IX+01 = 2?
	cp 002h		;6319
	jr nz,L_6330		;631b
	ld b,(ix+00ch)		;631d   ; IX+0C
	ld a,(ix+00bh)		;6320   ; IX+0B = 0?
	and a			;6323
	jr nz,L_632D		;6324
	ld a,014h		;6326   ; si: 20 - IX+0A - IX+0C
	sub (ix+00ah)		;6328
	sub b			;632b
	ld b,a			;632c
L_632D:
	ld a,b			;632d
	jr L_6341		;632e
L_6330:
	ld a,(ix+00ah)		;6330   ; IX+0A: las filas
	ld b,a			;6333
	and a			;6334   ; 0: fuera
	ret z			;6335
	ld a,(ix+00bh)		;6336   ; IX+0B = 0?
	and a			;6339
	jr z,L_6348		;633a
	ld a,b			;633c   ; si no: 20 - las filas
	sub 014h		;633d
	neg		;633f
L_6341:
	add a,a			;6341   ; x 6...
	ld b,a			;6342
	add a,a			;6343
	add a,b			;6344
	call 040c9h		;6345   ; ...se salta de la forma
L_6348:
	ld b,(ix+009h)		;6348   ; B = el ancho (IX+09), C = las filas (IX+0A)
	ld c,(ix+00ah)		;634b
	ld a,(0f000h)		;634e   ; pintar o borrar (0xF000)
	and a			;6351
	jp z,L_638E		;6352   ; borrar: p01:638E
	ld a,(0e620h)		;6355   ; en vertical?
	or a			;6358
	jr z,L_636B		;6359
	ld a,(ix+003h)		;635b   ; IX+03 = 0 y la y de 0x7F en adelante...
	and a			;635e
	jr nz,L_6370		;635f
	ld a,(ix+004h)		;6361
	cp 07fh		;6364
	jp nc,0502dh		;6366   ; ...p00:502D
	jr L_6370		;6369
L_636B:
	ld a,(ix+005h)		;636b   ; en horizontal: IX+05 = 1?
	dec a			;636e
	ret z			;636f   ; si: fuera
L_6370:
	push bc			;6370
	push de			;6371
	call L_64F8		;6372   ; la y y la x (p01:64F8)
	call 05aadh		;6375   ; a la direccion de la RAM
	pop de			;6378
	pop bc			;6379
	ex de,hl			;637a   ; HL = la forma, DE = la RAM
	ld a,c			;637b   ; las filas
L_637C:
	push de			;637c
	ld c,(ix+009h)		;637d   ; el ancho
	ld b,000h		;6380
	ldir		;6382   ; una fila
	pop de			;6384
	ld c,040h		;6385   ; la siguiente de la RAM (64)
	ex de,hl			;6387
	add hl,bc			;6388
	ex de,hl			;6389
	dec a			;638a   ; las filas
	jr nz,L_637C		;638b
	ret			;638d
L_638E:
	ld a,(0e620h)		;638e   ; borrar: en vertical?
	or a			;6391
	jr z,L_63A4		;6392
	ld a,(ix+003h)		;6394
	and a			;6397
	jr nz,L_63A9		;6398
	ld a,(ix+004h)		;639a
	cp 07fh		;639d
	jp nc,04fc2h		;639f   ; ...p00:4FC2
	jr L_63A9		;63a2
L_63A4:
	ld a,(ix+005h)		;63a4   ; en horizontal: IX+05 = 1?
	dec a			;63a7
	ret z			;63a8
L_63A9:
	push bc			;63a9
	call L_64F8		;63aa   ; la y y la x
	call 05aadh		;63ad   ; a la direccion de la RAM
	pop bc			;63b0
L_63B1:
	ld b,(ix+009h)		;63b1   ; el ancho
	push hl			;63b4
	xor a			;63b5   ; a cero
L_63B6:
	ld (hl),a			;63b6   ; borra
	inc hl			;63b7
	djnz L_63B6		;63b8
	pop hl			;63ba
	ld a,040h		;63bb   ; la siguiente fila
	call 040c4h		;63bd   ; hl_mas_a: HL = HL + A
	dec c			;63c0   ; las filas
	jr nz,L_63B1		;63c1
	ret			;63c3
L_63C4:
	ld c,00bh		;63c4   ; el sonido 0x0B...
	ld a,(ix+008h)		;63c6   ; ...si IX+08 no es 1
	dec a			;63c9
	ld a,c			;63ca
	call nz,04d6eh		;63cb   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ret			;63ce
L_63CF:
	push ix		;63cf
	call L_63D7		;63d1
	pop ix		;63d4
	ret			;63d6
L_63D7:
	ld a,(ix+000h)		;63d7   ; el tipo de la pieza
	cp 00ch		;63da   ; el 0x0C o el 8: p01:6450
	jr z,L_6450		;63dc
	cp 008h		;63de
	jr z,L_6450		;63e0
	cp 011h		;63e2   ; el 0x11: p01:647E
	call z,L_647E		;63e4
	cp 013h		;63e7   ; el 0x13: p01:64DD
	jp z,L_64DD		;63e9
	cp 012h		;63ec   ; el 0x12: p01:64D1
	jp z,L_64D1		;63ee
	cp 00eh		;63f1   ; el 0x0E: p01:64C9
	jp z,L_64C9		;63f3
	cp 016h		;63f6   ; el 0x16: p01:64C5
	jp z,L_64C5		;63f8
	cp 007h		;63fb   ; el 7: p01:64B8
	jp z,L_64B8		;63fd
L_6400:
	ld a,(ix+000h)		;6400   ; p01:79FE
	call L_79FE		;6403
	and a			;6406   ; 0: fuera
	ret z			;6407
	cp 001h		;6408   ; 1, 3 o 0x0A: p01:6415
	jr z,L_6415		;640a
	cp 003h		;640c
	jr z,L_6415		;640e
	cp 00ah		;6410
	jr z,L_6415		;6412
	ret nz			;6414   ; si no, fuera
L_6415:
	ld d,(ix+006h)		;6415   ; la x
	ld e,(ix+004h)		;6418   ; la y
	ld l,(ix+005h)		;641b   ; el byte alto de la y...
	ld h,(ix+003h)		;641e   ; ...y el de la x
	ld b,001h		;6421   ; B = 1
	call L_7AD2		;6423   ; p01:7AD2: en la pantalla?
	call z,L_6434		;6426   ; si: p01:6434
	ld a,(ix+00bh)		;6429   ; IX+0B bit 0...
	rra			;642c
	rl b		;642d   ; ...a B
	ld a,015h		;642f   ; 0x15
	jp L_7811		;6431   ; p01:7811
L_6434:
	ld a,(0e620h)		;6434   ; en vertical?
	and a			;6437
	jr z,L_6446		;6438   ; en horizontal: p01:6446
	ld a,e			;643a   ; por la y: menos de 0x28...
	cp 028h		;643b
	ld b,003h		;643d   ; ...B = 3...
	ret c			;643f
	dec b			;6440   ; ...de 0x60...
	cp 060h		;6441
	ret c			;6443
	dec b			;6444   ; ...1
	ret			;6445
L_6446:
	ld a,d			;6446   ; por la x: menos de 0x50, 1...
	cp 050h		;6447
	ret c			;6449
	inc b			;644a
	cp 0a8h		;644b   ; ...de 0xA8, 2...
	ret c			;644d
	inc b			;644e   ; ...si no, 3
	ret			;644f
L_6450:
	ld a,0ffh		;6450   ; IX+01 y IX+0D = 0xFF
	ld (ix+001h),a		;6452
	ld (ix+00dh),a		;6455
	ld a,(ix+00bh)		;6458   ; IX+0B distinto de 0?
	or a			;645b
	ld b,011h		;645c   ; 0x11
	jr nz,L_6471		;645e
	ld a,004h		;6460   ; 0x10: la y sube (4 - IX+0A) x 8
	sub (ix+00ah)		;6462
	add a,a			;6465
	add a,a			;6466
	add a,a			;6467
	neg		;6468
	add a,(ix+004h)		;646a
	ld (ix+004h),a		;646d
	dec b			;6470
L_6471:
	ld (ix+007h),b		;6471   ; IX+07 = la forma
	ld (ix+009h),004h		;6474   ; 4 x 4
	ld (ix+00ah),004h		;6478
	jr L_6415		;647c
L_647E:
	call L_79FE		;647e   ; p01:79FE
	call L_6486		;6481   ; p01:6486
	jr L_6415		;6484
L_6486:
	bit 1,(ix+00bh)		;6486   ; IX+0B bit 1?
	ret z			;648a   ; no: fuera
	ld a,(0e354h)		;648b   ; 0xE354?
	and a			;648e
	ret z			;648f   ; 0: fuera
	ld hl,0e6d2h		;6490   ; a 0xE6D2
	ld (hl),a			;6493
	inc l			;6494
	ld a,(ix+004h)		;6495   ; la y + 16
	add a,010h		;6498
	ld e,a			;649a
	ld (hl),a			;649b
	inc l			;649c
	ld a,(ix+006h)		;649d   ; la x
	ld d,a			;64a0
	ld (hl),a			;64a1
	ex de,hl			;64a2   ; a la direccion de la RAM
	call 05a99h		;64a3   ; hl_a_nombre: convierte las coordenadas de HL en una direccion de la tabla de nombres
	ld bc,00403h		;64a6   ; 3 filas de 4
L_64A9:
	push bc			;64a9
L_64AA:
	ld (hl),000h		;64aa   ; borra
	inc l			;64ac
	djnz L_64AA		;64ad
	ld a,l			;64af   ; la fila siguiente
	add a,03ch		;64b0
	ld l,a			;64b2
	pop bc			;64b3
	dec c			;64b4
	jr nz,L_64A9		;64b5   ; las 3
	ret			;64b7
L_64B8:
	ld a,(0e301h)		;64b8   ; en la fase 3...
	cp 003h		;64bb
	ld b,049h		;64bd   ; ...la forma 0x49...
	jr z,L_64DF		;64bf
	ld b,01dh		;64c1   ; ...si no, 0x1D
	jr L_64DF		;64c3
L_64C5:
	ld b,04ah		;64c5   ; la forma 0x4A
	jr L_64DF		;64c7
L_64C9:
	ld a,(0e301h)		;64c9   ; en la fase 5...
	cp 005h		;64cc
	jp nz,L_6400		;64ce   ; ...si no, p01:6400
L_64D1:
	ld b,058h		;64d1   ; la forma 0x58...
	bit 0,(ix+00bh)		;64d3
	jr nz,L_64DF		;64d7
	ld b,04bh		;64d9   ; ...o 0x4B segun IX+0B bit 0
	jr L_64DF		;64db
L_64DD:
	ld b,057h		;64dd   ; la forma 0x57
L_64DF:
	ld a,0ffh		;64df   ; IX+01 y IX+0D = 0xFF
	ld (ix+001h),a		;64e1
	ld (ix+00dh),a		;64e4
	ld (ix+007h),b		;64e7   ; IX+07 = la forma
	ld a,(ix+000h)		;64ea   ; el 0x12 y el 0x0E siguen en p01:6415
	cp 012h		;64ed
	jp z,L_6415		;64ef
	cp 00eh		;64f2
	jp z,L_6415		;64f4
	ret			;64f7
L_64F8:
	ld l,(ix+004h)		;64f8   ; HL = la y (IX+03 alto, IX+04 bajo)
	ld h,(ix+003h)		;64fb
	ld e,(ix+006h)		;64fe   ; DE = la x (IX+05 alto, IX+06 bajo)
	ld d,(ix+005h)		;6501
	ret			;6504
L_6505:
	ld e,(ix+020h)		;6505   ; IX+20/21...
	ld d,(ix+021h)		;6508
	call 05adfh		;650b   ; ...cambiado de signo
L_650E:
	ld (ix+020h),e		;650e   ; IX+20/21 = DE
	ld (ix+021h),d		;6511
	ret			;6514
L_6515:
	ld (ix+020h),e		;6515
	ld (ix+021h),d		;6518
	ret			;651b
L_651C:
	ld a,d			;651c   ; DE sin signo...
	or a			;651d
	call m,05adfh		;651e   ; menos_de: DE = -DE
	ld (ix+022h),e		;6521   ; ...a IX+22/23
	ld (ix+023h),d		;6524
	ret			;6527
L_6528:
	ld a,(ix+007h)		;6528   ; IX+07/08 + IX+20/21
	add a,(ix+020h)		;652b
	ld (ix+007h),a		;652e
	ld a,(ix+008h)		;6531
	adc a,(ix+021h)		;6534
	ld (ix+008h),a		;6537
	ret			;653a
L_653B:
	ld a,(ix+009h)		;653b   ; IX+09/0A + IX+20/21
	add a,(ix+020h)		;653e
	ld (ix+009h),a		;6541
	ld a,(ix+00ah)		;6544
	adc a,(ix+021h)		;6547
	ld (ix+00ah),a		;654a
	ret			;654d
L_654E:
	ld e,(ix+007h)		;654e   ; IX+07/08 sin signo...
	ld d,(ix+008h)		;6551
	ld a,d			;6554
	or a			;6555
	call m,05adfh		;6556   ; menos_de: DE = -DE
	ld l,(ix+022h)		;6559   ; ...comparado con IX+22/23
	ld h,(ix+023h)		;655c
	rst 20h			;655f
	ret			;6560
L_6561:
	ld e,(ix+009h)		;6561   ; IX+09/0A cambiado de signo
	ld d,(ix+00ah)		;6564
	call 05adfh		;6567   ; menos_de: DE = -DE
	ld (ix+009h),e		;656a
	ld (ix+00ah),d		;656d
	ret			;6570
L_6571:
	ld e,(ix+007h)		;6571   ; IX+07/08 cambiado de signo
	ld d,(ix+008h)		;6574
	call 05adfh		;6577   ; menos_de: DE = -DE
	ld (ix+007h),e		;657a
	ld (ix+008h),d		;657d
	ret			;6580
L_6581:
	ld a,(0e203h)		;6581   ; la cuenta de cuadros & 0x1F: Z una vez cada 32
	and 01fh		;6584
	ret			;6586
L_6587:
	call L_6581		;6587   ; una vez cada 32 cuadros...
	ret nz			;658a
	dec (ix+025h)		;658b   ; ...IX+25 - 1
	ret nz			;658e
	xor a			;658f   ; llego: Z
	ret			;6590
anima_c:		; cada (B+1) cuadros avanza IX+26 de 0 a C-1
	ld a,(0e203h)		;6591   ; la cuenta de cuadros...
	and b			;6594   ; ...& B: cada B + 1 cuadros
	ret nz			;6595
	ld a,(ix+026h)		;6596   ; el cuadro de la animacion
	inc a			;6599   ; + 1
	cp c			;659a   ; hasta C...
	jr c,L_659E		;659b
	xor a			;659d   ; ...y vuelve a 0
L_659E:
	ld (ix+026h),a		;659e   ; se guarda
	call 05ad8h		;65a1   ; el dibujo de la tabla HL
	ld (ix+030h),a		;65a4   ; a IX+30 (el sprite)...
	ld (ix+032h),a		;65a7   ; ...y a IX+32 (el caracter)
	ret			;65aa
azar_r:		; un numero al azar: R girado y mezclado con la cuenta de cuadros (0xE203)
	ld a,r		;65ab   ; R...
	rrca			;65ad   ; ...girado tres veces
	rrca			;65ae
	rrca			;65af
	ld hl,0e203h		;65b0   ; apunta a la cuenta de cuadros del juego
	xor (hl)			;65b3   ; XOR la cuenta de cuadros
	ret			;65b4
crea_enemigo_ix:		; crea un enemigo de tipo A guardando IX
	push ix		;65b5
	call crea_enemigo		;65b7   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
	pop ix		;65ba
	ret			;65bc
crea_enemigo:		; crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
	ld (0e650h),a		;65bd   ; el tipo
	cp 023h		;65c0   ; el 0x23...
	jr nz,L_65C9		;65c2
	ld a,(0e689h)		;65c4   ; ...solo si 0xE689 es 0
	or a			;65c7
	ret nz			;65c8
L_65C9:
	ld (0f019h),de		;65c9   ; la posicion (DE) en 0xF019
	ld a,l			;65cd   ; L y H en 0xE65D y 0xE65C
	ld (0e65dh),a		;65ce
	ld a,h			;65d1
	ld (0e65ch),a		;65d2
	ld a,b			;65d5   ; B en 0xE65F
	ld (0e65fh),a		;65d6
	xor a			;65d9   ; 0xE653 = 0
	ld (0e653h),a		;65da
	ld a,c			;65dd   ; C en 0xE651
	ld (0e651h),a		;65de
	ld hl,0e700h		;65e1   ; un hueco en los 12 enemigos
	ld b,00ch		;65e4
	ld de,00040h		;65e6
	xor a			;65e9   ; tipo 0
L_65EA:
	cp (hl)			;65ea   ; libre?
	jr z,L_65F2		;65eb   ; si: p01:65F2
	add hl,de			;65ed   ; el siguiente
	djnz L_65EA		;65ee
	xor a			;65f0   ; no hay: A = 0
	ret			;65f1
L_65F2:
	push hl			;65f2   ; se guarda el hueco
	ld a,(0e650h)		;65f3   ; la ficha del tipo: 0x6C5D + 7 x tipo
	ld l,a			;65f6
	ld h,000h		;65f7
	ld e,l			;65f9
	ld d,h			;65fa
	add hl,hl			;65fb
	add hl,hl			;65fc
	add hl,hl			;65fd
	or a			;65fe
	sbc hl,de		;65ff
	ld de,06c5dh		;6601
	add hl,de			;6604
	ex de,hl			;6605
	pop hl			;6606
	ld a,(de)			;6607   ; el primer byte: bit 6...
	bit 6,a		;6608
	jr nz,L_661C		;660a   ; ...con el no cuenta
	and 03fh		;660c   ; sus bits 0-5: lo que pesa
	ld b,a			;660e
	ld a,(0e655h)		;660f   ; 0xE655: lo que pesan los que hay
	add a,b			;6612   ; + este
	cp 00dh		;6613   ; cabe (menos de 13)?
	jr c,L_6619		;6615   ; si
	xor a			;6617   ; no: no se crea
	ret			;6618
L_6619:
	ld (0e655h),a		;6619   ; lo que pesan ahora
L_661C:
	push de			;661c
	ld de,(0f019h)		;661d   ; la posicion
	exx			;6621
	ld hl,0e652h		;6622   ; 0xE652: cuantos enemigos
	inc (hl)			;6625   ; uno mas
	exx			;6626
	push hl			;6627   ; IX = el hueco
	pop ix		;6628
	ld a,(0e650h)		;662a   ; el tipo...
	ld (0e653h),a		;662d   ; ...en 0xE653...
	ld (hl),a			;6630   ; ...y en IX+00
	inc l			;6631
	xor a			;6632
	ld (hl),a			;6633   ; IX+01-03 a 0
	inc l			;6634
	ld (hl),a			;6635
	inc l			;6636
	ld (hl),a			;6637
	inc l			;6638
	ld (hl),e			;6639   ; IX+04 = E (la y)
	inc l			;663a
	ld (hl),a			;663b   ; IX+05 = 0
	inc l			;663c
	ld (hl),d			;663d   ; IX+06 = D (la x)
	ld de,00005h		;663e
	add hl,de			;6641
	pop de			;6642
	ex de,hl			;6643
	ldi		;6644   ; IX+0B, el 2.o byte de la ficha del tipo
	ld a,(0e651h)		;6646   ; IX+0C = C
	ld (de),a			;6649
	inc e			;664a
	ldi		;664b   ; IX+0D-0F, el 3.o al 5.o
	ldi		;664d
	ldi		;664f
	ld a,007h		;6651   ; IX+10 = 7
	ld (de),a			;6653
	ld a,005h		;6654
	call 040c9h		;6656   ; IX+15...
	call L_67CA		;6659   ; ...p01:67CA
	ld (de),a			;665c   ; IX+16
	inc e			;665d
	ld a,(0e650h)		;665e   ; el tipo 0x26: p01:667F
	cp 026h		;6661
	jr z,L_667F		;6663
	xor a			;6665   ; IX+17 = 0
	ld (de),a			;6666
	ld a,(0e650h)		;6667   ; los tipos 0x0A, 0x0B y 0x31...
	cp 00ah		;666a
	jr z,L_6676		;666c
	cp 00bh		;666e
	jr z,L_6676		;6670
	cp 031h		;6672
	jr nz,L_667F		;6674
L_6676:
	ld a,001h		;6676   ; ...IX+17 = 1 e IX+18 = 0xE696
	ld (de),a			;6678
	inc e			;6679
	ld a,(0e696h)		;667a
	ld (de),a			;667d
	dec e			;667e
L_667F:
	inc e			;667f   ; IX+19 = 0
	inc e			;6680
	xor a			;6681
	ld (de),a			;6682
	inc e			;6683
	ld a,(0e65fh)		;6684   ; IX+1A = B
	ld (de),a			;6687
	inc e			;6688
	xor a			;6689   ; IX+1B = 0
	ld (de),a			;668a
	ld a,006h		;668b   ; 6 mas: IX+21
	call 040c9h		;668d   ; de_mas_a: DE = DE + A
	ld a,(0e650h)		;6690   ; el tipo 0x3F...
	cp 03fh		;6693
	jr nz,L_66A1		;6695
	ld a,(0e65dh)		;6697   ; ...IX+21/22 = L y H
	ld (de),a			;669a
	inc e			;669b
	ld a,(0e65ch)		;669c
	ld (de),a			;669f
	dec e			;66a0
L_66A1:
	ld a,010h		;66a1   ; 16 mas: IX+31
	call 040c9h		;66a3   ; de_mas_a: DE = DE + A
	ldi		;66a6   ; IX+31, el 6.o byte de la ficha del tipo
	ld a,(hl)			;66a8   ; IX+32: el 7.o & 0x0F
	and 00fh		;66a9
	ld (de),a			;66ab
	inc hl			;66ac
	inc de			;66ad
	ldi		;66ae   ; IX+33...
	ld a,(0e651h)		;66b0   ; 0xE651 distinto de 0...
	and a			;66b3
	jr z,L_66BA		;66b4
	ld (ix+031h),008h		;66b6   ; ...IX+31 = 8
L_66BA:
	ld a,(0e650h)		;66ba   ; el tipo - 1...
	dec a			;66bd
	call 040ceh		;66be   ; ...por la tabla de detras: su rutina de arranque

; ----------------------------------------------------------------------
; DATOS tabla_66C1: 65 destinos del despachador p00:40CE (call en p01:66BE, el
;   indice en A): 8077, 67A6, A103, 9F78, 679D, 678B, A02D, A18A, A23A, 6767,
;   6743, 674C, 6755, 9343, A784, B954, 6794, A4E5, 67E0, BB83, BABB, 675E,
;   67B8, 67AF, A2BE, 67E0, A295, 6779, 6782, A2E6, A385, A3FB, BDBF, 67E0,
;   9326, 9E3C, BD00, 81F6, BD30, 6770, 824E, 825B, 67E0, 67E0, 67E0, 67E0,
;   67E0, A460, 90F8, 90FC, 9343, 92C5, BBBA, BF36, 67E0, 67C1, 9EDE, 9EE7,
;   9EEF, 9EF7, 9F00, B8C2, BA37, 9DBC, 9D29; lo leen p01:66BE (130 bytes)
;   0x66c1..0x6743  (130 bytes)
DATA_tabla_66C1:
	defw 08077h,067a6h,0a103h,09f78h,0679dh,0678bh,0a02dh,0a18ah	; 66c1
	defw 0a23ah,06767h,06743h,0674ch,06755h,09343h,0a784h,0b954h	; 66d1
	defw 06794h,0a4e5h,067e0h,0bb83h,0babbh,0675eh,067b8h,067afh	; 66e1
	defw 0a2beh,067e0h,0a295h,06779h,06782h,0a2e6h,0a385h,0a3fbh	; 66f1
	defw 0bdbfh,067e0h,09326h,09e3ch,0bd00h,081f6h,0bd30h,06770h	; 6701
	defw 0824eh,0825bh,067e0h,067e0h,067e0h,067e0h,067e0h,0a460h	; 6711
	defw 090f8h,090fch,09343h,092c5h,0bbbah,0bf36h,067e0h,067c1h	; 6721
	defw 09edeh,09ee7h,09eefh,09ef7h,09f00h,0b8c2h,0ba37h,09dbch	; 6731
	defw 09d29h	; 6741

; ======================================================================
; CODIGO 0x6743..0x67e1  (158 bytes)
; ======================================================================


L_6743:
	call 041bbh		;6743   ; el arranque del tipo en el banco 6: p06:BE62
	call 0be62h		;6746
	jp 041d0h		;6749   ; y vuelve al 3
L_674C:
	call 041cbh		;674c   ; los arranques con el 12 en 0xA000: p12:A715
	call 0a715h		;674f
	jp 041d0h		;6752   ; de vuelta el 2 y el 3
L_6755:
	call 041cbh		;6755   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a784h		;6758   ; p12:A784
	jp 041d0h		;675b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_675E:
	call 041cbh		;675e   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a804h		;6761   ; p12:A804
	jp 041d0h		;6764   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6767:
	call 041cbh		;6767   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a871h		;676a   ; p12:A871
	jp 041d0h		;676d   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6770:
	call 041cbh		;6770   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b01ah		;6773   ; p12:B01A
	jp 041d0h		;6776   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6779:
	call 041cbh		;6779   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0aaedh		;677c   ; p12:AAED
	jp 041d0h		;677f   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6782:
	call 041cbh		;6782   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0aaf9h		;6785   ; p12:AAF9
	jp 041d0h		;6788   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_678B:
	call 041cbh		;678b   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0acd4h		;678e   ; p12:ACD4
	jp 041d0h		;6791   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6794:
	call 041cbh		;6794   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a99ah		;6797   ; p12:A99A
	jp 041d0h		;679a   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_679D:
	call 041cbh		;679d   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0ae10h		;67a0   ; p12:AE10
	jp 041d0h		;67a3   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_67A6:
	call 041cbh		;67a6   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b250h		;67a9   ; p12:B250
	jp 041d0h		;67ac   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_67AF:
	call 041cbh		;67af   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b31eh		;67b2   ; p12:B31E
	jp 041d0h		;67b5   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_67B8:
	call 041cbh		;67b8   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b47ch		;67bb   ; p12:B47C
	jp 041d0h		;67be   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_67C1:
	call 041bfh		;67c1   ; con el 11 en 0xA000: p11:A469
	call 0a469h		;67c4
	jp 041d0h		;67c7   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_67CA:
	push hl			;67ca   ; un numero de la tabla de 0x67E1...
	ld hl,067e1h		;67cb
	jr L_67D4		;67ce
L_67D0:
	push hl			;67d0   ; ...o de la de 0x67F1
	ld hl,067f1h		;67d1
L_67D4:
	ld a,(0e64fh)		;67d4   ; la dificultad (0xE64F)
	call 040c4h		;67d7   ; su entrada
	ld a,r		;67da   ; mas R & 7: un poco al azar
	and 007h		;67dc
	add a,(hl)			;67de
	pop hl			;67df
L_67E0:
	ret			;67e0

; ----------------------------------------------------------------------
; DATOS tabla_67E1: 16 bytes que p01:67D4 elige con 0xE64F (y le suma R & 7);
;   lo leen p01:67CB (16 bytes)
;   0x67e1..0x67f1  (16 bytes)
DATA_tabla_67E1:
	defb 068h,060h,048h,040h,038h,030h,028h,024h,020h,01ch,01ah,018h,014h,010h,00eh,00ch	; 67e1  h`H@80($ .......

; ----------------------------------------------------------------------
; DATOS tabla_67F1: 16 bytes que p01:67D4 elige con 0xE64F (y le suma R & 7);
;   lo leen p01:67D1 (16 bytes)
;   0x67f1..0x6801  (16 bytes)
DATA_tabla_67F1:
	defb 040h,038h,030h,02bh,027h,023h,020h,01dh,01ah,018h,016h,014h,012h,010h,00eh,00ch	; 67f1  @80+'# .........

; ======================================================================
; CODIGO 0x6801..0x68f1  (240 bytes)
; ======================================================================


L_6801:
	ld e,(ix+004h)		;6801   ; la y
	ld d,(ix+006h)		;6804   ; la x
L_6807:
	call L_6828		;6807   ; p01:6828 y p01:752E
	call L_752E		;680a
L_680D:
	ld de,(0f012h)		;680d   ; la velocidad x de 0xF012 a IX+07/08
	call pon_ix07		;6811   ; pon_ix07: IX+07/08 = DE
	ld de,(0f014h)		;6814   ; y la y de 0xF014 a IX+09/0A
	jr pon_ix09		;6818
L_681A:
	call L_6828		;681a   ; p01:6828
	ld e,(ix+004h)		;681d   ; la y y la x
	ld d,(ix+006h)		;6820
	call L_7522		;6823   ; p01:7522
	jr L_680D		;6826
L_6828:
	push af			;6828   ; p01:74B4 guardando A y HL
	push hl			;6829
	call L_74B4		;682a
	pop hl			;682d
	pop af			;682e
	ret			;682f
L_6830:
	ld a,080h		;6830   ; A = 0x80
L_6832:
	ld e,(ix+004h)		;6832   ; la y y la x
	ld d,(ix+006h)		;6835
	ld (0f00fh),a		;6838   ; A en 0xF00F
	ld a,h			;683b   ; H en 0xF000
	ld (0f000h),a		;683c
	ld a,l			;683f   ; L en 0xF001
	ld (0f001h),a		;6840
	call L_75B4		;6843   ; p01:75B4: la direccion hacia (H, L)
	ld d,001h		;6846   ; D = 1
	call L_7536		;6848   ; p01:7536
	ld de,(0f014h)		;684b   ; la velocidad y...
	call pon_ix09		;684f   ; ...a IX+09/0A
	ld de,(0f012h)		;6852   ; la x a IX+07/08
pon_ix07:		; IX+07/08 = DE
	ld (ix+007h),e		;6856   ; IX+07/08 = DE
	ld (ix+008h),d		;6859
	ret			;685c
pon_ix09:		; IX+09/0A = DE
	ld (ix+009h),e		;685d   ; IX+09/0A = DE
	ld (ix+00ah),d		;6860
	ret			;6863
L_6864:
	ld e,(ix+009h)		;6864   ; DE = IX+09/0A
	ld d,(ix+00ah)		;6867
	ret			;686a
L_686B:
	ld e,(ix+007h)		;686b   ; DE = IX+07/08
	ld d,(ix+008h)		;686e
	ret			;6871
L_6872:
	call L_687C		;6872   ; IX+09/0A a 0 e IX+07/08 = DE
	jr pon_ix07		;6875
L_6877:
	ld d,000h		;6877   ; IX+07/08 = 0
	ld e,d			;6879
	jr pon_ix07		;687a
L_687C:
	ld d,000h		;687c   ; IX+09/0A = 0
	ld e,d			;687e
	jr pon_ix09		;687f
L_6881:
	call pon_ix09		;6881   ; IX+09/0A = DE e IX+07/08 = HL
	ex de,hl			;6884
	jr pon_ix07		;6885
L_6887:
	ld e,(ix+009h)		;6887   ; IX+09/0A...
	ld d,(ix+00ah)		;688a
	call 05adfh		;688d   ; ...cambiado de signo
	ld (ix+009h),e		;6890
	ld (ix+00ah),d		;6893
	ret			;6896
L_6897:
	ld e,(ix+007h)		;6897   ; IX+07/08...
	ld d,(ix+008h)		;689a
	call 05adfh		;689d   ; ...cambiado de signo
	ld (ix+007h),e		;68a0
	ld (ix+008h),d		;68a3
	ret			;68a6
L_68A7:
	ld ix,0e700h		;68a7   ; los 12 enemigos
	ld b,00ch		;68ab
L_68AD:
	push bc			;68ad
	ld a,(ix+000h)		;68ae   ; el tipo
	and a			;68b1
	jr z,L_68DA		;68b2   ; libre: el siguiente
	call L_68E3		;68b4   ; p01:68E3: su rutina
	ld a,(ix+000h)		;68b7   ; ha muerto?
	or a			;68ba
	jr z,L_68DA		;68bb   ; si: el siguiente
	call L_6A03		;68bd   ; p01:6A03: con el scroll en horizontal
	jr c,L_68DA		;68c0   ; se ha salido: el siguiente
	call L_6A6F		;68c2   ; p01:6A6F: con el scroll en vertical
	jr c,L_68DA		;68c5
	call L_6AEB		;68c7   ; p01:6AEB: se mueve y mira si se sale
	ld a,(ix+000h)		;68ca   ; el tipo 0x16...
	cp 016h		;68cd
	call z,L_6C3F		;68cf   ; ...p01:6C3F
	ld a,(ix+000h)		;68d2   ; el tipo 0x24...
	cp 024h		;68d5
	call z,09e58h		;68d7   ; ...p02:9E58
L_68DA:
	ld bc,00040h		;68da   ; 0x40 bytes por ficha
	add ix,bc		;68dd
	pop bc			;68df   ; los 12
	djnz L_68AD		;68e0
L_68E2:
	ret			;68e2
L_68E3:
	ld a,(ix+000h)		;68e3   ; el tipo 0x26...
	cp 026h		;68e6   ; ...igual que los demas
	jr z,L_68EA		;68e8
L_68EA:
	ld a,(ix+000h)		;68ea   ; el tipo - 1...
	dec a			;68ed
	call 040ceh		;68ee   ; ...por la tabla de detras: su rutina de cada cuadro

; ----------------------------------------------------------------------
; DATOS tabla_68F1: 65 destinos del despachador p00:40CE (call en p01:68EE, el
;   indice en A): 80E9, 69CD, A121, 9FB2, 69C4, 69B2, A086, A1AA, A257, 698E,
;   6973, 697C, A2DC, 9387, A2DC, B985, 69BB, A50F, 68E2, BB9B, BAD5, 6985,
;   69DF, 69D6, A2DC, 68E2, A2A6, 69A0, 69A9, A305, A3A3, A426, BDF2, 68E2,
;   937D, 9E65, 69F1, 820D, BD35, 6997, 68E2, 68E2, 68E2, 68E2, 68E2, 68E2,
;   68E2, A46D, 9129, 9129, 9387, 92F9, BBEC, BEBC, 68E2, 69FA, 9F22, 9F22,
;   9F22, 9F22, 9F22, BEBC, 69E8, 9DE3, 9D47; lo leen p01:68EE (130 bytes)
;   0x68f1..0x6973  (130 bytes)
DATA_tabla_68F1:
	defw 080e9h,069cdh,0a121h,09fb2h,069c4h,069b2h,0a086h,0a1aah	; 68f1
	defw 0a257h,0698eh,06973h,0697ch,0a2dch,09387h,0a2dch,0b985h	; 6901
	defw 069bbh,0a50fh,068e2h,0bb9bh,0bad5h,06985h,069dfh,069d6h	; 6911
	defw 0a2dch,068e2h,0a2a6h,069a0h,069a9h,0a305h,0a3a3h,0a426h	; 6921
	defw 0bdf2h,068e2h,0937dh,09e65h,069f1h,0820dh,0bd35h,06997h	; 6931
	defw 068e2h,068e2h,068e2h,068e2h,068e2h,068e2h,068e2h,0a46dh	; 6941
	defw 09129h,09129h,09387h,092f9h,0bbech,0bebch,068e2h,069fah	; 6951
	defw 09f22h,09f22h,09f22h,09f22h,09f22h,0bebch,069e8h,09de3h	; 6961
	defw 09d47h	; 6971

; ======================================================================
; CODIGO 0x6973..0x6c64  (753 bytes)
; ======================================================================


L_6973:
	call 041bbh		;6973   ; las rutinas de cada cuadro en el banco 6: p06:BE86
	call 0be86h		;6976
	jp 041d0h		;6979   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_697C:
	call 041cbh		;697c   ; las del 12: p12:A81A
	call 0a81ah		;697f
	jp 041d0h		;6982   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6985:
	call 041cbh		;6985   ; p12:A832
	call 0a832h		;6988
	jp 041d0h		;698b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_698E:
	call 041cbh		;698e   ; p12:A8C6
	call 0a8c6h		;6991
	jp 041d0h		;6994   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6997:
	call 041cbh		;6997   ; p12:B044
	call 0b044h		;699a
	jp 041d0h		;699d   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69A0:
	call 041cbh		;69a0   ; p12:AB27
	call 0ab27h		;69a3
	jp 041d0h		;69a6   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69A9:
	call 041cbh		;69a9   ; p12:AB71
	call 0ab71h		;69ac
	jp 041d0h		;69af   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69B2:
	call 041cbh		;69b2   ; p12:AD06
	call 0ad06h		;69b5
	jp 041d0h		;69b8   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69BB:
	call 041cbh		;69bb   ; p12:A9C6
	call 0a9c6h		;69be
	jp 041d0h		;69c1   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69C4:
	call 041cbh		;69c4   ; p12:AE84
	call 0ae84h		;69c7
	jp 041d0h		;69ca   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69CD:
	call 041cbh		;69cd   ; p12:B284
	call 0b284h		;69d0
	jp 041d0h		;69d3   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69D6:
	call 041cbh		;69d6   ; p12:B35E
	call 0b35eh		;69d9
	jp 041d0h		;69dc   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69DF:
	call 041cbh		;69df   ; p12:B4BB
	call 0b4bbh		;69e2
	jp 041d0h		;69e5   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69E8:
	call 041cbh		;69e8   ; p12:BAA0
	call 0baa0h		;69eb
	jp 041d0h		;69ee   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69F1:
	call 041cbh		;69f1   ; p12:BD13
	call 0bd13h		;69f4
	jp 041d0h		;69f7   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_69FA:
	call 041bfh		;69fa   ; la del 11: p11:A4B5
	call 0a4b5h		;69fd
	jp 041d0h		;6a00   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6A03:
	ld a,(ix+010h)		;6a03   ; IX+10 bit 3: se mueve con el scroll?
	and 008h		;6a06
	ret z			;6a08   ; no: fuera
	ld a,(0e627h)		;6a09   ; 0xE627: hay columna nueva?
	and a			;6a0c
	ret z			;6a0d   ; no: fuera
	ld a,(ix+000h)		;6a0e   ; el tipo 0x3F: p01:6A2E
	cp 03fh		;6a11
	jr z,L_6A2E		;6a13
	ld a,(0e627h)		;6a15   ; hacia donde
	bit 7,a		;6a18
	ld a,(ix+006h)		;6a1a   ; la x
	jr z,L_6A23		;6a1d   ; bit 7: a la derecha
	add a,008h		;6a1f   ; + 8
	jr L_6A25		;6a21
L_6A23:
	sub 008h		;6a23   ; - 8
L_6A25:
	ld (ix+006h),a		;6a25   ; se guarda
	ret nc			;6a28   ; sin pasarse: fuera
	call L_6B62		;6a29   ; se sale: p01:6B62 (fuera)
	scf			;6a2c   ; acarreo: se ha ido
	ret			;6a2d
L_6A2E:
	ld a,(ix+019h)		;6a2e   ; el tipo 0x3F: IX+19 = 3?
	cp 003h		;6a31
	jr nz,L_6A48		;6a33
	ld a,(ix+021h)		;6a35   ; IX+21 (x alta) = 0?
	and a			;6a38
	jr nz,L_6A48		;6a39
	ld a,(ix+006h)		;6a3b   ; y la x = 0?
	and a			;6a3e
	jr nz,L_6A48		;6a3f
	dec (ix+014h)		;6a41   ; IX+14 - 1...
	jp z,L_6B62		;6a44   ; ...llega a 0: fuera
	ret			;6a47
L_6A48:
	ld a,(0e627h)		;6a48   ; la x de 16 bits (IX+06, IX+21)
	bit 7,a		;6a4b
	ld l,(ix+006h)		;6a4d
	ld h,(ix+021h)		;6a50
	ld de,00008h		;6a53   ; 8
	jr z,L_6A60		;6a56   ; bit 7: a la derecha
	add hl,de			;6a58   ; + 8
	ld de,00150h		;6a59   ; llega a 0x150?
	rst 20h			;6a5c
	ccf			;6a5d
	jr L_6A63		;6a5e
L_6A60:
	or a			;6a60   ; - 8
	sbc hl,de		;6a61
L_6A63:
	ld (ix+006h),l		;6a63   ; se guarda
	ld (ix+021h),h		;6a66
	ret nc			;6a69   ; sin pasarse: fuera
	call L_6B62		;6a6a   ; se sale: fuera
	scf			;6a6d
	ret			;6a6e
L_6A6F:
	ld a,(ix+010h)		;6a6f   ; IX+10 bit 3?
	and 008h		;6a72
	ret z			;6a74   ; no: fuera
	ld a,(0e628h)		;6a75   ; 0xE628: hay fila nueva?
	and a			;6a78
	ret z			;6a79   ; no: fuera
	ld a,(ix+000h)		;6a7a   ; el tipo 0x3F: p01:6A9F
	cp 03fh		;6a7d
	jr z,L_6A9F		;6a7f
	ld a,(0e628h)		;6a81   ; hacia donde
	bit 7,a		;6a84
	ld a,(ix+004h)		;6a86   ; la y
	jr z,L_6A91		;6a89   ; bit 7: hacia arriba
	sub 008h		;6a8b   ; - 8
	jr c,L_6A9A		;6a8d   ; se pasa: fuera
	jr L_6A93		;6a8f
L_6A91:
	add a,008h		;6a91   ; + 8
L_6A93:
	ld (ix+004h),a		;6a93   ; se guarda
	cp 0a8h		;6a96   ; de 0xA8 en adelante: fuera
	ccf			;6a98
	ret nc			;6a99
L_6A9A:
	call L_6B62		;6a9a   ; p01:6B62: se va
	scf			;6a9d
	ret			;6a9e
L_6A9F:
	ld a,(ix+019h)		;6a9f   ; el 0x3F: IX+19?
	and a			;6aa2
	jr z,L_6AD5		;6aa3   ; 0: p01:6AD5
	dec a			;6aa5   ; 1?
	jr nz,L_6AB5		;6aa6
	ld a,(ix+013h)		;6aa8   ; IX+13 hasta IX+22...
	cp (ix+022h)		;6aab
	jr z,L_6AB5		;6aae
	inc (ix+013h)		;6ab0   ; ...sube uno
	or a			;6ab3
	ret			;6ab4
L_6AB5:
	ld a,(0e628h)		;6ab5   ; la y de 16 bits (IX+04, IX+20)
	bit 7,a		;6ab8
	ld l,(ix+004h)		;6aba
	ld h,(ix+020h)		;6abd
	ld de,00008h		;6ac0   ; + 8...
	jr z,L_6AC8		;6ac3
	ld de,0fff8h		;6ac5   ; ...o - 8
L_6AC8:
	add hl,de			;6ac8
	ld (ix+004h),l		;6ac9   ; se guarda
	ld (ix+020h),h		;6acc
	ld a,l			;6acf   ; justo 0xA8: fuera
	cp 0a8h		;6ad0
	ret nz			;6ad2
	jr L_6A9A		;6ad3
L_6AD5:
	ld l,(ix+004h)		;6ad5   ; IX+20 distinto de 0: mueve
	ld h,(ix+020h)		;6ad8
	ld a,h			;6adb
	and a			;6adc
	jr nz,L_6AB5		;6add
	ld a,l			;6adf   ; menos de 0xA8: mueve
	cp 0a8h		;6ae0
	jr c,L_6AB5		;6ae2
	dec (ix+013h)		;6ae4   ; IX+13 - 1...
	jp z,L_6B62		;6ae7   ; ...llega a 0: fuera
	ret			;6aea
L_6AEB:
	bit 2,(ix+010h)		;6aeb   ; IX+10 bit 2: se mueve solo?
	jr z,L_6AFA		;6aef   ; no: p01:6AFA
	call L_6B01		;6af1   ; p01:6B01: suma la velocidad
	ret c			;6af4   ; dentro: fuera
L_6AF5:
	call L_6B62		;6af5   ; se va
	or a			;6af8
	ret			;6af9
L_6AFA:
	call L_6B13		;6afa   ; p01:6B13: dentro de la pantalla?
	ret c			;6afd   ; si: fuera
	jp L_6AF5		;6afe
L_6B01:
	push ix		;6b01   ; HL = IX+03
	pop hl			;6b03
	inc l			;6b04
	inc l			;6b05
	inc l			;6b06
	ld d,h			;6b07   ; DE = IX+07
	ld e,l			;6b08
	inc e			;6b09
	inc e			;6b0a
	inc e			;6b0b
	inc e			;6b0c
	call L_6B57		;6b0d   ; la y + la velocidad y (IX+03/04 + IX+07/08)
	call L_6B57		;6b10   ; la x + la velocidad x (IX+05/06 + IX+09/0A)
L_6B13:
	ld a,(ix+000h)		;6b13   ; el tipo 0x39: el borde 0xB0
	ld c,0b0h		;6b16
	cp 039h		;6b18
	jr z,L_6B39		;6b1a
	ld c,0a8h		;6b1c   ; los demas, 0xA8
	cp 03fh		;6b1e   ; el 0x3F: p01:6B22
	jr nz,L_6B39		;6b20
	ld a,(ix+020h)		;6b22   ; IX+20 = 0?
	and a			;6b25
	jr nz,L_6B2D		;6b26
	ld a,(ix+004h)		;6b28   ; la y pasa del borde?
	cp c			;6b2b
	ret nc			;6b2c   ; si: fuera (NC)
L_6B2D:
	ld a,(ix+021h)		;6b2d   ; IX+21 distinto de 0: fuera
	and a			;6b30
	scf			;6b31
	ret nz			;6b32
	ld a,(ix+006h)		;6b33   ; la x de 0xF9 en adelante: fuera
	cp 0f9h		;6b36
	ret			;6b38
L_6B39:
	ld a,(ix+004h)		;6b39   ; la y pasa del borde?
	cp c			;6b3c
	ret nc			;6b3d   ; si: fuera
	ld a,(ix+000h)		;6b3e   ; el tipo 0x0A?
	cp 00ah		;6b41
	jr z,L_6B4B		;6b43
	ld a,(ix+006h)		;6b45   ; la x de 0xF9 en adelante: fuera
	cp 0f9h		;6b48
	ret			;6b4a
L_6B4B:
	bit 7,(ix+00ah)		;6b4b   ; el 0x0A: con la velocidad x hacia la izquierda...
	scf			;6b4f
	ret nz			;6b50
	ld a,(ix+006h)		;6b51   ; ...la x de 0xF8 en adelante: fuera
	cp 0f8h		;6b54
	ret			;6b56
L_6B57:
	ld a,(de)			;6b57   ; (HL) = (HL) + (DE), 16 bits
	add a,(hl)			;6b58
	ld (hl),a			;6b59
	inc l			;6b5a
	inc e			;6b5b
	ld a,(de)			;6b5c
	adc a,(hl)			;6b5d
	ld (hl),a			;6b5e
	inc l			;6b5f
	inc e			;6b60
	ret			;6b61
L_6B62:
	ld hl,0e652h		;6b62   ; un enemigo menos
	dec (hl)			;6b65
	ld l,(ix+000h)		;6b66   ; la ficha de su tipo (0x6C5D + 7 x tipo)
	ld h,000h		;6b69
	ld e,l			;6b6b
	ld d,h			;6b6c
	add hl,hl			;6b6d
	add hl,hl			;6b6e
	add hl,hl			;6b6f
	or a			;6b70
	sbc hl,de		;6b71
	ld de,06c5dh		;6b73
	add hl,de			;6b76
	ld a,(hl)			;6b77   ; el primer byte
	bit 6,a		;6b78   ; bit 6: no cuenta
	jr nz,L_6B85		;6b7a
	and 03fh		;6b7c   ; lo que pesa...
	ld hl,0e655h		;6b7e   ; ...se resta de 0xE655
	sub (hl)			;6b81
	neg		;6b82
	ld (hl),a			;6b84
L_6B85:
	call L_6BA5		;6b85   ; p01:6BA5
	xor a			;6b88   ; la ficha libre: tipo 0
	ld (ix+000h),a		;6b89
	ld (ix+00bh),a		;6b8c   ; IX+0B a 0
	ld (ix+010h),a		;6b8f   ; IX+10 a 0
	bit 0,(ix+016h)		;6b92   ; IX+16 bit 0: lleva una cuenta?
	ret z			;6b96   ; no: fuera
	ld a,(ix+017h)		;6b97   ; la de IX+17...
	call 08d05h		;6b9a   ; ...p02:8D05
	ret c			;6b9d
	inc l			;6b9e   ; uno menos
	dec (hl)			;6b9f
	ret nz			;6ba0
	dec l			;6ba1   ; llega a 0: la borra
	ld (hl),000h		;6ba2
	ret			;6ba4
L_6BA5:
	ld a,(ix+000h)		;6ba5   ; el tipo 4...
	cp 004h		;6ba8
	jr z,L_6BB4		;6baa
	cp 023h		;6bac   ; el 0x23...
	ret nz			;6bae
	xor a			;6baf   ; ...0xE689 = 0
	ld (0e689h),a		;6bb0
	ret			;6bb3
L_6BB4:
	ld a,(ix+019h)		;6bb4   ; el 4 con IX+19 = 0...
	or a			;6bb7
	ret nz			;6bb8
	xor a			;6bb9   ; ...0xE664 = 0
	ld (0e664h),a		;6bba
	ret			;6bbd
L_6BBE:
	call 04e58h		;6bbe   ; el azar & 0x0F...
	and 00fh		;6bc1
	add a,014h		;6bc3   ; + 20 - la dificultad...
	ld hl,0e64fh		;6bc5
	sub (hl)			;6bc8
	ld (ix+002h),a		;6bc9   ; ...a IX+02: una cuenta
	ret			;6bcc
L_6BCD:
	xor a			;6bcd   ; IX+24 e IX+26 a 0: la animacion desde el principio
	ld (ix+024h),a		;6bce
	ld (ix+026h),a		;6bd1
	ret			;6bd4
anima_6:		; cada 4 cuadros avanza IX+26 de 0 a 5 y pone el dibujo de la tabla HL
	inc (ix+024h)		;6bd5   ; IX+24 + 1
	ld a,(ix+024h)		;6bd8
	and 003h		;6bdb   ; cada 4
	ret nz			;6bdd
	inc (ix+026h)		;6bde   ; IX+26 + 1
	ld a,(ix+026h)		;6be1
	cp 006h		;6be4   ; de 0 a 5
	jr nz,L_6BEC		;6be6
	xor a			;6be8
	ld (ix+026h),a		;6be9
L_6BEC:
	call 05ad8h		;6bec   ; el dibujo de la tabla HL
	ld (ix+030h),a		;6bef   ; a IX+30
	ret			;6bf2
L_6BF3:
	ld l,(ix+007h)		;6bf3   ; IX+07/08 + BC
	ld h,(ix+008h)		;6bf6
	add hl,bc			;6bf9
	ld (ix+007h),l		;6bfa
	ld (ix+008h),h		;6bfd
	ret			;6c00
L_6C01:
	ld l,(ix+009h)		;6c01   ; IX+09/0A + BC
	ld h,(ix+00ah)		;6c04
	add hl,bc			;6c07
	ld (ix+009h),l		;6c08
	ld (ix+00ah),h		;6c0b
	ret			;6c0e
L_6C0F:
	call azar_r		;6c0f   ; un numero al azar...
	and 00fh		;6c12   ; ...de 0 a 15
	ld (ix+026h),010h		;6c14   ; IX+26 = 16
	ld (ix+025h),a		;6c18   ; IX+25 = el numero
	ld c,a			;6c1b
	ld a,(0e64fh)		;6c1c   ; la dificultad: menos de 6...
	ld b,001h		;6c1f   ; ...B = 1...
	cp 006h		;6c21
	jr c,L_6C26		;6c23
	inc b			;6c25   ; ...si no, 2
L_6C26:
	ld a,c			;6c26   ; la direccion
	call 04f1eh		;6c27   ; la velocidad de p00:4F1E
	jp L_6881		;6c2a   ; a IX+07-0A
L_6C2D:
	ld e,(hl)			;6c2d   ; la velocidad y de (HL)
	inc hl			;6c2e
	ld d,(hl)			;6c2f
	call pon_ix09		;6c30   ; a IX+09/0A
	inc hl			;6c33
	ld e,(hl)			;6c34   ; la x
	inc hl			;6c35
	ld d,(hl)			;6c36
	bit 0,b		;6c37   ; B bit 0: al reves
	call nz,05adfh		;6c39   ; menos_de: DE = -DE
	jp pon_ix07		;6c3c   ; a IX+07/08
L_6C3F:
	ld a,(ix+004h)		;6c3f   ; la y + 16...
	add a,010h		;6c42
	ld (ix+034h),a		;6c44   ; ...a los dos sprites de IX+34 y IX+38
	ld (ix+038h),a		;6c47
	ld a,(ix+006h)		;6c4a   ; la x + 8
	add a,008h		;6c4d
	jr nc,L_6C55		;6c4f   ; se pasa: el primero fuera
	ld (ix+034h),0e0h		;6c51
L_6C55:
	ld (ix+035h),a		;6c55   ; su x
	sub 010h		;6c58   ; - 16
	jr nc,L_6C60		;6c5a   ; se pasa: el segundo fuera
	ld (ix+038h),0e0h		;6c5c
L_6C60:
	ld (ix+039h),a		;6c60   ; su x
	ret			;6c63

; ----------------------------------------------------------------------
; DATOS fichas_por_tipo: 65 fichas de 7 bytes, una por tipo de enemigo de 1 a
;   65 (p01:65F2: 0x6C5D + 7 x tipo): crea_enemigo copia de ella lo que va en
;   la ficha nueva; p02:8C9C lee su sexto byte (0x6C62 + 7 x tipo: la cifra
;   alta es un sonido de 0x8CE4); lo leen p01:6604 (455 bytes)
;   0x6c64..0x6e2b  (455 bytes)
DATA_fichas_por_tipo:
	defb 0c0h,001h,010h,010h,0b0h,015h,000h	; 6c64
	defb 081h,001h,010h,010h,060h,00ah,000h	; 6c6b
	defb 0c0h,008h,010h,010h,000h,040h,000h	; 6c72
	defb 081h,001h,010h,010h,0a0h,006h,000h	; 6c79
	defb 081h,001h,010h,010h,0d0h,01ah,000h	; 6c80
	defb 081h,001h,010h,010h,050h,005h,000h	; 6c87
	defb 081h,001h,010h,010h,0c0h,007h,000h	; 6c8e
	defb 081h,001h,010h,010h,0b0h,008h,000h	; 6c95
	defb 081h,001h,010h,010h,0c0h,007h,000h	; 6c9c
	defb 0c0h,001h,010h,010h,000h,000h,004h	; 6ca3
	defb 0c0h,001h,010h,010h,000h,000h,005h	; 6caa
	defb 0c0h,0ffh,020h,020h,000h,020h,006h	; 6cb1
	defb 081h,0ffh,010h,010h,080h,01eh,000h	; 6cb8
	defb 081h,001h,010h,010h,050h,003h,000h	; 6cbf
	defb 081h,0ffh,010h,010h,080h,017h,000h	; 6cc6
	defb 081h,001h,010h,010h,0b0h,002h,000h	; 6ccd
	defb 081h,001h,010h,010h,084h,007h,000h	; 6cd4
	defb 081h,001h,010h,010h,084h,009h,000h	; 6cdb
	defb 081h,0ffh,000h,000h,000h,007h,000h	; 6ce2
	defb 0c0h,0ffh,008h,010h,000h,000h,008h	; 6ce9
	defb 0c0h,010h,020h,018h,000h,020h,007h	; 6cf0
	defb 083h,0ffh,020h,010h,0c8h,00eh,000h	; 6cf7
	defb 081h,001h,010h,010h,094h,007h,000h	; 6cfe
	defb 081h,001h,010h,010h,0a0h,007h,000h	; 6d05
	defb 081h,0ffh,010h,010h,080h,00eh,000h	; 6d0c
	defb 081h,001h,010h,010h,090h,00eh,000h	; 6d13
	defb 0c0h,00eh,020h,020h,000h,020h,021h	; 6d1a
	defb 081h,001h,010h,010h,0a8h,013h,000h	; 6d21
	defb 081h,001h,010h,010h,0a8h,013h,000h	; 6d28
	defb 081h,001h,010h,010h,070h,004h,000h	; 6d2f
	defb 081h,001h,010h,010h,06ch,008h,000h	; 6d36
	defb 0c0h,0ffh,010h,020h,000h,000h,022h	; 6d3d
	defb 0c0h,008h,010h,010h,000h,000h,01eh	; 6d44
	defb 081h,001h,010h,010h,050h,00ah,000h	; 6d4b
	defb 081h,001h,010h,010h,09ch,00fh,000h	; 6d52
	defb 082h,0ffh,00eh,00eh,0c8h,00fh,000h	; 6d59
	defb 081h,001h,010h,010h,064h,00ah,000h	; 6d60
	defb 081h,000h,010h,010h,030h,00fh,000h	; 6d67
	defb 081h,0ffh,004h,004h,02ch,009h,000h	; 6d6e
	defb 081h,001h,010h,010h,0d0h,01ah,000h	; 6d75
	defb 0c0h,001h,010h,010h,000h,000h,00ah	; 6d7c
	defb 0c0h,001h,010h,010h,000h,000h,023h	; 6d83
	defb 081h,001h,010h,010h,000h,002h,037h	; 6d8a
	defb 081h,001h,010h,010h,000h,008h,038h	; 6d91
	defb 081h,001h,010h,010h,000h,008h,038h	; 6d98
	defb 081h,001h,010h,010h,000h,000h,000h	; 6d9f
	defb 081h,001h,010h,010h,000h,000h,006h	; 6da6
	defb 081h,001h,010h,010h,0b4h,004h,000h	; 6dad
	defb 0c0h,0ffh,005h,010h,000h,000h,005h	; 6db4
	defb 0c0h,0ffh,005h,010h,000h,000h,005h	; 6dbb
	defb 081h,001h,010h,010h,050h,00ah,000h	; 6dc2
	defb 081h,001h,010h,010h,090h,03fh,000h	; 6dc9
	defb 0c0h,001h,010h,010h,000h,000h,037h	; 6dd0
	defb 0c0h,0ffh,008h,008h,000h,000h,000h	; 6dd7
	defb 081h,0ffh,010h,010h,068h,00bh,000h	; 6dde
	defb 084h,0ffh,008h,010h,0a0h,002h,000h	; 6de5
	defb 0c0h,0ffh,002h,008h,000h,000h,000h	; 6dec
	defb 0c0h,0ffh,010h,008h,000h,000h,000h	; 6df3
	defb 0c0h,0ffh,008h,008h,000h,000h,000h	; 6dfa
	defb 0c0h,0ffh,00ah,008h,000h,000h,000h	; 6e01
	defb 0c0h,0ffh,012h,008h,000h,000h,000h	; 6e08
	defb 0c0h,0ffh,008h,008h,000h,000h,000h	; 6e0f
	defb 0c0h,0ffh,008h,008h,000h,000h,024h	; 6e16
	defb 0c0h,0ffh,010h,008h,000h,000h,042h	; 6e1d
	defb 081h,008h,010h,010h,058h,00ch,000h	; 6e24

; ======================================================================
; CODIGO 0x6e2b..0x6e89  (94 bytes)
; ======================================================================


L_6E2B:
	ld a,(0e301h)		;6e2b   ; la fase 7?
	cp 007h		;6e2e
	jr z,L_6E44		;6e30   ; si: p01:6E44 (del otro cartucho)
	call 041d8h		;6e32   ; con el 14-15
	ld a,(0e658h)		;6e35   ; el suceso siguiente de 0x84BA
	ld hl,084bah		;6e38
	call 04e66h		;6e3b   ; ...comparado con el scroll
	push af			;6e3e
	call 041d0h		;6e3f   ; de vuelta el 2 y el 3
	pop af			;6e42
	ret			;6e43
L_6E44:
	di			;6e44   ; la fase 7: sin interrupciones
	ld a,0c9h		;6e45   ; el gancho H.KEYI a `ret`
	ld (0fd9ah),a		;6e47
	ld a,(0f0f4h)		;6e4a   ; el slot del vecino...
	ld h,080h		;6e4d   ; ...en la pagina 2 (0x8000)
	call 00024h		;6e4f   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,00eh		;6e52   ; su banco 14 en 0x8000
	ld (09000h),a		;6e54   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0e658h)		;6e57   ; el suceso siguiente...
	ld de,0956ch		;6e5a   ; ...de la lista 0x956C de ese cartucho
	call 04e6eh		;6e5d
	push af			;6e60
	push bc			;6e61
	ld a,(0f0f6h)		;6e62   ; el slot de este cartucho...
	ld h,080h		;6e65   ; ...otra vez en la pagina 2
	call 00024h		;6e67   ; BIOS ENASLT - Switches to specified slot and page definitively
	call 041d0h		;6e6a   ; y el 2-3
	ld a,0c3h		;6e6d   ; el gancho H.KEYI otra vez a `jp`
	ld (0fd9ah),a		;6e6f
	pop bc			;6e72
	pop af			;6e73
	ei			;6e74   ; con interrupciones
	ret			;6e75
L_6E76:
	ld a,(0e640h)		;6e76   ; el jefe - 1
	dec a			;6e79
	ret m			;6e7a   ; sin jefe: fuera
	ld c,a			;6e7b
	call 041bfh		;6e7c   ; con el 11
	ld a,c			;6e7f
	call L_6E86		;6e80   ; por el jefe, la tabla de detras
	jp 041d0h		;6e83   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6E86:
	call 040ceh		;6e86   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6E89: 8 destinos del despachador p00:40CE (call en p01:6E86, el
;   indice en A): A870, A68D, ACC8, AB03, B154, AEB4, AE9C, B405; lo leen
;   p01:6E86 (16 bytes)
;   0x6e89..0x6e99  (16 bytes)
DATA_tabla_6E89:
	defw 0a870h,0a68dh,0acc8h,0ab03h,0b154h,0aeb4h,0ae9ch,0b405h	; 6e89

; ======================================================================
; CODIGO 0x6e99..0x6f1d  (132 bytes)
; ======================================================================


L_6E99:
	call 08031h		;6e99   ; p02:8031
	call L_7088		;6e9c   ; p01:7088
	ld a,(0e6beh)		;6e9f   ; 0xE6BE...
	or a			;6ea2
	call nz,L_71AF		;6ea3   ; ...p01:71AF
	call L_6EC5		;6ea6   ; p01:6EC5: hay que esperar?
	ret nz			;6ea9   ; si: fuera
	call L_6F33		;6eaa   ; p01:6F33
	ld a,(0e690h)		;6ead   ; 0xE690 distinto de 0: fuera
	and a			;6eb0
	ret nz			;6eb1
	ld a,(0e653h)		;6eb2   ; 0xE653 (el ultimo creado)?
	and a			;6eb5
	jr z,L_6ED7		;6eb6   ; ninguno: p01:6ED7
	ld hl,0e652h		;6eb8   ; 11 - los que hay...
	ld a,00bh		;6ebb
	sub (hl)			;6ebd
	ld hl,0e692h		;6ebe
	cp (hl)			;6ec1   ; ...menos que 0xE692: fuera
	ret c			;6ec2
	jr L_6ED7		;6ec3
L_6EC5:
	ld hl,0e654h		;6ec5   ; 0xE654: la espera
	ld a,(hl)			;6ec8
	and a			;6ec9
	jr z,L_6ED0		;6eca   ; 0: p01:6ED0
	dec (hl)			;6ecc   ; uno menos
	or 0ffh		;6ecd   ; NZ: espera
	ret			;6ecf
L_6ED0:
	ld a,(0e640h)		;6ed0   ; con jefe: NZ
	and a			;6ed3
	ret nz			;6ed4
	xor a			;6ed5   ; si no, Z
	ret			;6ed6
L_6ED7:
	call 041d8h		;6ed7   ; con el 14-15
	ld a,(0e301h)		;6eda   ; las oleadas de la fase (p14:8550)
	ld de,08550h		;6edd
	call 04e21h		;6ee0   ; palabra_de_de: DE = la palabra DE + 2 x A
	ld hl,(0e302h)		;6ee3   ; el scroll...
	ld a,l			;6ee6
	rr h		;6ee7
	rra			;6ee9
	rr h		;6eea
	rra			;6eec
	rra			;6eed
	rra			;6eee
	rra			;6eef   ; ...el tramo de 32
	and 01fh		;6ef0
	call 040c9h		;6ef2   ; su byte
	ld a,(de)			;6ef5   ; lo lee
	push af			;6ef6
	rra			;6ef7   ; la cifra alta: una oleada
	rra			;6ef8
	rra			;6ef9
	rra			;6efa
	and 00fh		;6efb
	push af			;6efd
	call 041d0h		;6efe   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	pop af			;6f01   ; la cifra alta
	call L_6F18		;6f02   ; p01:6F18: esa oleada
	pop bc			;6f05   ; B = el byte entero
	ld a,(0e64fh)		;6f06   ; la dificultad...
	cp 00ah		;6f09   ; ...menos de 10: solo la primera
	jp c,041d0h		;6f0b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,b			;6f0e   ; el byte otra vez
	pop af			;6f0f
	and 00fh		;6f10   ; la cifra baja
	call L_6F18		;6f12   ; la segunda oleada
	jp 041d0h		;6f15   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_6F18:
	dec a			;6f18   ; la oleada - 1
	ret m			;6f19   ; 0: ninguna
	call 040ceh		;6f1a   ; por la tabla de detras

; ----------------------------------------------------------------------
; DATOS tabla_6F1D: 11 destinos del despachador p00:40CE (call en p01:6F1A, el
;   indice en A): 7169, 71AF, 735B, 72EE, 71C6, 7307, 72BB, 73C7, 724B, 71BF,
;   7245; lo leen p01:6F1A (22 bytes)
;   0x6f1d..0x6f33  (22 bytes)
DATA_tabla_6F1D:
	defw 07169h,071afh,0735bh,072eeh,071c6h,07307h,072bbh,073c7h	; 6f1d
	defw 0724bh,071bfh,07245h	; 6f2d  -> L_724B L_71BF L_7245

; ======================================================================
; CODIGO 0x6f33..0x7007  (212 bytes)
; ======================================================================


L_6F33:
	ld a,(0e301h)		;6f33   ; la fase 7 no tiene estas oleadas
	cp 007h		;6f36
	ret z			;6f38
	ld hl,0e690h		;6f39   ; 0xE690: la oleada en curso
	ld a,(hl)			;6f3c
	and a			;6f3d   ; 0: p01:6FA2, mira si empieza otra
	jr z,L_6FA2		;6f3e
	dec a			;6f40   ; 1: p01:6F9A
	jr z,L_6F9A		;6f41
	inc l			;6f43   ; la cuenta entre enemigos (0xE691)
	dec (hl)			;6f44
	ret nz			;6f45   ; aun no
	ld a,(0e693h)		;6f46   ; el tipo de la oleada (0xE693)
	ld b,008h		;6f49   ; el 0x0B: cada 8...
	cp 00bh		;6f4b
	jr z,L_6F57		;6f4d
	cp 00ah		;6f4f   ; ...el 0x0A: cada 4...
	ld b,004h		;6f51
	jr z,L_6F57		;6f53
	ld b,006h		;6f55   ; ...los demas: cada 6
L_6F57:
	ld (hl),b			;6f57   ; la cuenta
	inc l			;6f58
	dec (hl)			;6f59   ; cuantos quedan (0xE692)
	jr nz,L_6F60		;6f5a   ; quedan: p01:6F60
	dec l			;6f5c
	dec l			;6f5d
	ld (hl),000h		;6f5e   ; ninguno: la oleada acaba
L_6F60:
	ld hl,0e67eh		;6f60   ; 0xE67E: el numero del enemigo de la oleada
	inc (hl)			;6f63
	ld b,(hl)			;6f64   ; en B
	ld a,(0e620h)		;6f65   ; en vertical...
	or a			;6f68
	jr z,L_6F7A		;6f69
	ld a,(0e693h)		;6f6b   ; ...salvo el tipo 0x0B...
	cp 00bh		;6f6e
	jr z,L_6F7A		;6f70
	ld a,(0e695h)		;6f72   ; ...sale arriba: x = 0xE695, y = 0
	ld d,a			;6f75
	ld e,000h		;6f76
	jr L_6F80		;6f78
L_6F7A:
	ld a,(0e695h)		;6f7a   ; en horizontal sale a la derecha: y = 0xE695, x = 0xF8
	ld e,a			;6f7d
	ld d,0f8h		;6f7e
L_6F80:
	ld a,(0e693h)		;6f80   ; el tipo
	ld c,000h		;6f83   ; C = 0
	call crea_enemigo		;6f85   ; crea el enemigo
	ld a,(0e653h)		;6f88   ; creado?
	and a			;6f8b
	ret nz			;6f8c   ; si: fuera
	ld hl,0e67eh		;6f8d   ; no cabia: se deshace la cuenta...
	dec (hl)			;6f90
	ld hl,0e692h		;6f91   ; ...y vuelve a intentarlo...
	inc (hl)			;6f94
	dec l			;6f95
	dec l			;6f96
	ld (hl),001h		;6f97   ; ...en el estado 1
	ret			;6f99
L_6F9A:
	ld a,(0e652h)		;6f9a   ; estado 1: cuando haya menos de 7 enemigos...
	cp 007h		;6f9d
	ret nc			;6f9f
	inc (hl)			;6fa0   ; ...vuelve al 2
	ret			;6fa1
L_6FA2:
	ld a,(0e627h)		;6fa2   ; hay columna o fila nueva?
	and a			;6fa5
	jr nz,L_6FAD		;6fa6
	ld a,(0e628h)		;6fa8
	and a			;6fab
	ret z			;6fac
L_6FAD:
	ld hl,07006h		;6fad   ; el scroll en el que empiezan: 0x7006 + fase
	ld a,(0e301h)		;6fb0   ; lee la fase (de 1 a 7; 0 en la presentacion)
	call 040c4h		;6fb3   ; hl_mas_a: HL = HL + A
	ld d,000h		;6fb6   ; en DE
	ld e,(hl)			;6fb8
	ld hl,(0e302h)		;6fb9   ; el scroll
	rst 20h			;6fbc   ; antes: fuera
	ret nc			;6fbd
	ld a,l			;6fbe   ; solo cada 8
	and 007h		;6fbf
	ret nz			;6fc1
	ld hl,00101h		;6fc2   ; 0xE690 = 1 y 0xE691 = 1: empieza
	ld (0e690h),hl		;6fc5
	ld hl,0e696h		;6fc8   ; 0xE696 + 1 (nunca 0)
	ld a,(hl)			;6fcb
	inc a			;6fcc
	jr nz,L_6FD0		;6fcd
	inc a			;6fcf
L_6FD0:
	ld (hl),a			;6fd0
	ld a,(0e301h)		;6fd1   ; el tipo de la fase: 0x704D + fase
	ld hl,0704dh		;6fd4
	call 05ad8h		;6fd7   ; byte_de_tabla: A = el byte HL + A
L_6FDA:
	ld (0e693h),a		;6fda   ; en 0xE693
	call L_701A		;6fdd   ; p01:701A: su y o su x
	ld (0e695h),a		;6fe0   ; en 0xE695
	ld a,006h		;6fe3   ; 6 enemigos
	ld (0e692h),a		;6fe5
	ld a,0ffh		;6fe8   ; 0xE67E = 0xFF
	ld (0e67eh),a		;6fea
	xor a			;6fed   ; p02:8D05
	call 08d05h		;6fee
	jr nc,$+29		;6ff1   ; cabe...
	xor a			;6ff3   ; no: no empieza
	ld (0e690h),a		;6ff4
	ret			;6ff7
L_6FF8:
	ld hl,(0e302h)		;6ff8   ; el scroll...
	ld de,00040h		;6ffb
	rst 20h			;6ffe   ; ...antes de 0x40...
	ld a,00ah		;6fff   ; ...el tipo 0x0A...
	jr c,L_6FDA		;7001
	ld a,00bh		;7003   ; ...si no, el 0x0B
	jr L_6FDA		;7005

; ----------------------------------------------------------------------
; DATOS tabla_por_fase_7007: 7 bytes, uno por fase (p01:6FAD: 0x7006 +
;   0xE301); lo leen p01:6FB3 (7 bytes)
;   0x7007..0x700e  (7 bytes)
DATA_tabla_por_fase_7007:
	defb 080h,048h,048h,080h,080h,000h,000h	; 7007

; ======================================================================
; CODIGO 0x700e..0x704e  (64 bytes)
; ======================================================================


L_700E:
	ld a,(0e696h)		;700e   ; 0xE696, 0xE692 y 0xE692 a (HL)
	ld (hl),a			;7011
	inc l			;7012
	ld a,(0e692h)		;7013
	ld (hl),a			;7016
	inc l			;7017
	ld (hl),a			;7018
	ret			;7019
L_701A:
	ld hl,0e663h		;701a   ; 0xE663 + 1: alterna
	inc (hl)			;701d
	ld a,(0e693h)		;701e   ; el tipo 0x0B?
	cp 00bh		;7021
	jr z,L_7032		;7023
	cp 00ah		;7025   ; el 0x0A?
	jr z,L_703B		;7027
	ld a,(hl)			;7029   ; los demas: 0x30 o 0x70
	and 001h		;702a
	ld a,030h		;702c
	ret z			;702e
	xor 040h		;702f
	ret			;7031
L_7032:
	ld a,(hl)			;7032   ; el 0x0B: 0x20 o 0x80
	and 001h		;7033
	ld a,020h		;7035
	ret z			;7037
	ld a,080h		;7038
	ret			;703a
L_703B:
	ld a,(hl)			;703b   ; el 0x0A: 0x18/0x48 o 0x88/0xB0
	and 001h		;703c
	ld hl,01848h		;703e
	jr z,L_7046		;7041
	ld hl,088b0h		;7043
L_7046:
	ld a,(0e620h)		;7046   ; en vertical, el byte bajo; en horizontal, el alto
	or a			;7049
	ld a,h			;704a
	ret z			;704b
	ld a,l			;704c
	ret			;704d

; ----------------------------------------------------------------------
; DATOS tabla_por_fase_704E: 7 bytes, uno por fase (p01:6FD4: 0x704D +
;   0xE301); lo leen p01:6FD7 (7 bytes)
;   0x704e..0x7055  (7 bytes)
DATA_tabla_por_fase_704E:
	defb 00ah,00ah,00ah,00bh,00bh,00bh,000h	; 704e

; ======================================================================
; CODIGO 0x7055..0x7135  (224 bytes)
; ======================================================================


L_7055:
	ld c,007h		;7055   ; C = 7
	jr L_705F		;7057
L_7059:
	ld c,002h		;7059   ; C = 2
	jr L_705F		;705b
L_705D:
	ld c,003h		;705d   ; C = 3
L_705F:
	ld hl,0e656h		;705f   ; 0xE656 + 1
	ld a,(hl)			;7062
	inc (hl)			;7063
	and c			;7064   ; & C...
	ld c,000h		;7065   ; ...C = 1 si sale 0, si no 0
	ret nz			;7067
	inc c			;7068
	ret			;7069
L_706A:
	ld hl,0e302h		;706a   ; los sucesos de 0x85D1 contra el scroll
	ld (0f008h),hl		;706d
L_7070:
	call L_70B1		;7070   ; p01:70B1 hasta que no toque ninguno
	jr z,L_7070		;7073
	ret c			;7075
	ld hl,0e67ch		;7076   ; se pasa: el siguiente
	inc (hl)			;7079
	jr L_7070		;707a
L_707C:
	call L_711F		;707c   ; los de 0x85DF
	jr z,L_707C		;707f
	ret c			;7081
	ld hl,0e677h		;7082   ; apunta a la cuenta de las apariciones de 0x85DF
	inc (hl)			;7085
	jr L_707C		;7086
L_7088:
	ld a,(0e610h)		;7088   ; 0xE610: el scroll de los altos?
	and a			;708b
	jr nz,L_70FC		;708c   ; si: p01:70FC
	ld hl,0e302h		;708e   ; se compara con el scroll de verdad
	ld (0f008h),hl		;7091
	ld a,(0e627h)		;7094   ; columna o fila nueva?
	and a			;7097
	jr nz,L_709F		;7098
	ld a,(0e628h)		;709a
	and a			;709d
	ret z			;709e
L_709F:
	ld a,(0e620h)		;709f   ; en horizontal sale por la derecha (0xF8)...
	and a			;70a2
	ld a,0f8h		;70a3
	jr z,L_70A8		;70a5
	xor a			;70a7   ; ...en vertical por arriba (0)
L_70A8:
	ld (0f004h),a		;70a8   ; en 0xF004
L_70AB:
	call L_70B1		;70ab   ; todos los que tocan
	jr z,L_70AB		;70ae
	ret			;70b0
L_70B1:
	call 041d8h		;70b1   ; con el 14-15
	ld a,(0e67ch)		;70b4   ; la ficha 0xE67C de 0x85D1
	ld hl,085d1h		;70b7
	call suceso		;70ba   ; suceso: la ficha A (de 4 bytes) de la lista de la fase de la tabla HL; Z si se acabo
	jp nz,041d0h		;70bd   ; aun no: de vuelta 2-3
	ld hl,0e67ch		;70c0   ; toca: la siguiente
	inc (hl)			;70c3
L_70C4:
	ld e,b			;70c4   ; E = el dato (b)
	srl a		;70c5   ; la posicion / 4: B
	srl a		;70c7
	ld b,a			;70c9
	ld a,(0f004h)		;70ca   ; el borde (0xF004)
	ld d,a			;70cd
	ld a,(0e610h)		;70ce   ; 0xE610...
	and a			;70d1
	jr z,L_70DA		;70d2
	cp 003h		;70d4   ; ...3 o mas: no se cambian
	jr c,L_70E0		;70d6
	jr L_70E3		;70d8
L_70DA:
	ld a,(0e620h)		;70da   ; en vertical...
	and a			;70dd
	jr z,L_70E3		;70de
L_70E0:
	ld a,e			;70e0   ; ...la x y la y cambiadas
	ld e,d			;70e1
	ld d,a			;70e2
L_70E3:
	ld a,c			;70e3   ; el tipo (C) & 0x3F
	ld l,a			;70e4
	and 03fh		;70e5
	cp c			;70e7
	ld c,000h		;70e8   ; C = 0...
	jr z,L_70F2		;70ea
	inc c			;70ec   ; ...1 si tenia el bit 6...
	rl l		;70ed
	jr nc,L_70F2		;70ef
	inc c			;70f1   ; ...2 si tenia el 7
L_70F2:
	push af			;70f2
	call 041d0h		;70f3   ; de vuelta el 2-3
	pop af			;70f6
	call crea_enemigo		;70f7   ; crea el enemigo
	xor a			;70fa
	ret			;70fb
L_70FC:
	ld hl,0e612h		;70fc   ; con los altos, contra 0xE612
	ld (0f008h),hl		;70ff
	ld a,(0e627h)		;7102
	and a			;7105
	jr nz,L_710D		;7106
	ld a,(0e628h)		;7108
	and a			;710b
	ret z			;710c
L_710D:
	ld a,(0e610h)		;710d   ; el borde por 0xE610 (tabla 0x7134)
	ld hl,07134h		;7110
	call 05ad8h		;7113   ; byte_de_tabla: A = el byte HL + A
	ld (0f004h),a		;7116
L_7119:
	call L_711F		;7119
	jr z,L_7119		;711c
	ret			;711e
L_711F:
	call 041d8h		;711f   ; con el 14-15
	ld a,(0e677h)		;7122   ; la ficha 0xE677 de 0x85DF
	ld hl,085dfh		;7125
	call suceso		;7128   ; suceso: la ficha A (de 4 bytes) de la lista de la fase de la tabla HL; Z si se acabo
	jp nz,041d0h		;712b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld hl,0e677h		;712e   ; toca: la siguiente
	inc (hl)			;7131
	jp L_70C4		;7132

; ----------------------------------------------------------------------
; DATOS tabla_7135: 4 bytes (p01:7110: 0x7134 + 0xE610, de 1 a 4); lo leen
;   p01:7113 (4 bytes)
;   0x7135..0x7139  (4 bytes)
DATA_tabla_7135:
	defb 0a0h,000h,000h,0f8h	; 7135

; ======================================================================
; CODIGO 0x7139..0x71a7  (110 bytes)
; ======================================================================


suceso:		; la ficha A (de 4 bytes) de la lista de la fase de la tabla HL; Z si se acabo
	push af			;7139   ; se guarda A
	ld a,(0e301h)		;713a   ; la lista de la fase (tabla HL)
	call 04e28h		;713d   ; palabra_de_hl: DE = la palabra HL + 2 x A
	pop af			;7140
	add a,a			;7141   ; A x 4: la ficha
	add a,a			;7142
	call 040c9h		;7143   ; de_mas_a: DE = DE + A
	ex de,hl			;7146   ; la posicion, bajo
	ld e,(hl)			;7147
	inc hl			;7148
	ld a,(hl)			;7149   ; el alto...
	cp e			;714a   ; ...FF FF acaba: Z y acarreo
	jr nz,L_7154		;714b
	cp 0ffh		;714d
	jr nz,L_7154		;714f
	or a			;7151
	scf			;7152
	ret			;7153
L_7154:
	and 003h		;7154   ; los 2 bits de la posicion alta
	ld d,a			;7156
	ld a,(hl)			;7157   ; el byte con los bits altos (el tipo)
	inc hl			;7158
	ld c,(hl)			;7159   ; C = el tercero
	inc hl			;715a
	ld b,(hl)			;715b   ; B = el cuarto
	ld hl,(0f008h)		;715c   ; el scroll de (0xF008)
	push af			;715f
	ld a,(hl)			;7160
	inc hl			;7161
	ld h,(hl)			;7162
	ld l,a			;7163
	pop af			;7164
	and a			;7165
	sbc hl,de		;7166   ; scroll - posicion: Z si ha llegado
	ret			;7168
L_7169:
	ld hl,0e673h		;7169   ; 0xE673: la cuenta de una tanda
	ld a,(hl)			;716c
	and a			;716d
	jr nz,L_7177		;716e   ; en marcha: p01:7177
	ld (hl),004h		;7170   ; empieza: 4 enemigos...
	inc l			;7172
	ld c,030h		;7173   ; ...y la espera de 0x30
	jr L_719E		;7175
L_7177:
	inc l			;7177   ; la espera
	dec (hl)			;7178
	ret nz			;7179   ; aun no
	ld (hl),005h		;717a   ; 5 cuadros hasta el siguiente
	dec l			;717c
	dec (hl)			;717d   ; uno menos
	ld a,(hl)			;717e
	xor 003h		;717f   ; el ultimo...
	ld b,a			;7181
	jr nz,L_7189		;7182
	ld a,(0e664h)		;7184   ; ...solo si 0xE664 es 0
	or a			;7187
	ret nz			;7188
L_7189:
	ld e,000h		;7189   ; E = 0
	ld a,r		;718b   ; al azar...
	xor (hl)			;718d
	and 007h		;718e
	ld hl,071a7h		;7190   ; ...una de las 8 x de 0x71A7
	call 040c4h		;7193   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;7196
	ld c,000h		;7197
	ld a,004h		;7199   ; el tipo 4
	jp crea_enemigo		;719b   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
L_719E:
	ld a,(0e64fh)		;719e   ; la espera: 2 x dificultad - C, cambiada de signo
	add a,a			;71a1
	sub c			;71a2
	neg		;71a3
	ld (hl),a			;71a5
	ret			;71a6

; ----------------------------------------------------------------------
; DATOS tabla_71A7: 8 bytes que p01:7190 elige con R & 7; lo leen p01:7193 (8
;   bytes)
;   0x71a7..0x71af  (8 bytes)
DATA_tabla_71A7:
	defb 030h,0e0h,060h,0a0h,080h,050h,040h,0c0h	; 71a7  0.`..P@.

; ======================================================================
; CODIGO 0x71af..0x7235  (134 bytes)
; ======================================================================


L_71AF:
	ld a,(0e301h)		;71af   ; en la fase 7 el tipo 0x28...
	cp 007h		;71b2
	ld a,028h		;71b4
	jr z,L_71BA		;71b6
	ld a,005h		;71b8   ; ...en las demas el 5
L_71BA:
	ld (0f000h),a		;71ba   ; en 0xF000
	jr L_71CB		;71bd
L_71BF:
	ld a,006h		;71bf   ; el tipo 6
	ld (0f000h),a		;71c1
	jr L_71CB		;71c4
L_71C6:
	ld a,017h		;71c6   ; el tipo 0x17
	ld (0f000h),a		;71c8
L_71CB:
	ld hl,0e66fh		;71cb   ; 0xE66F: cuantos quedan de la tanda
	ld a,(hl)			;71ce
	and a			;71cf
	jr z,L_722F		;71d0   ; 0: p01:722F
	inc l			;71d2
	dec (hl)			;71d3   ; la espera
	ret nz			;71d4
	ld a,(0e64fh)		;71d5   ; la nueva: 0x41 - 2 x dificultad
	add a,a			;71d8
	sub 041h		;71d9
	neg		;71db
	ld (hl),a			;71dd
	dec l			;71de
	dec (hl)			;71df   ; uno menos
	ld a,(hl)			;71e0
	and 007h		;71e1   ; de 0 a 7
	ld b,a			;71e3
	ld hl,0723dh		;71e4   ; la y de 0x723D (en vertical)...
	ld a,(0e620h)		;71e7   ; lee 1 si la fase va en vertical
	rra			;71ea
	jr c,L_71F0		;71eb
	ld hl,07235h		;71ed   ; ...o de 0x7235
L_71F0:
	ld a,b			;71f0
	call 05ad8h		;71f1   ; su entrada
	ld e,a			;71f4   ; en E
	ld d,000h		;71f5
	call L_705D		;71f7   ; C de p01:705D
	ld a,(0f000h)		;71fa   ; los tipos 5 y 0x28 salen tal cual
	cp 005h		;71fd
	jr z,L_722C		;71ff
	cp 028h		;7201
	jr z,L_722C		;7203
	cp 006h		;7205   ; el 6 en la fase 4...
	jr nz,L_721F		;7207
	ld a,(0e301h)		;7209   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 004h		;720c
	jr nz,L_721F		;720e
	ld hl,0e303h		;7210   ; ...con el jugador abajo del todo...
	ld a,(hl)			;7213
	dec a			;7214
	jr z,L_721F		;7215
	dec hl			;7217
	ld a,(hl)			;7218
	cp 0e1h		;7219
	jr nc,L_721F		;721b
	ld e,080h		;721d   ; ...sale en 0x80
L_721F:
	ld a,(0e203h)		;721f   ; por la cuenta de cuadros, por un lado o por el otro
	and 001h		;7222
	ld b,a			;7224
	ld a,(0f000h)		;7225
	jr z,L_722C		;7228
	ld d,0f8h		;722a   ; x = 0xF8
L_722C:
	jp crea_enemigo		;722c   ; crea el enemigo
L_722F:
	ld (hl),008h		;722f   ; la tanda siguiente: 8 enemigos y espera 1
	inc l			;7231
	ld (hl),001h		;7232
	ret			;7234

; ----------------------------------------------------------------------
; DATOS tabla_7235: 8 bytes que p01:71ED elige con (HL) & 7 en horizontal; lo
;   leen p01:71F1 (8 bytes)
;   0x7235..0x723d  (8 bytes)
DATA_tabla_7235:
	defb 020h,080h,020h,020h,080h,020h,080h,080h	; 7235   .  . ..

; ----------------------------------------------------------------------
; DATOS tabla_723D: 8 bytes que p01:71E4 elige con (HL) & 7 en vertical
;   (0xE620); lo leen p01:71F1 (8 bytes)
;   0x723d..0x7245  (8 bytes)
DATA_tabla_723D:
	defb 020h,0d8h,020h,020h,0d8h,020h,0d8h,0d8h	; 723d   .  . ..

; ======================================================================
; CODIGO 0x7245..0x72b3  (110 bytes)
; ======================================================================


L_7245:
	ld b,008h		;7245   ; el tipo 0x0D, cada 8...
	ld a,00dh		;7247
	jr L_724F		;7249
L_724B:
	ld b,004h		;724b   ; ...o el 0x19, cada 4
	ld a,019h		;724d
L_724F:
	ld (0f000h),a		;724f   ; en 0xF000
	ld hl,0e668h		;7252   ; la espera (0xE668)
	dec (hl)			;7255
	ret p			;7256   ; aun no
	ld hl,0e68eh		;7257   ; 0xE68E + 1
	inc (hl)			;725a
	ld a,(hl)			;725b
	and 007h		;725c   ; de 0 a 7
	ld hl,072b3h		;725e   ; de la tabla de 0x72B3
	call 05ad8h		;7261   ; byte_de_tabla: A = el byte HL + A
	add a,b			;7264   ; + B
	ld hl,0e668h		;7265
	ld (hl),a			;7268   ; la nueva espera
	cp 018h		;7269   ; 24 o mas...
	jr c,L_7274		;726b
	ld a,(0e64fh)		;726d   ; ...se le resta la dificultad
	sub (hl)			;7270
	neg		;7271
	ld (hl),a			;7273
L_7274:
	ld a,r		;7274   ; al azar...
	and 078h		;7276
	call L_7286		;7278   ; ...la x (p01:7286)
	ld e,000h		;727b   ; y = 0
	ld bc,00000h		;727d
	ld a,(0f000h)		;7280   ; el tipo
	jp crea_enemigo		;7283   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
L_7286:
	ld c,a			;7286   ; C = el azar
	ld a,(0f000h)		;7287
	cp 00dh		;728a   ; el 0x0D sale en cualquier sitio
	jr z,L_7295		;728c
	ld a,(0e301h)		;728e   ; en la fase 3...
	cp 003h		;7291
	jr z,L_729A		;7293
L_7295:
	ld a,c			;7295   ; x = azar + 0x38
	add a,038h		;7296
	ld d,a			;7298
	ret			;7299
L_729A:
	ld hl,(0e302h)		;729a   ; la fase 3: segun el scroll...
	ld de,00170h		;729d
	ld b,070h		;72a0
	rst 20h			;72a2   ; ...antes de 0x170...
	ld e,060h		;72a3
	jr c,L_72AB		;72a5   ; ...0x70 + (azar mod 0x60)...
	ld b,018h		;72a7   ; ...despues, 0x18 + (azar mod 0x58)
	ld e,058h		;72a9
L_72AB:
	ld a,c			;72ab
	cp e			;72ac
	jr c,L_72B0		;72ad
	sub e			;72af
L_72B0:
	add a,b			;72b0
	ld d,a			;72b1
	ret			;72b2

; ----------------------------------------------------------------------
; DATOS tabla_72B3: 8 bytes que p01:725E elige con (HL) & 7; lo leen p01:7261
;   (8 bytes)
;   0x72b3..0x72bb  (8 bytes)
DATA_tabla_72B3:
	defb 003h,004h,020h,002h,004h,005h,003h,004h	; 72b3  .. .....

; ======================================================================
; CODIGO 0x72bb..0x73bb  (256 bytes)
; ======================================================================


L_72BB:
	ld hl,0e675h		;72bb   ; 0xE675: la espera
	dec (hl)			;72be
	ret p			;72bf   ; aun no
	ld (hl),002h		;72c0   ; 2 cuadros
	inc hl			;72c2
	ld a,(hl)			;72c3   ; 0xE676: cuantos quedan
	or a			;72c4
	jr nz,L_72CD		;72c5   ; quedan: p01:72CD
	ld (hl),006h		;72c7   ; la tanda siguiente: 6...
	dec hl			;72c9
	ld (hl),080h		;72ca   ; ...y 128 de espera
	ret			;72cc
L_72CD:
	dec (hl)			;72cd   ; uno menos
	bit 0,(hl)		;72ce   ; alternando...
	ld e,048h		;72d0   ; ...la y 0x48...
	jr z,L_72D6		;72d2
	ld e,060h		;72d4   ; ...o 0x60
L_72D6:
	ld a,(0e203h)		;72d6   ; por la cuenta de cuadros...
	rra			;72d9
	and 001h		;72da
	ld b,a			;72dc
	ld d,0f8h		;72dd   ; ...por la derecha (0xF8)...
	jr z,L_72E3		;72df
	ld d,000h		;72e1   ; ...o por la izquierda (0)
L_72E3:
	ld hl,0e67bh		;72e3   ; C de p01:7059
	call L_7059		;72e6
	ld a,018h		;72e9   ; el tipo 0x18
	jp crea_enemigo		;72eb   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
L_72EE:
	ld hl,0e678h		;72ee   ; 0xE678: la espera
	dec (hl)			;72f1
	ret p			;72f2   ; aun no
	ld a,(0e64fh)		;72f3   ; la nueva: 0x30 - 2 x dificultad
	add a,a			;72f6
	sub 030h		;72f7
	neg		;72f9
	ld (hl),a			;72fb
	ld de,0f830h		;72fc   ; sale en (0x30, 0xF8)
	ld bc,00001h		;72ff   ; B = 0, C = 1
	ld a,008h		;7302   ; el tipo 8
	jp crea_enemigo		;7304   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
L_7307:
	ld hl,0e686h		;7307   ; 0xE686: la espera
	dec (hl)			;730a
	ret p			;730b   ; aun no
	ld a,(0e64fh)		;730c   ; la nueva: 10, o 6 con dificultad 6 o mas
	cp 006h		;730f
	ld a,00ah		;7311
	jr c,L_7317		;7313
	ld a,006h		;7315
L_7317:
	ld (hl),a			;7317
	inc hl			;7318
	inc (hl)			;7319   ; 0xE687 + 1
	ld a,(hl)			;731a
	and 003h		;731b   ; cada 4...
	jr nz,L_7325		;731d
	dec hl			;731f   ; ...la espera larga (0x50)
	ld c,050h		;7320
	jp L_719E		;7322
L_7325:
	and 001h		;7325   ; alternando...
	or a			;7327
	ld bc,01008h		;7328   ; ...arriba (0x10, 0x08)...
	jr z,L_7330		;732b
	ld bc,0d078h		;732d   ; ...o abajo (0xD0, 0x78)
L_7330:
	ld a,(0e620h)		;7330   ; en vertical o en horizontal
	rra			;7333
	ld e,c			;7334
	ld d,0f8h		;7335
	jr nc,L_733C		;7337
	ld e,000h		;7339
	ld d,b			;733b
L_733C:
	ld b,003h		;733c   ; tres seguidos
L_733E:
	push bc			;733e
	push de			;733f
	call L_705D		;7340   ; C de p01:705D
	ld a,011h		;7343   ; el tipo 0x11
	call crea_enemigo		;7345   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
	pop de			;7348
	ld a,(0e620h)		;7349   ; lee 1 si la fase va en vertical
	rra			;734c
	ld hl,01200h		;734d   ; el siguiente 0x12 mas alla...
	jr c,L_7355		;7350
	ld hl,00012h		;7352   ; ...en vertical o en horizontal
L_7355:
	add hl,de			;7355
	ex de,hl			;7356
	pop bc			;7357
	djnz L_733E		;7358   ; los tres
	ret			;735a
L_735B:
	ld hl,0e682h		;735b   ; 0xE682: cuantos quedan
	ld a,(hl)			;735e
	and a			;735f
	jr nz,L_7388		;7360   ; quedan: p01:7388
	ld (hl),005h		;7362   ; la tanda: 5
	inc l			;7364
	ld a,(0e64fh)		;7365   ; la espera: 0x40 - 2 x dificultad
	add a,a			;7368
	sub 040h		;7369
	neg		;736b
	ld (hl),a			;736d
	call azar_r		;736e   ; al azar...
	and 007h		;7371   ; ...de 0 a 7
	ld hl,0e203h		;7373   ; apunta a la cuenta de cuadros del juego
	bit 0,(hl)		;7376   ; por la cuenta de cuadros...
	ld hl,0e660h		;7378
	jr z,L_737F		;737b
	add a,084h		;737d   ; ...+ 0x84
L_737F:
	ld (hl),a			;737f   ; en 0xE660
	ld a,(0e326h)		;7380   ; la nave abajo (0xE326 bit 7)?
	rla			;7383
	ret nc			;7384
	set 6,(hl)		;7385   ; si: el bit 6 de 0xE660
	ret			;7387
L_7388:
	inc l			;7388   ; la espera
	dec (hl)			;7389
	ret nz			;738a   ; aun no
	ld (hl),006h		;738b   ; 6 cuadros
	ld a,(0e660h)		;738d   ; 0xE660
	ld c,a			;7390
	bit 6,a		;7391   ; bit 6: hacia abajo (+4)...
	ld b,004h		;7393
	jr nz,L_7399		;7395
	ld b,0fch		;7397   ; ...o hacia arriba (-4)
L_7399:
	bit 7,a		;7399   ; bit 7...
	dec a			;739b   ; ...0xE660 - 1...
	jr nz,L_73A0		;739c
	inc a			;739e   ; ...o + 1
	inc a			;739f
L_73A0:
	ld (0e660h),a		;73a0   ; se guarda
	ld a,c			;73a3   ; la x de la tabla de 0x73BB
	and 00fh		;73a4
	ld hl,073bbh		;73a6
	call 05ad8h		;73a9   ; byte_de_tabla: A = el byte HL + A
	ld hl,0e682h		;73ac   ; uno menos de la tanda
	dec (hl)			;73af
	ld e,000h		;73b0   ; y = 0
	ld d,a			;73b2
	call L_7059		;73b3   ; C de p01:7059
	ld a,009h		;73b6   ; el tipo 9
	jp crea_enemigo		;73b8   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700

; ----------------------------------------------------------------------
; DATOS tabla_73BB: 12 bytes que p01:73A6 elige con C & 0x0F; lo leen p01:73A9
;   (12 bytes)
;   0x73bb..0x73c7  (12 bytes)
DATA_tabla_73BB:
	defb 020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0c0h,0d0h	; 73bb   0@P`p......

; ======================================================================
; CODIGO 0x73c7..0x7426  (95 bytes)
; ======================================================================


L_73C7:
	ld hl,0e68ch		;73c7   ; 0xE68C: la espera
	ld a,(hl)			;73ca
	dec (hl)			;73cb   ; - 1
	and a			;73cc
	ret nz			;73cd   ; aun no
	ld b,001h		;73ce   ; p01:73FF: donde esta el jugador
	call L_73FF		;73d0
	dec b			;73d3
	ret z			;73d4   ; no vale: fuera
	ld a,r		;73d5   ; la espera nueva: 0x5A + R & 0x3F
	and 03fh		;73d7
	add a,05ah		;73d9
	ld (0e68ch),a		;73db
	ld b,008h		;73de   ; 8 enemigos en circulo
L_73E0:
	push bc			;73e0
	push de			;73e1
	ld a,b			;73e2   ; el numero
	ld hl,l7424h		;73e3   ; su desplazamiento de la tabla de 0x7424
	call 04e31h		;73e6   ; palabra_a_hl: HL = la palabra HL + 2 x A
	ld a,(de)			;73e9   ; + la y del jugador
	add a,l			;73ea
	ld l,a			;73eb
	inc e			;73ec
	inc e			;73ed
	ld a,(de)			;73ee   ; + la x
	add a,h			;73ef
	ld d,a			;73f0
	ld e,l			;73f1
	ld b,c			;73f2   ; B = C
	ld c,000h		;73f3
	ld a,030h		;73f5   ; el tipo 0x30
	call crea_enemigo		;73f7   ; crea_enemigo: crea un enemigo de tipo A (0xE650) en el primer hueco de 0xE700
	pop de			;73fa
	pop bc			;73fb
	djnz L_73E0		;73fc   ; los 8
	ret			;73fe
L_73FF:
	ld a,(0e227h)		;73ff   ; con dos jugadores...
	cp 002h		;7402
	jr nz,L_7413		;7404
	ld hl,0e68dh		;7406   ; ...alterna...
	ld a,(hl)			;7409
	inc (hl)			;740a
	ld de,0e3a6h		;740b   ; ...el jugador 2 (0xE3A6)...
	ld c,001h		;740e
	rra			;7410
	jr c,L_7418		;7411
L_7413:
	ld de,0e326h		;7413   ; ...o el 1 (0xE326)
	ld c,000h		;7416
L_7418:
	ld a,(de)			;7418   ; su x - 0x30
	sub 030h		;7419
	cp 090h		;741b   ; mas alla de 0x90: no vale
	ret nc			;741d
	dec e			;741e   ; su y (2 antes)
	dec e			;741f
	ld a,(de)			;7420
	cp 0a0h		;7421   ; 0xA0: no vale
	ret z			;7423
L_7424:
	dec b			;7424   ; B = 0: vale
	ret			;7425

; ----------------------------------------------------------------------
; DATOS tabla_7426: 8 palabras (p01:73E3: 0x7424 + 2 x B, B de 8 a 1); lo leen
;   p01:73E6 (16 bytes)
;   0x7426..0x7436  (16 bytes)
DATA_tabla_7426:
	defw 021dfh,02121h,0df21h,0dfdfh,000d0h,03000h,00030h,0d000h	; 7426

; ======================================================================
; CODIGO 0x7436..0x763a  (516 bytes)
; ======================================================================


L_7436:
	ld a,(0e630h)		;7436   ; el reloj en 5...
	cp 005h		;7439
	jr nz,L_7442		;743b
	ld a,(0e203h)		;743d   ; ...uno de cada dos cuadros
	rra			;7440
	ret c			;7441
L_7442:
	ld ix,0ea00h		;7442   ; los disparos de los enemigos (0xEA00)
	ld b,008h		;7446   ; 8
L_7448:
	ld a,(ix+000h)		;7448   ; el tipo
	and a			;744b
	jr z,L_746B		;744c   ; libre: el siguiente
	cp 082h		;744e   ; el 0x82: p12:BD13
	call z,0bd13h		;7450
	ld a,(ix+000h)		;7453
	cp 083h		;7456   ; el 0x83: p12:BD35
	call z,0bd35h		;7458
	call L_6B01		;745b   ; se mueve
	jr nc,L_7467		;745e   ; se sale: fuera
	ld a,(ix+006h)		;7460   ; la x de 0xF8 en adelante...
	cp 0f8h		;7463
	jr c,L_746B		;7465   ; ...tambien
L_7467:
	ld (ix+000h),000h		;7467   ; libre
L_746B:
	ld de,00010h		;746b   ; 16 bytes por disparo
	add ix,de		;746e
	djnz L_7448		;7470   ; los 8
	ret			;7472
L_7473:
	ld ix,0ea00h		;7473   ; los disparos contra el decorado
	ld b,008h		;7477
L_7479:
	ld a,(ix+000h)		;7479   ; vivo?
	and a			;747c
	jr z,L_748C		;747d
	bit 7,a		;747f   ; el bit 7 (los que atraviesan): no
	jr nz,L_748C		;7481
	call L_7494		;7483   ; p01:7494: choca?
	jr nc,L_748C		;7486   ; no: el siguiente
	ld (ix+000h),000h		;7488   ; si: se va
L_748C:
	ld de,00010h		;748c
	add ix,de		;748f
	djnz L_7479		;7491
	ret			;7493
L_7494:
	ld l,(ix+004h)		;7494   ; la y y la x
	ld h,(ix+006h)		;7497
	call 05a99h		;749a   ; su sitio en el mapa de la RAM
	ld a,(0e605h)		;749d   ; el primer caracter del decorado (0xE605)...
	cp (hl)			;74a0   ; ...comparado con el que hay: acarreo si es decorado
	ret			;74a1
L_74A2:
	ld (0f012h),bc		;74a2   ; la velocidad en 0xF012/0xF014
	ld (0f014h),hl		;74a6
	ld a,e			;74a9   ; la y + 8
	add a,008h		;74aa
	ld e,a			;74ac
	ld a,(0f00eh)		;74ad   ; 0xF00E: demasiado cerca?
	and a			;74b0
	ret nz			;74b1   ; si: no dispara
	jr L_74EA		;74b2   ; crea el disparo
L_74B4:
	ld hl,0e63dh		;74b4   ; a quien se apunta (0xE63D)
	ld a,(0e227h)		;74b7   ; con dos jugadores...
	cp 002h		;74ba
	ld a,000h		;74bc   ; ...alterna entre los dos...
	jr nz,L_74C3		;74be
	ld a,(hl)			;74c0   ; ...si no, siempre el 1
	xor 001h		;74c1
L_74C3:
	ld (hl),a			;74c3
	ret			;74c4
L_74C5:
	call L_74B4		;74c5   ; a quien
	ld a,(0e64fh)		;74c8   ; la rapidez: 2 x dificultad + 0x60...
	add a,a			;74cb
	add a,060h		;74cc
	cp 070h		;74ce   ; ...hasta 0x70
	jr c,L_74D4		;74d0
	ld a,070h		;74d2
L_74D4:
	ld (0f00fh),a		;74d4   ; en 0xF00F
	ld a,e			;74d7   ; la y + 8
	add a,008h		;74d8
	ld e,a			;74da
	push de			;74db
	call L_7531		;74dc   ; p01:7531: la velocidad hacia el jugador
	pop de			;74df
	ld a,(0f00eh)		;74e0   ; demasiado cerca?
	and a			;74e3
	ret nz			;74e4   ; si: no dispara
	ld a,(0e654h)		;74e5   ; 0xE654 (esperando)?
	and a			;74e8
	ret nz			;74e9   ; si: no dispara
L_74EA:
	ld hl,0ea00h		;74ea   ; un hueco en los disparos
	ld b,008h		;74ed
L_74EF:
	ld a,(hl)			;74ef   ; libre?
	and a			;74f0
	jr z,L_74FA		;74f1
	ld a,010h		;74f3   ; el siguiente
	add a,l			;74f5
	ld l,a			;74f6
	djnz L_74EF		;74f7
	ret			;74f9   ; no hay: no dispara
L_74FA:
	ld a,001h		;74fa   ; 0xE607 = 1: se ha disparado
	ld (0e607h),a		;74fc
	ld (hl),a			;74ff   ; el tipo 1
	inc l			;7500
	inc l			;7501
	inc l			;7502
	xor a			;7503   ; IX+03 = 0
	ld (hl),a			;7504
	inc l			;7505
	ld (hl),e			;7506   ; IX+04 = la y
	inc l			;7507
	ld (hl),a			;7508   ; IX+05 = 0
	inc l			;7509
	ld (hl),d			;750a   ; IX+06 = la x
	inc l			;750b
	ld de,(0f012h)		;750c   ; IX+07/08 = la velocidad y
	ld (hl),e			;7510
	inc l			;7511
	ld (hl),d			;7512
	ld de,(0f014h)		;7513   ; IX+09/0A = la velocidad x
	inc l			;7517
	ld (hl),e			;7518
	inc l			;7519
	ld (hl),d			;751a
	inc l			;751b
	ld (hl),02ch		;751c   ; IX+0B = 0x2C: el dibujo
	inc l			;751e
	ld (hl),009h		;751f   ; IX+0C = 9: el color
	ret			;7521
L_7522:
	ld (0f00fh),a		;7522   ; la rapidez
	call L_7594		;7525   ; hacia el jugador
	ld d,001h		;7528   ; D = 1: sin azar
	jr L_7536		;752a
L_752C:
	ld a,080h		;752c   ; rapidez 0x80
L_752E:
	ld (0f00fh),a		;752e   ; la rapidez
L_7531:
	call L_7594		;7531   ; la direccion hacia el jugador
L_7534:
	ld d,000h		;7534   ; D = 0: con azar
L_7536:
	ld a,(0f017h)		;7536   ; la direccion (0xF017)
	ld e,a			;7539
	ld a,(0e64fh)		;753a   ; con dificultad 7 o mas...
	cp 007h		;753d
	jr c,L_755E		;753f
	dec d			;7541   ; ...y D = 0...
	jr z,L_755E		;7542
	ld a,r		;7544   ; ...se tuerce al azar...
	ld b,a			;7546
	and 00fh		;7547
	bit 6,b		;7549
	jr z,L_7556		;754b   ; ...a un lado...
	ld b,a			;754d
	ld a,c			;754e
	sub b			;754f
	jr nc,L_7553		;7550
	xor a			;7552
L_7553:
	ld e,a			;7553
	jr L_755E		;7554
L_7556:
	add a,e			;7556   ; ...o al otro (hasta 0x3F)
	cp 03fh		;7557
	jr c,L_755D		;7559
	ld a,03fh		;755b
L_755D:
	ld e,a			;755d
L_755E:
	ld d,000h		;755e   ; la direccion, de 0 a 0x3F
	ld a,e			;7560
	sub 03fh		;7561   ; la complementaria: 0x3F - direccion
	neg		;7563
	ld hl,0773ah		;7565   ; en la tabla de 0x773A: un componente...
	push hl			;7568
	add hl,de			;7569
	ld c,(hl)			;756a   ; ...el de la direccion...
	pop hl			;756b
	ld e,a			;756c
	add hl,de			;756d
	ld a,(hl)			;756e   ; ...y el de la complementaria
	ld (0f016h),a		;756f   ; en 0xF016
	ld e,c			;7572
	call L_7608		;7573   ; x la rapidez
	ld a,(0f010h)		;7576   ; hacia la izquierda...
	and a			;7579
	call nz,05adfh		;757a   ; ...negativo
	ld (0f012h),de		;757d   ; la velocidad x en 0xF012
	ld a,(0f016h)		;7581   ; el otro componente
	ld e,a			;7584
	call L_7608		;7585   ; x la rapidez
	ld a,(0f011h)		;7588   ; hacia arriba...
	and a			;758b
	call nz,05adfh		;758c   ; ...negativo
	ld (0f014h),de		;758f   ; la velocidad y en 0xF014
	ret			;7593
L_7594:
	ld a,(0e63dh)		;7594   ; a cual de los dos
	or a			;7597
	jr z,L_75A8		;7598   ; el 1: p01:75A8
	ld a,(0e3a4h)		;759a   ; el 2: su y y su x
	ld (0f000h),a		;759d
	ld a,(0e3a6h)		;75a0
	ld (0f001h),a		;75a3
	jr L_75B4		;75a6
L_75A8:
	ld a,(0e324h)		;75a8   ; el 1: su y y su x
	ld (0f000h),a		;75ab
	ld a,(0e326h)		;75ae
	ld (0f001h),a		;75b1
L_75B4:
	ld hl,0f010h		;75b4   ; la direccion de (E, D) hacia (0xF000, 0xF001)
	ld (hl),000h		;75b7
	ld a,(0f000h)		;75b9   ; la y de destino - E
	sub e			;75bc
	jr nc,L_75C2		;75bd   ; positiva: bien
	neg		;75bf   ; negativa: al reves...
	inc (hl)			;75c1   ; ...y 0xF010 = 1
L_75C2:
	inc hl			;75c2
	ld (hl),000h		;75c3
	and 0f0h		;75c5   ; la distancia y, solo la cifra alta
	ld e,a			;75c7
	ld a,(0f001h)		;75c8   ; la x de destino - D
	sub d			;75cb
	jr nc,L_75D1		;75cc
	neg		;75ce   ; negativa: al reves y 0xF011 = 1
	inc (hl)			;75d0
L_75D1:
	ld d,a			;75d1
	ld hl,0f00eh		;75d2   ; 0xF00E = 0
	ld (hl),000h		;75d5
	add a,e			;75d7   ; las dos distancias...
	jr c,L_75DF		;75d8
	cp 030h		;75da   ; ...juntas menos de 0x30: muy cerca (0xF00E = 1)
	jr nc,L_75DF		;75dc
	inc (hl)			;75de
L_75DF:
	ld a,d			;75df   ; la distancia x / 16
	rra			;75e0
	rra			;75e1
	rra			;75e2
	rra			;75e3
	and 00fh		;75e4
	add a,e			;75e6   ; + la y: el indice
	ld hl,0763ah		;75e7   ; en la tabla de 0x763A: la direccion
	call 040c4h		;75ea   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;75ed
	ld (0f017h),a		;75ee   ; en 0xF017
	ld c,a			;75f1
	ld hl,(0f010h)		;75f2   ; los dos signos
	ld a,h			;75f5
	ld b,000h		;75f6
	and a			;75f8   ; x negativa: + 0x80
	jr z,L_75FD		;75f9
	ld b,080h		;75fb
L_75FD:
	cp l			;75fd   ; y con el mismo signo...
	ld a,c			;75fe
	jr z,L_7603		;75ff
	neg		;7601   ; ...o al reves
L_7603:
	add a,b			;7603
	ld (0f018h),a		;7604   ; la direccion completa en 0xF018
	ret			;7607
L_7608:
	ld a,(0f00fh)		;7608   ; la rapidez (0xF00F)...
	ld h,a			;760b
	call L_761A		;760c   ; ...x el componente (E): HL = H x E
	xor a			;760f
	add hl,hl			;7610   ; x 8...
	adc a,a			;7611
	add hl,hl			;7612
	adc a,a			;7613
	add hl,hl			;7614
	adc a,a			;7615
	ld l,h			;7616   ; ...y se queda con los bits altos
	ld h,a			;7617
	ex de,hl			;7618
	ret			;7619
L_761A:
	ld b,008h		;761a   ; H x E, 8 bits: HL
	ld l,000h		;761c
	ld d,l			;761e
L_761F:
	add hl,hl			;761f   ; un bit de H
	jr nc,L_7623		;7620   ; si es 1, + E
	add hl,de			;7622
L_7623:
	djnz L_761F		;7623   ; los 8
	ret			;7625
L_7626:
	dec (ix+015h)		;7626   ; IX+15: la espera del disparo
	ret nz			;7629   ; aun no
	ld e,(ix+004h)		;762a   ; la y y la x
	ld d,(ix+006h)		;762d
	call L_74C5		;7630   ; dispara hacia el jugador
	call L_67CA		;7633   ; la espera siguiente
	ld (ix+015h),a		;7636
	ret			;7639

; ----------------------------------------------------------------------
; DATOS tabla_763A: 256 bytes que p01:75E7 elige con A (0x763A + A); lo leen
;   p01:75EA (256 bytes)
;   0x763a..0x773a  (256 bytes)
DATA_tabla_763A:
	defb 020h,00dh,008h,006h,004h,004h,003h,003h,002h,002h,002h,002h,001h,001h,001h,001h	; 763a   ...............
	defb 033h,020h,016h,010h,00dh,00bh,009h,008h,007h,006h,006h,005h,005h,004h,004h,004h	; 764a  3 ..............
	defb 038h,02ah,020h,019h,015h,011h,00fh,00dh,00ch,00ah,009h,009h,008h,007h,007h,006h	; 765a  8* .............
	defb 03ah,02fh,027h,020h,01bh,017h,014h,012h,010h,00eh,00dh,00ch,00bh,00ah,00ah,009h	; 766a  :/' ............
	defb 03bh,033h,02bh,025h,020h,01ch,019h,016h,014h,012h,010h,00fh,00eh,00dh,00ch,00bh	; 767a  .3+% ...........
	defb 03ch,035h,02eh,029h,024h,020h,01ch,01ah,017h,015h,014h,012h,011h,010h,00fh,00eh	; 768a  <5.)$ ..........
	defb 03dh,037h,031h,02ch,027h,023h,020h,01dh,01ah,018h,016h,015h,013h,012h,011h,010h	; 769a  =71,'# .........
	defb 03dh,038h,033h,02eh,02ah,026h,023h,020h,01dh,01bh,019h,017h,016h,015h,013h,012h	; 76aa  =83.*&# ........
	defb 03dh,039h,034h,030h,02ch,028h,025h,022h,020h,01eh,01ch,01ah,018h,017h,015h,014h	; 76ba  =940,(%" .......
	defb 03eh,039h,035h,031h,02eh,02ah,027h,025h,022h,020h,01eh,01ch,01ah,019h,017h,016h	; 76ca  >951.*'%" ......
	defb 03eh,03ah,036h,033h,02fh,02ch,029h,027h,024h,022h,020h,01eh,01ch,01bh,019h,018h	; 76da  >:63/,)'$" .....
	defb 03eh,03bh,037h,034h,031h,02eh,02bh,028h,026h,024h,022h,020h,01eh,01dh,01bh,01ah	; 76ea  >.741.+(&$" ....
	defb 03eh,03bh,038h,035h,032h,02fh,02ch,02ah,028h,025h,023h,022h,020h,01eh,01dh,01ch	; 76fa  >.852/,*(%#" ...
	defb 03eh,03bh,038h,036h,033h,030h,02eh,02bh,029h,027h,025h,023h,021h,020h,01eh,01dh	; 770a  >.8630.+)'%#! ..
	defb 03eh,03ch,039h,036h,034h,031h,02fh,02ch,02ah,028h,026h,025h,023h,021h,020h,01eh	; 771a  ><9641/,*(&%#! .
	defb 03fh,03ch,039h,037h,034h,032h,030h,02dh,02bh,029h,028h,026h,024h,023h,021h,020h	; 772a  ?<97420-+)(&$#!

; ----------------------------------------------------------------------
; DATOS tabla_773A: 64 bytes que p01:7565 elige con DE (0x773A + DE); lo leen
;   p01:7569 (64 bytes)
;   0x773a..0x777a  (64 bytes)
DATA_tabla_773A:
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch,032h,038h,03eh,044h,04ah,050h,056h,05ch	; 773a  ......&,28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h,08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; 774a  bhmsy~..........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h,0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; 775a  ................
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah,0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; 776a  ................

; ======================================================================
; CODIGO 0x777a..0x786d  (243 bytes)
; ======================================================================


L_777A:
	ld a,(0e620h)		;777a   ; el borde por el que salen: en vertical -0x30...
	ld de,0ffd0h		;777d
	and a			;7780
	jr nz,L_7786		;7781
	ld de,00040h		;7783   ; ...en horizontal +0x40
L_7786:
	ld a,(0f004h)		;7786   ; + 0xF004
	ld l,a			;7789
	ld h,000h		;778a
	add hl,de			;778c
	ld a,l			;778d
	ld (0f005h),a		;778e   ; en 0xF005/0xF006
	ld a,h			;7791
	ld (0f006h),a		;7792
	call L_77C9		;7795   ; p01:77C9: los sucesos de 0x9205
	jr z,L_777A		;7798   ; hasta que no toque ninguno
	ret c			;779a
	ld hl,0e659h		;779b   ; se pasa: el siguiente
	inc (hl)			;779e
	jr L_777A		;779f
L_77A1:
	ld a,(0e610h)		;77a1   ; con el scroll de los altos: p01:7905
	and a			;77a4
	jp nz,L_7905		;77a5
	ld a,(0e627h)		;77a8   ; columna nueva?
	and a			;77ab
	jr nz,L_77B8		;77ac
	ld a,(0e628h)		;77ae   ; fila nueva?
	or a			;77b1
	ret z			;77b2
	ld de,0ffd0h		;77b3   ; en vertical: -0x30
	jr L_77BB		;77b6
L_77B8:
	ld de,00140h		;77b8   ; en horizontal: 0x140
L_77BB:
	ld a,e			;77bb   ; en 0xF005/0xF006
	ld (0f005h),a		;77bc
	ld a,d			;77bf
	ld (0f006h),a		;77c0
L_77C3:
	call L_77C9		;77c3   ; todos los que tocan
	jr z,L_77C3		;77c6
	ret			;77c8
L_77C9:
	call L_78EC		;77c9   ; p01:78EC: el suceso siguiente de 0x9205
	ret nz			;77cc   ; aun no: fuera
	ld hl,0e659h		;77cd   ; toca: el siguiente
	inc (hl)			;77d0
	call L_77D6		;77d1   ; p01:77D6: lo pone
	xor a			;77d4
	ret			;77d5
L_77D6:
	bit 7,c		;77d6   ; el bit 7 del dato...
	jr z,L_77E0		;77d8
	ld a,(0e305h)		;77da   ; ...solo con 0xE305 de 4 en adelante
	cp 004h		;77dd
	ret c			;77df
L_77E0:
	ld a,b			;77e0   ; la posicion (B & 0xF8)...
	and 0f8h		;77e1
	ld e,a			;77e3   ; ...en E
	ld l,000h		;77e4
	ld a,(0f005h)		;77e6   ; y el borde (0xF005/0xF006)
	ld d,a			;77e9
	ld a,(0f006h)		;77ea
	ld h,a			;77ed
	ld a,(0e610h)		;77ee   ; 0xE610...
	and a			;77f1
	jr z,L_77FB		;77f2
	dec a			;77f4
	cp 002h		;77f5
	jr c,L_7801		;77f7
	jr L_7807		;77f9
L_77FB:
	ld a,(0e620h)		;77fb   ; en vertical...
	and a			;77fe
	jr z,L_7807		;77ff
L_7801:
	ld a,e			;7801   ; ...la y y la x cambiadas
	ld e,d			;7802
	ld d,a			;7803
	ld a,l			;7804
	ld l,h			;7805
	ld h,a			;7806
L_7807:
	ld a,c			;7807   ; los bits 6-7 del dato...
	rlca			;7808
	rlca			;7809
	rlca			;780a
	and 003h		;780b
	ld b,a			;780d   ; ...en B
	ld a,c			;780e   ; los bits 0-4: el tipo de la pieza
	and 01fh		;780f
L_7811:
	ld (0f010h),a		;7811   ; el tipo en 0xF010
	ld a,b			;7814
	ld (0f011h),a		;7815   ; B en 0xF011
	ld (0f012h),de		;7818   ; la y en 0xF012...
	ld (0f014h),hl		;781c   ; ...y la x en 0xF014
	ld hl,0eb00h		;781f   ; un hueco en las 8 piezas de 0xEB00
	ld de,00010h		;7822
	xor a			;7825
	ld b,008h		;7826
L_7828:
	cp (hl)			;7828   ; libre?
	jr z,L_7830		;7829
	add hl,de			;782b   ; el siguiente
	djnz L_7828		;782c
	xor a			;782e   ; no hay: fuera
	ret			;782f
L_7830:
	push hl			;7830   ; IX = el hueco
	pop ix		;7831
	ld a,(0f010h)		;7833
	ld (hl),a			;7836   ; IX+00 = el tipo
	push af			;7837
	inc l			;7838
	ld (hl),000h		;7839   ; IX+01 = 0
	ld de,(0f012h)		;783b   ; la y
	inc l			;783f
	ld a,d			;7840   ; 0xF8 en la y alta: IX+03 = 0...
	cp 0f8h		;7841
	ld a,000h		;7843
	jr z,L_7848		;7845
	dec a			;7847   ; ...si no, 0xFF
L_7848:
	ld (hl),a			;7848
	inc l			;7849
	ld a,(0f014h)		;784a   ; IX+04 = la y baja
	ld (hl),a			;784d
	inc l			;784e
	ld (hl),e			;784f   ; IX+05 = 0x... la x alta
	inc l			;7850
	ld a,(0f015h)		;7851   ; de 0xF015
	ld (hl),a			;7854
	inc l			;7855
	ld (hl),d			;7856   ; IX+06 = la x
	ld a,l			;7857   ; 5 mas: IX+0B
	add a,005h		;7858
	ld l,a			;785a
	ld a,(0f011h)		;785b   ; = B
	ld (hl),a			;785e
	inc l			;785f
	inc l			;7860
	ld (hl),0ffh		;7861   ; IX+0D = 0xFF
	pop af			;7863
	call L_7869		;7864   ; p01:7869: su arranque
	scf			;7867   ; acarreo: creada
L_7868:
	ret			;7868
L_7869:
	dec a			;7869   ; el tipo - 1...
	call 040ceh		;786a   ; ...por la tabla de detras

; ----------------------------------------------------------------------
; DATOS tabla_786D: 23 destinos del despachador p00:40CE (call en p01:786A, el
;   indice en A): B796, 78DA, 7868, 78E3, 78B6, 78BF, B7F0, 78C8, 7868, B7D4,
;   789B, 78D1, BA66, B7C6, 78AD, 78A4, B9FC, B796, B7E6, A49F, BC91, BCAF,
;   AC44; lo leen p01:786A (46 bytes)
;   0x786d..0x789b  (46 bytes)
DATA_tabla_786D:
	defw 0b796h,078dah,07868h,078e3h,078b6h,078bfh,0b7f0h,078c8h	; 786d
	defw 07868h,0b7d4h,0789bh,078d1h,0ba66h,0b7c6h,078adh,078a4h	; 787d
	defw 0b9fch,0b796h,0b7e6h,0a49fh,0bc91h,0bcafh,0ac44h	; 788d

; ======================================================================
; CODIGO 0x789b..0x7a17  (380 bytes)
; ======================================================================


L_789B:
	call 041cbh		;789b   ; los arranques de las piezas en el banco 12: p12:B720
	call 0b720h		;789e
	jp 041d0h		;78a1   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78A4:
	call 041cbh		;78a4   ; p12:B5FC
	call 0b5fch		;78a7
	jp 041d0h		;78aa   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78AD:
	call 041cbh		;78ad   ; p12:BAC3
	call 0bac3h		;78b0
	jp 041d0h		;78b3   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78B6:
	call 041cbh		;78b6   ; p12:BB8C
	call 0bb8ch		;78b9
	jp 041d0h		;78bc   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78BF:
	call 041cbh		;78bf   ; banco_12_en_a000: pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	call 0bb8ch		;78c2
	jp 041d0h		;78c5   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78C8:
	call 041bfh		;78c8   ; en el 11: p11:BE62
	call 0be62h		;78cb
	jp 041d0h		;78ce   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78D1:
	call 041bfh		;78d1   ; p11:BE4E
	call 0be4eh		;78d4
	jp 041d0h		;78d7   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78DA:
	call 041bfh		;78da   ; p11:BFDE
	call 0bfdeh		;78dd
	jp 041d0h		;78e0   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78E3:
	call 041bfh		;78e3   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0bfdeh		;78e6
	jp 041d0h		;78e9   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_78EC:
	call 041d8h		;78ec   ; con el 14-15
	ld a,(0e301h)		;78ef   ; la lista de la fase de 0x9205
	ld hl,09205h		;78f2
	call 04e28h		;78f5   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld a,(0e659h)		;78f8   ; la ficha 0xE659
	call L_793C		;78fb   ; p01:793C
	ld hl,(0e302h)		;78fe   ; comparada con el scroll
	rst 20h			;7901
	jp 0416eh		;7902   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_7905:
	ld de,000a0h		;7905   ; con los altos: el borde 0xA0
	ld a,e			;7908
	ld (0f005h),a		;7909
	ld a,d			;790c
	ld (0f006h),a		;790d
L_7910:
	call L_7916		;7910   ; todos los que tocan
	jr z,L_7910		;7913
	ret			;7915
L_7916:
	call L_7923		;7916   ; p01:7923: los de 0x9213
	ret nz			;7919
	ld hl,0e688h		;791a   ; toca: el siguiente...
	inc (hl)			;791d
	call L_77D6		;791e   ; ...y lo pone
	xor a			;7921
	ret			;7922
L_7923:
	call 041d8h		;7923   ; con el 14-15
	ld a,(0e301h)		;7926   ; la lista de la fase de 0x9213
	ld hl,09213h		;7929
	call 04e28h		;792c   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld a,(0e688h)		;792f   ; la ficha 0xE688
	call L_793C		;7932
	ld hl,(0e612h)		;7935   ; comparada con el scroll de los altos
	rst 20h			;7938
	jp 0416eh		;7939   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_793C:
	ld b,a			;793c   ; la ficha A x 3
	add a,a			;793d
	add a,b			;793e
	call 040c9h		;793f   ; de_mas_a: DE = DE + A
	ex de,hl			;7942
	ld e,(hl)			;7943   ; la posicion baja
	inc hl			;7944
	ld a,(hl)			;7945   ; el byte con la alta y el tipo
	ld b,a			;7946   ; en B
	and 007h		;7947   ; los 3 bits de la posicion
	ld d,a			;7949
	inc hl			;794a
	ld c,(hl)			;794b   ; C = el tercero
	ret			;794c
L_794D:
	ld hl,0eb70h		;794d   ; cuenta las piezas: desde la ultima (0xEB70)...
	ld de,0fff0h		;7950   ; ...hacia atras
	ld bc,00808h		;7953   ; 8
L_7956:
	ld a,(hl)			;7956   ; viva?
	and a			;7957
	jr nz,L_795E		;7958   ; si: ya esta
	dec c			;795a   ; una menos
	add hl,de			;795b
	djnz L_7956		;795c
L_795E:
	ld a,c			;795e   ; en 0xE6B2: hasta la ultima viva
	ld (0e6b2h),a		;795f
	ret			;7962
L_7963:
	ld ix,0eb00h		;7963   ; las piezas
	ld a,(0e6b2h)		;7967   ; cuantas
	and a			;796a
	ret z			;796b
	ld b,a			;796c
L_796D:
	push bc			;796d
	call L_797A		;796e   ; p01:797A: una
	pop bc			;7971
	ld de,00010h		;7972   ; 16 bytes por pieza
	add ix,de		;7975
	djnz L_796D		;7977
	ret			;7979
L_797A:
	ld a,(ix+000h)		;797a   ; el tipo
	and a			;797d
	ret z			;797e   ; libre: fuera
	call L_7A13		;797f   ; p01:7A13: su rutina
	call L_7A03		;7982   ; p01:7A03
	ld a,(0e628h)		;7985   ; fila nueva?
	and a			;7988
	jr z,L_79C5		;7989   ; no: p01:79C5
	ld a,(ix+000h)		;798b   ; el tipo 6...
	cp 006h		;798e
	jr nz,L_7997		;7990
	ld a,(ix+001h)		;7992   ; ...con IX+01 = 1 no se mueve
	dec a			;7995
	ret z			;7996
L_7997:
	ld a,(0e628h)		;7997   ; hacia donde
	bit 7,a		;799a
	ld l,(ix+004h)		;799c   ; la y de 16 bits
	ld h,(ix+003h)		;799f
	ld de,00008h		;79a2   ; 8
	jr nz,L_79B3		;79a5   ; bit 7: hacia arriba
	add hl,de			;79a7   ; + 8
	ld a,h			;79a8
	or a			;79a9
	jr nz,L_79BF		;79aa   ; alta distinta de 0: bien
	ld a,l			;79ac   ; de 0xA8 en adelante: se va
	cp 0a8h		;79ad
	jr nc,L_79FE		;79af
	jr L_79BF		;79b1
L_79B3:
	or a			;79b3
	sbc hl,de		;79b4   ; - 8
	ld a,h			;79b6
	or a			;79b7
	jr z,L_79BF		;79b8
	ld a,l			;79ba   ; y de 0xC0 para abajo con alta...
	cp 0c0h		;79bb
	jr c,L_79FE		;79bd   ; ...se va
L_79BF:
	ld (ix+004h),l		;79bf   ; se guarda
	ld (ix+003h),h		;79c2
L_79C5:
	ld a,(0e627h)		;79c5   ; columna nueva?
	and a			;79c8
	ret z			;79c9   ; no: fuera
	bit 7,a		;79ca
	ld l,(ix+006h)		;79cc   ; la x de 16 bits
	ld h,(ix+005h)		;79cf
	ld de,00008h		;79d2   ; 8
	jr nz,L_79F0		;79d5   ; bit 7: a la derecha
	or a			;79d7
	sbc hl,de		;79d8   ; - 8
	ld a,h			;79da   ; la alta pasa a 0xFF...
	inc a			;79db
	jr nz,L_79F7		;79dc
	ex de,hl			;79de   ; ...y el ancho entero (IX+09 x 8)...
	ld l,(ix+009h)		;79df
	ld h,000h		;79e2
	add hl,hl			;79e4
	add hl,hl			;79e5
	add hl,hl			;79e6
	ex de,hl			;79e7
	call 05adfh		;79e8   ; menos_de: DE = -DE
	rst 20h			;79eb   ; ...ya ha salido: se va
	jr c,L_79FE		;79ec
	jr L_79F7		;79ee
L_79F0:
	add hl,de			;79f0   ; + 8
	ld de,00150h		;79f1   ; hasta 0x150
	rst 20h			;79f4
	jr nc,L_79FE		;79f5
L_79F7:
	ld (ix+006h),l		;79f7   ; se guarda
	ld (ix+005h),h		;79fa
	ret			;79fd
L_79FE:
	ld (ix+000h),000h		;79fe   ; la pieza se va: tipo 0
	ret			;7a02
L_7A03:
	ld a,(ix+003h)		;7a03   ; la y alta...
	and a			;7a06
	jr nz,L_7A0E		;7a07
	ld a,(ix+005h)		;7a09   ; ...o la x alta distintas de 0...
	and a			;7a0c
	ret z			;7a0d
L_7A0E:
	ld (ix+00dh),0ffh		;7a0e   ; ...IX+0D = 0xFF: fuera de la pantalla
L_7A12:
	ret			;7a12
L_7A13:
	dec a			;7a13   ; el tipo - 1...
	call 040ceh		;7a14   ; ...por la tabla de detras: su rutina de cada cuadro

; ----------------------------------------------------------------------
; DATOS tabla_7A17: 23 destinos del despachador p00:40CE (call en p01:7A14, el
;   indice en A): B6E9, 7A84, 7A12, 7A8D, 7A60, 7A69, B8CC, 7A72, 7A12, B814,
;   7A45, 7A7B, BA71, B87F, 7A57, 7A4E, BA26, B6E9, B8D1, A4AA, BC2C, BCC1,
;   7A96; lo leen p01:7A14 (46 bytes)
;   0x7a17..0x7a45  (46 bytes)
DATA_tabla_7A17:
	defw 0b6e9h,07a84h,07a12h,07a8dh,07a60h,07a69h,0b8cch,07a72h	; 7a17
	defw 07a12h,0b814h,07a45h,07a7bh,0ba71h,0b87fh,07a57h,07a4eh	; 7a27
	defw 0ba26h,0b6e9h,0b8d1h,0a4aah,0bc2ch,0bcc1h,07a96h	; 7a37

; ======================================================================
; CODIGO 0x7a45..0x7c77  (562 bytes)
; ======================================================================


L_7A45:
	call 041cbh		;7a45   ; las de cada cuadro en el banco 12: p12:B73D
	call 0b73dh		;7a48
	jp 041d0h		;7a4b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A4E:
	call 041cbh		;7a4e   ; p12:B624
	call 0b624h		;7a51
	jp 041d0h		;7a54   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A57:
	call 041cbh		;7a57   ; p12:BABE
	call 0babeh		;7a5a
	jp 041d0h		;7a5d   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A60:
	call 041cbh		;7a60   ; p12:BBB6
	call 0bbb6h		;7a63
	jp 041d0h		;7a66   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A69:
	call 041cbh		;7a69   ; p12:BC17
	call 0bc17h		;7a6c
	jp 041d0h		;7a6f   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A72:
	call 041bfh		;7a72   ; en el 11: p11:BDC9
	call 0bdc9h		;7a75
	jp 041d0h		;7a78   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A7B:
	call 041bfh		;7a7b   ; p11:BDFA
	call 0bdfah		;7a7e
	jp 041d0h		;7a81   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A84:
	call 041bfh		;7a84   ; p11:BEB2
	call 0beb2h		;7a87
	jp 041d0h		;7a8a   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A8D:
	call 041bfh		;7a8d   ; p11:BF05
	call 0bf05h		;7a90
	jp 041d0h		;7a93   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A96:
	call 041bfh		;7a96   ; p11:AC67
	call 0ac67h		;7a99
	jp 041d0h		;7a9c   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_7A9F:
	ld ix,0e700h		;7a9f   ; los enemigos contra el decorado
	ld b,00ch		;7aa3
L_7AA5:
	ld a,(ix+02fh)		;7aa5   ; IX+2F distinto de 0: no
	and a			;7aa8
	jr nz,L_7AC5		;7aa9
	ld a,(ix+000h)		;7aab   ; libre: no
	and a			;7aae
	jr z,L_7AC5		;7aaf
	cp 01dh		;7ab1   ; los tipos 0x1D, 0x20 y 0x22...
	jr z,L_7ABD		;7ab3
	cp 020h		;7ab5
	jr z,L_7ABD		;7ab7
	cp 022h		;7ab9
	jr nz,L_7AC5		;7abb
L_7ABD:
	call L_7494		;7abd   ; ...chocan con el decorado?
	jr nc,L_7AC5		;7ac0
	call L_6B62		;7ac2   ; si: se van
L_7AC5:
	ld de,00040h		;7ac5   ; el siguiente
	add ix,de		;7ac8
	djnz L_7AA5		;7aca
	ret			;7acc
L_7ACD:
	ld a,(ix+003h)		;7acd   ; la y alta: Z si esta en la pantalla
	and a			;7ad0
	ret			;7ad1
L_7AD2:
	ld a,(ix+005h)		;7ad2   ; la x alta distinta de 0: fuera
	and a			;7ad5
	ret nz			;7ad6
	ld a,(ix+006h)		;7ad7   ; de 0xF8 en adelante: fuera
	cp 0f8h		;7ada
	jr nc,L_7AE0		;7adc
	jr L_7ACD		;7ade
L_7AE0:
	or 0ffh		;7ae0   ; fuera: NZ
	ret			;7ae2
L_7AE3:
	call L_7AF6		;7ae3   ; p01:7AF6: dentro?
	ret nz			;7ae6   ; no: fuera
	ld (ix+00dh),c		;7ae7   ; IX+0D = C
	ret			;7aea
L_7AEB:
	ld a,(ix+007h)		;7aeb   ; IX+07 - D...
	sub d			;7aee
	call 040c4h		;7aef   ; ...en la tabla HL
	ld c,(hl)			;7af2
	ld (ix+00dh),c		;7af3   ; IX+0D
L_7AF6:
	ld a,(ix+003h)		;7af6   ; la y alta...
	and a			;7af9
	jr nz,L_7B01		;7afa
	ld a,(ix+005h)		;7afc   ; ...o la x alta: fuera de la pantalla
	and a			;7aff
	ret z			;7b00
L_7B01:
	ld (ix+00dh),0ffh		;7b01   ; IX+0D = 0xFF
	ret			;7b05
L_7B06:
	call 04ca4h		;7b06   ; el final de la partida: borra la pantalla
	call L_7BA1		;7b09   ; p01:7BA1: los graficos
	call 04199h		;7b0c   ; con el 10 y el 15
	ld de,038c3h		;7b0f   ; en 0x38C3...
	ld a,(0e6d1h)		;7b12   ; ...el resultado 0xE6D1...
	ld c,a			;7b15
	call 08cf0h		;7b16   ; ...p10:8CF0
	ld a,(0e6d1h)		;7b19   ; 5 o mas...
	cp 005h		;7b1c
	jr c,L_7B33		;7b1e
	ld a,001h		;7b20   ; ...0xE35E = 1...
	ld (0e35eh),a		;7b22
	ld a,(0e227h)		;7b25   ; lee cuantos jugadores (o el modo de dos)
	cp 002h		;7b28
	jr nz,L_7B31		;7b2a
	ld a,001h		;7b2c   ; ...y 0xE3DE = 1 con dos jugadores
	ld (0e3deh),a		;7b2e
L_7B31:
	jr L_7B70		;7b31
L_7B33:
	ld b,a			;7b33   ; el resultado (de 2 a 4)
	ld a,(0002bh)		;7b34   ; la version: japonesa o inglesa (0x002B de la BIOS)
	and 00fh		;7b37
	ld hl,09ffch		;7b39   ; la tabla japonesa (0x9FFC)...
	jr z,L_7B41		;7b3c
	ld hl,0a01ah		;7b3e   ; ...o la inglesa (0xA01A)
L_7B41:
	ld a,b			;7b41
	call 04e28h		;7b42   ; DE = la direccion de la VRAM
	ld a,b			;7b45
	ld hl,0e309h		;7b46   ; 0xE309 + B
	add a,l			;7b49
	ld l,a			;7b4a
	ld a,(hl)			;7b4b   ; su valor x 6
	add a,a			;7b4c
	ld b,a			;7b4d
	add a,a			;7b4e
	add a,b			;7b4f
	ld c,a			;7b50
	ld b,000h		;7b51
	ld a,(0002bh)		;7b53   ; la version
	and 00fh		;7b56
	ld hl,0a006h		;7b58   ; la ficha japonesa (0xA006)...
	jr z,L_7B60		;7b5b
	ld hl,0a024h		;7b5d   ; ...o la inglesa (0xA024)
L_7B60:
	add hl,bc			;7b60   ; + 6 x valor
	ld a,(0002bh)		;7b61   ; la version: 3 letras...
	and 00fh		;7b64
	ld bc,00003h		;7b66
	jr z,L_7B6D		;7b69
	ld c,006h		;7b6b   ; ...o 6
L_7B6D:
	call 04cbeh		;7b6d   ; LDIRVM
L_7B70:
	jp 0416eh		;7b70   ; de vuelta a 1-2-3
L_7B73:
	ld a,001h		;7b73   ; 0xE30A = 1
	ld (0e30ah),a		;7b75
	ld a,(0e227h)		;7b78   ; con dos jugadores 0xE38A = 1
	cp 002h		;7b7b
	jr nz,L_7B84		;7b7d
	ld a,001h		;7b7f
	ld (0e38ah),a		;7b81
L_7B84:
	call 04ca4h		;7b84   ; borra la pantalla
	call L_7BA1		;7b87   ; los graficos
	ld de,03863h		;7b8a   ; en 0x3863...
	ld c,00ah		;7b8d   ; ...el texto 10
L_7B8F:
	call 04199h		;7b8f   ; con el 10 y el 15: p10:944A
	call 0944ah		;7b92
	jr L_7B70		;7b95
L_7B97:
	call 04ca4h		;7b97   ; borra la pantalla
	ld de,03863h		;7b9a   ; en 0x3863 el texto 11
	ld c,00bh		;7b9d
	jr L_7B8F		;7b9f
L_7BA1:
	call 041bfh		;7ba1   ; con el 11: p11:B9E1
	call 0b9e1h		;7ba4
	call 041c3h		;7ba7   ; con el 15: las rachas de p15:A912...
	ld hl,02190h		;7baa   ; ...en 0x2190...
	ld de,0a912h		;7bad
	call 04ce5h		;7bb0   ; ...en los tres tercios
	ld hl,02760h		;7bb3   ; 0x68 bytes de p15:AF9A a 0x2760
	ld de,0af9ah		;7bb6
	ld bc,00068h		;7bb9
	call 04cc1h		;7bbc   ; copia_a_vram_3: copia BC bytes de DE a la VRAM HL en los tres tercios
	ld hl,02560h		;7bbf   ; 0x110 de p15:AE8A a 0x2560...
	ld de,0ae8ah		;7bc2
	ld bc,00110h		;7bc5
	ld a,(0e6d1h)		;7bc8   ; ...o, con el resultado 5...
	cp 005h		;7bcb
	jr nz,L_7BD5		;7bcd
	ld de,0ac8ah		;7bcf   ; ...0x200 de p15:AC8A
	ld bc,00200h		;7bd2
L_7BD5:
	call 04cc1h		;7bd5   ; en los tres tercios
	ld hl,00008h		;7bd8   ; 0xF0 desde 0x0008...
	ld bc,007f8h		;7bdb   ; ...0x7F8 bytes...
	ld a,0f0h		;7bde
	jp 04cd4h		;7be0   ; ...en los tres tercios
L_7BE3:
	call L_7C06		;7be3   ; p01:7C06: los sucesos de p12:A181
	jr z,L_7BE3		;7be6   ; hasta que no toque ninguno
	ret c			;7be8
	ld hl,0e67dh		;7be9   ; se pasa: el siguiente
	inc (hl)			;7bec
	jp L_7BE3		;7bed
L_7BF0:
	ld hl,(0e627h)		;7bf0   ; columna o fila nueva (0xE627/0xE628)?
	ld a,h			;7bf3
	or l			;7bf4
	ret z			;7bf5   ; ninguna: fuera
	ld a,l			;7bf6   ; columna...
	or a			;7bf7
	ld a,0f8h		;7bf8   ; ...borde 0xF8...
	jr nz,L_7BFD		;7bfa
	xor a			;7bfc   ; ...fila: 0
L_7BFD:
	ld (0f004h),a		;7bfd   ; en 0xF004
L_7C00:
	call L_7C06		;7c00   ; todos los que tocan
	jr z,L_7C00		;7c03
	ret			;7c05
L_7C06:
	call 041cbh		;7c06   ; con el 12
	ld a,(0e67dh)		;7c09   ; la ficha 0xE67D de p12:A181
	ld hl,0a181h		;7c0c
	call 04e66h		;7c0f   ; suceso_de_fase: la ficha A de la lista de sucesos de la fase y compara su posicion con el scroll
	jp nz,041d0h		;7c12   ; aun no: de vuelta 2-3
	ld hl,0e67dh		;7c15   ; toca: la siguiente
	inc (hl)			;7c18
	ld a,c			;7c19   ; el dato & 0xF8: la posicion
	and 0f8h		;7c1a
	ld e,a			;7c1c
	ld a,(0f004h)		;7c1d   ; y el borde
	ld d,a			;7c20
	ld a,(0e620h)		;7c21   ; en vertical...
	or a			;7c24
	jr z,L_7C2A		;7c25
	ld a,d			;7c27   ; ...cambiadas
	ld d,e			;7c28
	ld e,a			;7c29
L_7C2A:
	ld a,c			;7c2a   ; el dato & 7: el jefe que se pinta
	and 007h		;7c2b
	ld c,a			;7c2d
	call L_7C36		;7c2e   ; p01:7C36
	call 041d0h		;7c31   ; de vuelta 2-3
	xor a			;7c34
	ret			;7c35
L_7C36:
	ld a,(0e227h)		;7c36   ; con dos jugadores...
	cp 002h		;7c39
	jr z,L_7C41		;7c3b
	ld a,c			;7c3d   ; ...o de 0 a 4
	cp 005h		;7c3e
	ret nc			;7c40
L_7C41:
	ld a,(0ec20h)		;7c41   ; ya hay uno (0xEC20)?
	or a			;7c44
	ret nz			;7c45   ; si: fuera
	ld a,(0e630h)		;7c46   ; el reloj en marcha?
	or a			;7c49
	ret nz			;7c4a   ; si: fuera
	ld hl,0ec20h		;7c4b   ; 0xEC20 = cual...
	ld (hl),c			;7c4e
	inc l			;7c4f
	ld (hl),e			;7c50   ; ...0xEC21 = la y...
	inc l			;7c51
	ld (hl),d			;7c52   ; ...0xEC22 = la x
	jp 04882h		;7c53   ; y sus dibujos (p00:4882)
L_7C56:
	exx			;7c56   ; el primer caracter del decorado (0xE605)...
	ld a,(0e605h)		;7c57   ; lee el byte de 0x88E2 de la fase (y el del jefe)
	ld c,a			;7c5a   ; ...en C'
	exx			;7c5b
	ld iy,0e440h		;7c5c   ; los disparos del jugador (0xE440)
	ld b,00fh		;7c60   ; 15
L_7C62:
	push bc			;7c62
	call L_7C6F		;7c63   ; p01:7C6F: uno
	ld bc,00018h		;7c66   ; 0x18 bytes cada uno
	add iy,bc		;7c69
	pop bc			;7c6b
	djnz L_7C62		;7c6c
	ret			;7c6e
L_7C6F:
	ld a,(iy+000h)		;7c6f   ; el tipo - 1
	dec a			;7c72
	ret m			;7c73   ; 0: libre
	call 040ceh		;7c74   ; por la tabla de detras: su choque con el decorado

; ----------------------------------------------------------------------
; DATOS tabla_7C77: 12 destinos del despachador p00:40CE (call en p01:7C74, el
;   indice en A): 7C8F, 7E4D, 7E4D, 7E4D, 7D90, 7CFA, 7D65, 7CDA, 7D65, 7D61,
;   7E4D, 7E4D; lo leen p01:7C74 (24 bytes)
;   0x7c77..0x7c8f  (24 bytes)
DATA_tabla_7C77:
	defw 07c8fh,07e4dh,07e4dh,07e4dh,07d90h,07cfah,07d65h,07cdah	; 7c77
	defw 07d65h,07d61h,07e4dh,07e4dh	; 7c87  -> L_7D65 L_7D61 L_7E4D L_7E4D

; ======================================================================
; CODIGO 0x7c8f..0x8000  (881 bytes)
; ======================================================================


L_7C8F:
	ld a,(0e620h)		;7c8f   ; en vertical: p01:7CBE
	or a			;7c92
	jr nz,L_7CBE		;7c93
	ld a,(iy+005h)		;7c95   ; la x - 8
	sub 008h		;7c98
	ld h,a			;7c9a
	call L_7CA6		;7c9b   ; p01:7CA6
L_7C9E:
	ld a,(iy+000h)		;7c9e   ; sigue vivo?
	or a			;7ca1
	ret z			;7ca2   ; no: fuera
	ld h,(iy+005h)		;7ca3   ; la x
L_7CA6:
	ld l,(iy+003h)		;7ca6   ; la y
L_7CA9:
	call L_7EA2		;7ca9   ; p01:7EA2: choca con el decorado?
	ret nc			;7cac   ; no: fuera
	ld a,(0e640h)		;7cad   ; con jefe...
	or a			;7cb0
	jr nz,L_7CB8		;7cb1
	call L_7FD4		;7cb3   ; sin jefe: p01:7FD4 (rompe el decorado?)
	jr L_7CBB		;7cb6
L_7CB8:
	call L_7CCC		;7cb8   ; con jefe: el sonido del golpe
L_7CBB:
	jp L_7D31		;7cbb   ; el disparo se acaba (p11:AA64)
L_7CBE:
	ld a,(iy+003h)		;7cbe   ; en vertical: la y + 8
	add a,008h		;7cc1
	ld l,a			;7cc3
	ld h,(iy+005h)		;7cc4
	call L_7CA9		;7cc7
	jr L_7C9E		;7cca
L_7CCC:
	ld a,(0e609h)		;7ccc   ; el golpe solo una vez por cuadro (0xE609)
	or a			;7ccf
	ret nz			;7cd0
	inc a			;7cd1
	ld (0e609h),a		;7cd2
	ld a,00bh		;7cd5   ; el sonido 0x0B
	jp 04d6eh		;7cd7   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_7CDA:
	ld a,(0e301h)		;7cda   ; en la fase 3 0xE6A3 = 1...
	cp 003h		;7cdd
	ld a,001h		;7cdf
	jr z,L_7CE4		;7ce1
	dec a			;7ce3   ; ...si no, 0
L_7CE4:
	ld (0e6a3h),a		;7ce4
	call L_7CFA		;7ce7   ; p01:7CFA
	xor a			;7cea   ; 0xE6A3 = 0
	ld (0e6a3h),a		;7ceb
	ret			;7cee
L_7CEF:
	ld h,(iy+005h)		;7cef   ; H = la x, L = la y del disparo
	ld l,(iy+003h)		;7cf2
L_7CF5:
	call 05a99h		;7cf5   ; a la direccion de la RAM...
	ex de,hl			;7cf8   ; ...en DE
	ret			;7cf9
L_7CFA:
	ld a,(iy+00ah)		;7cfa   ; el largo del rayo (IY+0A)
	or a			;7cfd
	ret z			;7cfe   ; 0: fuera
	ld b,a			;7cff   ; en B
	call L_7CEF		;7d00   ; su sitio en la RAM
L_7D03:
	ld a,(0e620h)		;7d03   ; en vertical: p01:7D36
	or a			;7d06
	jr nz,L_7D36		;7d07
L_7D09:
	call L_7E63		;7d09   ; decorado?
	jr nc,L_7D19		;7d0c   ; no: el siguiente
	ld a,(0e640h)		;7d0e   ; con jefe: el golpe
	or a			;7d11
	jr nz,L_7CB8		;7d12
	call L_7FD4		;7d14   ; sin jefe: se rompe?
	jr nc,L_7D1E		;7d17   ; se rompe: p01:7D1E
L_7D19:
	inc de			;7d19   ; el siguiente caracter a la derecha
	djnz L_7D09		;7d1a   ; todo el largo
	or a			;7d1c   ; sin choque: NC
	ret			;7d1d
L_7D1E:
	ld a,(iy+00ah)		;7d1e   ; el rayo se acorta...
	inc b			;7d21
	sub b			;7d22
	jr c,L_7D31		;7d23   ; ...del todo: se acaba
	jp z,L_7D31		;7d25
	ld (iy+00ah),a		;7d28   ; el largo nuevo
	ld (iy+001h),002h		;7d2b   ; IY+01 = 2
	scf			;7d2f   ; choque: acarreo
	ret			;7d30
L_7D31:
	call 0aa64h		;7d31   ; el disparo se acaba (p11:AA64)
	scf			;7d34
	ret			;7d35
L_7D36:
	call L_7E63		;7d36   ; en vertical: decorado?
	jr nc,L_7D47		;7d39
	ld a,(0e640h)		;7d3b   ; con jefe: el golpe
	or a			;7d3e
	jp nz,L_7CB8		;7d3f
	call L_7FD4		;7d42   ; sin jefe: se rompe?
	jr nc,L_7D51		;7d45
L_7D47:
	ex de,hl			;7d47   ; el caracter de arriba (-64)
	ld de,0ffc0h		;7d48
	add hl,de			;7d4b
	ex de,hl			;7d4c
	djnz L_7D36		;7d4d   ; todo el largo
	or a			;7d4f
	ret			;7d50
L_7D51:
	ld a,(iy+00ah)		;7d51   ; el rayo se acorta
	sub b			;7d54
	jp z,L_7D31		;7d55
	ld (iy+00ah),a		;7d58
	ld (iy+001h),002h		;7d5b
	scf			;7d5f
	ret			;7d60
L_7D61:
	ld a,003h		;7d61   ; tres filas
	jr L_7D67		;7d63
L_7D65:
	ld a,002h		;7d65   ; dos filas
L_7D67:
	ld (0f000h),a		;7d67   ; en 0xF000
	ld a,(iy+00ah)		;7d6a   ; el largo
	or a			;7d6d
	ret z			;7d6e   ; 0: fuera
	ld b,a			;7d6f
	call L_7CEF		;7d70   ; su sitio
L_7D73:
	push bc			;7d73   ; una fila
	push de			;7d74
	call L_7D03		;7d75   ; p01:7D03
	pop de			;7d78
	pop bc			;7d79
	ret c			;7d7a   ; choca: fuera
	inc de			;7d7b   ; la siguiente
	ld a,(0e620h)		;7d7c   ; en horizontal, 64 mas: la fila de abajo
	or a			;7d7f
	jr nz,L_7D87		;7d80
	ld hl,0003fh		;7d82
	add hl,de			;7d85
	ex de,hl			;7d86
L_7D87:
	exx			;7d87   ; las filas de 0xF000
	ld hl,0f000h		;7d88
	dec (hl)			;7d8b
	exx			;7d8c
	jr nz,L_7D73		;7d8d
	ret			;7d8f
L_7D90:
	call L_7CEF		;7d90   ; su sitio, en 0xF000
	ld (0f000h),de		;7d93
	ld a,(iy+00ah)		;7d97   ; el largo
	or a			;7d9a
	jr z,L_7DED		;7d9b   ; 0: p01:7DED
	ld b,a			;7d9d
	ld a,(0e620h)		;7d9e   ; en vertical: p01:7E02
	or a			;7da1
	jr nz,L_7E02		;7da2
	ld c,000h		;7da4   ; cuantos choques (C)
L_7DA6:
	call L_7E63		;7da6   ; decorado?
	jr nc,L_7DB9		;7da9
	ld a,(0e640h)		;7dab   ; con jefe: el golpe
	or a			;7dae
	jp nz,L_7CB8		;7daf
	call L_7FD4		;7db2   ; sin jefe: se rompe?
	jp nc,L_7D31		;7db5   ; no se rompe: se acaba
	inc c			;7db8   ; un choque mas
L_7DB9:
	ld a,040h		;7db9   ; la fila de abajo
	call 040c9h		;7dbb   ; de_mas_a: DE = DE + A
	djnz L_7DA6		;7dbe   ; todo el largo
	ld a,c			;7dc0   ; algun choque: se acaba
	or a			;7dc1
	jp nz,L_7D31		;7dc2
	ld a,(0e627h)		;7dc5   ; sin columna nueva: p01:7DED
	or a			;7dc8
	jr z,L_7DED		;7dc9
	ld de,(0f000h)		;7dcb   ; con columna nueva, la de al lado tambien
	dec de			;7dcf
	ld b,(iy+00ah)		;7dd0
	ld c,000h		;7dd3
L_7DD5:
	call L_7E63		;7dd5
	jr nc,L_7DE1		;7dd8
	call L_7FD4		;7dda
	jp nc,L_7D31		;7ddd
	inc c			;7de0
L_7DE1:
	ld a,040h		;7de1
	call 040c9h		;7de3   ; de_mas_a: DE = DE + A
	djnz L_7DD5		;7de6
	ld a,c			;7de8
	or a			;7de9
	jp nz,L_7D31		;7dea
L_7DED:
	ld a,(iy+00ah)		;7ded   ; el largo x 8...
	add a,a			;7df0
	add a,a			;7df1
	add a,a			;7df2
	ld b,a			;7df3
	ld a,(0e620h)		;7df4   ; ...en horizontal a IY+0D...
	or a			;7df7
	jr nz,L_7DFE		;7df8
	ld (iy+00dh),b		;7dfa
	ret			;7dfd
L_7DFE:
	ld (iy+00ch),b		;7dfe   ; ...en vertical a IY+0C
	ret			;7e01
L_7E02:
	ld c,000h		;7e02   ; en vertical: cuantos choques
L_7E04:
	call L_7E63		;7e04
	jr nc,L_7E17		;7e07
	ld a,(0e640h)		;7e09   ; lee el jefe (1 a 8)
	or a			;7e0c
	jp nz,L_7CB8		;7e0d
	call L_7FD4		;7e10
	jp nc,L_7D31		;7e13
	inc c			;7e16
L_7E17:
	inc de			;7e17   ; el siguiente a la derecha
	djnz L_7E04		;7e18
	ld a,c			;7e1a
	or a			;7e1b
	jp nz,L_7D31		;7e1c
	ld a,(0e627h)		;7e1f   ; sin fila nueva: p01:7DED
	or a			;7e22
	jr z,L_7DED		;7e23
	ld hl,(0f000h)		;7e25   ; con fila nueva, la de abajo tambien
	ld de,00040h		;7e28
	add hl,de			;7e2b
	ex de,hl			;7e2c
	ld b,(iy+00ah)		;7e2d
	ld c,000h		;7e30
L_7E32:
	call L_7E63		;7e32
	jr nc,L_7E3E		;7e35
	call L_7FD4		;7e37
	jp nc,L_7D31		;7e3a
	inc c			;7e3d
L_7E3E:
	ld a,040h		;7e3e
	call 040c9h		;7e40   ; de_mas_a: DE = DE + A
	djnz L_7E32		;7e43
	ld a,c			;7e45
	or a			;7e46
	jp nz,L_7D31		;7e47
	jp L_7DED		;7e4a
L_7E4D:
	ld h,(iy+005h)		;7e4d   ; la x y la y del disparo
	ld l,(iy+003h)		;7e50
	call L_7EA2		;7e53   ; choca con el decorado?
	ret nc			;7e56   ; no: fuera
	ld a,(0e640h)		;7e57   ; sin jefe: fuera
	or a			;7e5a
	ret z			;7e5b
	ld (iy+000h),000h		;7e5c   ; con jefe: el disparo se acaba...
	jp L_7CCC		;7e60   ; ...y el golpe
L_7E63:
	ld a,(de)			;7e63   ; el caracter de (DE)...
	exx			;7e64
	cp c			;7e65   ; ...comparado con el primero del decorado: NC si no es decorado
	ccf			;7e66
	exx			;7e67
	ret nc			;7e68
	ld a,(0e640h)		;7e69   ; con los jefes 7 y 8...
	sub 007h		;7e6c
	cp 001h		;7e6e
	ccf			;7e70
	ret c			;7e71   ; ...todo es decorado
	ld a,(de)			;7e72   ; los caracteres 0x90-0x94...
	sub 090h		;7e73
	cp 005h		;7e75
	ccf			;7e77
	ret nc			;7e78   ; ...no chocan
	sub 030h		;7e79   ; ni los 0xC0-0xC4
	cp 005h		;7e7b
	ccf			;7e7d
	ret			;7e7e
L_7E7F:
	ld a,(iy+000h)		;7e7f   ; el tipo 5: p01:7DED
	cp 005h		;7e82
	jp z,L_7DED		;7e84
	ld a,(iy+00ah)		;7e87   ; el largo x 8...
	add a,a			;7e8a
	add a,a			;7e8b
	add a,a			;7e8c
	ld b,a			;7e8d
	ld a,(0e620h)		;7e8e   ; ...en horizontal a IY+0C...
	or a			;7e91
	jr nz,L_7E98		;7e92
	ld (iy+00ch),b		;7e94
	ret			;7e97
L_7E98:
	ld (iy+00dh),b		;7e98   ; ...en vertical a IY+0D
	ret			;7e9b
L_7E9C:
	call L_7CF5		;7e9c   ; a la direccion de la RAM y mira el caracter
	jp L_7E63		;7e9f
L_7EA2:
	call L_7CF5		;7ea2   ; a la direccion de la RAM
	call L_7E63		;7ea5   ; decorado?
	ret c			;7ea8   ; si: acarreo
	ld a,(0e620h)		;7ea9   ; en vertical...
	or a			;7eac
	jr z,L_7EB7		;7ead
	ld hl,0ffc0h		;7eaf   ; ...el de arriba
	add hl,de			;7eb2
	ex de,hl			;7eb3
	jp L_7E63		;7eb4
L_7EB7:
	inc de			;7eb7   ; en horizontal, el de la derecha...
	ld a,e			;7eb8
	and 01fh		;7eb9
	ret z			;7ebb   ; ...si no se sale de la fila
	jp L_7E63		;7ebc
L_7EBF:
	call 05a99h		;7ebf   ; a la direccion de la RAM...
	ld (0e6bch),hl		;7ec2   ; ...en 0xE6BC
L_7EC5:
	ld a,(0e605h)		;7ec5   ; el primer caracter del decorado
	ld c,a			;7ec8
	call L_7EE7		;7ec9   ; el de HL
	ret c			;7ecc   ; decorado: fuera
	ld de,00040h		;7ecd   ; el de abajo
	add hl,de			;7ed0
	jp L_7EE7		;7ed1
L_7ED4:
	call 05a99h		;7ed4   ; a la direccion de la RAM...
	ld (0e6bch),hl		;7ed7   ; ...en 0xE6BC
L_7EDA:
	ld a,(0e605h)		;7eda   ; el primer caracter del decorado
	ld c,a			;7edd
	call L_7EE7		;7ede   ; el de HL
	ret c			;7ee1   ; decorado: fuera
	inc hl			;7ee2   ; el de la derecha...
	ld a,l			;7ee3
	and 01fh		;7ee4
	ret z			;7ee6   ; ...si no se sale de la fila
L_7EE7:
	ld a,(hl)			;7ee7   ; el caracter...
	cp c			;7ee8   ; ...del decorado? (acarreo)
	ccf			;7ee9
	ret			;7eea
L_7EEB:
	call 05a99h		;7eeb   ; a la direccion de la RAM
L_7EEE:
	ld a,(0e605h)		;7eee   ; y mira el caracter
	ld c,a			;7ef1
	jr L_7EE7		;7ef2
L_7EF4:
	ld h,(ix+006h)		;7ef4   ; la x y la y + 16 del enemigo
	ld a,(ix+004h)		;7ef7
	add a,010h		;7efa
	ld l,a			;7efc
	jr L_7ED4		;7efd
L_7EFF:
	ld h,(ix+006h)		;7eff   ; la x y la y - 1
	ld l,(ix+004h)		;7f02
	dec l			;7f05
	jr L_7ED4		;7f06
L_7F08:
	ld iy,0e300h		;7f08   ; las naves contra el decorado: la 1
	call L_7F26		;7f0c   ; choca?
	jr nc,L_7F1C		;7f0f   ; no: la 2
L_7F11:
	ld a,(iy+020h)		;7f11   ; el estado 3...
	cp 003h		;7f14
	jp z,094a3h		;7f16   ; ...p02:94A3
	jp 09684h		;7f19   ; si no, p02:9684: muere
L_7F1C:
	ld iy,0e380h		;7f1c   ; la 2
	call L_7F26		;7f20
	ret nc			;7f23
	jr L_7F11		;7f24
L_7F26:
	ld a,(0e6c0h)		;7f26   ; 0xE6C0: no se mira
	or a			;7f29
	ret nz			;7f2a
	exx			;7f2b
	ld a,(0e605h)		;7f2c   ; el primer caracter del decorado
	ld c,a			;7f2f
	exx			;7f30
	ld a,(iy+020h)		;7f31   ; el estado de la nave
	dec a			;7f34
	cp 003h		;7f35   ; de 1 a 3
	ret nc			;7f37
	cp 002h		;7f38   ; el 3: p01:7F82
	jr z,L_7F82		;7f3a
	ld a,(0e620h)		;7f3c   ; en vertical: p01:7F62
	or a			;7f3f
	jr nz,L_7F62		;7f40
	ld a,(iy+024h)		;7f42   ; la y + 8
	add a,008h		;7f45
	ld l,a			;7f47
	ld a,(iy+026h)		;7f48   ; la x
	ld h,a			;7f4b
	and 007h		;7f4c   ; a medio caracter?
	cp 004h		;7f4e
	push af			;7f50
	call L_7CF5		;7f51   ; a la direccion de la RAM
	pop af			;7f54
	jr nc,L_7F5B		;7f55
	call L_7F5C		;7f57   ; el primero
	ret c			;7f5a
L_7F5B:
	inc de			;7f5b   ; el siguiente
L_7F5C:
	ld a,(de)			;7f5c   ; decorado? (acarreo)
	exx			;7f5d
	cp c			;7f5e
	ccf			;7f5f
	exx			;7f60
	ret			;7f61
L_7F62:
	ld a,(iy+026h)		;7f62   ; en vertical: la x + 4
	add a,004h		;7f65
	ld h,a			;7f67
	ld a,(iy+024h)		;7f68   ; la y
	ld l,a			;7f6b
	and 007h		;7f6c
	cp 004h		;7f6e
	push af			;7f70
	call L_7CF5		;7f71
	pop af			;7f74
	jr nc,L_7F7B		;7f75
	call L_7F5C		;7f77
	ret c			;7f7a
L_7F7B:
	ld a,040h		;7f7b   ; el de abajo
	call 040c9h		;7f7d   ; de_mas_a: DE = DE + A
	jr L_7F5C		;7f80
L_7F82:
	ld a,(0e620h)		;7f82   ; el estado 3: en vertical p01:7FA9
	or a			;7f85
	jr nz,L_7FA9		;7f86
	ld a,(iy+024h)		;7f88   ; la y + 8
	add a,008h		;7f8b
	ld l,a			;7f8d
	ld a,(iy+026h)		;7f8e
	ld h,a			;7f91
	and 007h		;7f92
	cp 004h		;7f94
	push af			;7f96
	call L_7CF5		;7f97
	pop af			;7f9a
	jr nc,L_7FA1		;7f9b
	call L_7F5C		;7f9d
	ret c			;7fa0
L_7FA1:
	inc de			;7fa1   ; y los dos siguientes
	call L_7F5C		;7fa2
	ret c			;7fa5
	inc de			;7fa6
	jr L_7F5C		;7fa7
L_7FA9:
	ld a,(iy+026h)		;7fa9   ; en vertical: la x + 4, la y + 8
	add a,004h		;7fac
	ld h,a			;7fae
	ld a,(iy+024h)		;7faf
	add a,008h		;7fb2
	ld l,a			;7fb4
	and 007h		;7fb5
	cp 004h		;7fb7
	push af			;7fb9
	call L_7CF5		;7fba
	pop af			;7fbd
	jr nc,L_7FC4		;7fbe
	call L_7F5C		;7fc0
	ret c			;7fc3
L_7FC4:
	ld a,040h		;7fc4   ; y los dos de abajo
	call 040c9h		;7fc6   ; de_mas_a: DE = DE + A
	call L_7F5C		;7fc9
	ret c			;7fcc
	ld a,040h		;7fcd
	call 040c9h		;7fcf   ; de_mas_a: DE = DE + A
	jr L_7F5C		;7fd2
L_7FD4:
	ld a,(0e640h)		;7fd4   ; con jefe: no se rompe nada
	or a			;7fd7
	ret nz			;7fd8
	ld a,(0e301h)		;7fd9   ; la fase
	dec a			;7fdc
	jr z,L_7FEA		;7fdd   ; la 1: p01:7FEA
	dec a			;7fdf
	ld hl,06e04h		;7fe0   ; la 2: con 0x6E04, en p02:8002
	jr z,$+31		;7fe3
	dec a			;7fe5   ; la 3: p02:800C
	jr z,$+39		;7fe6
	xor a			;7fe8   ; las demas: no
	ret			;7fe9
L_7FEA:
	ld a,(de)			;7fea   ; la fase 1: los caracteres 0x60-0x63...
	sub 060h		;7feb
	cp 004h		;7fed
	ret nc			;7fef   ; ...los otros no se rompen
	add a,05ch		;7ff0   ; pasan a 0x5C-0x5F
	ld (de),a			;7ff2   ; en la RAM
	push de			;7ff3
	ld hl,00020h		;7ff4   ; y el de abajo (32 mas)...
	add hl,de			;7ff7
	ld a,e			;7ff8   ; ...segun la columna
	and 01fh		;7ff9
	add a,a			;7ffb
	add a,020h		;7ffc
	ld (hl),a			;7ffe
	pop de			;7fff
