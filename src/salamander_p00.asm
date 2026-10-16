; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l5e52h:	equ 0x05e52

; ----------------------------------------------------------------------
; DATOS cabecera: cabecera del cartucho: "AB", INIT = 0x40DA y STATEMENT,
;   DEVICE y TEXT a cero; la lee la BIOS al arrancar; lo leen BIOS (16 bytes)
;   0x4000..0x4010  (16 bytes)
DATA_cabecera:
	defb 041h,042h,0dah,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............

; ----------------------------------------------------------------------
; DATOS cabecera_game_master: la segunda cabecera de Konami: "CD", 0x07 0x58
;   (RC-758) y los 21 bytes que lee el Game Master (direcciones de la RAM del
;   juego y, en 0x4023, la rutina 0x4054); este cartucho busca la de Nemesis 2
;   en el vecino (p03:B5E3); lo leen Game Master (23 bytes)
;   0x4010..0x4027  (23 bytes)
DATA_cabecera_game_master:
	defb 043h,044h,007h,058h,008h,000h,0e2h,004h,001h,0e3h,006h,000h,0e3h,07ah,0e2h,075h	; 4010  CD.X.........z.u
	defb 0e2h,002h,0e2h,054h,040h,000h,000h	; 4020

; ----------------------------------------------------------------------
; DATOS detras_de_la_cabecera: 9 bytes entre los 21 de la cabecera "CD" y la
;   tabla de saltos de 0x4030: ni el Game Master (21 bytes) ni este cartucho
;   los leen a la vista; lo leen nadie (9 bytes)
;   0x4027..0x4030  (9 bytes)
DATA_detras_de_la_cabecera:
	defb 000h,080h,000h,000h,001h,0ffh,0ffh,000h,000h	; 4027  .........

; ======================================================================
; CODIGO 0x4030..0x4868  (2104 bytes)
; ======================================================================


L_4030:
	jp L_4039		;4030   ; tabla de saltos de 0x4030: la entrada 0 la usa p10:8D46
L_4033:
	jp L_4042		;4033   ; entrada 1 de la tabla de saltos
L_4036:
	jp L_404B		;4036   ; entrada 2 de la tabla de saltos
L_4039:
	call bancos_1_2_3		;4039   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call 08263h		;403c   ; el banco 2 en 0x8000: p02:8263 (los jugadores)
	jp bancos_10_15		;403f   ; y vuelve con el 10 y el 15 puestos
L_4042:
	call bancos_1_2_3		;4042   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call 0a5eeh		;4045   ; p03:A5EE con 1-2-3
	jp bancos_10_15		;4048   ; y vuelve con el 10 y el 15 puestos
L_404B:
	call bancos_1_2_3		;404b   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call 0a808h		;404e   ; p03:A808 con 1-2-3 (las dos fichas de jugador)
	jp bancos_10_15		;4051   ; y vuelve con el 10 y el 15 puestos
L_4054:
	ld hl,0e301h		;4054   ; apunta a la fase (de 1 a 7; 0 en la presentacion)
	ld a,(hl)			;4057   ; la fase
	or a			;4058   ; es 0?
	jr nz,L_405D		;4059   ; si no, la deja
	ld (hl),001h		;405b   ; la fase 0 pasa a ser la 1
L_405D:
	ld a,(0e227h)		;405d   ; lee cuantos jugadores (o el modo de dos)
	or a			;4060   ; un jugador?
	ret z			;4061   ; con uno, fuera
	ld hl,(0e300h)		;4062   ; lee la ficha del jugador 1 (IY, 0x80 bytes) y el byte siguiente (16 bits)
	ld (0e380h),hl		;4065   ; con dos, copia los dos primeros bytes de la ficha del 1 en la del 2
	ret			;4068
interrupcion:		; la interrupcion (H.KEYI): cuenta el cuadro, el sonido con 4-5-6 y el cuadro del juego
	call 0013eh		;4069   ; BIOS RDVDP - Reads VDP status register
	di			;406c   ; sin interrupciones durante el cuadro
	ld hl,(0f0f7h)		;406d   ; lee la cuenta de interrupciones (16 bits)
	inc hl			;4070   ; un cuadro mas
	ld (0f0f7h),hl		;4071   ; guarda la cuenta de interrupciones (16 bits)
	ld hl,0e23ah		;4074   ; otra cuenta de cuadros en 0xE23A
	inc (hl)			;4077   ; sube
	call L_4E7F		;4078   ; p00:4E7F: lo que se mira cada cuadro
	ld hl,0e214h		;407b   ; 0xE214: el sonido ya esta en marcha?
	ld a,(hl)			;407e   ; lee la marca
	and a			;407f   ; 0 = libre
	ld (hl),001h		;4080   ; la marca a 1 mientras suena
	jp nz,L_40C2		;4082   ; si ya estaba, no se vuelve a entrar
	ld a,004h		;4085   ; los bancos 4-5-6 sin tocar sus copias: el sonido
	ld (07000h),a		;4087   ; el mapper: pone en 0x6000 el banco de A
	inc a			;408a   ; el 5
	ld (09000h),a		;408b   ; el mapper: pone en 0x8000 el banco de A
	inc a			;408e   ; el 6
	ld (0b000h),a		;408f   ; el mapper: pone en 0xA000 el banco de A
	call 06978h		;4092   ; sonido_cuadro: el sonido de un cuadro: los 8 canales (0xE000 + 0x2C x k)
	xor a			;4095   ; se acabo el sonido de este cuadro
	ld (0e214h),a		;4096   ; la marca de sonido a 0
	di			;4099   ; sin interrupciones para devolver los bancos
	ld a,(0f0f1h)		;409a   ; lee la copia del banco de 0x6000
	ld (07000h),a		;409d   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;40a0   ; lee la copia del banco de 0x8000
	ld (09000h),a		;40a3   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;40a6   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;40a9   ; el mapper: pone en 0xA000 el banco de A
	ld hl,0e205h		;40ac   ; 0xE205: el cuadro del juego ya esta en marcha?
	ld a,(hl)			;40af   ; lee la marca
	and a			;40b0   ; 0 = libre
	jr nz,L_40C2		;40b1   ; si no, solo el sonido
	inc (hl)			;40b3   ; la marca a 1
	ei			;40b4   ; con interrupciones: el cuadro puede durar mas de una
	call L_51A7		;40b5   ; p00:51A7, p00:5208 y p00:524C: el cuadro del juego
	call L_5208		;40b8
	call L_524C		;40bb
	xor a			;40be   ; el cuadro ha acabado
	ld (0e205h),a		;40bf   ; la marca del cuadro a 0
L_40C2:
	ei			;40c2
	ret			;40c3   ; vuelve de la interrupcion
hl_mas_a:		; HL = HL + A
	add a,l			;40c4   ; L + A
	ld l,a			;40c5   ; en L
	ret nc			;40c6   ; sin acarreo, ya esta
	inc h			;40c7   ; con acarreo, H + 1
	ret			;40c8
de_mas_a:		; DE = DE + A
	add a,e			;40c9   ; E + A
	ld e,a			;40ca   ; en E
	ret nc			;40cb   ; sin acarreo, ya esta
	inc d			;40cc   ; con acarreo, D + 1
	ret			;40cd
despacha:		; salta a la entrada A de la tabla que va detras del call
	pop hl			;40ce   ; HL = la tabla que va detras del call (su direccion de vuelta)
L_40CF:
	add a,a			;40cf   ; A x 2: la palabra A
	add a,l			;40d0   ; + la tabla
	ld l,a			;40d1
	jr nc,L_40D5		;40d2   ; sin acarreo, ya esta
	inc h			;40d4   ; con acarreo, H + 1
L_40D5:
	ld a,(hl)			;40d5   ; la palabra, byte bajo
	inc hl			;40d6
	ld h,(hl)			;40d7   ; byte alto
	ld l,a			;40d8
	jp (hl)			;40d9   ; salta alli
init:		; el arranque del cartucho (INIT de la cabecera AB)
	di			;40da   ; el arranque: sin interrupciones
	im 1		;40db   ; modo 1 de interrupcion
	ld a,0c3h		;40dd   ; 0xC3 = jp
	ld (0fd9ah),a		;40df   ; en el gancho H.KEYI (0xFD9A)
	ld hl,interrupcion		;40e2   ; jp interrupcion
	ld (0fd9bh),hl		;40e5   ; la direccion del gancho
	ld sp,0f0f0h		;40e8   ; la pila debajo de las copias de los bancos
	call L_412F		;40eb   ; p00:412F: este cartucho tambien en 0x8000-0xBFFF
	call L_414F		;40ee   ; p00:414F: apunta el slot de este cartucho
	xor a			;40f1   ; los bancos de encendido: 0, 1, 2 y 3
	ld hl,0f0f0h		;40f2   ; apunta a la copia del banco de 0x4000 (0)
	ld (05000h),a		;40f5   ; el mapper: pone en 0x4000 el banco de A
	ld (hl),a			;40f8   ; con su copia en 0xF0F0-3
	inc hl			;40f9
	inc a			;40fa   ; el 1
	ld (07000h),a		;40fb   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;40fe
	inc hl			;40ff
	inc a			;4100   ; el 2
	ld (09000h),a		;4101   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;4104
	inc hl			;4105
	inc a			;4106   ; el 3
	ld (hl),a			;4107
	ld (0b000h),a		;4108   ; el mapper: pone en 0xA000 el banco de A
	ld hl,0e000h		;410b   ; toda la RAM del juego, de 0xE000 a 0xEFFF
	ld de,0e001h		;410e
	ld bc,00fffh		;4111   ; 4.095 bytes mas
	xor a			;4114   ; a cero
	ld (hl),a			;4115
	ldir		;4116   ; la borra
	inc a			;4118   ; A = 1
	ld (0e205h),a		;4119   ; 0xE205 = 1: que la interrupcion no empiece un cuadro todavia
	ld (0e206h),a		;411c   ; y 0xE206 = 1
	call L_50D0		;411f   ; p00:50D0: prepara el VDP y la pantalla
	call 0b599h		;4122   ; p03:B599: mira que hay en el otro slot (Nemesis 2: p03:B5E3)
	xor a			;4125   ; ya puede ir el cuadro
	ld (0e205h),a		;4126   ; 0xE205 = 0
	call 0013eh		;4129   ; BIOS RDVDP - Reads VDP status register | lee el estado del VDP: da por atendida la interrupcion pendiente
	ei			;412c   ; con interrupciones
L_412D:
	jr L_412D		;412d   ; y se queda aqui: el juego entero corre desde la interrupcion
L_412F:
	call 00138h		;412f   ; BIOS RSLREG - Reads the primary slot register | el slot primario de las paginas
	rrca			;4132   ; el de la pagina 1 (0x4000), donde estamos
	rrca			;4133
	and 003h		;4134   ; dos bits
	ld c,a			;4136   ; C = el slot primario
	ld b,000h		;4137
	ld hl,0fcc1h		;4139   ; 0xFCC1: la tabla de slots expandidos de la BIOS (EXPTBL)
	add hl,bc			;413c   ; la del slot primario
	ld a,(hl)			;413d   ; lee si esta expandido
	and 080h		;413e   ; el bit 7
	or c			;4140   ; con el slot primario
	ld c,a			;4141
	inc hl			;4142   ; cuatro mas: SLTTBL, el secundario de ese slot
	inc hl			;4143
	inc hl			;4144
	inc hl			;4145
	ld a,(hl)			;4146   ; lo lee
	and 00ch		;4147   ; el secundario de la pagina 1 (bits 2-3)
	or c			;4149   ; con lo anterior: el slot de este cartucho
	ld h,080h		;414a   ; la pagina 2 (0x8000)
	jp 00024h		;414c   ; BIOS ENASLT - Switches to specified slot and page definitively | ENASLT: este cartucho tambien en 0x8000-0xBFFF
L_414F:
	call 00138h		;414f   ; BIOS RSLREG - Reads the primary slot register | lo mismo para guardar el slot
	rrca			;4152   ; el de la pagina 1
	rrca			;4153
	and 003h		;4154
	ld c,a			;4156   ; C = el slot primario
	ld b,000h		;4157
	ld hl,0fcc1h		;4159   ; EXPTBL
	add hl,bc			;415c   ; la del slot primario
	or (hl)			;415d   ; con el bit de expandido
	ld c,a			;415e
	inc hl			;415f
	inc hl			;4160
	inc hl			;4161
	inc hl			;4162
	ld a,(hl)			;4163   ; SLTTBL del slot
	and 00ch		;4164   ; el secundario de la pagina 1
	or c			;4166   ; junto
	ld (0f0f6h),a		;4167   ; guarda el slot de este cartucho
	ret			;416a
L_416B:
	jp pide_sonido		;416b   ; el sonido: salta a pide_sonido
bancos_1_2_3:		; pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	push af			;416e   ; guarda A
	ld a,001h		;416f   ; empieza por el 1
	jr L_4180		;4171
bancos_4_5_6:		; pone los bancos 4-5-6 (y su copia en 0xF0F1-3)
	push af			;4173
	ld a,004h		;4174   ; empieza por el 4
	jr L_4180		;4176
bancos_7_8_9:		; pone los bancos 7-8-9 (y su copia en 0xF0F1-3)
	push af			;4178
	ld a,007h		;4179   ; empieza por el 7
	jr L_4180		;417b
bancos_13_14_15:		; pone los bancos 13-14-15 (y su copia en 0xF0F1-3)
	push af			;417d
	ld a,00dh		;417e   ; empieza por el 13
L_4180:
	di			;4180   ; sin interrupciones mientras se cambia de banco
	push hl			;4181
	ld hl,0f0f1h		;4182   ; las copias en RAM de los registros
	ld (07000h),a		;4185   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;4188   ; y su copia
	inc a			;4189   ; el siguiente banco
	inc l			;418a   ; la siguiente copia
	ld (09000h),a		;418b   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;418e   ; y su copia
	inc a			;418f   ; el siguiente
	inc l			;4190   ; la siguiente copia
	ld (0b000h),a		;4191   ; el mapper: pone en 0xA000 el banco de A
	ld (hl),a			;4194   ; y su copia
	pop hl			;4195
	pop af			;4196   ; devuelve A
	ei			;4197   ; con interrupciones
	ret			;4198
bancos_10_15:		; pone el banco 10 en 0x8000 y el 15 en 0xA000 (y su copia en 0xF0F1-3)
	di			;4199   ; sin interrupciones
	ld a,00ah		;419a   ; el banco 10
	ld (09000h),a		;419c   ; el mapper: pone en 0x8000 el banco de A
	ld (0f0f2h),a		;419f   ; guarda la copia del banco de 0x8000
	ld a,00fh		;41a2   ; el banco 15
	ld (0b000h),a		;41a4   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f3h),a		;41a7   ; guarda la copia del banco de 0xA000
	ei			;41aa   ; con interrupciones
	ret			;41ab
banco_14_en_8000:		; pone el banco 14 en 0x8000 (y su copia en 0xF0F1-3)
	ld a,00eh		;41ac   ; el banco 14 y a la escritura de 0x9000
	jr L_41B2		;41ae
banco_10_en_8000:		; pone el banco 10 en 0x8000 (y su copia en 0xF0F1-3)
	ld a,00ah		;41b0   ; el banco 10
L_41B2:
	di			;41b2   ; sin interrupciones
	ld (09000h),a		;41b3   ; el mapper: pone en 0x8000 el banco de A
	ld (0f0f2h),a		;41b6   ; guarda la copia del banco de 0x8000
	ei			;41b9   ; con interrupciones
	ret			;41ba
banco_6_en_a000:		; pone el banco 6 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,006h		;41bb   ; el banco 6
	jr L_41CD		;41bd
banco_11_en_a000:		; pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,00bh		;41bf   ; el banco 11
	jr L_41CD		;41c1
banco_15_en_a000:		; pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,00fh		;41c3   ; el banco 15
	jr L_41CD		;41c5
banco_9_en_a000:		; pone el banco 9 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,009h		;41c7   ; el banco 9
	jr L_41CD		;41c9
banco_12_en_a000:		; pone el banco 12 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,00ch		;41cb   ; el banco 12
L_41CD:
	di			;41cd   ; sin interrupciones
	jr L_41E2		;41ce   ; a la escritura de 0xB000
bancos_2_3:		; pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,002h		;41d0   ; el banco 2 (y el 3 detras)
	jr L_41DA		;41d2
bancos_8_9:		; pone los bancos 8-9 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,008h		;41d4   ; el banco 8 (y el 9 detras)
	jr L_41DA		;41d6
bancos_14_15:		; pone los bancos 14-15 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,00eh		;41d8   ; el banco 14 (y el 15 detras)
L_41DA:
	di			;41da   ; sin interrupciones
	ld (09000h),a		;41db   ; el mapper: pone en 0x8000 el banco de A
	ld (0f0f2h),a		;41de   ; guarda la copia del banco de 0x8000
	inc a			;41e1   ; el siguiente para 0xA000
L_41E2:
	ld (0b000h),a		;41e2   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f3h),a		;41e5   ; guarda la copia del banco de 0xA000
	ei			;41e8   ; con interrupciones
	ret			;41e9
bancos_1_2:		; pone los bancos 1-2 en 0x6000-0x8000 (y su copia en 0xF0F1-3)
	ld a,001h		;41ea   ; el banco 1 (y el 2 detras)
	jr L_41F0		;41ec
bancos_7_8:		; pone los bancos 7-8 en 0x6000-0x8000 (y su copia en 0xF0F1-3)
	ld a,007h		;41ee   ; el banco 7 (y el 8 detras)
L_41F0:
	di			;41f0   ; sin interrupciones
	ld (07000h),a		;41f1   ; el mapper: pone en 0x6000 el banco de A
	ld (0f0f1h),a		;41f4   ; guarda la copia del banco de 0x6000
	inc a			;41f7   ; el siguiente para 0x8000
	ld (09000h),a		;41f8   ; el mapper: pone en 0x8000 el banco de A
	ld (0f0f2h),a		;41fb   ; guarda la copia del banco de 0x8000
	ei			;41fe   ; con interrupciones
	ret			;41ff
L_4200:
	call L_5EA7		;4200   ; el cuadro del juego en marcha: p00:5EA7
	xor a			;4203   ; tres contadores de 0xE607-0xE609 a 0
	ld (0e607h),a		;4204
	ld (0e608h),a		;4207
	ld (0e609h),a		;420a
	call L_5F69		;420d   ; p00:5F69
	call bancos_14_15		;4210   ; bancos_14_15: pone los bancos 14-15 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 06055h		;4213   ; con el 14-15 en 0x8000-0xA000: p01:6055
	call bancos_1_2_3		;4216   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call borra_atributos		;4219   ; los sprites fuera de la pantalla antes de repintarlos
	call 08510h		;421c   ; p02:8510: el scroll y sus altos
	ld a,(0e21ah)		;421f   ; 0xE21A distinto de 0: no hay nada mas este cuadro
	and a			;4222   ; ...
	ret nz			;4223   ; fuera
	call 08720h		;4224   ; p02:8720
	call banco_12_en_a000		;4227   ; con el 12 en 0xA000: p12:A5CE
	call 0a5ceh		;422a
	call bancos_2_3		;422d   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,(0e6d0h)		;4230   ; 0xE6D0 distinto de 0: fuera
	or a			;4233
	ret nz			;4234   ; fuera
	call bancos_13_14_15		;4235   ; con 13-14-15: p00:4959, el mapa
	call L_4959		;4238
	call bancos_1_2_3		;423b   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call L_5C77		;423e   ; p00:5C77: cambios de graficos a mitad de fase
	call 08263h		;4241   ; p02:8263: los jugadores
	ld a,(0e213h)		;4244   ; 0xE213 = 0: la partida no esta en marcha
	or a			;4247
	ret z			;4248   ; fuera
	call 08929h		;4249   ; lo de la partida: p02:8929, p03:A5EE, p03:A808...
	call 0a5eeh		;424c
	call 0a808h		;424f
	call 0a8b7h		;4252
	call 0a851h		;4255
	ld a,(0e6aah)		;4258   ; 0xE6AA distinto de 0: se salta p01:68A7, 7436 y 6E99
	or a			;425b
	jr nz,L_4267		;425c   ; si no es 0, se salta los tres
	call 068a7h		;425e
	call 07436h		;4261
	call 06e99h		;4264
L_4267:
	call 08b61h		;4267   ; lo que va siempre
	call 07bf0h		;426a
	call banco_11_en_a000		;426d   ; con el 11 en 0xA000: p11:BBE2 y p11:BB4B
	call 0bbe2h		;4270
	call 0bb4bh		;4273
	call bancos_2_3		;4276   ; de vuelta el 2 y el 3
	call 0794dh		;4279
	call 07963h		;427c
	call 077a1h		;427f
	call 09183h		;4282
	call banco_12_en_a000		;4285   ; con el 12 en 0xA000: p12:A000
	call 0a000h		;4288
	call bancos_2_3		;428b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 09c7bh		;428e
	call 06e76h		;4291
	call L_5B35		;4294   ; p00:5B35: el jefe
	ld a,(0e6aah)		;4297   ; 0xE6AA distinto de 0: se salta los enemigos del banco 2
	or a			;429a
	jr nz,L_42C4		;429b   ; si no es 0, se los salta
	call 08fa0h		;429d   ; los enemigos del banco 2 (p02:8FA0 ... p02:996E)
	call 09837h		;42a0
	call 09a1ah		;42a3
	call 09c43h		;42a6
	call 09c3bh		;42a9
	call 08bc8h		;42ac
	call 08d66h		;42af
	call 095cdh		;42b2
	call 095a5h		;42b5
	call 098d3h		;42b8
	call 09649h		;42bb
	call 09473h		;42be
	call 0996eh		;42c1
L_42C4:
	call 08b97h		;42c4   ; lo que va siempre
	call 062c2h		;42c7
	call banco_12_en_a000		;42ca   ; con el 12 en 0xA000: p12:B7E2
	call 0b7e2h		;42cd
	call bancos_1_2_3		;42d0   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call banco_11_en_a000		;42d3   ; con el 11 en 0xA000: p11:BC61
	call 0bc61h		;42d6
	call bancos_2_3		;42d9   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 07f08h		;42dc
	call 07473h		;42df
	call 07c56h		;42e2
	ld a,(0e6aah)		;42e5   ; 0xE6AA = 0: p01:7A9F
	or a			;42e8
	call z,07a9fh		;42e9
	call banco_12_en_a000		;42ec   ; con el 12: p12:BDFC y p12:BD67
	call 0bdfch		;42ef
	call 0bd67h		;42f2
	call bancos_2_3		;42f5   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 08ef1h		;42f8
	call 091e1h		;42fb
	call banco_12_en_a000		;42fe   ; con el 12: p12:A1C2
	call 0a1c2h		;4301
	call banco_11_en_a000		;4304   ; con el 11: p11:A0D0
	call 0a0d0h		;4307
	call bancos_2_3		;430a   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 0925ah		;430d
	call 0610ch		;4310
	call 060d4h		;4313
	call banco_11_en_a000		;4316   ; con el 11: p11:A000, A06A, A09C y A224
	call 0a000h		;4319
	call 0a06ah		;431c
	call 0a09ch		;431f
	call 0a224h		;4322
	call bancos_2_3		;4325   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call banco_12_en_a000		;4328   ; con el 12: p12:A4A9
	call 0a4a9h		;432b
	call bancos_1_2_3		;432e   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call L_4B1A		;4331   ; p00:4B1A
	call L_5FC5		;4334   ; p00:5FC5
	call L_5F0C		;4337   ; p00:5F0C
	call banco_11_en_a000		;433a   ; con el 11: p11:A177
	call 0a177h		;433d
	call banco_12_en_a000		;4340   ; con el 12: p12:A26A
	call 0a26ah		;4343
	call bancos_2_3		;4346   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call 09221h		;4349
	call L_5B64		;434c   ; p00:5B64: el jefe
	call 08bb4h		;434f
	call 06263h		;4352
	call banco_11_en_a000		;4355   ; con el 11: p11:BCEE
	call 0bceeh		;4358
	call bancos_2_3		;435b   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	call L_5F76		;435e   ; p00:5F76
	ld a,(0e203h)		;4361   ; uno de cada 8 cuadros...
	and 007h		;4364   ; los tres bits bajos
	dec a			;4366   ; iguales a 1?
	jp z,L_5A3D		;4367   ; entonces p00:5A3D
	ret			;436a
L_436B:
	call banco_11_en_a000		;436b   ; al empezar la fase: con el 11 en 0xA000, p11:B957
	call 0b957h		;436e
	call bancos_7_8_9		;4371   ; con 7-8-9: los graficos de la fase
	call L_438C		;4374   ; p00:438C: los caracteres y sprites de la fase
	call L_5C3A		;4377   ; p00:5C3A
	ld a,(0ec20h)		;437a   ; 0xEC20: el jefe que hay que pintar (0 = ninguno)
	ld c,a			;437d   ; en C para p00:4882
	or a			;437e   ; hay?
	call nz,L_4882		;437f   ; p00:4882: sus dibujos (tabla p09:A331)
	ld a,(0e640h)		;4382   ; lee el jefe (1 a 8)
	or a			;4385   ; hay jefe?
	call nz,L_4DC8		;4386   ; p00:4DC8: sus graficos
	jp bancos_1_2_3		;4389   ; y vuelve a 1-2-3
L_438C:
	call L_44B7		;438c   ; p00:44B7: los caracteres de la fase
	call L_483F		;438f   ; p00:483F
	call bancos_7_8_9		;4392   ; con 7-8-9
	call L_444F		;4395   ; p00:444F: las rachas de 0x1880-0x1960
	call L_4494		;4398   ; p00:4494: los dibujos de sprite de la fase
	ld hl,08bd3h		;439b   ; las fichas de sprites de la fase (p08:8BD3)
	ld a,(0e301h)		;439e   ; lee la fase (de 1 a 7; 0 en la presentacion)
	call palabra_de_hl		;43a1   ; palabra_de_hl: DE = la palabra HL + 2 x A
	push de			;43a4   ; IX = la lista de la fase
	pop ix		;43a5
L_43A7:
	ld a,(ix+000h)		;43a7   ; el tipo de la ficha
	dec a			;43aa   ; 1 = copia de sprites
	ret m			;43ab   ; 0 acaba la lista
	push af			;43ac
	call z,L_43BB		;43ad   ; tipo 1: p00:43BB
	pop af			;43b0
	call nz,L_442B		;43b1   ; los demas: p00:442B
	ld bc,00004h		;43b4   ; 4 bytes por ficha
	add ix,bc		;43b7   ; la siguiente
	jr L_43A7		;43b9
L_43BB:
	ld a,(ix+001h)		;43bb   ; cuantos (de 32 bytes)
	or a			;43be   ; 0: nada
	ret z			;43bf   ; fuera
	ld (0f010h),a		;43c0   ; la cuenta en 0xF010
	ld l,(ix+002h)		;43c3   ; el dibujo de origen
	ld h,000h		;43c6
	add hl,hl			;43c8   ; x 8
	add hl,hl			;43c9
	add hl,hl			;43ca
	ld bc,01800h		;43cb   ; + 0x1800: los dibujos de sprite en la VRAM
	add hl,bc			;43ce
	ld (0f012h),hl		;43cf   ; el origen en 0xF012
	ld l,(ix+003h)		;43d2   ; el dibujo de destino
	ld h,000h		;43d5
	add hl,hl			;43d7   ; x 8
	add hl,hl			;43d8
	add hl,hl			;43d9
	add hl,bc			;43da   ; + 0x1800
	ld (0f014h),hl		;43db   ; el destino en 0xF014
L_43DE:
	ld hl,(0f012h)		;43de   ; de la VRAM del origen
	ld de,0c600h		;43e1   ; a 0xC600
	ld bc,00020h		;43e4   ; 32 bytes: un sprite de 16 x 16
	call 00059h		;43e7   ; BIOS LDIRMV - Block transfers to memory from VRAM | LDIRMV: de la VRAM a la RAM
	call L_4411		;43ea   ; p00:4411: le da la vuelta en espejo
	ld hl,(0f014h)		;43ed   ; al destino
	ld de,0c620h		;43f0   ; lo ya girado de 0xC620
	ld bc,00020h		;43f3   ; 32 bytes
	call copia_a_vram		;43f6   ; copia_a_vram
	ld bc,00020h		;43f9   ; el siguiente sprite: 32 mas
	ld hl,(0f012h)		;43fc   ; en el origen
	add hl,bc			;43ff
	ld (0f012h),hl		;4400   ; el origen avanza
	ld hl,(0f014h)		;4403   ; y el destino
	add hl,bc			;4406   ; 32 mas
	ld (0f014h),hl		;4407   ; guarda el destino
	ld hl,0f010h		;440a   ; la cuenta de sprites
	dec (hl)			;440d   ; uno menos
	jr nz,L_43DE		;440e   ; quedan: el siguiente
	ret			;4410
L_4411:
	ld hl,0c600h		;4411   ; la mitad izquierda del sprite (16 bytes de 0xC600)
	ld de,0c62fh		;4414   ; al reves, de 0xC62F hacia atras: espejo
	ld b,010h		;4417   ; 16 bytes
	call L_4424		;4419   ; copia del derecho al reves
	ld hl,0c610h		;441c   ; la mitad derecha (0xC610)
	ld de,0c63fh		;441f   ; a 0xC63F hacia atras
	ld b,010h		;4422   ; 16 bytes
L_4424:
	ld a,(hl)			;4424   ; un byte
	ld (de),a			;4425   ; al otro lado
	inc hl			;4426   ; el siguiente del origen
	dec de			;4427   ; el anterior del destino
	djnz L_4424		;4428   ; los 16
	ret			;442a
L_442B:
	ld a,(ix+001h)		;442b   ; cuantos caracteres
	or a			;442e   ; 0: nada
	ret z			;442f   ; fuera
	ld l,(ix+003h)		;4430   ; el destino
	ld h,000h		;4433
	add hl,hl			;4435   ; x 8
	add hl,hl			;4436
	add hl,hl			;4437
	ld bc,01810h		;4438   ; + 0x1810
	add hl,bc			;443b
	ex de,hl			;443c   ; en DE
	ld l,(ix+002h)		;443d   ; el origen
	ld h,000h		;4440
	add hl,hl			;4442   ; x 8
	add hl,hl			;4443
	add hl,hl			;4444
	ld bc,01800h		;4445   ; + 0x1800: los dibujos de sprite
	add hl,bc			;4448
	ld c,(ix+001h)		;4449   ; C = cuantos
	jp L_4D3B		;444c   ; p00:4D3B: los copia girados
L_444F:
	ld de,0a130h		;444f   ; las rachas de p09:A130
	ld hl,01880h		;4452   ; a los dibujos de sprite de 0x1880
	call rachas		;4455   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld de,0a06fh		;4458   ; las de p09:A06F
	ld hl,01960h		;445b   ; a 0x1960
	call rachas		;445e   ; rachas: descomprime las rachas de DE en la VRAM HL
	call bit_de_fase		;4461   ; segun la fase (bit de 0x26)...
	ld de,0a042h		;4464   ; p09:A042 si no hay acarreo
	jr nc,L_446C		;4467   ; sin acarreo, esa
	ld de,0a009h		;4469   ; con acarreo, p09:A009
L_446C:
	ld hl,018c0h		;446c   ; a 0x18C0
	call rachas		;446f   ; rachas: descomprime las rachas de DE en la VRAM HL
	call bit_de_fase		;4472   ; otra vez segun la fase
	ld de,0a0d8h		;4475   ; p09:A0D8 sin acarreo
	jr nc,L_447D		;4478
	ld de,0a0f3h		;447a   ; p09:A0F3 con acarreo
L_447D:
	ld hl,01900h		;447d   ; a 0x1900
	call rachas		;4480   ; rachas: descomprime las rachas de DE en la VRAM HL
	call bit_de_fase		;4483   ; y otra
	ld de,0a113h		;4486   ; p09:A113 sin acarreo
	jr nc,L_448E		;4489
	ld de,0a122h		;448b   ; p09:A122 con acarreo
L_448E:
	ld hl,018a0h		;448e   ; a 0x18A0
	jp rachas		;4491   ; rachas: descomprime las rachas de DE en la VRAM HL
L_4494:
	ld a,(0e301h)		;4494   ; la fase
	ld hl,08b26h		;4497   ; la lista de dibujos de sprite de la fase (p08:8B26)
	call palabra_de_hl		;449a   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ex de,hl			;449d   ; HL = la lista
L_449E:
	ld a,(hl)			;449e   ; el caracter de destino
	or a			;449f   ; 0 acaba
	ret z			;44a0   ; fuera
	inc hl			;44a1
	ld e,(hl)			;44a2   ; las rachas, byte bajo
	inc hl			;44a3
	ld d,(hl)			;44a4   ; byte alto
	inc hl			;44a5   ; la siguiente ficha
	push hl			;44a6   ; se guarda
	ld l,a			;44a7   ; el caracter
	ld h,000h		;44a8
	add hl,hl			;44aa   ; x 8
	add hl,hl			;44ab
	add hl,hl			;44ac
	ld bc,01800h		;44ad   ; + 0x1800
	add hl,bc			;44b0
	call rachas		;44b1   ; descomprime los dibujos alli
	pop hl			;44b4   ; la ficha siguiente
	jr L_449E		;44b5
L_44B7:
	ld ix,06c63h		;44b7   ; la lista de caracteres de todas las fases (p07:6C63)
	call caracteres		;44bb   ; caracteres: la lista de caracteres de IX (dibujos y colores por rachas)
	call bit_de_fase		;44be   ; segun la fase...
	ld ix,06c8eh		;44c1   ; p07:6C8E (fases 1, 2 y 5)
	jr nc,L_44CB		;44c5
	ld ix,06c95h		;44c7   ; o p07:6C95
L_44CB:
	call caracteres		;44cb   ; caracteres: la lista de caracteres de IX (dibujos y colores por rachas)
	ld a,(0e301h)		;44ce   ; la fase
	cp 007h		;44d1   ; la 7?
	call z,fase7_copia		;44d3   ; la 7 trae los graficos del otro cartucho
	ld a,(0e301h)		;44d6   ; lee la fase (de 1 a 7; 0 en la presentacion)
	ld hl,06c37h		;44d9   ; los caracteres de la fase (p07:6C37)
	call caracteres_de_tabla		;44dc   ; caracteres_de_tabla: la lista de caracteres de la entrada A de la tabla HL
	xor a			;44df   ; las copias, primero en espejo
	ld (0f000h),a		;44e0   ; 0xF000 = 0
	ld hl,06c45h		;44e3   ; la tabla de p07:6C45
	call L_44F0		;44e6   ; copias de la fase
	ld hl,0f000h		;44e9   ; 0xF000 = 1: cabeza abajo
	inc (hl)			;44ec
	ld hl,06c53h		;44ed   ; la tabla de p07:6C53
L_44F0:
	ld a,(0e301h)		;44f0   ; la fase
copias_de_tabla:		; la lista de copias VRAM -> VRAM de la entrada A de la tabla HL
	call palabra_de_hl		;44f3   ; DE = la lista de la entrada A
	push de			;44f6   ; a IX
	pop ix		;44f7
copias:		; la lista de copias VRAM -> VRAM de IX
	ld a,(ix+000h)		;44f9   ; el primer byte de la ficha
	and a			;44fc   ; 0 acaba
	ret z			;44fd   ; fuera
	ld a,(ix+002h)		;44fe   ; los dos bits altos del tercer byte...
	rlca			;4501   ; arriba
	rlca			;4502
	and 003h		;4503   ; dos bits
	jr nz,L_4518		;4505   ; no son cero: ficha de 3 bytes, ese es el cuantos
	ld l,(ix+003h)		;4507   ; son cero: ficha de 4 bytes, el cuarto es el cuantos
	ld a,l			;450a
	ld (0f003h),a		;450b   ; cuantos caracteres, en 0xF003
	call L_4526		;450e   ; p00:4526: copia esos caracteres
	ld de,00004h		;4511   ; 4 bytes por ficha
	add ix,de		;4514
	jr copias		;4516   ; la siguiente
L_4518:
	ld l,a			;4518   ; los bits altos son el cuantos
	ld (0f003h),a		;4519   ; en 0xF003
	call L_4526		;451c   ; copia
	ld de,00003h		;451f   ; 3 bytes por ficha
	add ix,de		;4522
	jr copias		;4524   ; la siguiente
L_4526:
	ld h,000h		;4526   ; los caracteres...
	add hl,hl			;4528
	add hl,hl			;4529
	add hl,hl			;452a
	ld (0f001h),hl		;452b   ; x 8 = los bytes, en 0xF001
	call L_467B		;452e   ; p00:467B: los lee de la VRAM a la RAM
	ld a,(0f000h)		;4531   ; 0xF000: en espejo o cabeza abajo
	and a			;4534
	push af			;4535   ; se guarda
	call z,L_45E0		;4536   ; 0: p00:45E0, en espejo (cada byte al reves)
	pop af			;4539
	call nz,L_459B		;453a   ; 1: p00:459B, cabeza abajo (las filas al reves)
	jp L_45FF		;453d   ; y p00:45FF: de vuelta a la VRAM
caracteres_de_tabla:		; la lista de caracteres de la entrada A de la tabla HL
	call palabra_de_hl		;4540   ; DE = la lista de la entrada A
	push de			;4543   ; a IX
	pop ix		;4544
caracteres:		; la lista de caracteres de IX (dibujos y colores por rachas)
	ld a,(ix+000h)		;4546   ; los tercios en los que va
	and a			;4549   ; 0 acaba
	ret z			;454a   ; fuera
	rra			;454b   ; bit 0: el tercio de abajo
	ld de,01000h		;454c   ; 0x1000
	call c,L_456D		;454f   ; p00:456D
	bit 1,(ix+000h)		;4552   ; bit 1: el del medio
	ld de,00800h		;4556   ; 0x0800
	call nz,L_456D		;4559
	bit 2,(ix+000h)		;455c   ; bit 2: el de arriba
	ld de,00000h		;4560   ; 0x0000
	call nz,L_456D		;4563
	ld de,00006h		;4566   ; 6 bytes por ficha
	add ix,de		;4569   ; la siguiente
	jr caracteres		;456b
L_456D:
	ld l,(ix+003h)		;456d   ; el caracter
	ld h,000h		;4570
	add hl,hl			;4572   ; x 8
	add hl,hl			;4573
	add hl,hl			;4574
	add hl,de			;4575   ; + el tercio
	push hl			;4576   ; se guarda
	ld de,02000h		;4577   ; + 0x2000: los dibujos
	add hl,de			;457a
	ld e,(ix+001h)		;457b   ; las rachas de los dibujos, bajo
	ld d,(ix+002h)		;457e   ; alto
	push ix		;4581
	call rachas		;4583   ; las descomprime
	pop ix		;4586
	pop hl			;4588   ; el caracter otra vez
	ld de,00000h		;4589   ; + 0x0000: los colores
	add hl,de			;458c
	ld e,(ix+004h)		;458d   ; las rachas de los colores, bajo
	ld d,(ix+005h)		;4590   ; alto
	push ix		;4593
	call rachas		;4595   ; las descomprime
	pop ix		;4598
	ret			;459a
L_459B:
	ld hl,0c600h		;459b   ; cabeza abajo: los dibujos de 0xC600
	ld de,0c607h		;459e   ; con 0xC607, la ultima fila del caracter
	ld a,(0e63ah)		;45a1   ; en la presentacion...
	and a			;45a4
	jr z,L_45AD		;45a5   ; ...no
	ld hl,0e700h		;45a7   ; ...el bufer es 0xE700
	ld de,0e707h		;45aa
L_45AD:
	call L_45C2		;45ad   ; da la vuelta a los dibujos
	ld hl,0c800h		;45b0   ; los colores de 0xC800
	ld de,0c807h		;45b3   ; y su ultima fila
	ld a,(0e63ah)		;45b6   ; en la presentacion...
	and a			;45b9
	jr z,L_45C2		;45ba
	ld hl,0e900h		;45bc   ; ...0xE900
	ld de,0e907h		;45bf
L_45C2:
	exx			;45c2
	ld a,(0f003h)		;45c3   ; cuantos caracteres
	ld b,a			;45c6   ; en B'
L_45C7:
	exx			;45c7
	ld b,004h		;45c8   ; 4 cambios por caracter: filas 0-7, 1-6, 2-5, 3-4
L_45CA:
	ld c,(hl)			;45ca   ; la fila de arriba
	ld a,(de)			;45cb   ; la de abajo
	ld (hl),a			;45cc   ; arriba
	ld a,c			;45cd   ; la de arriba
	ld (de),a			;45ce   ; abajo
	inc hl			;45cf   ; baja
	dec de			;45d0   ; sube
	djnz L_45CA		;45d1   ; las cuatro
	inc hl			;45d3   ; al caracter siguiente: 4 mas
	inc hl			;45d4
	inc hl			;45d5
	inc hl			;45d6
	ld a,00ch		;45d7   ; y la ultima fila del siguiente, 12 mas
	call de_mas_a		;45d9   ; de_mas_a: DE = DE + A
	exx			;45dc
	djnz L_45C7		;45dd   ; el siguiente caracter
	ret			;45df
L_45E0:
	ld hl,0c600h		;45e0   ; en espejo: los dibujos de 0xC600
	ld a,(0e63ah)		;45e3   ; en la presentacion...
	and a			;45e6
	jr z,L_45EC		;45e7
	ld hl,0e700h		;45e9   ; ...0xE700
L_45EC:
	ld de,(0f001h)		;45ec   ; cuantos bytes
L_45F0:
	ld b,008h		;45f0   ; 8 bits
L_45F2:
	rr (hl)		;45f2   ; saca el bit de la derecha
	adc a,a			;45f4   ; y lo mete por la derecha en A: al reves
	djnz L_45F2		;45f5   ; los 8
	ld (hl),a			;45f7   ; el byte girado
	inc hl			;45f8   ; el siguiente
	dec de			;45f9   ; uno menos
	ld a,d			;45fa   ; quedan?
	or e			;45fb
	jr nz,L_45F0		;45fc   ; el siguiente
	ret			;45fe
L_45FF:
	ld a,(0e63ah)		;45ff   ; de vuelta a la VRAM: en la presentacion los tercios van en A
	and a			;4602
	jr nz,L_4623		;4603   ; en la presentacion, p00:4623
	bit 3,(ix+002h)		;4605   ; bit 3 del tercer byte: el tercio de abajo
	ld de,01000h		;4609   ; 0x1000
	call nz,L_463D		;460c   ; p00:463D
	bit 4,(ix+002h)		;460f   ; bit 4: el del medio
	ld de,00800h		;4613   ; 0x0800
	call nz,L_463D		;4616
	bit 5,(ix+002h)		;4619   ; bit 5: el de arriba
	ld de,00000h		;461d   ; 0x0000
	ret z			;4620   ; si no va, fuera
	jr L_463D		;4621   ; si va, p00:463D
L_4623:
	push af			;4623   ; en la presentacion, por los bits de A
	bit 4,a		;4624   ; bit 4: arriba
	ld de,00000h		;4626
	call nz,L_463D		;4629
	pop af			;462c
	push af			;462d
	bit 5,a		;462e   ; bit 5: el medio
	ld de,00800h		;4630
	call nz,L_463D		;4633
	pop af			;4636
	bit 6,a		;4637   ; bit 6: abajo
	ld de,01000h		;4639
	ret z			;463c   ; si no, fuera
L_463D:
	push ix		;463d   ; el caracter de destino
	ld l,(ix+001h)		;463f
	ld h,000h		;4642
	add hl,hl			;4644   ; x 8
	add hl,hl			;4645
	add hl,hl			;4646
	add hl,de			;4647   ; + el tercio
	push hl			;4648   ; se guarda
	ld de,02000h		;4649   ; + 0x2000: los dibujos
	add hl,de			;464c
	ld de,0c600h		;464d   ; desde 0xC600
	ld a,(0e63ah)		;4650   ; en la presentacion...
	and a			;4653
	jr z,L_4659		;4654
	ld de,0e700h		;4656   ; ...desde 0xE700
L_4659:
	ld bc,(0f001h)		;4659   ; los bytes
	call copia_a_vram		;465d   ; a la VRAM
	pop hl			;4660   ; el destino otra vez
	ld de,00000h		;4661   ; + 0x0000: los colores
	add hl,de			;4664
	ld de,0c800h		;4665   ; desde 0xC800
	ld a,(0e63ah)		;4668   ; en la presentacion...
	and a			;466b
	jr z,L_4671		;466c
	ld de,0e900h		;466e   ; ...desde 0xE900
L_4671:
	ld bc,(0f001h)		;4671   ; los bytes
	call copia_a_vram		;4675   ; a la VRAM
	pop ix		;4678
	ret			;467a
L_467B:
	ld bc,(0f001h)		;467b   ; cuantos bytes
	ld l,(ix+000h)		;467f   ; el caracter de origen
	ld h,000h		;4682
	add hl,hl			;4684   ; x 8
	add hl,hl			;4685
	add hl,hl			;4686
	ld a,(0e63ah)		;4687   ; en la presentacion, p00:46C2
	and a			;468a
	jr nz,L_46C2		;468b
	push hl			;468d   ; se guarda
	ld de,02000h		;468e   ; del tercio de arriba (0x2000)...
	bit 2,(ix+002h)		;4691   ; ...si lleva el bit 2
	jr nz,L_46A1		;4695
	ld d,028h		;4697   ; del medio (0x2800)
	bit 1,(ix+002h)		;4699   ; si lleva el bit 1
	jr nz,L_46A1		;469d
	ld d,030h		;469f   ; si no, de abajo (0x3000)
L_46A1:
	add hl,de			;46a1   ; la direccion de los dibujos
	ld de,0c600h		;46a2   ; a 0xC600
	push ix		;46a5
	call 00059h		;46a7   ; BIOS LDIRMV - Block transfers to memory from VRAM | LDIRMV
	pop ix		;46aa
	pop hl			;46ac   ; el caracter otra vez
	ld de,00000h		;46ad   ; de los colores de arriba (0x0000)...
	bit 2,(ix+002h)		;46b0   ; ...con el bit 2
	jr nz,L_46EF		;46b4
	ld d,008h		;46b6   ; del medio (0x0800)
	bit 1,(ix+002h)		;46b8
	jr nz,L_46EF		;46bc
	ld d,010h		;46be   ; de abajo (0x1000)
	jr L_46EF		;46c0
L_46C2:
	push hl			;46c2   ; en la presentacion: el tercio por los bits de A
	ld de,02000h		;46c3
	bit 4,a		;46c6   ; bit 4: arriba
	jr nz,L_46D2		;46c8
	ld d,028h		;46ca   ; del medio
	bit 5,a		;46cc   ; bit 5
	jr nz,L_46D2		;46ce
	ld d,030h		;46d0   ; de abajo
L_46D2:
	add hl,de			;46d2
	push af			;46d3
	ld de,0e700h		;46d4   ; a 0xE700
	push ix		;46d7
	call 00059h		;46d9   ; BIOS LDIRMV - Block transfers to memory from VRAM | LDIRMV
	pop ix		;46dc
	pop af			;46de
	pop hl			;46df
	ld de,00000h		;46e0   ; los colores
	bit 4,a		;46e3
	jr nz,L_46EF		;46e5
	ld d,008h		;46e7
	bit 5,a		;46e9
	jr nz,L_46EF		;46eb
	ld d,010h		;46ed
L_46EF:
	add hl,de			;46ef   ; la direccion de los colores
	ld de,0c800h		;46f0   ; a 0xC800
	ld a,(0e63ah)		;46f3   ; en la presentacion...
	and a			;46f6
	jr z,L_46FC		;46f7
	ld de,0e900h		;46f9   ; ...a 0xE900
L_46FC:
	ld bc,(0f001h)		;46fc   ; los bytes
	push ix		;4700
	call 00059h		;4702   ; BIOS LDIRMV - Block transfers to memory from VRAM | LDIRMV
	pop ix		;4705
	ret			;4707
L_4708:
	ld a,(0e21dh)		;4708   ; la presentacion por pasos (0xE21D)
	dec a			;470b   ; paso 1?
	jr z,L_4731		;470c   ; a p00:4731
	dec a			;470e   ; paso 2?
	jr z,L_474E		;470f   ; a p00:474E
	xor a			;4711   ; paso 0: los dibujos (0xE21E = 0)
	ld (0e21eh),a		;4712
	ld c,000h		;4715   ; sin color (mascara 0)
	call L_4763		;4717   ; p00:4763: la lista de 0xE220
	ld a,001h		;471a   ; los colores (0xE21E = 1)
	ld (0e21eh),a		;471c
	ld c,0f0h		;471f   ; con la mascara 0xF0
	call L_4763		;4721
	call L_47E1		;4724   ; y las copias
	ld a,001h		;4727   ; la mascara siguiente empieza en 1
	ld (0e21fh),a		;4729   ; 0xE21F
L_472C:
	ld hl,0e21dh		;472c   ; al paso siguiente
	inc (hl)			;472f
	ret			;4730
L_4731:
	xor a			;4731   ; paso 1: dibujos
	ld (0e21eh),a		;4732
	ld a,(0e21fh)		;4735   ; con la mascara de 0xE21F
	ld c,a			;4738   ; en C
	call L_4763		;4739
	call L_47E1		;473c
	ld hl,0e21fh		;473f   ; la mascara
	ld a,(hl)			;4742
	cp 0ffh		;4743   ; ya es 0xFF?
	jr z,L_472C		;4745   ; entonces al paso siguiente
	rlca			;4747   ; si no, la gira tres veces y le pone un bit mas
	rlca			;4748
	rlca			;4749
	or 001h		;474a
	ld (hl),a			;474c   ; la nueva mascara
	ret			;474d
L_474E:
	ld a,001h		;474e   ; paso 2: los colores enteros
	ld (0e21eh),a		;4750
	ld c,0ffh		;4753   ; mascara 0xFF
	call L_4763		;4755
	call L_47E1		;4758
	call L_4DB1		;475b   ; p00:4DB1
	xor a			;475e   ; la presentacion pintada
	ld (0e21ch),a		;475f   ; 0xE21C = 0
	ret			;4762
L_4763:
	ld ix,(0e220h)		;4763   ; IX = la lista de caracteres de 0xE220
	ld a,(0e63ah)		;4767   ; en la presentacion...
	and a			;476a
	jr nz,L_4794		;476b   ; ...las fichas son de 5 bytes: p00:4794
L_476D:
	ld a,(ix+000h)		;476d   ; los tercios
	and a			;4770   ; 0 acaba
	ret z			;4771
	rra			;4772   ; bit 0: abajo
	ld de,01000h		;4773
	call c,L_47AE		;4776
	bit 1,(ix+000h)		;4779   ; bit 1: el medio
	ld de,00800h		;477d
	call nz,L_47AE		;4780
	bit 2,(ix+000h)		;4783   ; bit 2: arriba
	ld de,00000h		;4787
	call nz,L_47AE		;478a
	ld de,00006h		;478d   ; 6 bytes por ficha
	add ix,de		;4790
	jr L_476D		;4792
L_4794:
	ld a,(ix+000h)		;4794   ; el primer byte de la ficha (bajo del puntero)
	and a			;4797   ; 0 acaba
	ret z			;4798
	dec ix		;4799   ; IX un byte atras: la ficha de 5 bytes lee como si fuera de 6
	ld de,00800h		;479b   ; el medio
	call L_47AE		;479e
	ld de,00000h		;47a1   ; y arriba
	call L_47AE		;47a4
	ld de,00006h		;47a7   ; la siguiente: 5 bytes desde el principio
	add ix,de		;47aa
	jr L_4794		;47ac
L_47AE:
	ld l,(ix+003h)		;47ae   ; el caracter
	ld h,000h		;47b1
	add hl,hl			;47b3   ; x 8
	add hl,hl			;47b4
	add hl,hl			;47b5
	add hl,de			;47b6   ; + el tercio
	ld a,(0e21eh)		;47b7   ; dibujos o colores (0xE21E)
	dec a			;47ba
	jr z,L_47CF		;47bb   ; 1: los colores
	ld de,02000h		;47bd   ; 0: + 0x2000, los dibujos
	add hl,de			;47c0
	ld e,(ix+001h)		;47c1   ; las rachas de los dibujos
	ld d,(ix+002h)		;47c4
	push ix		;47c7
	call L_47F7		;47c9   ; p00:47F7: las rachas con la mascara C
	pop ix		;47cc
	ret			;47ce
L_47CF:
	ld de,00000h		;47cf   ; los colores
	add hl,de			;47d2
	ld e,(ix+004h)		;47d3   ; sus rachas
	ld d,(ix+005h)		;47d6
	push ix		;47d9
	call L_47F7		;47db   ; con la mascara
	pop ix		;47de
	ret			;47e0
L_47E1:
	xor a			;47e1   ; las copias de la presentacion: en espejo...
	ld (0f000h),a		;47e2   ; 0xF000 = 0
	ld ix,(0e222h)		;47e5   ; la lista de 0xE222
	call copias		;47e9   ; copias: la lista de copias VRAM -> VRAM de IX
	ld hl,0f000h		;47ec   ; ...y cabeza abajo
	inc (hl)			;47ef
	ld ix,(0e224h)		;47f0   ; la lista de 0xE224
	jp copias		;47f4   ; copias: la lista de copias VRAM -> VRAM de IX
L_47F7:
	call puerto_vdp		;47f7   ; el puerto del VDP
L_47FA:
	ld a,(de)			;47fa   ; n
	and a			;47fb   ; 0 acaba
	ret z			;47fc
	inc de			;47fd   ; el siguiente
	ld b,a			;47fe   ; se guarda
	and 07fh		;47ff   ; n & 0x7F
	cp b			;4801   ; igual: n < 0x80, repite
	jr z,L_481C		;4802   ; a p00:481C
	ld b,a			;4804   ; n > 0x80: copia n & 0x7F bytes
L_4805:
	ld a,(de)			;4805   ; el byte
	and c			;4806   ; con la mascara
	inc de			;4807   ; el siguiente
	exx			;4808
	out (c),a		;4809   ; al VDP
	exx			;480b
	ld a,(0e21eh)		;480c   ; con los dibujos (0xE21E = 0)...
	and a			;480f
	jr nz,L_4818		;4810   ; ...los colores no giran la mascara
	rrc c		;4812   ; la mascara gira tres bits
	rrc c		;4814
	rrc c		;4816
L_4818:
	djnz L_4805		;4818   ; los n
	jr L_47FA		;481a   ; las rachas siguientes
L_481C:
	ld a,(de)			;481c   ; el byte que se repite
	inc de			;481d
L_481E:
	and c			;481e   ; con la mascara
	exx			;481f
	out (c),a		;4820   ; al VDP
	exx			;4822
	ex af,af'			;4823
	ld a,(0e21eh)		;4824   ; con los dibujos...
	and a			;4827
	jr nz,L_4830		;4828
	rrc c		;482a   ; ...gira la mascara
	rrc c		;482c
	rrc c		;482e
L_4830:
	ex af,af'			;4830
	djnz L_481E		;4831   ; los n
	jr L_47FA		;4833   ; las rachas siguientes
bit_de_fase:		; acarreo = el bit de la fase en 0x26 (fases 1, 2 y 5)
	ld a,(0e301h)		;4835   ; la fase
	ld b,a			;4838   ; en B
	ld a,026h		;4839   ; 0x26 = 00100110: un bit por fase
L_483B:
	rra			;483b   ; gira a la derecha...
	djnz L_483B		;483c   ; ...fase veces: el bit de la fase queda en el acarreo
	ret			;483e
L_483F:
	call bit_de_fase		;483f   ; segun la fase...
	jr nc,L_4856		;4842   ; sin acarreo, p00:4856
	ld de,04876h		;4844   ; las rachas de p00:4876
	ld hl,02280h		;4847   ; a los dibujos de 0x2280
	call rachas_3		;484a   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
	ld de,04879h		;484d   ; y p00:4879
	ld hl,00280h		;4850   ; a los colores de 0x0280
	jp rachas_3		;4853   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
L_4856:
	ld de,04868h		;4856   ; las de p00:4868
	ld hl,02280h		;4859   ; a 0x2280
	call rachas_3		;485c   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
	ld de,0486bh		;485f   ; y p00:486B
	ld hl,00280h		;4862   ; a 0x0280
	jp rachas_3		;4865   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios

; ----------------------------------------------------------------------
; DATOS rachas3_4868: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:485C (3 bytes)
;   0x4868..0x486b  (3 bytes)
DATA_rachas3_4868:
	defb 010h,000h,000h	; 4868

; ----------------------------------------------------------------------
; DATOS rachas3_486B: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:4865 (11 bytes)
;   0x486b..0x4876  (11 bytes)
DATA_rachas3_486B:
	defb 002h,000h,081h,0b0h,008h,000h,081h,070h,004h,000h,000h	; 486b  .......p...

; ----------------------------------------------------------------------
; DATOS rachas3_4876: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:484A (3 bytes)
;   0x4876..0x4879  (3 bytes)
DATA_rachas3_4876:
	defb 010h,001h,000h	; 4876

; ----------------------------------------------------------------------
; DATOS rachas3_4879: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:4853 (9 bytes)
;   0x4879..0x4882  (9 bytes)
DATA_rachas3_4879:
	defb 081h,0b0h,007h,000h,081h,070h,007h,000h,000h	; 4879  .....p...

; ======================================================================
; CODIGO 0x4882..0x4b87  (773 bytes)
; ======================================================================


L_4882:
	call banco_9_en_a000		;4882   ; el banco 9 en 0xA000
	ld l,c			;4885   ; el jefe que se pinta (C)
	ld h,000h		;4886
	add hl,hl			;4888   ; x 4
	add hl,hl			;4889
	ld de,0a331h		;488a   ; en la tabla de p09:A331
	add hl,de			;488d
	ld e,(hl)			;488e   ; las rachas de los dibujos
	inc hl			;488f
	ld d,(hl)			;4890
	push hl			;4891   ; se guarda
	ld hl,02120h		;4892   ; a 0x2120
	call rachas_3		;4895   ; en los tres tercios
	pop hl			;4898
	inc hl			;4899   ; las rachas de los colores
	ld e,(hl)			;489a
	inc hl			;489b
	ld d,(hl)			;489c
	ld hl,00120h		;489d   ; a 0x0120
	call rachas_3		;48a0   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
	jp bancos_1_2_3		;48a3   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_48A6:
	ld a,(0e620h)		;48a6   ; en vertical?
	or a			;48a9
	jp nz,L_48F1		;48aa   ; a p00:48F1
	xor a			;48ad   ; la pantalla entera de una vez, en horizontal
	ld (0f004h),a		;48ae
	ld hl,(0e302h)		;48b1   ; el scroll...
	ld de,00020h		;48b4   ; ...32 atras
	sbc hl,de		;48b7
	ld (0e302h),hl		;48b9   ; se guarda
	ld hl,0ca00h		;48bc   ; el mapa de la pantalla en la RAM, columna 0 (0xCA00)
	ld (0f000h),hl		;48bf   ; en 0xF000
	ld b,020h		;48c2   ; 32 columnas
L_48C4:
	push bc			;48c4
	call bancos_13_14_15		;48c5   ; con 13-14-15 (el mapa)
	call L_499E		;48c8   ; p00:499E: una columna
	call bancos_1_2_3		;48cb   ; de vuelta a 1-2-3
	call L_50B2		;48ce   ; p00:50B2
	ld hl,(0f000h)		;48d1   ; la columna siguiente
	inc hl			;48d4
	ld (0f000h),hl		;48d5
	ld hl,0f004h		;48d8   ; 0xF004 + 8
	ld a,(hl)			;48db
	add a,008h		;48dc
	ld (hl),a			;48de
	ld hl,(0e302h)		;48df   ; el scroll + 1
	inc hl			;48e2
	ld (0e302h),hl		;48e3   ; guarda la posicion del scroll (16 bits)
	pop bc			;48e6
	djnz L_48C4		;48e7   ; las 32
	ld hl,(0e302h)		;48e9   ; el scroll, uno atras
	dec hl			;48ec
	ld (0e302h),hl		;48ed   ; guarda la posicion del scroll (16 bits)
	ret			;48f0
L_48F1:
	ld a,0a0h		;48f1   ; en vertical: 0xF004 = 0xA0
	ld (0f004h),a		;48f3
	ld hl,(0e302h)		;48f6   ; el scroll...
	ld de,0ffebh		;48f9   ; ...21 atras
	add hl,de			;48fc
	ld (0e302h),hl		;48fd   ; se guarda
	ld hl,0cf00h		;4900   ; la ultima fila del mapa de la RAM (0xCF00)
	ld (0f000h),hl		;4903
	ld b,015h		;4906   ; 21 filas
L_4908:
	push bc			;4908
	call bancos_13_14_15		;4909   ; con 13-14-15
	call L_4A6B		;490c   ; p00:4A6B: una fila
	call bancos_1_2_3		;490f   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call L_50B2		;4912   ; p00:50B2
	ld hl,(0f000h)		;4915   ; la fila de arriba
	ld bc,0ffc0h		;4918   ; 64 menos
	add hl,bc			;491b
	ld (0f000h),hl		;491c
	ld hl,0f004h		;491f   ; 0xF004 - 8
	ld a,(hl)			;4922
	sub 008h		;4923
	ld (hl),a			;4925
	ld hl,(0e302h)		;4926   ; el scroll + 1
	inc hl			;4929
	ld (0e302h),hl		;492a   ; guarda la posicion del scroll (16 bits)
	pop bc			;492d
	djnz L_4908		;492e   ; las 21
	ld hl,(0e302h)		;4930   ; el scroll, uno atras
	dec hl			;4933
	ld (0e302h),hl		;4934   ; guarda la posicion del scroll (16 bits)
	ld a,(0e301h)		;4937   ; la fase 3?
	sub 003h		;493a
	ret nz			;493c   ; si no, fuera
	ld bc,000ffh		;493d   ; en la 3...
	ld a,005h		;4940   ; ...0xE65E = 5 si el scroll pasa de 0xFF
	or a			;4942
	sbc hl,bc		;4943
	ret c			;4945   ; si no, fuera
	ld (0e65eh),a		;4946
	ret			;4949
L_494A:
	ld a,001h		;494a   ; 0xE629 = 1: el scroll se ha parado
	ld (0e629h),a		;494c
	ret			;494f
L_4950:
	ld de,0e616h		;4950   ; 0xE616: un bit que gira cada cuadro
	ld a,(de)			;4953
	rlca			;4954   ; gira
	ld (de),a			;4955
	and 001h		;4956   ; Z o NZ segun el bit: el scroll va a medias
	ret			;4958
L_4959:
	xor a			;4959   ; el scroll de un cuadro: 0xE627-0xE629 a 0
	ld (0e627h),a		;495a
	ld (0e628h),a		;495d
	ld (0e629h),a		;4960
	ld a,(0e630h)		;4963   ; 0xE630 = 1?
	dec a			;4966
	ret z			;4967   ; entonces no hay scroll
	ld a,(0e610h)		;4968   ; 0xE610 distinto de 0...
	or a			;496b
	jp nz,L_4BE6		;496c   ; ...p00:4BE6
	ld de,(0e625h)		;496f   ; el siguiente alto
	ld hl,(0e302h)		;4973   ; el scroll
	rst 20h			;4976   ; ya llego?
	jr nc,L_494A		;4977   ; si, se para (0xE629 = 1)
	ld de,0e62ah		;4979   ; 0xE62A: la fase del scroll fino, de 0 a 7
	ld a,(de)			;497c
	inc a			;497d   ; uno mas
	and 007h		;497e   ; de 0 a 7
	ld (de),a			;4980
	call L_4950		;4981   ; un cuadro si y otro no
	ret z			;4984   ; en el que no, fuera
	inc hl			;4985   ; el scroll avanza
	ld (0e302h),hl		;4986   ; guarda la posicion del scroll (16 bits)
	ld a,(0e620h)		;4989   ; en vertical...
	or a			;498c
	jp nz,L_4A45		;498d   ; ...p00:4A45
	ld a,001h		;4990   ; 0xE627 = 1: hay columna nueva
	ld (0e627h),a		;4992
	call L_4A0C		;4995   ; p00:4A0C: corre el mapa de la RAM una columna
	ld hl,0ca1fh		;4998   ; la columna nueva, la 31 de 0xCA00
	ld (0f000h),hl		;499b
L_499E:
	ld hl,(0e302h)		;499e   ; el scroll
	ld de,(0e623h)		;49a1   ; el final del recorrido
	rst 20h			;49a5   ; HL >= final?
	ccf			;49a6
	jp c,L_4AD5		;49a7   ; entonces columna vacia: p00:4AD5
	ld de,(0e621h)		;49aa   ; el principio
	and a			;49ae
	sbc hl,de		;49af   ; scroll - principio
	jp c,L_4AD5		;49b1   ; antes del principio: vacia
	push hl			;49b4   ; se guarda
	ld hl,06f4ch		;49b5   ; el mapa de la fase (p13:6F4C)
	ld a,(0e301h)		;49b8   ; lee la fase (de 1 a 7; 0 en la presentacion)
	call palabra_de_hl		;49bb   ; DE = el mapa
	pop hl			;49be
L_49BF:
	ld a,l			;49bf   ; (scroll - principio)...
	srl h		;49c0   ; / 2
	rra			;49c2
	and 0feh		;49c3   ; par: 2 x (columna de bloques)
	ld l,a			;49c5
	ld c,l			;49c6
	ld b,h			;49c7
	add hl,hl			;49c8   ; x 2
	add hl,bc			;49c9   ; + 1: x 3, o sea 6 por columna de bloques
	add hl,de			;49ca   ; + el mapa
	ld (0f002h),hl		;49cb   ; la columna de bloques, en 0xF002
	ld hl,(0f000h)		;49ce   ; la columna de la RAM
	ld b,006h		;49d1   ; 6 bloques de alto
L_49D3:
	push bc			;49d3
	push hl			;49d4
	ld hl,(0f002h)		;49d5   ; el bloque siguiente de la columna
	ld a,(hl)			;49d8
	inc hl			;49d9
	ld (0f002h),hl		;49da
	call L_4A25		;49dd   ; p00:4A25: DE = sus 16 bytes
	ld a,(0e302h)		;49e0   ; la columna del bloque: scroll & 3
	and 003h		;49e3
	add a,e			;49e5   ; + el bloque
	ld e,a			;49e6
	jr nc,L_49EA		;49e7
	inc d			;49e9
L_49EA:
	pop hl			;49ea   ; la RAM de la pantalla
	ld bc,00040h		;49eb   ; 64 por fila en la RAM
	ld a,(de)			;49ee   ; fila 1 del bloque
	ld (hl),a			;49ef
	add hl,bc			;49f0   ; la de abajo
	inc de			;49f1   ; 4 mas en el bloque
	inc de			;49f2
	inc de			;49f3
	inc de			;49f4
	ld a,(de)			;49f5   ; fila 2
	ld (hl),a			;49f6
	add hl,bc			;49f7
	inc de			;49f8
	inc de			;49f9
	inc de			;49fa
	inc de			;49fb
	ld a,(de)			;49fc   ; fila 3
	ld (hl),a			;49fd
	add hl,bc			;49fe
	inc de			;49ff
	inc de			;4a00
	inc de			;4a01
	inc de			;4a02
	ld a,(de)			;4a03   ; fila 4 del bloque
	ld (hl),a			;4a04
	add hl,bc			;4a05   ; la de abajo
	pop bc			;4a06
	dec b			;4a07   ; el bloque de abajo
	jp nz,L_49D3		;4a08   ; los 6 de la columna
	ret			;4a0b
L_4A0C:
	ld hl,0ca01h		;4a0c   ; corre el mapa de la RAM una columna a la izquierda: de 0xCA01...
	ld e,l			;4a0f   ; ...a 0xCA00
	ld d,h			;4a10
	dec de			;4a11
	ld b,018h		;4a12   ; 24 filas
L_4A14:
	push bc			;4a14
	ld bc,0001fh		;4a15   ; 31 columnas por fila
	ldir		;4a18   ; una columna a la izquierda
	ld bc,00021h		;4a1a   ; a la fila siguiente (64 por fila en la RAM)
	add hl,bc			;4a1d
	ld e,l			;4a1e
	ld d,h			;4a1f
	dec de			;4a20
	pop bc			;4a21
	djnz L_4A14		;4a22   ; las 24
	ret			;4a24
L_4A25:
	sub 004h		;4a25   ; el bloque: menos de 4?
	jr nc,L_4A30		;4a27   ; 4 o mas: los de la fase
	add a,004h		;4a29   ; 0-3: los comunes de p13:600E
	ld de,0600eh		;4a2b
	jr L_4A3B		;4a2e
L_4A30:
	ld b,a			;4a30   ; el numero del bloque de la fase (- 4)
	ld a,(0e301h)		;4a31   ; la fase
	ld hl,05ffeh		;4a34   ; la tabla de los bloques de la fase (0x5FFE + 2 x fase = p13:6000)
	call palabra_de_hl		;4a37   ; DE = los bloques de la fase
	ld a,b			;4a3a   ; el bloque
L_4A3B:
	ld l,a			;4a3b   ; x 16: cuatro filas de cuatro
	ld h,000h		;4a3c
	add hl,hl			;4a3e
	add hl,hl			;4a3f
	add hl,hl			;4a40
	add hl,hl			;4a41
	add hl,de			;4a42   ; + los bloques
	ex de,hl			;4a43   ; DE = el bloque
	ret			;4a44
L_4A45:
	ld a,001h		;4a45   ; en vertical: 0xE628 = 1, hay fila nueva
	ld (0e628h),a		;4a47
	ld hl,0cec0h		;4a4a   ; corre el mapa de la RAM una fila hacia abajo: de 0xCEC0...
	ld de,0cf00h		;4a4d   ; ...a 0xCF00
	ld b,014h		;4a50   ; 20 filas
L_4A52:
	push bc			;4a52
	ld bc,00020h		;4a53   ; 32 columnas
	ldir		;4a56   ; una fila abajo
	ld bc,0ffe0h		;4a58   ; a la fila de arriba del origen
	add hl,bc			;4a5b
	ld e,l			;4a5c
	ld d,h			;4a5d
	ld bc,0ffc0h		;4a5e   ; y el origen una fila mas arriba
	add hl,bc			;4a61
	pop bc			;4a62
	djnz L_4A52		;4a63   ; las 20
	ld hl,0ca00h		;4a65   ; la fila nueva arriba (0xCA00)
	ld (0f000h),hl		;4a68
L_4A6B:
	ld hl,(0e302h)		;4a6b   ; el scroll
	ld de,(0e623h)		;4a6e   ; el final del recorrido
	rst 20h			;4a72   ; HL >= final?
	ccf			;4a73
	jp c,L_4AF9		;4a74   ; entonces fila vacia: p00:4AF9
	ld de,(0e621h)		;4a77   ; el principio
	and a			;4a7b
	sbc hl,de		;4a7c   ; scroll - principio
	jp c,L_4AF9		;4a7e   ; antes del principio: vacia
	push hl			;4a81
	ld hl,06f4ch		;4a82   ; el mapa de la fase (p13:6F4C)
	ld a,(0e301h)		;4a85   ; lee la fase (de 1 a 7; 0 en la presentacion)
	call palabra_de_hl		;4a88   ; DE = el mapa
	pop hl			;4a8b
L_4A8C:
	ld a,l			;4a8c   ; (scroll - principio) & ~3...
	and 0fch		;4a8d
	ld l,a			;4a8f
	add hl,hl			;4a90   ; x 2: 8 por fila de bloques
	add hl,de			;4a91   ; + el mapa
	ld (0f002h),hl		;4a92   ; la fila de bloques, en 0xF002
	ld de,(0f000h)		;4a95   ; la fila de la RAM
	ld b,008h		;4a99   ; 8 bloques de ancho
L_4A9B:
	push bc			;4a9b
	push de			;4a9c
	ld hl,(0f002h)		;4a9d   ; el bloque siguiente de la fila
	ld a,(hl)			;4aa0
	inc hl			;4aa1
	ld (0f002h),hl		;4aa2
	call L_4AC8		;4aa5   ; p00:4AC8: DE = sus 16 bytes
	ld a,(0e302h)		;4aa8   ; la fila del bloque: 3 - (scroll & 3)
	and 003h		;4aab
	sub 003h		;4aad
	neg		;4aaf
	add a,a			;4ab1   ; x 4
	add a,a			;4ab2
	add a,e			;4ab3   ; + el bloque
	ld e,a			;4ab4
	jr nc,L_4AB8		;4ab5
	inc d			;4ab7
L_4AB8:
	ex de,hl			;4ab8   ; HL = la fila del bloque
	pop de			;4ab9   ; DE = la RAM
	ldi		;4aba   ; cuatro caracteres de la fila del bloque
	ldi		;4abc
	ldi		;4abe
	ldi		;4ac0
	pop bc			;4ac2
	dec b			;4ac3   ; los 8
	jp nz,L_4A9B		;4ac4
	ret			;4ac7
L_4AC8:
	sub 004h		;4ac8   ; menos de 4: los comunes
	jp nc,L_4A30		;4aca   ; 4 o mas: los de la fase
	add a,004h		;4acd   ; 0-3
	ld de,0600eh		;4acf   ; los comunes de p13:600E
	jp L_4A3B		;4ad2
L_4AD5:
	ld a,(0e302h)		;4ad5   ; columna vacia: las estrellas del fondo
	and 01fh		;4ad8   ; el scroll & 0x1F
	ld hl,09e1fh		;4ada   ; en la tabla de p14:9E1F
	call hl_mas_a		;4add   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;4ae0   ; la fila de la estrella de esta columna
	ld a,c			;4ae1
	ex af,af'			;4ae2   ; se guarda
	ld b,015h		;4ae3   ; 21 filas
	ld de,00040h		;4ae5   ; 64 por fila
	ld hl,(0f000h)		;4ae8   ; la columna de la RAM
L_4AEB:
	xor a			;4aeb   ; un hueco
	dec c			;4aec   ; la fila de la estrella?
	jr nz,L_4AF4		;4aed   ; no: hueco
	ex af,af'			;4aef   ; si: el caracter 0x50 o 0x51 segun el bit 0
	and 001h		;4af0
	add a,050h		;4af2
L_4AF4:
	ld (hl),a			;4af4   ; a la RAM
	add hl,de			;4af5   ; la fila de abajo
	djnz L_4AEB		;4af6   ; las 21
	ret			;4af8
L_4AF9:
	ld a,(0e302h)		;4af9   ; fila vacia: las estrellas
	and 01fh		;4afc
	ld hl,09e3fh		;4afe   ; en la tabla de p14:9E3F
	call hl_mas_a		;4b01   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;4b04   ; la columna de la estrella
	ld a,c			;4b05
	ex af,af'			;4b06
	ld b,020h		;4b07   ; 32 columnas
	ld hl,(0f000h)		;4b09
L_4B0C:
	xor a			;4b0c   ; un hueco
	dec c			;4b0d   ; la columna de la estrella?
	jr nz,L_4B15		;4b0e
	ex af,af'			;4b10   ; si: 0x50 o 0x51
	and 001h		;4b11
	add a,050h		;4b13
L_4B15:
	ld (hl),a			;4b15   ; a la RAM
	inc hl			;4b16   ; la columna siguiente
	djnz L_4B0C		;4b17   ; las 32
	ret			;4b19
L_4B1A:
	ld a,(0e630h)		;4b1a   ; 0xE630 = 1: sin scroll, fuera
	dec a			;4b1d
	ret z			;4b1e
	ld a,(0e610h)		;4b1f   ; 0xE610 distinto de 0: fuera
	or a			;4b22
	ret nz			;4b23
	ld a,(0e620h)		;4b24   ; en vertical?
	or a			;4b27
	jr nz,L_4B49		;4b28   ; a p00:4B49
	ld a,(0e203h)		;4b2a   ; la cuenta de cuadros & 6
	and 006h		;4b2d
	ld hl,04b87h		;4b2f   ; un par de la tabla de p00:4B87
	ld e,a			;4b32
	ld d,000h		;4b33
	add hl,de			;4b35
	ld c,(hl)			;4b36   ; C
	inc hl			;4b37
	ld b,(hl)			;4b38   ; B
	ld hl,02282h		;4b39   ; a la VRAM 0x2282
	call L_4B43		;4b3c   ; con C
	ld c,b			;4b3f   ; y a 0x228B con B
	ld hl,0228bh		;4b40
L_4B43:
	ld a,(0e616h)		;4b43   ; 0xE616 (el bit que gira) con la mascara
	and c			;4b46
	jr L_4B79		;4b47   ; a los tres tercios
L_4B49:
	ld a,(0e203h)		;4b49   ; en vertical: la cuenta de cuadros & 6
	and 006h		;4b4c
	ld e,a			;4b4e
	ld d,000h		;4b4f
	ld hl,04b8fh		;4b51   ; un par de la tabla de p00:4B8F
	add hl,de			;4b54
	ld c,(hl)			;4b55
	inc hl			;4b56
	ld b,(hl)			;4b57
	ld hl,00280h		;4b58   ; a 0x0280
	call L_4B62		;4b5b
	ld c,b			;4b5e
	ld hl,00288h		;4b5f   ; y a 0x0288
L_4B62:
	ld a,(0e62ah)		;4b62   ; + 0xE62A (el scroll fino)
	add a,l			;4b65
	ld l,a			;4b66
	push hl			;4b67
	ld a,c			;4b68   ; el valor de C
	call L_4B79		;4b69   ; a los tres tercios
	pop hl			;4b6c
	dec hl			;4b6d   ; la fila de antes
	ld a,(0e62ah)		;4b6e   ; 0xE62A = 0?
	or a			;4b71
	jr nz,L_4B78		;4b72   ; si no, se borra la de antes
	ld a,l			;4b74   ; con 0: la del caracter de al lado
	add a,008h		;4b75
	ld l,a			;4b77
L_4B78:
	xor a			;4b78   ; 0: borra
L_4B79:
	call 0004dh		;4b79   ; BIOS WRTVRM - Writes data in VRAM | al tercio de arriba (WRTVRM)
	ld de,00800h		;4b7c   ; 0x800 mas: el del medio
	add hl,de			;4b7f
	call 0004dh		;4b80   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	add hl,de			;4b83   ; el de abajo
	jp 0004dh		;4b84   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM

; ----------------------------------------------------------------------
; DATOS pares_4B87: 4 pares [C][B] que p00:4B2F elige con 0xE203 & 6; lo leen
;   p00:4B36 (8 bytes)
;   0x4b87..0x4b8f  (8 bytes)
DATA_pares_4B87:
	defb 0ffh,000h	; 4b87
	defb 0ffh,0ffh	; 4b89
	defb 000h,0ffh	; 4b8b
	defb 0ffh,0ffh	; 4b8d

; ----------------------------------------------------------------------
; DATOS pares_4B8F: 4 pares [C][B] que p00:4B51 elige con 0xE203 & 6; lo leen
;   p00:4B55 (8 bytes)
;   0x4b8f..0x4b97  (8 bytes)
DATA_pares_4B8F:
	defb 030h,000h	; 4b8f
	defb 050h,090h	; 4b91
	defb 000h,0b0h	; 4b93
	defb 070h,0f0h	; 4b95

; ======================================================================
; CODIGO 0x4b97..0x4f3d  (934 bytes)
; ======================================================================


L_4B97:
	call bancos_13_14_15		;4b97   ; con 13-14-15: las estrellas en la pantalla entera
	ld ix,09e1fh		;4b9a   ; la tabla de p14:9E1F
	ld a,(0e302h)		;4b9e   ; el scroll - 31...
	sub 01fh		;4ba1
	and 01fh		;4ba3   ; & 0x1F
	ld e,a			;4ba5
	ld d,000h		;4ba6
	add ix,de		;4ba8   ; IX = su entrada
	sub 020h		;4baa   ; lo que queda hasta el final de la tabla
	neg		;4bac
	ld c,a			;4bae   ; en C
	ld de,0ca00h		;4baf   ; el mapa de la RAM (0xCA00)
	ld b,020h		;4bb2   ; 32 columnas
L_4BB4:
	push de			;4bb4
	ld a,(ix+000h)		;4bb5   ; la fila de la estrella
	ld l,a			;4bb8
	dec l			;4bb9   ; - 1
	ld h,000h		;4bba
	add hl,hl			;4bbc   ; x 64
	add hl,hl			;4bbd
	add hl,hl			;4bbe
	add hl,hl			;4bbf
	add hl,hl			;4bc0
	add hl,hl			;4bc1
	add hl,de			;4bc2   ; + la columna
	and 001h		;4bc3   ; el caracter 0x50 o 0x51 segun el bit 0
	add a,050h		;4bc5
	ld (hl),a			;4bc7   ; a la RAM
	dec c			;4bc8   ; al final de la tabla...
	jr nz,L_4BCF		;4bc9
	ld ix,09e1fh		;4bcb   ; ...vuelve al principio
L_4BCF:
	pop de			;4bcf
	inc de			;4bd0   ; la columna siguiente
	inc ix		;4bd1   ; la entrada siguiente
	djnz L_4BB4		;4bd3   ; las 32
	jp bancos_1_2_3		;4bd5   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_4BD8:
	exx			;4bd8   ; los 4 bloques comunes (p13:600E)...
	ld hl,0600eh		;4bd9
	ld de,0ec40h		;4bdc   ; ...a 0xEC40
	ld bc,00010h		;4bdf   ; 16 bytes
	ldir		;4be2
	exx			;4be4
	ret			;4be5
L_4BE6:
	ld hl,(0e612h)		;4be6   ; el scroll de los altos: 0xE612 hasta 0xE614
	ld de,(0e614h)		;4be9
	rst 20h			;4bed   ; ya llego?
	jp z,L_494A		;4bee   ; si, se para
	call L_4950		;4bf1   ; un cuadro si y otro no
	ret z			;4bf4
	ld a,(0e610h)		;4bf5   ; 0xE610: hacia donde
	dec a			;4bf8
	jr z,L_4C55		;4bf9   ; 1: hacia arriba (p00:4C55)
	dec a			;4bfb
	jr z,L_4C54		;4bfc   ; 2: nada
	dec a			;4bfe
	jr z,L_4C19		;4bff   ; 3: a la izquierda (p00:4C19)
	inc hl			;4c01   ; 4: a la derecha: 0xE612 + 1
	ld (0e612h),hl		;4c02
	ld a,001h		;4c05   ; hay columna nueva
	ld (0e627h),a		;4c07
	call L_4A0C		;4c0a   ; corre el mapa de la RAM
	ld hl,0ca1fh		;4c0d   ; la columna nueva a la derecha
	ld (0f000h),hl		;4c10
	ld hl,0ca1fh		;4c13
	jp L_4C3D		;4c16
L_4C19:
	dec hl			;4c19   ; a la izquierda: 0xE612 - 1
	ld (0e612h),hl		;4c1a
	ld a,0ffh		;4c1d   ; 0xE627 = 0xFF: columna nueva por la izquierda
	ld (0e627h),a		;4c1f
	ld hl,0ca1eh		;4c22   ; corre el mapa de la RAM a la derecha, de atras hacia delante
	ld e,l			;4c25
	ld d,h			;4c26
	inc de			;4c27
	ld b,015h		;4c28   ; 21 filas
L_4C2A:
	push bc			;4c2a
	ld bc,0001fh		;4c2b   ; 31 columnas
	lddr		;4c2e   ; a la derecha
	ld bc,0005fh		;4c30   ; a la fila siguiente
	add hl,bc			;4c33
	ld e,l			;4c34
	ld d,h			;4c35
	inc de			;4c36
	pop bc			;4c37
	djnz L_4C2A		;4c38   ; las 21
	ld hl,0ca00h		;4c3a   ; la columna nueva, la 0
L_4C3D:
	ld (0f000h),hl		;4c3d   ; en 0xF000
	ld hl,(0e302h)		;4c40   ; se guarda el scroll
	push hl			;4c43
	ld hl,(0e612h)		;4c44   ; y se pone el de los altos
	ld (0e302h),hl		;4c47   ; guarda la posicion del scroll (16 bits)
	ld de,0818ch		;4c4a   ; el mapa de p14:818C (el de la fase 7)
	call L_49BF		;4c4d   ; p00:49BF: la columna
	pop hl			;4c50   ; el scroll de verdad otra vez
	ld (0e302h),hl		;4c51   ; guarda la posicion del scroll (16 bits)
L_4C54:
	ret			;4c54
L_4C55:
	dec hl			;4c55   ; hacia arriba: 0xE612 - 1
	ld (0e612h),hl		;4c56
	ld a,0ffh		;4c59   ; 0xE628 = 0xFF: fila nueva por abajo
	ld (0e628h),a		;4c5b
	ld hl,0ca40h		;4c5e   ; corre el mapa de la RAM una fila arriba: de 0xCA40...
	ld de,0ca00h		;4c61   ; ...a 0xCA00
	ld b,017h		;4c64   ; 23 filas
L_4C66:
	push bc			;4c66
	push hl			;4c67
	ld bc,00020h		;4c68   ; 32 columnas
	ldir		;4c6b   ; una fila
	ld bc,00020h		;4c6d   ; la siguiente
	add hl,bc			;4c70
	pop de			;4c71
	pop bc			;4c72
	djnz L_4C66		;4c73   ; las 23
	ld hl,0cfc0h		;4c75   ; la fila nueva abajo (0xCFC0)
	ld (0f000h),hl		;4c78
	ld hl,(0e302h)		;4c7b   ; se guarda el scroll
	push hl			;4c7e
	ld hl,(0e612h)		;4c7f   ; y se pone el de los altos
	ld (0e302h),hl		;4c82   ; guarda la posicion del scroll (16 bits)
	call L_4C8D		;4c85   ; p00:4C8D: la fila
	pop hl			;4c88
	ld (0e302h),hl		;4c89   ; el scroll de verdad
	ret			;4c8c
L_4C8D:
	ld a,(0e301h)		;4c8d   ; en la fase 1...
	ld de,080fch		;4c90   ; ...el mapa de p14:80FC
	dec a			;4c93   ; la 1?
	jr z,L_4C99		;4c94
	ld de,0815ch		;4c96   ; en las demas, p14:815C
L_4C99:
	jp L_4A8C		;4c99   ; la fila con ese mapa
L_4C9C:
	call L_5909		;4c9c   ; p00:5909 y borra los 0x2A0 primeros nombres
	ld bc,002a0h		;4c9f
	jr L_4CAA		;4ca2
borra_nombres:		; borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_5909		;4ca4   ; p00:5909 y la tabla de nombres entera
	ld bc,00300h		;4ca7   ; 0x300 bytes
L_4CAA:
	ld hl,03800h		;4caa   ; desde 0x3800
	xor a			;4cad   ; a cero
	jp 00056h		;4cae   ; BIOS FILVRM - Fills VRAM with value | FILVRM
puerto_vdp:		; C' = el puerto de datos del VDP (0x0007 de la BIOS) tras fijar la direccion (0x0053)
	ex af,af'			;4cb1   ; se guarda A
	call 00053h		;4cb2   ; BIOS SETWRT - Enables VDP to write | SETWRT: la direccion HL de la VRAM para escribir
	exx			;4cb5
	ld a,(00007h)		;4cb6   ; el puerto de escritura del VDP (VDP.DW, 0x0007 de la BIOS)
	ld c,a			;4cb9   ; en C'
	exx			;4cba
	ex af,af'			;4cbb   ; devuelve A
	ret			;4cbc
copia_a_vram:		; copia BC bytes de DE a la VRAM HL (LDIRVM)
	ex de,hl			;4cbd   ; HL = el origen, DE = la VRAM
L_4CBE:
	jp 0005ch		;4cbe   ; BIOS LDIRVM - Block transfers to VRAM from memory | LDIRVM
copia_a_vram_3:		; copia BC bytes de DE a la VRAM HL en los tres tercios
	exx			;4cc1
	ld b,003h		;4cc2   ; tres veces
L_4CC4:
	exx			;4cc4
	push bc			;4cc5
	push de			;4cc6
	call copia_a_vram		;4cc7   ; copia BC bytes
	ld de,00800h		;4cca   ; 0x800 mas: el tercio siguiente
	add hl,de			;4ccd
	pop de			;4cce
	pop bc			;4ccf
	exx			;4cd0
	djnz L_4CC4		;4cd1   ; los tres
	ret			;4cd3
L_4CD4:
	ld d,003h		;4cd4   ; FILVRM tres veces
L_4CD6:
	push bc			;4cd6
	push de			;4cd7
	call 00056h		;4cd8   ; BIOS FILVRM - Fills VRAM with value | FILVRM
	ld de,00800h		;4cdb   ; el tercio siguiente
	add hl,de			;4cde
	pop de			;4cdf
	pop bc			;4ce0
	dec d			;4ce1   ; los tres
	jr nz,L_4CD6		;4ce2
	ret			;4ce4
rachas_3:		; las rachas de DE en la VRAM HL, en los tres tercios
	ld b,003h		;4ce5   ; tres veces
L_4CE7:
	push bc			;4ce7
	push de			;4ce8
	call rachas		;4ce9   ; las rachas
	ld de,00800h		;4cec   ; el tercio siguiente
	add hl,de			;4cef
	pop de			;4cf0
	pop bc			;4cf1
	djnz L_4CE7		;4cf2   ; los tres
	ret			;4cf4
lista_a_vram:		; la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld c,0ffh		;4cf5   ; mascara 0xFF: se pinta
L_4CF7:
	ex de,hl			;4cf7   ; el destino de la lista
	ld e,(hl)			;4cf8
	inc hl			;4cf9
	ld d,(hl)			;4cfa
	ex de,hl			;4cfb   ; HL = el destino
	inc de			;4cfc   ; el primer byte
lista_a_vram_aqui:		; la lista de DE en la VRAM HL (sin destino delante)
	ld a,(de)			;4cfd   ; un byte
	inc de			;4cfe
	ld b,a			;4cff   ; + 1...
	inc b			;4d00
	ret z			;4d01   ; 0xFF: acaba
	inc b			;4d02
	jr z,L_4CF7		;4d03   ; 0xFE: otro destino
	and c			;4d05   ; con la mascara (0 borra)
	call 0004dh		;4d06   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	inc hl			;4d09   ; el siguiente de la VRAM
	jr lista_a_vram_aqui		;4d0a
borra_lista:		; borra lo que pintaria la lista de DE (C = 0)
	ld c,000h		;4d0c   ; mascara 0: se borra lo que pinta la lista
	jr L_4CF7		;4d0e
rachas_con_destino:		; [destino] y rachas de DE a la VRAM
	ex de,hl			;4d10   ; el destino de las rachas
	ld e,(hl)			;4d11
	inc hl			;4d12
	ld d,(hl)			;4d13
	ex de,hl			;4d14   ; HL = el destino
	inc de			;4d15
rachas:		; descomprime las rachas de DE en la VRAM HL
	call puerto_vdp		;4d16   ; el puerto del VDP
L_4D19:
	ld a,(de)			;4d19   ; n
	and a			;4d1a   ; 0 acaba
	ret z			;4d1b
	inc de			;4d1c   ; el siguiente
	ld b,a			;4d1d   ; se guarda
	and 07fh		;4d1e   ; n & 0x7F
	cp b			;4d20   ; igual: n < 0x80, repite
	jr z,L_4D31		;4d21
	and a			;4d23   ; 0x80: otro destino
	jr z,rachas_con_destino		;4d24   ; a rachas_con_destino
	ld b,a			;4d26   ; n > 0x80: copia n & 0x7F bytes
L_4D27:
	ld a,(de)			;4d27   ; un byte
	inc de			;4d28
	exx			;4d29
	out (c),a		;4d2a   ; al VDP
	exx			;4d2c
	djnz L_4D27		;4d2d   ; los n
	jr L_4D19		;4d2f   ; las siguientes
L_4D31:
	ld a,(de)			;4d31   ; el byte que se repite
	inc de			;4d32
L_4D33:
	exx			;4d33
	out (c),a		;4d34   ; al VDP
	exx			;4d36
	djnz L_4D33		;4d37   ; n veces
	jr L_4D19		;4d39   ; las siguientes
L_4D3B:
	call L_4D47		;4d3b   ; p00:4D47: un sprite de 16 x 16 girado
	ld a,020h		;4d3e   ; 32 bytes mas en el destino
	call de_mas_a		;4d40   ; de_mas_a: DE = DE + A
	dec c			;4d43   ; C sprites
	jr nz,L_4D3B		;4d44
	ret			;4d46
L_4D47:
	push de			;4d47   ; se guarda el destino
L_4D48:
	ld b,010h		;4d48   ; 16 bytes: una columna del sprite
L_4D4A:
	call 0004ah		;4d4a   ; BIOS RDVRM - Reads the content of VRAM | RDVRM: un byte del origen
	call L_4D63		;4d4d   ; p00:4D63: sus bits al reves
	ex de,hl			;4d50
	call 0004dh		;4d51   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM al destino
	ex de,hl			;4d54
	inc e			;4d55   ; el siguiente del destino
	inc hl			;4d56   ; el siguiente del origen
	djnz L_4D4A		;4d57   ; los 16
	ld a,e			;4d59   ; el destino 32 atras...
	sub 020h		;4d5a
	ld e,a			;4d5c
	bit 4,e		;4d5d   ; ...hasta pasar por las dos columnas (bit 4 de E)
	jr z,L_4D48		;4d5f
	pop de			;4d61
	ret			;4d62
L_4D63:
	push bc			;4d63   ; C = el byte
	ld c,a			;4d64
	ld b,008h		;4d65   ; 8 bits
L_4D67:
	rr c		;4d67   ; el de la derecha de C...
	rla			;4d69   ; ...entra por la derecha en A: al reves
	djnz L_4D67		;4d6a   ; los 8
	pop bc			;4d6c
	ret			;4d6d
pide_sonido:		; pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	di			;4d6e   ; sin interrupciones
	push hl			;4d6f
	push de			;4d70
	push bc			;4d71
	push ix		;4d72
	push af			;4d74
	ld a,004h		;4d75   ; los bancos 4-5-6 sin tocar sus copias: el sonido
	ld (07000h),a		;4d77   ; el mapper: pone en 0x6000 el banco de A
	inc a			;4d7a
	ld (09000h),a		;4d7b   ; el mapper: pone en 0x8000 el banco de A
	inc a			;4d7e
	ld (0b000h),a		;4d7f   ; el mapper: pone en 0xA000 el banco de A
	pop af			;4d82   ; el sonido A
	push af			;4d83
	call 06472h		;4d84   ; arranca_sonido
	ld a,(0f0f1h)		;4d87   ; y devuelve los bancos de antes
	ld (07000h),a		;4d8a   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;4d8d   ; lee la copia del banco de 0x8000
	ld (09000h),a		;4d90   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;4d93   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;4d96   ; el mapper: pone en 0xA000 el banco de A
	pop af			;4d99
	pop ix		;4d9a
	pop bc			;4d9c
	pop de			;4d9d
	pop hl			;4d9e
	ei			;4d9f   ; con interrupciones
	ret			;4da0
cuadros_desde:		; compara la cuenta de cuadros (0xF0F7) con DE
	ld hl,(0f0f7h)		;4da1   ; la cuenta de interrupciones
	rst 20h			;4da4   ; compara con DE (acarreo si es menor)
	ret			;4da5
otro_jugador:		; IY a la ficha del otro jugador (0xE300 <-> 0xE380)
	push iy		;4da6   ; IY...
	pop bc			;4da8
	ld a,c			;4da9   ; ...su byte bajo
	xor 080h		;4daa   ; 0x00 <-> 0x80
	ld c,a			;4dac
	push bc			;4dad   ; a IY: la ficha del otro jugador
	pop iy		;4dae
	ret			;4db0
L_4DB1:
	ld hl,0c600h		;4db1   ; borra el bufer de 0xC600 (0x400 bytes)
	ld a,(0e63ah)		;4db4   ; en la presentacion...
	and a			;4db7
	jr z,L_4DBD		;4db8
	ld hl,0e700h		;4dba   ; ...el de 0xE700
L_4DBD:
	ld d,h			;4dbd
	ld e,l			;4dbe
	inc de			;4dbf
	ld bc,003ffh		;4dc0   ; 1.023 mas
	ld (hl),000h		;4dc3   ; a cero
	ldir		;4dc5
	ret			;4dc7
L_4DC8:
	ld a,(0e640h)		;4dc8   ; el jefe
	cp 008h		;4dcb   ; el 8: nada
	ret z			;4dcd
	cp 003h		;4dce   ; el 3 y el 6: p00:4E08
	jr z,L_4E08		;4dd0
	cp 006h		;4dd2
	jr z,L_4E08		;4dd4
	push ix		;4dd6
	call bancos_7_8_9		;4dd8   ; con 7-8-9
	ld a,(0e640h)		;4ddb   ; lee el jefe (1 a 8)
	ld hl,067d6h		;4dde   ; sus caracteres (p07:67D6)
	call caracteres_de_tabla		;4de1   ; caracteres_de_tabla: la lista de caracteres de la entrada A de la tabla HL
	xor a			;4de4   ; las copias en espejo
	ld (0f000h),a		;4de5
	ld a,(0e640h)		;4de8   ; lee el jefe (1 a 8)
	ld hl,067e4h		;4deb   ; de p07:67E4
	call copias_de_tabla		;4dee   ; copias_de_tabla: la lista de copias VRAM -> VRAM de la entrada A de la tabla HL
	ld hl,0f000h		;4df1   ; y cabeza abajo
	inc (hl)			;4df4
	ld a,(0e640h)		;4df5   ; lee el jefe (1 a 8)
	ld hl,067f2h		;4df8   ; de p07:67F2
	call copias_de_tabla		;4dfb   ; copias_de_tabla: la lista de copias VRAM -> VRAM de la entrada A de la tabla HL
	call bancos_1_2_3		;4dfe   ; de vuelta a 1-2-3
	call banco_11_en_a000		;4e01   ; con el 11 en 0xA000 (los jefes)
	pop ix		;4e04
	jr L_4DB1		;4e06   ; y borra el bufer
L_4E08:
	ld hl,00001h		;4e08   ; el jefe 3 o 6: por la lista de la presentacion (p00:4763)
	ld (0e21ch),hl		;4e0b   ; 0xE21C = 1, 0xE21D = 0
	ld hl,06822h		;4e0e   ; los caracteres de p07:6822
	ld (0e220h),hl		;4e11
	ld hl,06895h		;4e14   ; las copias de p07:6895
	ld (0e222h),hl		;4e17
	ld hl,068c0h		;4e1a   ; y p07:68C0
	ld (0e224h),hl		;4e1d
	ret			;4e20
palabra_de_de:		; DE = la palabra DE + 2 x A
	ld l,a			;4e21   ; HL = A
	ld h,000h		;4e22
	add hl,hl			;4e24   ; x 2
	add hl,de			;4e25   ; + DE
	jr L_4E2D		;4e26
palabra_de_hl:		; DE = la palabra HL + 2 x A
	add a,a			;4e28   ; A x 2
	ld e,a			;4e29
	ld d,000h		;4e2a
	add hl,de			;4e2c   ; + HL
L_4E2D:
	ld e,(hl)			;4e2d   ; la palabra, bajo
	inc hl			;4e2e
	ld d,(hl)			;4e2f   ; alto
	ret			;4e30
palabra_a_hl:		; HL = la palabra HL + 2 x A
	add a,a			;4e31   ; A x 2
	call hl_mas_a		;4e32   ; + HL
	ld a,(hl)			;4e35   ; la palabra, bajo
	inc hl			;4e36
	ld h,(hl)			;4e37   ; alto
	ld l,a			;4e38   ; en HL
	ret			;4e39
hay_enemigos:		; NZ si queda algun enemigo (0xE700) o disparo (0xEA00) vivo
	ld hl,0e700h		;4e3a   ; los enemigos
	ld de,00040h		;4e3d   ; 0x40 bytes cada uno
	ld b,00ch		;4e40   ; 12
L_4E42:
	ld a,(hl)			;4e42   ; su tipo
	and a			;4e43   ; vivo?
	ret nz			;4e44   ; si: NZ
	add hl,de			;4e45   ; el siguiente
	djnz L_4E42		;4e46
	ld hl,0ea00h		;4e48   ; los disparos
	ld de,00010h		;4e4b   ; 0x10 bytes cada uno
	ld b,008h		;4e4e   ; 8
L_4E50:
	ld a,(hl)			;4e50
	and a			;4e51
	ret nz			;4e52   ; vivo: NZ
	add hl,de			;4e53
	djnz L_4E50		;4e54
	xor a			;4e56   ; ninguno: Z
	ret			;4e57
azar:		; mezcla R en 0xE606 (el azar)
	ld a,r		;4e58   ; R
	ld b,a			;4e5a
	add a,a			;4e5b   ; x 3
	add a,b			;4e5c
	ld b,a			;4e5d
	ld a,(0e606h)		;4e5e   ; + el azar
	add a,b			;4e61
	ld (0e606h),a		;4e62   ; guarda el azar (lo mezcla p00:4E58)
	ret			;4e65
suceso_de_fase:		; la ficha A de la lista de sucesos de la fase y compara su posicion con el scroll
	push af			;4e66   ; se guarda A
	ld a,(0e301h)		;4e67   ; la fase
	call palabra_de_hl		;4e6a   ; DE = la lista de la fase
	pop af			;4e6d
L_4E6E:
	ld c,a			;4e6e   ; A...
	add a,a			;4e6f
	add a,c			;4e70   ; x 3: la ficha
	call de_mas_a		;4e71   ; de_mas_a: DE = DE + A
	ex de,hl			;4e74   ; HL = la ficha
	ld e,(hl)			;4e75   ; la posicion, bajo
	inc hl			;4e76
	ld d,(hl)			;4e77   ; alto
	inc hl			;4e78
	ld c,(hl)			;4e79   ; C = el dato
	ld hl,(0e302h)		;4e7a   ; el scroll
	rst 20h			;4e7d   ; comparado con la posicion
	ret			;4e7e
L_4E7F:
	ld a,(0e200h)		;4e7f   ; 0xE200: el estado del juego
	cp 002h		;4e82   ; 2?
	jr z,L_4E89		;4e84
	cp 005h		;4e86   ; o 5?
	ret nz			;4e88   ; si no, fuera
L_4E89:
	ld a,(0e630h)		;4e89   ; 0xE630 = 0?
	or a			;4e8c
	ret z			;4e8d   ; entonces fuera
	ld hl,0e215h		;4e8e   ; 0xE215 ya puesto?
	ld a,(hl)			;4e91
	or a			;4e92
	ret nz			;4e93   ; entonces fuera
	ld hl,0e632h		;4e94   ; 0xE632: cuenta 60 cuadros
	dec (hl)			;4e97   ; uno menos
	ret nz			;4e98   ; no ha llegado: fuera
	ld (hl),03ch		;4e99   ; vuelve a 60
	dec l			;4e9b   ; 0xE631: un segundo menos (BCD)
	ld a,(hl)			;4e9c
	sub 001h		;4e9d   ; - 1
	daa			;4e9f   ; en BCD
	ld (hl),a			;4ea0
	ld a,001h		;4ea1   ; 0xE215 = 1...
	jr nz,L_4EA6		;4ea3   ; ...o 2 si ha llegado a 0
	inc a			;4ea5
L_4EA6:
	ld (0e215h),a		;4ea6
	ret			;4ea9
L_4EAA:
	set 4,(ix+010h)		;4eaa   ; pone el bit 4 de IX+10
	ret			;4eae
borra_atributos:		; los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	ld hl,0ef80h		;4eaf   ; los atributos de sprite de la RAM
	ld de,0ef81h		;4eb2
	ld (hl),0e0h		;4eb5   ; 0xE0: fuera de la pantalla (y = 224)
	ld bc,0007fh		;4eb7   ; los 128 bytes
	ldir		;4eba
	ret			;4ebc
L_4EBD:
	ld a,(ix+014h)		;4ebd   ; IX+14: el ancho
	or a			;4ec0   ; 0: nada
	ret z			;4ec1
	ld b,a			;4ec2   ; en B
	ld l,(ix+011h)		;4ec3   ; IX+11/12: la direccion en el mapa de la RAM
	ld h,(ix+012h)		;4ec6
	ld a,(ix+000h)		;4ec9   ; el tipo
	sub 03ah		;4ecc   ; 0x3A?
	jr z,L_4EF1		;4ece   ; a p00:4EF1
	ld c,002h		;4ed0   ; dos filas
	sub 002h		;4ed2   ; 0x3C?
	jr z,L_4EE2		;4ed4   ; a p00:4EE2
	inc c			;4ed6   ; tres filas
	dec a			;4ed7   ; 0x3D?
	jr z,L_4EE2		;4ed8   ; a p00:4EE2
L_4EDA:
	ld a,(ix+032h)		;4eda   ; el caracter de IX+32
L_4EDD:
	ld (hl),a			;4edd   ; a la RAM
	inc l			;4ede   ; el siguiente
	djnz L_4EDD		;4edf   ; el ancho
	ret			;4ee1
L_4EE2:
	push hl			;4ee2
	push bc			;4ee3
	call L_4EDA		;4ee4   ; una fila
	pop bc			;4ee7
	pop hl			;4ee8
	ld de,00020h		;4ee9   ; la siguiente (32 por fila)
	add hl,de			;4eec
	dec c			;4eed   ; C filas
	jr nz,L_4EE2		;4eee
	ret			;4ef0
L_4EF1:
	ld a,038h		;4ef1   ; el tipo 0x3A: dos filas con 0x38/0x39 alternos
	push hl			;4ef3
	push bc			;4ef4
	call L_4F00		;4ef5   ; la de arriba
	pop bc			;4ef8
	pop hl			;4ef9
	ld de,00020h		;4efa
	add hl,de			;4efd
	ld a,039h		;4efe   ; la de abajo con 0x39
L_4F00:
	ld (hl),a			;4f00   ; el caracter
	xor 001h		;4f01   ; el otro
	inc l			;4f03   ; el siguiente
	djnz L_4F00		;4f04   ; el ancho
	ret			;4f06
L_4F07:
	ld a,(ix+013h)		;4f07   ; IX+13: el alto
	or a			;4f0a   ; 0: nada
	ret z			;4f0b
	ld b,a			;4f0c
	ld l,(ix+011h)		;4f0d   ; la direccion en el mapa de la RAM
	ld h,(ix+012h)		;4f10
	ld a,(ix+032h)		;4f13   ; el caracter de IX+32
	ld de,00040h		;4f16   ; 64 por fila
L_4F19:
	ld (hl),a			;4f19   ; a la RAM
	add hl,de			;4f1a   ; la de abajo
	djnz L_4F19		;4f1b   ; las del alto
	ret			;4f1d
L_4F1E:
	push af			;4f1e   ; se guarda la direccion (A)
	ld hl,04f5dh		;4f1f   ; la palabra de p00:4F5D
	call palabra_de_hl		;4f22   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld hl,00000h		;4f25   ; HL = 0
	push bc			;4f28
L_4F29:
	add hl,de			;4f29   ; + DE...
	djnz L_4F29		;4f2a   ; ...B veces
	pop bc			;4f2c
	pop af			;4f2d
	push hl			;4f2e   ; se guarda
	ld hl,04f3dh		;4f2f   ; la palabra de p00:4F3D
	call palabra_de_hl		;4f32   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld hl,00000h		;4f35
L_4F38:
	add hl,de			;4f38   ; + DE...
	djnz L_4F38		;4f39   ; ...B veces
	pop de			;4f3b   ; DE = la primera; HL = la segunda
	ret			;4f3c

; ----------------------------------------------------------------------
; DATOS velocidad_4F3D: 16 palabras con signo, una por direccion (A de 0 a 15,
;   p00:4F32 con p00:4E28), que p00:4F38 suma B veces; lo leen p00:4F32 (32
;   bytes)
;   0x4f3d..0x4f5d  (32 bytes)
DATA_velocidad_4F3D:
	defw 00000h,0ff80h,0ff4bh,0ff23h,0ff00h,0ff23h,0ff4bh,0ff80h	; 4f3d
	defw 00000h,00080h,000b5h,000ddh,00100h,000ddh,000b5h,00080h	; 4f4d

; ----------------------------------------------------------------------
; DATOS velocidad_4F5D: 16 palabras con signo, una por direccion (A de 0 a 15,
;   p00:4F22 con p00:4E28), que p00:4F29 suma B veces; lo leen p00:4F22 (32
;   bytes)
;   0x4f5d..0x4f7d  (32 bytes)
DATA_velocidad_4F5D:
	defw 00100h,000ddh,000b5h,00080h,00000h,0ff80h,0ff4bh,0ff23h	; 4f5d
	defw 0ff00h,0ff23h,0ff4bh,0ff80h,00000h,00080h,000b5h,000ddh	; 4f6d

; ======================================================================
; CODIGO 0x4f7d..0x4f97  (26 bytes)
; ======================================================================


L_4F7D:
	ld hl,04f97h		;4f7d   ; los caracteres de p00:4F97
L_4F80:
	ld c,000h		;4f80   ; C = 0
	dec (ix+024h)		;4f82   ; IX+24 - 1
	ld a,(ix+024h)		;4f85   ; lo lee
	rra			;4f88   ; / 4
	rra			;4f89
	dec c			;4f8a   ; C - 1 (0xFF)
	jr nz,L_4F8E		;4f8b   ; siempre: no se divide mas
	rra			;4f8d
L_4F8E:
	and 003h		;4f8e   ; de 0 a 3
	call byte_de_tabla		;4f90   ; el caracter de la tabla HL
	ld (ix+030h),a		;4f93   ; a IX+30: el dibujo del sprite
	ret			;4f96

; ----------------------------------------------------------------------
; DATOS cuadros_4F97: 4 caracteres (0x90 0x94 0x98 0x94) que p00:4F7D pasa por
;   turno con IX+24; lo leen p00:4F7D (4 bytes)
;   0x4f97..0x4f9b  (4 bytes)
DATA_cuadros_4F97:
	defb 090h,094h,098h,094h	; 4f97

; ======================================================================
; CODIGO 0x4f9b..0x5130  (405 bytes)
; ======================================================================


L_4F9B:
	set 3,(ix+010h)		;4f9b   ; pone el bit 3 de IX+10
	ret			;4f9f
L_4FA0:
	ld a,(ix+013h)		;4fa0   ; IX+13...
	add a,a			;4fa3   ; x 8
	add a,a			;4fa4
	add a,a			;4fa5
	ld (ix+00eh),a		;4fa6   ; a IX+0E
L_4FA9:
	ld a,(ix+014h)		;4fa9   ; IX+14...
	add a,a			;4fac   ; x 8
	add a,a			;4fad
	add a,a			;4fae
	ld (ix+00fh),a		;4faf   ; a IX+0F
	ret			;4fb2
L_4FB3:
	call L_5087		;4fb3   ; p00:5087
	ld a,(0e647h)		;4fb6   ; 0xE647 + 1...
	inc a			;4fb9
	ld b,a			;4fba   ; ...es el ancho
	jr L_4FD4		;4fbb
L_4FBD:
	call L_5087		;4fbd   ; p00:5087
	jr L_4FD4		;4fc0
L_4FC2:
	call L_5092		;4fc2   ; p00:5092
	jr L_4FD4		;4fc5
L_4FC7:
	call L_509F		;4fc7   ; p00:509F
	jr L_4FD4		;4fca
L_4FCC:
	call L_506E		;4fcc   ; p00:506E
	jr L_4FD4		;4fcf
L_4FD1:
	call L_5078		;4fd1   ; p00:5078
L_4FD4:
	ld e,b			;4fd4   ; E = el ancho
L_4FD5:
	ld a,h			;4fd5   ; fuera del mapa de la RAM (0xD000)?
	cp 0d0h		;4fd6
	ret nc			;4fd8   ; entonces fuera
	ld b,e			;4fd9
	xor a			;4fda   ; a cero
	push hl			;4fdb
L_4FDC:
	ld (hl),a			;4fdc   ; borra
	inc hl			;4fdd   ; la siguiente
	djnz L_4FDC		;4fde   ; el ancho
	pop hl			;4fe0
	ld a,040h		;4fe1   ; la fila de abajo (64)
	call hl_mas_a		;4fe3   ; hl_mas_a: HL = HL + A
	dec c			;4fe6   ; C filas
	jr nz,L_4FD5		;4fe7
	ret			;4fe9
L_4FEA:
	push bc			;4fea
	call L_5087		;4feb   ; p00:5087
	pop af			;4fee
	push hl			;4fef
	push de			;4ff0
	push bc			;4ff1
	call L_5047		;4ff2   ; p00:5047
	pop bc			;4ff5
	pop hl			;4ff6
	pop de			;4ff7
	ld a,(0e647h)		;4ff8   ; + 0xE647
	call de_mas_a		;4ffb   ; de_mas_a: DE = DE + A
	ld a,(0e647h)		;4ffe
	inc a			;5001
	sub b			;5002
	ld b,a			;5003   ; B = lo que queda
L_5004:
	push de			;5004
	push bc			;5005
L_5006:
	ld a,(0e646h)		;5006   ; 0xE646 + el caracter
	add a,(hl)			;5009
	cp 031h		;500a   ; 0x31 o mas?
	jr nc,L_500F		;500c   ; si, se queda
	xor a			;500e   ; si no, 0: hueco
L_500F:
	ld (de),a			;500f   ; a la RAM (DE)
	inc hl			;5010   ; el siguiente del origen
	dec de			;5011   ; el anterior del destino: al reves
	djnz L_5006		;5012   ; la fila
	pop bc			;5014
	pop de			;5015
	ld a,040h		;5016   ; la fila siguiente de la RAM (64)
	call de_mas_a		;5018   ; de_mas_a: DE = DE + A
	ld a,(0ec80h)		;501b   ; 0xEC80: el jefe en marcha
	cp 008h		;501e   ; del 8 en adelante...
	jr nc,L_5023		;5020   ; ...el origen no avanza
	inc hl			;5022
L_5023:
	dec c			;5023   ; C filas
	jr nz,L_5004		;5024
	ret			;5026
L_5027:
	push bc			;5027   ; p00:5087 y copia la forma (p00:5047)
	call L_5087		;5028
	jr L_5031		;502b
L_502D:
	push bc			;502d   ; p00:5092 y copia la forma
	call L_5092		;502e
L_5031:
	pop af			;5031
	jr L_5047		;5032
L_5034:
	push bc			;5034   ; p00:509F y copia la forma
	call L_509F		;5035
	pop af			;5038
	jr L_5047		;5039
L_503B:
	push bc			;503b   ; p00:506E y copia la forma
	call L_506E		;503c
	pop af			;503f
	jr L_5047		;5040
L_5042:
	push bc			;5042   ; p00:5078 y copia la forma
	call L_5078		;5043
	pop af			;5046
L_5047:
	sub b			;5047   ; el ancho de la forma - el que cabe: lo que se salta del origen
	exx			;5048
	ld c,a			;5049   ; en C'
	exx			;504a
	ld a,040h		;504b   ; 64 - lo que cabe: lo que se salta de la RAM
	sub b			;504d
	exx			;504e
	ld d,a			;504f   ; en D'
	exx			;5050
	ld a,c			;5051   ; C = las filas
	ld c,b			;5052
	ld b,a			;5053   ; B = lo que cabe
	ex de,hl			;5054   ; HL = el origen, DE = la RAM
L_5055:
	ld a,d			;5055   ; fuera del mapa de la RAM (0xD000)?
	cp 0d0h		;5056
	ret nc			;5058   ; entonces fuera
	push bc			;5059
	ld b,000h		;505a   ; B bytes de la fila
	ldir		;505c   ; copia
	pop bc			;505e
	exx			;505f
	ld a,c			;5060   ; lo que se salta del origen
	exx			;5061
	call hl_mas_a		;5062   ; en HL
	exx			;5065
	ld a,d			;5066   ; lo que se salta de la RAM
	exx			;5067
	call de_mas_a		;5068   ; en DE
	djnz L_5055		;506b   ; las filas
	ret			;506d
L_506E:
	push de			;506e
	call 064f8h		;506f   ; p01:64F8
	call L_5AAD		;5072   ; p00:5AAD: a la direccion de la RAM
	pop de			;5075
	jr L_507B		;5076
L_5078:
	call hl_a_nombre		;5078   ; a la direccion de la RAM (p00:5A99)
L_507B:
	ld a,l			;507b   ; la columna
	and 01fh		;507c
	add a,b			;507e   ; + el ancho
	sub 020h		;507f   ; - 32
	ret c			;5081   ; cabe entera: fuera
	neg		;5082   ; lo que sobra...
	add a,b			;5084   ; ...se quita del ancho
	ld b,a			;5085
	ret			;5086
L_5087:
	push de			;5087   ; la direccion de E' y D'
	exx			;5088
	ld a,e			;5089
	exx			;508a
	ld e,a			;508b
	exx			;508c
	ld a,d			;508d
	exx			;508e
	ld d,a			;508f
	jr L_5096		;5090
L_5092:
	push de			;5092
	call 064f8h		;5093   ; p01:64F8
L_5096:
	ld a,l			;5096   ; la columna
	push af			;5097
	call L_5AAD		;5098   ; p00:5AAD
	pop af			;509b
	pop de			;509c
	jr L_50A5		;509d
L_509F:
	ld a,l			;509f   ; la columna
	push af			;50a0
	call hl_a_nombre		;50a1   ; a la direccion de la RAM
	pop af			;50a4
L_50A5:
	rra			;50a5   ; la fila (/ 8)
	rra			;50a6
	rra			;50a7
	and 01fh		;50a8
	sub 015h		;50aa   ; 21 - fila: las que caben
	neg		;50ac
	cp c			;50ae   ; caben las C?
	ret nc			;50af   ; si: fuera
	ld c,a			;50b0   ; si no, C = las que caben
	ret			;50b1
L_50B2:
	call 08025h		;50b2   ; lo que se pinta en el mapa de la RAM: p02:8025...
	call 0777ah		;50b5
	call 0706ah		;50b8
	call 07be3h		;50bb
	call banco_11_en_a000		;50be   ; con el 11: p11:BB39
	call 0bb39h		;50c1
	call banco_12_en_a000		;50c4   ; con el 12: p12:BD55 y p12:A639
	call 0bd55h		;50c7
	call 0a639h		;50ca
	jp bancos_1_2_3		;50cd   ; de vuelta a 1-2-3
L_50D0:
	ld a,0ffh		;50d0   ; el sonido de arranque: 0xE1D8-0xE1D9 = 0xFF
	ld hl,0e1d8h		;50d2
	ld (hl),a			;50d5
	inc hl			;50d6
	ld (hl),a			;50d7
	inc hl			;50d8
	ld de,0e1dbh		;50d9   ; 0xE1DA-0xE1E3 = 1
	ld (hl),001h		;50dc
	ld bc,00009h		;50de   ; 10 bytes
	ldir		;50e1
	ld a,004h		;50e3   ; los bancos 4-5-6 sin tocar sus copias
	ld (07000h),a		;50e5   ; el mapper: pone en 0x6000 el banco de A
	inc a			;50e8
	ld (09000h),a		;50e9   ; el mapper: pone en 0x8000 el banco de A
	inc a			;50ec
	ld (0b000h),a		;50ed   ; el mapper: pone en 0xA000 el banco de A
	call 0728eh		;50f0   ; p04:728E: prepara el SCC
	ld a,(0f0f1h)		;50f3   ; y devuelve los bancos
	ld (07000h),a		;50f6   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;50f9   ; lee la copia del banco de 0x8000
	ld (09000h),a		;50fc   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;50ff   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;5102   ; el mapper: pone en 0xA000 el banco de A
	ld a,0bfh		;5105   ; 0xBF: el registro 7 del PSG con los tonos y el ruido callados
	ld (0e1d0h),a		;5107   ; su copia
	ld e,a			;510a
	ld a,007h		;510b   ; el registro 7
	call 00093h		;510d   ; BIOS WRTPSG - Writes data to PSG-register | WRTPSG
	ld a,001h		;5110   ; el sonido 1: calla todo
	call pide_sonido		;5112   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld hl,00000h		;5115   ; la VRAM entera...
	ld bc,04000h		;5118   ; ...16 KB...
	xor a			;511b   ; ...a cero
	call 00056h		;511c   ; BIOS FILVRM - Fills VRAM with value | FILVRM
L_511F:
	ld hl,05130h		;511f   ; los registros del VDP de p00:5130
	ld c,000h		;5122   ; desde el 0
	ld d,008h		;5124   ; 8 registros
L_5126:
	ld b,(hl)			;5126   ; el valor
	call 00047h		;5127   ; BIOS WRTVDP - Writes data in the VDP-register | WRTVDP
	inc hl			;512a   ; el siguiente
	inc c			;512b   ; el registro siguiente
	dec d			;512c   ; los 8
	jr nz,L_5126		;512d
	ret			;512f

; ----------------------------------------------------------------------
; DATOS registros_vdp: los 8 registros del VDP (0 a 7) que p00:511F escribe
;   con WRTVDP: SCREEN 2; lo leen p00:5127 (8 bytes)
;   0x5130..0x5138  (8 bytes)
DATA_registros_vdp:
	defb 002h,0e2h,00eh,07fh,007h,076h,003h,0e4h	; 5130  .....v..

; ======================================================================
; CODIGO 0x5138..0x5260  (296 bytes)
; ======================================================================


L_5138:
	ld c,007h		;5138   ; el registro 7 del VDP (el color del borde) = B
	jp 00047h		;513a   ; BIOS WRTVDP - Writes data in the VDP-register
L_513D:
	ld iy,0e300h		;513d   ; los mandos de los dos jugadores: el 1
	call L_5148		;5141
	ld iy,0e380h		;5144   ; y el 2
L_5148:
	push iy		;5148   ; HL = IY + 0x0F: donde van los mandos
	pop hl			;514a
	ld bc,0000fh		;514b
	add hl,bc			;514e
	bit 0,(iy+021h)		;514f   ; con mando (IY+21 bit 0)?
	jr nz,L_515C		;5153   ; a p00:515C
	push hl			;5155   ; con teclado: p00:51BF
	call L_51BF		;5156
	pop hl			;5159
	jr L_51B8		;515a   ; y los apunta (p00:51B8)
L_515C:
	push hl			;515c   ; con mando: el puerto 2 (registro 15 = 0xCF)
	ld e,0cfh		;515d
	call L_51F1		;515f
	and 03fh		;5162   ; los 6 bits
	call L_516A		;5164   ; y el teclado del jugador 2 (p00:516A)
	pop hl			;5167
	jr L_51B8		;5168   ; y los apunta
L_516A:
	push af			;516a   ; la fila 6 del teclado (SNSMAT)
	ld a,006h		;516b
	call 00141h		;516d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5170   ; al reves: 1 = pulsada
	rlca			;5171   ; a los bits 4-5
	rlca			;5172
	rlca			;5173
	rlca			;5174
	and 030h		;5175   ; dos teclas
	ld e,a			;5177   ; en E
	ld a,003h		;5178   ; la fila 3
	call 00141h		;517a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;517d   ; al reves
	ld c,a			;517e
	and 008h		;517f   ; una tecla al bit 3
	ld d,a			;5181
	ld a,c			;5182
	rla			;5183   ; otra al bit 1
	and 002h		;5184
	or d			;5186
	ld d,a			;5187
	ld a,c			;5188   ; otra al bit 0
	rra			;5189
	rra			;518a
	and 001h		;518b
	or d			;518d
	ld d,a			;518e
	ld a,005h		;518f   ; la fila 5
	call 00141h		;5191   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5194   ; al reves
	ld c,a			;5195
	rla			;5196   ; una al bit 2
	rla			;5197
	and 004h		;5198
	or d			;519a
	or e			;519b   ; todo junto
	ex af,af'			;519c
	ld a,c			;519d
	and 0e0h		;519e   ; los bits 5-7 de la fila 5...
	ld (0e60dh),a		;51a0   ; ...en 0xE60D
	ex af,af'			;51a3
	pop bc			;51a4
	or b			;51a5   ; con los del mando
	ret			;51a6
L_51A7:
	ld a,(0e200h)		;51a7   ; el estado del juego
	cp 005h		;51aa   ; 5 o 9: los dos jugadores
	jr z,L_513D		;51ac
	cp 009h		;51ae
	jr z,L_513D		;51b0
	call L_51BF		;51b2   ; uno: el teclado (p00:51BF)
	ld hl,0e30fh		;51b5   ; en 0xE30F
L_51B8:
	ld c,(hl)			;51b8   ; lo de antes
	ld (hl),a			;51b9   ; lo de ahora
	xor c			;51ba   ; lo que ha cambiado...
	and (hl)			;51bb   ; ...y esta pulsado: lo recien pulsado
	dec hl			;51bc   ; en el byte de delante
	ld (hl),a			;51bd
	ret			;51be
L_51BF:
	ld e,08fh		;51bf   ; el puerto 1 (registro 15 = 0x8F)
	call L_51F1		;51c1   ; lee el mando
	and 03fh		;51c4   ; los 6 bits
L_51C6:
	push af			;51c6   ; la fila 4 del teclado
	ld a,004h		;51c7
	call 00141h		;51c9   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;51cc   ; al reves
	and 00ch		;51cd   ; dos teclas (bits 2-3)
	ld e,a			;51cf
	jr z,L_51D4		;51d0   ; alguna?
	ld e,020h		;51d2   ; entonces el bit 5
L_51D4:
	ld a,008h		;51d4   ; la fila 8: los cursores y el espacio
	call 00141h		;51d6   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;51d9   ; al reves
	rrca			;51da   ; girados
	rrca			;51db
	ld b,a			;51dc
	and 004h		;51dd   ; un bit al 2
	or e			;51df
	ld c,a			;51e0
	ld a,b			;51e1
	rrca			;51e2   ; dos mas
	rrca			;51e3
	ld b,a			;51e4
	and 018h		;51e5   ; a los bits 3-4
	or c			;51e7
	ld c,a			;51e8
	ld a,b			;51e9
	rrca			;51ea
	and 003h		;51eb   ; y los dos de abajo
	or c			;51ed
	pop bc			;51ee   ; con el mando
	or b			;51ef
	ret			;51f0
L_51F1:
	ld a,00fh		;51f1   ; el registro 15 del PSG (los puertos de mando)
	call 00093h		;51f3   ; BIOS WRTPSG - Writes data to PSG-register | WRTPSG con E
	ld a,00eh		;51f6   ; el registro 14
	di			;51f8
	call 00096h		;51f9   ; BIOS RDPSG - Reads value from PSG-register | RDPSG: el mando
	ei			;51fc
	cpl			;51fd   ; al reves: 1 = pulsado
	ret			;51fe
L_51FF:
	ld e,08fh		;51ff   ; el puerto 1 y el teclado
	call L_51F1		;5201
	and 03fh		;5204
	jr L_51C6		;5206
L_5208:
	ld a,(0e202h)		;5208   ; 0xE202 bit 6: la pausa permitida?
	and 040h		;520b
	ret z			;520d   ; si no, fuera
	ld a,(0e30fh)		;520e   ; algo pulsado en los mandos del 1...
	and 01fh		;5211
	ret nz			;5213   ; ...entonces fuera
	ld a,(0e38fh)		;5214   ; o del 2
	and 01fh		;5217
	ret nz			;5219
	ld a,(0e60dh)		;521a   ; o la fila 5 (0xE60D)
	or a			;521d
	ret nz			;521e
	ld a,006h		;521f   ; la fila 6 del teclado
	call 00141h		;5221   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5224   ; al reves
	rlca			;5225
	rlca			;5226
	rlca			;5227
	push af			;5228
	ld a,007h		;5229   ; la fila 7
	call 00141h		;522b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;522e
	rlca			;522f
	rlca			;5230
	rlca			;5231
	pop bc			;5232
	or b			;5233
	push af			;5234
	ld a,008h		;5235   ; la fila 8
	call 00141h		;5237   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;523a
	rrca			;523b
	rrca			;523c
	rrca			;523d
	pop bc			;523e   ; todo junto, 6 bits
	or b			;523f
	and 03fh		;5240
	ld hl,0e219h		;5242   ; en 0xE219, con lo recien pulsado en 0xE218
	ld c,(hl)			;5245
	ld (hl),a			;5246
	xor c			;5247
	and (hl)			;5248
	dec hl			;5249
	ld (hl),a			;524a
	ret			;524b
L_524C:
	ld hl,0e203h		;524c   ; la cuenta de cuadros + 1
	inc (hl)			;524f
	ld hl,057dch		;5250   ; p00:57DC se ejecuta al volver (estados 0-2)
	ld bc,(0e200h)		;5253   ; el estado (C) y el paso (B)
	ld a,c			;5257
	cp 003h		;5258   ; del 3 en adelante...
	jr nc,L_525D		;525a   ; ...no
	push hl			;525c   ; la vuelta por p00:57DC
L_525D:
	call despacha		;525d   ; por el estado: la tabla de detras

; ----------------------------------------------------------------------
; DATOS tabla_5260: 13 destinos del despachador p00:40CE (call en p00:525D, el
;   indice en A): 527A, 52B4, 52EB, 5340, 539F, 53FD, 543C, 54A9, 555F, 55CC,
;   56E7, 5601, 5670; lo leen p00:525D (26 bytes)
;   0x5260..0x527a  (26 bytes)
DATA_tabla_5260:
	defw 0527ah,052b4h,052ebh,05340h,0539fh,053fdh,0543ch,054a9h	; 5260
	defw 0555fh,055cch,056e7h,05601h,05670h	; 5270

; ======================================================================
; CODIGO 0x527a..0x58be  (1604 bytes)
; ======================================================================


L_527A:
	djnz L_5291		;527a   ; paso 0...
	ld a,(0e203h)		;527c   ; uno de cada dos cuadros
	rra			;527f
	ret nc			;5280
	call banco_12_en_a000		;5281   ; con el 12: p12:A313
	call 0a313h		;5284
	push af			;5287
	call bancos_2_3		;5288   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	pop af			;528b
	ret nz			;528c   ; NZ: fuera
	xor a			;528d   ; Z: al paso siguiente con cuenta 0
	jp L_5338		;528e
L_5291:
	djnz L_529C		;5291   ; paso 1: la cuenta atras
	ld hl,0e204h		;5293
	dec (hl)			;5296   ; uno menos
	ret nz			;5297   ; no ha llegado: fuera
	xor a			;5298   ; al estado siguiente
	jp L_538A		;5299
L_529C:
	call L_511F		;529c   ; el VDP
	call borra_nombres		;529f   ; borra la pantalla
	call banco_11_en_a000		;52a2   ; con el 11: p11:B8D7
	call 0b8d7h		;52a5
	call banco_12_en_a000		;52a8   ; con el 12: p12:A2E5
	call 0a2e5h		;52ab
	call bancos_2_3		;52ae   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	jp L_533B		;52b1   ; al paso siguiente
L_52B4:
	djnz L_52CC		;52b4   ; con el 10 y el 15 puestos: p10:81A3 y p10:87E9
	call bancos_10_15		;52b6   ; bancos_10_15: pone el banco 10 en 0x8000 y el 15 en 0xA000 (y su copia en 0xF0F1-3)
	call 081a3h		;52b9
	call 087e9h		;52bc
	call bancos_1_2_3		;52bf   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld hl,0e204h		;52c2   ; la cuenta atras
	dec (hl)			;52c5
	jp nz,090bah		;52c6   ; sin acabar: p10:90BA
	jp L_5388		;52c9   ; acabada: al estado siguiente
L_52CC:
	call borra_nombres		;52cc   ; borra la pantalla
	call bancos_10_15		;52cf   ; con el 10 y el 15: la presentacion (p10:80B9, 813E)
	call 080b9h		;52d2
	call 0813eh		;52d5
	ld de,081a9h		;52d8   ; la lista de p10:81A9
	call lista_a_vram		;52db   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	call 087e9h		;52de
	call bancos_1_2_3		;52e1   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	xor a			;52e4   ; 0xE227 = 0
	ld (0e227h),a		;52e5   ; guarda cuantos jugadores (o el modo de dos)
	jp L_5338		;52e8   ; al paso siguiente con cuenta 0
L_52EB:
	djnz L_52FE		;52eb
	call bancos_10_15		;52ed   ; p10:81E6 y p10:87E9
	call 081e6h		;52f0
	call 087e9h		;52f3
	call bancos_1_2_3		;52f6   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0e217h)		;52f9   ; 0xE217: sigue el cuadro de la presentacion?
	and a			;52fc
	ret nz			;52fd   ; si, fuera
L_52FE:
	djnz L_5310		;52fe
	ld a,001h		;5300   ; el sonido 1: calla
	call pide_sonido		;5302   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call borra_nombres		;5305   ; borra la pantalla
	call L_582D		;5308   ; p00:582D
	call 0bf4eh		;530b   ; p03:BF4E
	jr L_533B		;530e
L_5310:
	djnz L_532B		;5310
	call 0bf85h		;5312   ; p03:BF85: la demostracion
	ld a,(0e213h)		;5315   ; 0xE213 = 0: se acabo la demo
	or a			;5318
	ret nz			;5319   ; si no, fuera
L_531A:
	ld a,001h		;531a   ; calla
	call pide_sonido		;531c   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	xor a			;531f   ; el estado 0
L_5320:
	ld (0e200h),a		;5320   ; en 0xE200
	ld a,020h		;5323   ; con 32 de cuenta
	ld (0e204h),a		;5325
	jp L_5391		;5328   ; y el paso 0
L_532B:
	call L_5F57		;532b   ; p00:5F57
	call borra_nombres		;532e   ; borra la pantalla
	ld a,001h		;5331   ; 0xE217 = 1
	ld (0e217h),a		;5333
L_5336:
	ld a,020h		;5336   ; 32 de cuenta
L_5338:
	ld (0e204h),a		;5338   ; en 0xE204
L_533B:
	ld hl,0e201h		;533b   ; el paso siguiente
	inc (hl)			;533e
	ret			;533f
L_5340:
	djnz L_5362		;5340
	ld hl,0e204h		;5342   ; la cuenta atras
	dec (hl)			;5345
	jr z,L_533B		;5346   ; llego: al paso siguiente
	ld a,(0e227h)		;5348   ; cuantos jugadores
	or a			;534b
	ld de,0b64dh		;534c   ; la lista de p03:B64D (uno)
	jr z,L_535A		;534f
	ld de,0b657h		;5351   ; p03:B657 (dos)
	dec a			;5354
	jr z,L_535A		;5355
	ld de,0b662h		;5357   ; p03:B662 (el otro modo)
L_535A:
	bit 2,(hl)		;535a   ; el bit 2 de la cuenta: parpadea
	jp z,lista_a_vram		;535c   ; pinta
	jp borra_lista		;535f   ; o borra
L_5362:
	djnz L_536E		;5362
	call borra_nombres		;5364   ; borra la pantalla
	ld a,001h		;5367
	ld (0e217h),a		;5369   ; 0xE217 = 1
	jr L_533B		;536c
L_536E:
	djnz L_5380		;536e
	call bancos_10_15		;5370   ; con el 10 y el 15: p10:8848
	call 08848h		;5373
	call bancos_1_2_3		;5376   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0e217h)		;5379   ; 0xE217 sigue?
	and a			;537c
	ret nz			;537d   ; si, fuera
	jr L_533B		;537e   ; al paso siguiente
L_5380:
	djnz L_5396		;5380
	call borra_nombres		;5382   ; borra la pantalla
	call L_5835		;5385   ; p00:5835
L_5388:
	ld a,020h		;5388   ; 32 de cuenta
L_538A:
	ld (0e204h),a		;538a
L_538D:
	ld hl,0e200h		;538d   ; al estado siguiente
	inc (hl)			;5390
L_5391:
	xor a			;5391   ; paso 0
L_5392:
	ld (0e201h),a		;5392
	ret			;5395
L_5396:
	ld a,049h		;5396   ; el sonido 0x49
	call pide_sonido		;5398   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld a,050h		;539b   ; 80 de cuenta
	jr L_5338		;539d
L_539F:
	djnz L_53B0		;539f
	ld hl,0e204h		;53a1   ; la cuenta atras
	dec (hl)			;53a4
	ret nz			;53a5   ; no ha llegado: fuera
	call L_5AEF		;53a6   ; p00:5AEF
	ld a,001h		;53a9   ; 0xE213 = 1: la partida en marcha
	ld (0e213h),a		;53ab
	jr L_538D		;53ae   ; al estado siguiente
L_53B0:
	call L_58E9		;53b0   ; p00:58E9: listo?
	ret p			;53b3   ; aun no
	call L_5F57		;53b4   ; p00:5F57
	call L_53CB		;53b7   ; p00:53CB: las vidas
	call L_5553		;53ba   ; p00:5553: el marcador
	call L_53F0		;53bd   ; p00:53F0: los caracteres comunes
	call L_5A12		;53c0   ; p00:5A12
	call L_5D18		;53c3   ; p00:5D18
	ld a,078h		;53c6   ; 120 de cuenta
	jp L_5338		;53c8
L_53CB:
	ld a,(0e227h)		;53cb   ; con dos jugadores...
	cp 002h		;53ce
	jr nz,L_53D9		;53d0
	ld iy,0e380h		;53d2   ; ...el 2
	call L_53DD		;53d6
L_53D9:
	ld iy,0e300h		;53d9   ; y el 1
L_53DD:
	ld a,(iy+020h)		;53dd   ; IY+20 = 0?
	or a			;53e0
	ret nz			;53e1   ; si no, fuera
	ld a,(iy+000h)		;53e2   ; IY+00 (BCD) - 1
	sub 001h		;53e5
	daa			;53e7
	ld (iy+000h),a		;53e8   ; se guarda
	ld (iy+020h),0ffh		;53eb   ; IY+20 = 0xFF
	ret			;53ef
L_53F0:
	call bancos_7_8_9		;53f0   ; con 7-8-9...
	ld ix,06c63h		;53f3   ; ...la lista de caracteres de todas las fases (p07:6C63)
	call caracteres		;53f7   ; caracteres: la lista de caracteres de IX (dibujos y colores por rachas)
	jp bancos_1_2_3		;53fa   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_53FD:
	call L_4200		;53fd   ; el cuadro de la partida (p00:4200)
	ld a,(0e213h)		;5400   ; 0xE213 = 0: se acabo
	or a			;5403
	jp z,L_5388		;5404   ; al estado siguiente
	ld a,(0e226h)		;5407   ; 0xE226 distinto de 0...
	and a			;540a
	ld a,00ah		;540b   ; ...el estado 10
	jp nz,L_5320		;540d
	ld a,(0e21ah)		;5410   ; 0xE21A distinto de 0...
	and a			;5413
	ld a,008h		;5414   ; ...el estado 8
	jp nz,L_5320		;5416
	ld a,(0e6d0h)		;5419   ; 0xE6D0 = 2...
	cp 002h		;541c
	ld a,00ch		;541e   ; ...el estado 12
	jp z,L_5320		;5420
	ld a,(0e6c0h)		;5423   ; 0xE6C0 distinto de 0: fuera
	or a			;5426
	ret nz			;5427
	ld a,(0e6aah)		;5428   ; 0xE6AA distinto de 0: fuera
	or a			;542b
	ret nz			;542c
	ld a,(0e218h)		;542d   ; lo recien pulsado (0xE218)
	rra			;5430   ; el bit 0
	ret nc			;5431   ; sin el: fuera
	ld a,0f3h		;5432   ; el sonido 0xF3: la pausa
	call pide_sonido		;5434   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld a,009h		;5437   ; el estado 9
	jp L_5320		;5439
L_543C:
	ld a,(0e227h)		;543c   ; con dos jugadores...
	cp 002h		;543f
	jr z,L_5461		;5441   ; ...p00:5461
	ld a,(0e300h)		;5443   ; le quedan vidas al 1?
	or a			;5446
	jr z,L_547A		;5447   ; no: p00:547A
	ld a,(0e380h)		;5449   ; y al 2?
	or a			;544c
	jr z,L_5458		;544d   ; no: p00:5458
L_544F:
	xor a			;544f   ; 0xE320 = 0
	ld (0e320h),a		;5450
	call L_549E		;5453   ; p00:549E: cambia las fichas de los jugadores
	jr L_545C		;5456
L_5458:
	xor a			;5458   ; 0xE320 = 0
	ld (0e320h),a		;5459
L_545C:
	ld a,004h		;545c   ; el estado 4
	jp L_5320		;545e
L_5461:
	ld hl,0e301h		;5461   ; dos jugadores: copia 5 bytes de la ficha del 1 a la del 2 (la fase...)
	ld de,0e381h		;5464
	ld bc,00005h		;5467
	ldir		;546a
	ld hl,(0e22eh)		;546c   ; la ficha del que juega (0xE22E)
	push hl			;546f
	pop iy		;5470   ; a IY
	ld a,(hl)			;5472   ; le quedan vidas?
	or a			;5473
	jr nz,L_5498		;5474   ; si: p00:5498
	ld (iy+020h),000h		;5476   ; no: IY+20 = 0
L_547A:
	call L_5480		;547a   ; p00:5480
	jp L_5388		;547d   ; al estado siguiente
L_5480:
	ld hl,03acfh		;5480   ; dos caracteres de la VRAM a 0: 0x3ACF...
	call L_548C		;5483
	ld hl,03adfh		;5486   ; ...y 0x3ADF
	call L_548C		;5489
L_548C:
	call puerto_vdp		;548c   ; la direccion
	exx			;548f
	xor a			;5490
	out (c),a		;5491   ; un 0
	exx			;5493
	exx			;5494
	out (c),a		;5495   ; y otro
	ret			;5497
L_5498:
	ld (iy+020h),000h		;5498   ; IY+20 = 0
	jr L_545C		;549c
L_549E:
	ld hl,0e300h		;549e   ; cambia las fichas de los dos jugadores...
	ld de,0e380h		;54a1   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	ld b,080h		;54a4   ; ...0x80 bytes
	jp L_5A8F		;54a6   ; p00:5A8F
L_54A9:
	djnz L_5515		;54a9
	call L_55EA		;54ab   ; p00:55EA: la tecla de seguir?
	ld hl,(0e649h)		;54ae   ; la cuenta de 0xE649...
	dec hl			;54b1   ; - 1
	ld (0e649h),hl		;54b2
	ld a,l			;54b5   ; llego a 0?
	or h			;54b6
	ret nz			;54b7   ; no: fuera
	ld a,001h		;54b8   ; calla
	call pide_sonido		;54ba   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld a,(0e227h)		;54bd   ; con dos jugadores...
	cp 002h		;54c0
	jr z,L_54EE		;54c2   ; ...p00:54EE
	xor a			;54c4   ; 0xE320 = 0
	ld (0e320h),a		;54c5
	ld a,(0e229h)		;54c8   ; 0xE229: se sigue?
	and a			;54cb
	jr z,L_54D6		;54cc   ; no: p00:54D6
	call L_553D		;54ce   ; p00:553D
	ld a,003h		;54d1   ; 3 vidas
	ld (0e300h),a		;54d3   ; guarda la ficha del jugador 1 (IY, 0x80 bytes)
L_54D6:
	ld a,(0e380h)		;54d6   ; le quedan al 2?
	or a			;54d9
	jp nz,L_544F		;54da   ; si: p00:544F
	ld a,(0e229h)		;54dd   ; se sigue?
	and a			;54e0
	jp nz,L_545C		;54e1   ; si: el estado 4
L_54E4:
	ld hl,0e202h		;54e4   ; se acabo: el bit 6 de 0xE202 a 0
	ld a,(hl)			;54e7
	and 0bfh		;54e8
	ld (hl),a			;54ea
	jp L_531A		;54eb   ; y al estado 0
L_54EE:
	ld hl,(0e22eh)		;54ee   ; la ficha del que juega
	push hl			;54f1
	pop iy		;54f2
	ld (iy+020h),000h		;54f4   ; IY+20 = 0
	ld a,(0e229h)		;54f8   ; se sigue?
	and a			;54fb
	jr z,L_5508		;54fc   ; no: p00:5508
	call L_553D		;54fe   ; p00:553D
	ld (iy+000h),003h		;5501   ; 3 vidas
	jp L_545C		;5505
L_5508:
	bit 7,l		;5508   ; si es la del 1...
	call z,L_549E		;550a   ; ...cambia las fichas
	ld a,001h		;550d   ; un jugador
	ld (0e227h),a		;550f   ; guarda cuantos jugadores (o el modo de dos)
	jp L_545C		;5512
L_5515:
	call L_58E9		;5515   ; p00:58E9: listo?
	ret p			;5518   ; aun no
	ld hl,001e0h		;5519   ; 480 cuadros de cuenta (0xE649)
	ld (0e649h),hl		;551c
	ld a,032h		;551f   ; el sonido 0x32
	call pide_sonido		;5521   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_5553		;5524   ; el marcador
	ld de,0b686h		;5527   ; la lista de p03:B686 (SEGUIR)
	call lista_a_vram		;552a   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	call L_581E		;552d   ; p00:581E
	call L_5A7E		;5530   ; p00:5A7E
	call L_5A12		;5533   ; p00:5A12
	xor a			;5536   ; 0xE229 = 0
	ld (0e229h),a		;5537
	jp L_5338		;553a
L_553D:
	ld hl,0e27ah		;553d   ; 0xE27A...
	ld a,(0e22ch)		;5540   ; ...o 0xE275 si 0xE22C
	or a			;5543
	jr z,L_5548		;5544
	ld l,075h		;5546
L_5548:
	xor a			;5548   ; 5 bytes a cero
	ld (hl),a			;5549
	inc l			;554a
	ld (hl),a			;554b
	inc l			;554c
	ld (hl),a			;554d
	inc l			;554e
	ld (hl),a			;554f
	inc l			;5550
	ld (hl),a			;5551
	ret			;5552
L_5553:
	call banco_11_en_a000		;5553   ; con el 11: p11:B957 y p11:B911
	call 0b957h		;5556
	call 0b911h		;5559
	jp bancos_2_3		;555c   ; de vuelta el 2 y el 3
L_555F:
	djnz L_5575		;555f
	call bancos_10_15		;5561   ; con el 10 y el 15: p10:8BEB y p10:87E9
	call 08bebh		;5564
	call 087e9h		;5567
	call bancos_1_2_3		;556a   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0e217h)		;556d   ; 0xE217 sigue?
	and a			;5570
	ret nz			;5571   ; si, fuera
	jp L_533B		;5572
L_5575:
	djnz L_558E		;5575
	xor a			;5577   ; 0xE21A = 0
	ld (0e21ah),a		;5578
	call 08703h		;557b   ; p02:8703: empieza la fase
L_557E:
	xor a			;557e   ; 0xE630, 0xE215, 0xE342 y 0xE3C2 a 0
	ld (0e630h),a		;557f
	ld (0e215h),a		;5582
	ld (0e342h),a		;5585
	ld (0e3c2h),a		;5588
	jp L_545C		;558b   ; el estado 4
L_558E:
	call borra_nombres		;558e   ; borra la pantalla
	call bancos_14_15		;5591   ; con el 14-15 en 0x8000-0xA000
	ld a,(0e301h)		;5594   ; la fase
	cp 004h		;5597   ; de la 4 en adelante...
	ld de,09ddfh		;5599   ; ...los sprites de p14:9DDF
	jr nc,L_55A1		;559c
	ld de,096bfh		;559e   ; si no, p14:96BF
L_55A1:
	push de			;55a1
	ld hl,01800h		;55a2   ; a 0x1800
	ld bc,00040h		;55a5   ; 64 bytes
	push bc			;55a8
	call copia_a_vram		;55a9   ; copia
	pop bc			;55ac
	pop de			;55ad
	ld hl,01840h		;55ae   ; y otra vez a 0x1840
	call copia_a_vram		;55b1   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	call bancos_1_2_3		;55b4   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	call L_5553		;55b7   ; el marcador
	call bancos_10_15		;55ba   ; con el 10 y el 15: p10:8B7B
	call 08b7bh		;55bd
	call bancos_1_2_3		;55c0   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,001h		;55c3   ; 0xE217 = 1
	ld (0e217h),a		;55c5
	xor a			;55c8
	jp L_5338		;55c9
L_55CC:
	call L_5F69		;55cc   ; p00:5F69
	ld a,(0e218h)		;55cf   ; lo recien pulsado
	rra			;55d2   ; el bit 0 (la pausa)...
	jp c,L_5641		;55d3   ; ...p00:5641
	ld a,(0e630h)		;55d6   ; 0xE630 distinto de 0: fuera
	or a			;55d9
	ret nz			;55da
	call L_55F9		;55db   ; la tecla de seguir?
	ret c			;55de   ; pulsada: fuera
	ld a,(0e227h)		;55df   ; con uno o dos jugadores...
	cp 002h		;55e2
	ret nc			;55e4   ; ...si no, fuera
	ld a,00bh		;55e5   ; el estado 11
	jp L_5320		;55e7
L_55EA:
	call L_55F9		;55ea   ; la tecla de seguir?
	ret c			;55ed   ; pulsada: fuera
	ld a,001h		;55ee   ; 0xE229 = 1: se sigue
	ld (0e229h),a		;55f0
	ld de,0b693h		;55f3   ; y borra la lista de p03:B693
	jp borra_lista		;55f6   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
L_55F9:
	ld a,007h		;55f9   ; la fila 7 del teclado
	call 00141h		;55fb   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rra			;55fe   ; el bit 1...
	rra			;55ff   ; ...al acarreo
	ret			;5600
L_5601:
	djnz L_5618		;5601
	call banco_12_en_a000		;5603   ; con el 12: p12:B877
	call 0b877h		;5606
	call bancos_2_3		;5609   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
	ld a,(0e230h)		;560c   ; 0xE230 = 0?
	or a			;560f
	ret z			;5610   ; si, fuera
	call borra_nombres		;5611   ; borra la pantalla
	xor a			;5614   ; al paso siguiente con cuenta 0
	jp L_5338		;5615
L_5618:
	djnz L_5657		;5618
	ld hl,0e204h		;561a   ; la cuenta atras
	dec (hl)			;561d
	ret nz			;561e   ; no ha llegado: fuera
	call L_564B		;561f   ; p00:564B: prepara la fase
	ld a,(0e6a5h)		;5622   ; 0xE6A5 distinto de 0?
	or a			;5625
	jr z,L_563B		;5626   ; no: p00:563B
	ld a,002h		;5628   ; dos jugadores
	ld (0e227h),a		;562a   ; guarda cuantos jugadores (o el modo de dos)
	call L_53CB		;562d   ; las vidas
	call L_5A12		;5630
	call L_5D18		;5633
	call 087a4h		;5636   ; p02:87A4
	jr L_5641		;5639
L_563B:
	call L_5A12		;563b
	call L_5D18		;563e
L_5641:
	ld a,0f2h		;5641   ; el sonido 0xF2
	call pide_sonido		;5643   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld a,005h		;5646   ; el estado 5
	jp L_5320		;5648
L_564B:
	call borra_nombres		;564b   ; borra la pantalla
	call L_5553		;564e   ; el marcador
	call L_53F0		;5651   ; los caracteres comunes
	jp L_436B		;5654   ; y los graficos de la fase (p00:436B)
L_5657:
	call borra_nombres		;5657   ; borra la pantalla
	call banco_11_en_a000		;565a   ; con el 11: p11:B8D7 y p11:B8FA
	call 0b8d7h		;565d
	call 0b8fah		;5660
	call bancos_1_2_3		;5663   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	xor a			;5666   ; 0xE230 y 0xE6A4 a 0
	ld (0e230h),a		;5667
	ld (0e6a4h),a		;566a
	jp L_533B		;566d
L_5670:
	djnz L_5681		;5670
L_5672:
	ld hl,(0e698h)		;5672   ; la cuenta de 0xE698...
	dec hl			;5675   ; - 1
	ld (0e698h),hl		;5676
	ld a,h			;5679
	or l			;567a
	ret nz			;567b   ; no ha llegado: fuera
	call L_564B		;567c   ; prepara la fase
	jr L_563B		;567f
L_5681:
	djnz L_569A		;5681
	call bancos_10_15		;5683   ; con el 10 y el 15: el texto (p10:9497)
	call 09497h		;5686
	call bancos_1_2_3		;5689   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0ee21h)		;568c   ; 0xEE21: el texto acabado?
	or a			;568f
	ret z			;5690   ; no, fuera
	ld de,0b6c0h		;5691   ; la lista de p03:B6C0
	call lista_a_vram		;5694   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
L_5697:
	jp L_533B		;5697
L_569A:
	djnz L_56A7		;569a
	ld a,(0e30eh)		;569c   ; 0xE30E bit 4...
	bit 4,a		;569f
	ret z			;56a1   ; ...sin el, fuera
	call 07b97h		;56a2   ; p01:7B97
	jr L_5697		;56a5
L_56A7:
	djnz L_56C0		;56a7
	call bancos_10_15		;56a9   ; el texto
	call 09497h		;56ac
	call bancos_1_2_3		;56af   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0ee21h)		;56b2   ; acabado?
	or a			;56b5
	ret z			;56b6
	ld hl,00384h		;56b7   ; 900 cuadros de cuenta
	ld (0e698h),hl		;56ba
	jp L_5336		;56bd
L_56C0:
	djnz L_56C4		;56c0
	jr L_5672		;56c2
L_56C4:
	ld a,022h		;56c4   ; el sonido 0x22
	call pide_sonido		;56c6   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	xor a			;56c9   ; 0xE6D0 = 0
	ld (0e6d0h),a		;56ca
	ld a,(0e6d1h)		;56cd   ; 0xE6D1 = 1?
	dec a			;56d0
	jr z,L_56DF		;56d1   ; si: p00:56DF
	call 07b06h		;56d3   ; p01:7B06
	ld hl,00384h		;56d6   ; 900 cuadros
	ld (0e698h),hl		;56d9
	jp L_533B		;56dc
L_56DF:
	ld a,002h		;56df   ; el paso 2
	ld (0e201h),a		;56e1
	jp 07b73h		;56e4   ; y p01:7B73
L_56E7:
	djnz L_571D		;56e7
	ld hl,0e204h		;56e9   ; la cuenta atras
	dec (hl)			;56ec
	ret nz			;56ed   ; no ha llegado: fuera
	call banco_11_en_a000		;56ee   ; con el 11: p11:B9E1
	call 0b9e1h		;56f1
	call banco_15_en_a000		;56f4   ; con el 15: las rachas de p15:A912
	ld hl,02190h		;56f7   ; a 0x2190
	ld de,0a912h		;56fa
	call rachas_3		;56fd   ; en los tres tercios
	ld hl,00008h		;5700   ; 0xF0 desde 0x0008...
	ld a,0f0h		;5703
	ld bc,007f8h		;5705   ; ...0x7F8 bytes
	call L_4CD4		;5708   ; en los tres tercios
	call bancos_1_2_3		;570b   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld de,0b6adh		;570e   ; la lista de p03:B6AD
	call lista_a_vram		;5711   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld a,001h		;5714   ; calla
	call pide_sonido		;5716   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	xor a			;5719
	jp L_5338		;571a
L_571D:
	djnz L_5755		;571d
	call L_57CC		;571f   ; la fila 5, bit 6?
	jr z,L_5730		;5722   ; pulsada: p00:5730
	call L_57D4		;5724   ; la fila 4, bit 3?
	jr z,L_5740		;5727   ; pulsada: p00:5740
	ld hl,0e204h		;5729   ; la cuenta atras
	dec (hl)			;572c
	ret nz			;572d   ; no ha llegado
	jr L_5740		;572e
L_5730:
	ld de,0b6adh		;5730   ; borra la lista de p03:B6AD
	call borra_lista		;5733   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
	ld de,0b6dch		;5736   ; y pinta la de p03:B6DC
	call lista_a_vram		;5739   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	xor a			;573c   ; al paso siguiente
	jp L_5338		;573d
L_5740:
	ld de,0b6adh		;5740   ; borra la de p03:B6AD
	call borra_lista		;5743   ; borra_lista: borra lo que pintaria la lista de DE (C = 0)
	ld de,0b6d1h		;5746   ; y pinta la de p03:B6D1
	call lista_a_vram		;5749   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	xor a			;574c   ; cuenta 0
	ld (0e204h),a		;574d
	ld a,004h		;5750   ; el paso 4
	jp L_5392		;5752
L_5755:
	djnz L_5793		;5755
	ld hl,0e204h		;5757   ; la cuenta atras
	dec (hl)			;575a
	ret nz			;575b   ; no ha llegado
	call borra_nombres		;575c   ; borra la pantalla
	ld a,001h		;575f   ; la fase 1
	ld (0e21bh),a		;5761   ; guarda la fase en curso
	call 08703h		;5764   ; empieza la fase
	call L_576D		;5767   ; p00:576D: borra parte de las fichas de los jugadores
	jp L_557E		;576a
L_576D:
	ld iy,0e300h		;576d   ; el 1
	call L_577E		;5771
	ld a,(0e227h)		;5774   ; con dos jugadores...
	cp 002h		;5777
	ret nz			;5779
	ld iy,0e380h		;577a   ; ...el 2
L_577E:
	xor a			;577e   ; IY+0A = 0
	ld (iy+00ah),a		;577f
	push iy		;5782   ; HL = IY + 0x60
	pop hl			;5784
	ld bc,00060h		;5785
	add hl,bc			;5788
	ld d,h			;5789   ; y 7 bytes mas
	ld e,l			;578a
	inc de			;578b
	ld bc,00007h		;578c
	ld (hl),a			;578f   ; a cero
	ldir		;5790
	ret			;5792
L_5793:
	djnz L_57B8		;5793
	ld hl,0e204h		;5795   ; la cuenta atras
	dec (hl)			;5798
	ret nz			;5799   ; no ha llegado
	call borra_nombres		;579a   ; borra la pantalla
	xor a			;579d   ; sin vidas el 1
	ld (0e300h),a		;579e   ; guarda la ficha del jugador 1 (IY, 0x80 bytes)
	ld a,(0e227h)		;57a1   ; con dos jugadores...
	cp 002h		;57a4
	jr nc,L_57B1		;57a6
	ld a,(0e380h)		;57a8   ; ...le quedan al 2?
	or a			;57ab   ; si: p00:544F
	jp nz,L_544F		;57ac
	jr L_57B5		;57af
L_57B1:
	xor a			;57b1
	ld (0e380h),a		;57b2   ; sin vidas el 2
L_57B5:
	jp L_54E4		;57b5   ; se acabo
L_57B8:
	call bancos_10_15		;57b8   ; con el 10 y el 15: p10:8F7F y p10:87E9
	call 08f7fh		;57bb
	call 087e9h		;57be
	call bancos_1_2_3		;57c1   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
	ld a,(0e226h)		;57c4   ; 0xE226 distinto de 0?
	or a			;57c7
	ret nz			;57c8   ; si, fuera
	jp L_5336		;57c9
L_57CC:
	ld a,005h		;57cc   ; la fila 5 del teclado
	call 00141h		;57ce   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 6,a		;57d1   ; el bit 6
	ret			;57d3
L_57D4:
	ld a,004h		;57d4   ; la fila 4
	call 00141h		;57d6   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 3,a		;57d9   ; el bit 3
	ret			;57db
L_57DC:
	call L_51FF		;57dc   ; los mandos de los estados 0-2: el puerto 1
	ld hl,0e211h		;57df   ; en 0xE211 con lo recien pulsado
	call L_51B8		;57e2
	or a			;57e5   ; nada pulsado?
	ret z			;57e6   ; fuera
	ld hl,0e204h		;57e7   ; la cuenta a 0
	ld (hl),000h		;57ea
	ld hl,0e200h		;57ec   ; el estado
	ld de,0e227h		;57ef   ; apunta a cuantos jugadores (o el modo de dos)
	ld b,(hl)			;57f2
	djnz L_5808		;57f3   ; estado 1?
	and 030h		;57f5   ; los botones (bits 4-5)?
	jr z,L_5815		;57f7
	ld a,040h		;57f9   ; 0xE202 = 0x40: la pausa permitida
	ld (0e202h),a		;57fb
	ld (hl),003h		;57fe   ; el estado 3
	inc hl			;5800
	ld c,000h		;5801   ; C = 0
	ld (hl),c			;5803   ; 0xE206 = 0
	dec c			;5804   ; C = 0xFF
	jp 090c4h		;5805   ; p02:90C4
L_5808:
	ld (hl),001h		;5808   ; el estado 1
	inc hl			;580a
	xor a			;580b   ; paso 0
	ld (hl),a			;580c
	ld (0e217h),a		;580d   ; 0xE217 = 0
	ld a,001h		;5810   ; calla
	jp pide_sonido		;5812   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_5815:
	ld a,(de)			;5815   ; el modo (0xE227) + 1...
	inc a			;5816
	cp 003h		;5817   ; ...de 0 a 2
	jr c,L_581C		;5819
	xor a			;581b
L_581C:
	ld (de),a			;581c
	ret			;581d
L_581E:
	ld a,(0e22ch)		;581e   ; 0xE22C: el marcador de quien juega
	or a			;5821
	ld de,0b670h		;5822   ; la lista de p03:B670
	jr z,L_582A		;5825
	ld de,0b67bh		;5827   ; o la de p03:B67B
L_582A:
	jp lista_a_vram		;582a   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
L_582D:
	ld hl,0e280h		;582d   ; borra 0xE280-0xF03F
	ld bc,00dbfh		;5830
	jr L_583B		;5833
L_5835:
	ld hl,0e275h		;5835   ; borra 0xE275-0xF03F
	ld bc,00dcah		;5838
L_583B:
	ld e,l			;583b
	ld d,h			;583c
	inc de			;583d
	ld (hl),000h		;583e   ; a cero
	ldir		;5840
	xor a			;5842
	ld (0e21ah),a		;5843   ; 0xE21A, 0xE21C y 0xE215 a 0
	ld (0e21ch),a		;5846
	ld (0e215h),a		;5849
	ld hl,058beh		;584c   ; el principio de la ficha del jugador 1 (p00:58BE)
	ld de,0e300h		;584f   ; apunta a la ficha del jugador 1 (IY, 0x80 bytes)
	ld bc,00007h		;5852   ; 7 bytes
	ldir		;5855
	ld a,e			;5857   ; 4 mas adelante
	add a,004h		;5858
	ld e,a			;585a
	ld a,(0e23ah)		;585b   ; 0xE23A: la cuenta de cuadros (un azar)
	ld b,a			;585e
	and 001h		;585f   ; el bit 0...
	ld (de),a			;5861   ; ...a IY+0B
	ld a,b			;5862
	rra			;5863   ; los bits 1-2...
	and 003h		;5864
	inc e			;5866
	ld (de),a			;5867   ; ...a IY+0C
	ld a,b			;5868
	rlca			;5869   ; los bits 6-7...
	and 003h		;586a
	inc e			;586c
	ld (de),a			;586d   ; ...a IY+0D
	ld a,043h		;586e   ; 0x43 mas adelante: IY+51
	add a,e			;5870
	ld e,a			;5871
	ld a,b			;5872   ; los bits 0-1 del azar
	and 003h		;5873
	ld b,a			;5875
	add a,a			;5876   ; x 9
	add a,a			;5877
	add a,a			;5878
	add a,b			;5879
	ld hl,058c5h		;587a   ; una de las 4 fichas de p00:58C5
	call hl_mas_a		;587d   ; hl_mas_a: HL = HL + A
	ld bc,00009h		;5880   ; 9 bytes
	ldir		;5883
	ld a,005h		;5885   ; y un 5
	ld (de),a			;5887
	ld a,(0f0f5h)		;5888   ; Nemesis 2 en el vecino (0xF0F5 bit 0)?
	rra			;588b
	call nc,L_58AE		;588c   ; no: p00:58AE
	call L_58A2		;588f   ; copia la ficha al jugador 2
	ld a,(0e227h)		;5892   ; un jugador?
	or a			;5895
	jr nz,L_589C		;5896   ; si no, se queda
	xor a			;5898   ; con uno, el 2 sin vidas
	ld (0e380h),a		;5899   ; guarda la ficha del jugador 2 (IY, 0x80 bytes)
L_589C:
	ld a,001h		;589c   ; 0xE3A1 = 1
	ld (0e3a1h),a		;589e
	ret			;58a1
L_58A2:
	ld hl,0e300h		;58a2   ; la ficha del 1...
	ld de,0e380h		;58a5   ; ...a la del 2
	ld bc,00080h		;58a8   ; 0x80 bytes
	ldir		;58ab
	ret			;58ad
L_58AE:
	ld hl,0e350h		;58ae   ; sin Nemesis 2: en 0xE350...
	ld b,009h		;58b1   ; ...9 bytes
L_58B3:
	ld a,(hl)			;58b3   ; un 1?
	dec a			;58b4
	jr z,L_58BB		;58b5   ; si: lo quita
	inc hl			;58b7   ; el siguiente
	djnz L_58B3		;58b8
	ret			;58ba
L_58BB:
	ld (hl),000h		;58bb   ; a 0
	ret			;58bd

; ----------------------------------------------------------------------
; DATOS estado_inicial: 7 bytes que p00:584C copia a 0xE300 (ldir); lo leen
;   p00:5855 (7 bytes)
;   0x58be..0x58c5  (7 bytes)
DATA_estado_inicial:
	defb 003h,001h,020h,000h,000h,000h,010h	; 58be

; ----------------------------------------------------------------------
; DATOS fichas_58C5: 4 fichas de 9 bytes que p00:587A elige con (B & 3) x 9 y
;   copia (ldir); lo leen p00:5883 (36 bytes)
;   0x58c5..0x58e9  (36 bytes)
DATA_fichas_58C5:
	defb 001h,000h,002h,000h,004h,000h,003h,000h,000h	; 58c5  .........
	defb 002h,000h,000h,000h,004h,003h,000h,000h,001h	; 58ce  .........
	defb 000h,000h,000h,002h,004h,001h,000h,000h,003h	; 58d7  .........
	defb 000h,002h,000h,001h,004h,000h,000h,003h,000h	; 58e0  .........

; ======================================================================
; CODIGO 0x58e9..0x5b53  (618 bytes)
; ======================================================================


L_58E9:
	ld hl,0e204h		;58e9   ; la cuenta de 0xE204 - 1
	dec (hl)			;58ec
	ret m			;58ed   ; negativa: fuera (S = 1)
	ld a,(hl)			;58ee   ; la cuenta...
	ld h,038h		;58ef   ; la VRAM 0x38xx
	xor 01fh		;58f1   ; 31 - cuenta: la columna
	ld l,a			;58f3
	ld b,015h		;58f4   ; 21 filas
	ld a,(0e200h)		;58f6   ; en el estado 2...
	cp 002h		;58f9
	jr nz,L_58FF		;58fb
	ld b,018h		;58fd   ; ...24
L_58FF:
	xor a			;58ff   ; un 0
	ld de,00020h		;5900   ; 32 por fila
L_5903:
	call 0004dh		;5903   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	add hl,de			;5906   ; la fila de abajo
	djnz L_5903		;5907   ; toda la columna
L_5909:
	ld hl,03b00h		;5909   ; los dos juegos de atributos de sprite: 0x3B00...
	call L_5912		;590c   ; ...y 0x3B80
	ld hl,03b80h		;590f
L_5912:
	ld a,0d0h		;5912   ; 0xD0: el primer sprite acaba la lista
	call 0004dh		;5914   ; BIOS WRTVRM - Writes data in VRAM | WRTVRM
	xor a			;5917
	ret			;5918
L_5919:
	ld a,(0e202h)		;5919   ; 0xE202 bit 6 (la partida)?
	add a,a			;591c
	ret p			;591d   ; no: fuera
	ld a,(iy+010h)		;591e   ; el jugador que da los puntos (IY+10)
	push iy		;5921
	ld iy,0e300h		;5923   ; el 1...
	xor (iy+021h)		;5927   ; ...si no es el, el 2
	jr z,L_5930		;592a
	ld iy,0e380h		;592c   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
L_5930:
	call L_593B		;5930   ; suma DE a sus puntos
	pop iy		;5933
	ret			;5935
L_5936:
	ld a,(0e202h)		;5936   ; 0xE202 bit 6?
	add a,a			;5939
	ret p			;593a   ; no: fuera
L_593B:
	bit 0,(iy+021h)		;593b   ; los puntos del jugador 1 (0xE27B)...
	ld hl,0e27bh		;593f
	jr z,L_5946		;5942
	ld l,076h		;5944   ; ...o del 2 (0xE276)
L_5946:
	ld a,(hl)			;5946   ; + E
	add a,e			;5947
	daa			;5948   ; en BCD
	ld (hl),a			;5949
	inc l			;594a
	ld a,(hl)			;594b   ; + D
	adc a,d			;594c
	daa			;594d   ; en BCD
	ld (hl),a			;594e
	inc hl			;594f
	ld a,(hl)			;5950   ; + el acarreo
	adc a,000h		;5951
	daa			;5953   ; en BCD
	ld (hl),a			;5954
	inc hl			;5955
	ld a,(hl)			;5956   ; + el acarreo
	adc a,000h		;5957
	daa			;5959   ; en BCD
	ld (hl),a			;595a
	jr nc,L_5970		;595b   ; sin pasarse: p00:5970
	ld a,099h		;595d   ; se pasa: todo a 99
	ld (hl),a			;595f
	dec l			;5960
	ld (hl),a			;5961
	dec l			;5962
	ld (hl),a			;5963
	dec l			;5964
	ld (hl),a			;5965
	ld hl,09999h		;5966   ; y el record tambien
	ld (0e271h),hl		;5969
	ld (0e273h),hl		;596c
	ret			;596f
L_5970:
	ex de,hl			;5970   ; DE = los puntos
	push iy		;5971
	pop hl			;5973
	ld a,008h		;5974   ; IY + 8: los puntos de la vida siguiente
	add a,l			;5976
	ld l,a			;5977
	ld a,(de)			;5978   ; alto
	cp (hl)			;5979   ; no llega: p00:599C
	jr c,L_599C		;597a
	dec e			;597c
	dec l			;597d
	ld a,(de)			;597e   ; medio
	cp (hl)			;597f
	jr c,L_599C		;5980
	dec e			;5982
	dec l			;5983
	ld a,(de)			;5984   ; bajo
	cp (hl)			;5985
	jr c,L_599C		;5986
	ld a,(hl)			;5988   ; llega: la siguiente vida...
	add a,010h		;5989   ; ...10.000 mas (BCD)
	daa			;598b
	ld (hl),a			;598c
	inc l			;598d
	ld a,(hl)			;598e
	adc a,000h		;598f
	daa			;5991
	ld (hl),a			;5992
	inc l			;5993
	ld a,(hl)			;5994
	adc a,000h		;5995
	daa			;5997
	ld (hl),a			;5998
	call L_59C1		;5999   ; p00:59C1: una vida mas
L_599C:
	bit 0,(iy+021h)		;599c   ; el record contra los puntos del 1...
	ld hl,0e27eh		;59a0
	jr z,L_59A8		;59a3
	ld hl,0e279h		;59a5   ; ...o del 2
L_59A8:
	ld b,004h		;59a8   ; 4 bytes
	ld de,0e274h		;59aa   ; el record (0xE274)
	ld c,l			;59ad
L_59AE:
	ld a,(de)			;59ae   ; record - puntos
	sub (hl)			;59af
	jr c,L_59B8		;59b0   ; menos: es record nuevo
	ret nz			;59b2   ; mas: fuera
	dec l			;59b3   ; igual: el byte siguiente
	dec e			;59b4
	djnz L_59AE		;59b5
	ret			;59b7
L_59B8:
	ld l,c			;59b8   ; el record = los puntos
	ld bc,00004h		;59b9
	ld e,074h		;59bc
	lddr		;59be
	ret			;59c0
L_59C1:
	ld a,(iy+000h)		;59c1   ; IY+00 (las vidas, BCD) + 1
	add a,001h		;59c4
	daa			;59c6   ; en BCD
	ret c			;59c7   ; 99: no se pasa
	ld (iy+000h),a		;59c8   ; se guarda
	ld a,012h		;59cb   ; el sonido 0x12: vida extra
	call pide_sonido		;59cd   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_59D0:
	push iy		;59d0   ; las vidas a la VRAM: DE = IY
	pop de			;59d2
	bit 0,(iy+021h)		;59d3   ; el 1 en 0x3AC2...
	ld hl,03ac2h		;59d7
	jr z,L_59DE		;59da
	ld l,0d2h		;59dc   ; ...el 2 en 0x3AD2
L_59DE:
	ld a,(de)			;59de   ; las vidas
	ld b,001h		;59df   ; una cifra
	and 0f0h		;59e1   ; mas de 9?
	jr nz,L_5A63		;59e3   ; entonces las dos
	call puerto_vdp		;59e5   ; el puerto del VDP
	exx			;59e8
	ld a,c			;59e9
	exx			;59ea
	ld c,a			;59eb
	xor a			;59ec   ; un hueco
	out (c),a		;59ed
	inc hl			;59ef   ; y la cifra de abajo
	jp L_5A74		;59f0
L_59F3:
	push iy		;59f3   ; DE = IY + 0x1B
	pop de			;59f5
	ld a,01bh		;59f6
	add a,e			;59f8
	ld e,a			;59f9
	bit 0,(iy+021h)		;59fa
	ld hl,03ac6h		;59fe   ; en 0x3AC6...
	jr z,L_5A05		;5a01
	ld l,0d6h		;5a03   ; ...o 0x3AD6
L_5A05:
	ld b,001h		;5a05   ; dos cifras
	jr L_5A63		;5a07
L_5A09:
	call L_5A19		;5a09   ; los dos jugadores
	ld iy,0e380h		;5a0c   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	jr L_5A1D		;5a10
L_5A12:
	ld a,(0e227h)		;5a12   ; con dos jugadores...
	cp 002h		;5a15
	jr z,L_5A09		;5a17   ; ...los dos
L_5A19:
	ld iy,0e300h		;5a19   ; el 1
L_5A1D:
	bit 0,(iy+021h)		;5a1d   ; su rotulo: el de p03:B62B...
	ld de,0b62bh		;5a21
	jr z,L_5A29		;5a24
	ld de,0b63ch		;5a26   ; ...o p03:B63C
L_5A29:
	call lista_a_vram		;5a29   ; a la VRAM
	call L_5A48		;5a2c   ; los puntos
	call L_59D0		;5a2f   ; las vidas
	jr L_59F3		;5a32   ; y IY+1B
L_5A34:
	call L_5A44		;5a34
	ld iy,0e380h		;5a37   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	jr L_5A48		;5a3b
L_5A3D:
	ld a,(0e227h)		;5a3d   ; con dos jugadores, los dos
	cp 002h		;5a40
	jr z,L_5A34		;5a42
L_5A44:
	ld iy,0e300h		;5a44   ; el 1
L_5A48:
	bit 0,(iy+021h)		;5a48   ; los puntos del 1 en 0x3AE5...
	ld hl,03ae5h		;5a4c
	ld de,0e27eh		;5a4f
	jr z,L_5A58		;5a52
	ld l,0f5h		;5a54   ; ...o los del 2 en 0x3AF5
	ld e,079h		;5a56
L_5A58:
	ld b,005h		;5a58   ; 10 cifras... 5 bytes BCD
	call puerto_vdp		;5a5a   ; el puerto del VDP
	exx			;5a5d
	ld a,c			;5a5e
	exx			;5a5f
	ld c,a			;5a60
	jr L_5A74		;5a61   ; sin la cifra alta del primero
L_5A63:
	call puerto_vdp		;5a63   ; el puerto del VDP en C
	exx			;5a66
	ld a,c			;5a67
	exx			;5a68
	ld c,a			;5a69
L_5A6A:
	ld a,(de)			;5a6a   ; la cifra alta...
	rra			;5a6b
	rra			;5a6c
	rra			;5a6d
	rra			;5a6e
	and 00fh		;5a6f   ; ...4 bits
	inc a			;5a71   ; + 1: el caracter de la cifra
	out (c),a		;5a72   ; al VDP
L_5A74:
	ld a,(de)			;5a74   ; la cifra baja
	and 00fh		;5a75
	inc a			;5a77   ; + 1
	out (c),a		;5a78   ; al VDP
	dec de			;5a7a   ; el byte anterior
	djnz L_5A6A		;5a7b   ; B bytes
	ret			;5a7d
L_5A7E:
	ld de,0b6a2h		;5a7e   ; el rotulo del record (p03:B6A2)
	call lista_a_vram		;5a81   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld de,0e274h		;5a84   ; el record
	ld hl,03a2bh		;5a87   ; en 0x3A2B
	ld b,005h		;5a8a   ; 5 bytes
	jp L_5A63		;5a8c
L_5A8F:
	ld c,(hl)			;5a8f   ; cambia B bytes de HL y DE
	ld a,(de)			;5a90
	ld (hl),a			;5a91
	ld a,c			;5a92
	ld (de),a			;5a93
	inc hl			;5a94
	inc de			;5a95
	djnz L_5A8F		;5a96
	ret			;5a98
hl_a_nombre:		; convierte las coordenadas de HL en una direccion de la tabla de nombres
	ld a,l			;5a99   ; la columna: x / 8
	rra			;5a9a
	rra			;5a9b
	rra			;5a9c
	or a			;5a9d   ; + la fila...
	rr h		;5a9e
	rra			;5aa0
	rr h		;5aa1
	rra			;5aa3
	rr h		;5aa4
	ld l,h			;5aa6   ; ...x 32
	and 007h		;5aa7
	add a,0cah		;5aa9   ; + 0xCA00: en el mapa de la RAM
	ld h,a			;5aab
	ret			;5aac
L_5AAD:
	ld a,040h		;5aad   ; + 0x40
	add a,l			;5aaf
	ld l,a			;5ab0
	jr nc,L_5AB4		;5ab1
	inc h			;5ab3
L_5AB4:
	ld a,080h		;5ab4   ; + 0x80
	add a,e			;5ab6
	ld e,a			;5ab7
	jr nc,L_5ABB		;5ab8
	inc d			;5aba
L_5ABB:
	ex de,hl			;5abb   ; las coordenadas...
	ld a,l			;5abc
	rr h		;5abd
	rra			;5abf
	rr d		;5ac0
	rr e		;5ac2
	rr e		;5ac4
	rr e		;5ac6
	rr e		;5ac8
	rra			;5aca
	rr e		;5acb
	rra			;5acd
	ld l,a			;5ace
	ld a,e			;5acf
	and 00fh		;5ad0
	ld h,a			;5ad2
	ld de,0c7f0h		;5ad3   ; + 0xC7F0
	add hl,de			;5ad6
	ret			;5ad7
byte_de_tabla:		; A = el byte HL + A
	add a,l			;5ad8   ; L + A
	ld l,a			;5ad9
	jr nc,L_5ADD		;5ada
	inc h			;5adc   ; con acarreo, H + 1
L_5ADD:
	ld a,(hl)			;5add   ; el byte
	ret			;5ade
menos_de:		; DE = -DE
	ld a,e			;5adf   ; E al reves
	cpl			;5ae0
	ld e,a			;5ae1
	ld a,d			;5ae2   ; D al reves
	cpl			;5ae3
	ld d,a			;5ae4
	inc de			;5ae5   ; + 1: -DE
	ret			;5ae6
menos_hl:		; HL = -HL
	ld a,l			;5ae7   ; L al reves
	cpl			;5ae8
	ld l,a			;5ae9
	ld a,h			;5aea   ; H al reves
	cpl			;5aeb
	ld h,a			;5aec
	inc hl			;5aed   ; + 1: -HL
	ret			;5aee
L_5AEF:
	xor a			;5aef   ; empieza la partida: 0xE215, 0xE630 y 0xE22C a 0
	ld (0e215h),a		;5af0
	ld (0e630h),a		;5af3
	ld (0e22ch),a		;5af6
	ld h,a			;5af9
	ld l,a			;5afa
	ld (0e22eh),hl		;5afb   ; la ficha del que juega a 0
	ld hl,0e400h		;5afe   ; 0xE400-0xEFFF a cero
	ld de,0e401h		;5b01
	ld bc,00bffh		;5b04
	ld (hl),a			;5b07
	ldir		;5b08
	call borra_atributos		;5b0a   ; los sprites fuera
	call L_5F57		;5b0d   ; p00:5F57
	call 0886ah		;5b10   ; p02:886A y p02:885B: la fase
	call 0885bh		;5b13
	ld a,(0e202h)		;5b16   ; 0xE202 bit 6?
	bit 6,a		;5b19
	jr nz,L_5B21		;5b1b
	xor a			;5b1d   ; no: 0xE64F = 0
	ld (0e64fh),a		;5b1e
L_5B21:
	call L_436B		;5b21   ; los graficos de la fase
	call 087a4h		;5b24   ; p02:87A4
	ld hl,0c700h		;5b27   ; borra 0xC700-0xCFFF
	ld de,0c701h		;5b2a
	ld bc,008ffh		;5b2d
	ldir		;5b30
	jp L_48A6		;5b32   ; y pinta la pantalla entera (p00:48A6)
L_5B35:
	ld a,(0e640h)		;5b35   ; el jefe...
	dec a			;5b38   ; - 1
	ret m			;5b39   ; sin jefe: fuera
	ld c,a			;5b3a   ; en C
	call bancos_7_8		;5b3b   ; con 7-8 y el 11
	call banco_11_en_a000		;5b3e   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call L_5B47		;5b41   ; p00:5B47
	jp bancos_1_2_3		;5b44   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)
L_5B47:
	ld a,(0ec80h)		;5b47   ; 0xEC80: el jefe en marcha?
	or a			;5b4a
	ret z			;5b4b   ; no: fuera
	ld a,c			;5b4c   ; el jefe
	call 0b6a8h		;5b4d   ; p11:B6A8
	call despacha		;5b50   ; por el jefe: su rutina del banco 11

; ----------------------------------------------------------------------
; DATOS tabla_5B53: 8 destinos del despachador p00:40CE (call en p00:5B50, el
;   indice en A): AA1D, A80A, AE25, AC34, B35E, B06F, 5B63, B4E9; lo leen
;   p00:5B50 (16 bytes)
;   0x5b53..0x5b63  (16 bytes)
DATA_tabla_5B53:
	defw 0aa1dh,0a80ah,0ae25h,0ac34h,0b35eh,0b06fh,05b63h,0b4e9h	; 5b53

; ======================================================================
; CODIGO 0x5b63..0x5bfe  (155 bytes)
; ======================================================================


L_5B63:
	ret			;5b63
L_5B64:
	ld a,(0e640h)		;5b64   ; el jefe
	and a			;5b67
	ret z			;5b68   ; ninguno: fuera
	cp 008h		;5b69   ; el 8: fuera
	ret z			;5b6b
	ld a,(0ec80h)		;5b6c   ; en marcha?
	and a			;5b6f
	ret z			;5b70   ; no: fuera
	ld hl,0ca00h		;5b71   ; borra el mapa de la RAM...
	ld de,0ca01h		;5b74
	ld bc,0151fh		;5b77   ; ...21 filas de 31
L_5B7A:
	push bc			;5b7a
	ld (hl),000h		;5b7b   ; a cero
	ld b,000h		;5b7d
	ldir		;5b7f   ; la fila
	ld a,021h		;5b81   ; la siguiente (33 mas)
	call hl_mas_a		;5b83   ; hl_mas_a: HL = HL + A
	ld a,021h		;5b86
	call de_mas_a		;5b88   ; de_mas_a: DE = DE + A
	pop bc			;5b8b
	djnz L_5B7A		;5b8c   ; las 21
	jp L_4B97		;5b8e   ; y las estrellas
fase7_copia:		; la fase 7: copia p00:5BA5 a 0xC000 y la ejecuta (trae graficos del otro cartucho)
	di			;5b91   ; sin interrupciones
	ld a,0c9h		;5b92   ; el gancho H.KEYI a `ret`: que no salte mientras cambia el slot
	ld (0fd9ah),a		;5b94
	ld hl,L_5BA5		;5b97   ; la rutina de p00:5BA5...
	ld de,0c000h		;5b9a   ; ...a 0xC000
	ld bc,00095h		;5b9d   ; 0x95 bytes
	ldir		;5ba0
	jp 0c000h		;5ba2   ; y se ejecuta alli
L_5BA5:
	call 0c010h		;5ba5   ; 0xC010: el otro cartucho y sus bancos 7-8-9
	call 0c03ch		;5ba8   ; 0xC03C: copia sus trozos a 0xC100
	call 0c024h		;5bab   ; 0xC024: de vuelta este cartucho
	ld a,0c3h		;5bae   ; el gancho H.KEYI otra vez a `jp`
	ld (0fd9ah),a		;5bb0
	ei			;5bb3   ; con interrupciones
	ret			;5bb4
L_5BB5:
	ld a,(0f0f4h)		;5bb5   ; el slot del vecino
	call 0c030h		;5bb8   ; 0xC030: en las paginas 1 y 2
L_5BBB:
	ld a,007h		;5bbb   ; los bancos 7-8-9 del cartucho que haya puesto
	ld (07000h),a		;5bbd   ; el mapper: pone en 0x6000 el banco de A
	inc a			;5bc0
	ld (09000h),a		;5bc1   ; el mapper: pone en 0x8000 el banco de A
	inc a			;5bc4
	ld (0b000h),a		;5bc5   ; el mapper: pone en 0xA000 el banco de A
	ret			;5bc8
L_5BC9:
	ld a,(0f0f6h)		;5bc9   ; el slot de este cartucho
	call 0c030h		;5bcc   ; 0xC030: en las paginas 1 y 2
	xor a			;5bcf   ; el banco 0 en 0x4000
	ld (05000h),a		;5bd0   ; el mapper: pone en 0x4000 el banco de A
	jr L_5BBB		;5bd3   ; y 7-8-9
L_5BD5:
	push af			;5bd5   ; ENASLT de A en la pagina 1 (0x4000)
	ld h,040h		;5bd6
	call 00024h		;5bd8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;5bdb
	ld h,080h		;5bdc   ; y en la 2 (0x8000)
	jp 00024h		;5bde   ; BIOS ENASLT - Switches to specified slot and page definitively
L_5BE1:
	ld de,0c100h		;5be1   ; a 0xC100...
	ld hl,0c059h		;5be4   ; ...los trozos de la tabla 0xC059 (p00:5BFE)
	ld b,014h		;5be7   ; 20
L_5BE9:
	push bc			;5be9
	push hl			;5bea
	ld c,(hl)			;5beb   ; cuantos
	ld b,000h		;5bec
	inc hl			;5bee
	ld a,(hl)			;5bef   ; el origen en el otro cartucho
	inc hl			;5bf0
	ld h,(hl)			;5bf1
	ld l,a			;5bf2
	ldir		;5bf3   ; copia
	pop hl			;5bf5
	ld bc,00003h		;5bf6   ; 3 bytes por ficha
	add hl,bc			;5bf9
	pop bc			;5bfa
	djnz L_5BE9		;5bfb   ; los 20
	ret			;5bfd

; ----------------------------------------------------------------------
; DATOS copia_del_vecino: 20 fichas [cuantos][origen lo hi] que la rutina
;   copiada a 0xC03C (p00:5BE1) lee en 0xC059: los trozos que la fase 7 copia
;   del cartucho de Nemesis 2 (bancos 7, 8 y 9 de ESE cartucho) a 0xC100,
;   1.137 bytes en total; lo leen p00:5BE4 (60 bytes)
;   0x5bfe..0x5c3a  (60 bytes)
DATA_copia_del_vecino:
	defb 028h,0a7h,069h	; 5bfe
	defb 0a7h,0b0h,06ah	; 5c01
	defb 020h,054h,071h	; 5c04
	defb 010h,057h,06bh	; 5c07
	defb 02eh,0cfh,069h	; 5c0a
	defb 05dh,0fdh,069h	; 5c0d
	defb 011h,05ah,06ah	; 5c10
	defb 02bh,06bh,06ah	; 5c13
	defb 028h,0c6h,07fh	; 5c16
	defb 092h,098h,080h	; 5c19
	defb 01eh,00eh,087h	; 5c1c
	defb 01eh,080h,087h	; 5c1f
	defb 012h,0d4h,081h	; 5c22
	defb 02ch,0eeh,07fh	; 5c25
	defb 04ah,01ah,080h	; 5c28
	defb 012h,064h,080h	; 5c2b
	defb 022h,076h,080h	; 5c2e
	defb 076h,06dh,0bfh	; 5c31
	defb 022h,0c2h,099h	; 5c34
	defb 061h,001h,096h	; 5c37

; ======================================================================
; CODIGO 0x5c3a..0x5cfa  (192 bytes)
; ======================================================================


L_5C3A:
	ld de,(0e302h)		;5c3a   ; cambios de graficos al empezar: el scroll
	ld a,(0e301h)		;5c3e   ; la fase
	dec a			;5c41   ; la 1?
	jr z,L_5C70		;5c42
	sub 002h		;5c44   ; la 3?
	jr z,L_5C69		;5c46
	sub 003h		;5c48   ; la 6?
	jr z,L_5C56		;5c4a
	dec a			;5c4c   ; la 7?
	ret nz			;5c4d
	ld hl,001bfh		;5c4e   ; la 7: del 0x1BF en adelante...
	rst 20h			;5c51
	ret nc			;5c52
	jp L_5C97		;5c53   ; ...el cambio de 0x5D12
L_5C56:
	ld hl,0019fh		;5c56   ; la 6: del 0x1A0 en adelante...
	ld hl,001a0h		;5c59
	rst 20h			;5c5c
	jr c,L_5CAD		;5c5d   ; ...el de 0x5D0C
	ld hl,000b7h		;5c5f   ; del 0xB7 en adelante...
	rst 20h			;5c62
	ret nc			;5c63
	ld hl,05d06h		;5c64   ; ...el de 0x5D06
	jr L_5CCB		;5c67
L_5C69:
	ld hl,0020eh		;5c69   ; la 3: del 0x20E...
	rst 20h			;5c6c
	ret nc			;5c6d
	jr L_5CBA		;5c6e
L_5C70:
	ld hl,0018fh		;5c70   ; la 1: del 0x18F...
	rst 20h			;5c73
	ret nc			;5c74
	jr L_5CC8		;5c75
L_5C77:
	ld bc,0e628h		;5c77   ; cambios a mitad de fase: 0xE628 (fila nueva)
	ld de,(0e302h)		;5c7a   ; el scroll
	ld a,(0e301h)		;5c7e   ; la fase
	dec a			;5c81   ; la 1?
	jr z,L_5CBF		;5c82
	sub 002h		;5c84   ; la 3?
	jr z,L_5CB2		;5c86
	sub 003h		;5c88   ; la 6?
	jr z,L_5C9C		;5c8a
	dec a			;5c8c   ; la 7?
	ret nz			;5c8d
	dec bc			;5c8e   ; la 7: 0xE627 (columna nueva)?
	ld a,(bc)			;5c8f
	or a			;5c90
	ret z			;5c91
	ld hl,001c0h		;5c92   ; justo en 0x1C0?
	rst 20h			;5c95
	ret nz			;5c96
L_5C97:
	ld hl,05d12h		;5c97   ; el cambio de 0x5D12
	jr L_5CCB		;5c9a
L_5C9C:
	ld a,(bc)			;5c9c   ; la 6: fila nueva?
	or a			;5c9d
	ret z			;5c9e
	ld hl,000b8h		;5c9f   ; en 0xB8?
	rst 20h			;5ca2
	ld hl,05d06h		;5ca3   ; el de 0x5D06
	jr z,L_5CCB		;5ca6
	ld hl,001a0h		;5ca8   ; en 0x1A0?
	rst 20h			;5cab
	ret nz			;5cac
L_5CAD:
	ld hl,05d0ch		;5cad   ; el de 0x5D0C
	jr L_5CCB		;5cb0
L_5CB2:
	ld a,(bc)			;5cb2   ; la 3: fila nueva?
	or a			;5cb3
	ret z			;5cb4
	ld hl,0020fh		;5cb5   ; en 0x20F?
	rst 20h			;5cb8
	ret nz			;5cb9
L_5CBA:
	ld hl,05d00h		;5cba   ; el de 0x5D00
	jr L_5CCB		;5cbd
L_5CBF:
	dec bc			;5cbf   ; la 1: columna nueva?
	ld a,(bc)			;5cc0
	or a			;5cc1
	ret z			;5cc2
	ld hl,00190h		;5cc3   ; en 0x190?
	rst 20h			;5cc6
	ret nz			;5cc7
L_5CC8:
	ld hl,05cfah		;5cc8   ; el de 0x5CFA
L_5CCB:
	call bancos_7_8_9		;5ccb   ; con 7-8-9
	ld e,(hl)			;5cce   ; la lista de caracteres
	inc hl			;5ccf
	ld d,(hl)			;5cd0
	push hl			;5cd1
	push de			;5cd2
	pop ix		;5cd3   ; a IX
	call caracteres		;5cd5   ; la pinta
	pop hl			;5cd8
	inc hl			;5cd9
	ld e,(hl)			;5cda   ; la de copias en espejo
	inc hl			;5cdb
	ld d,(hl)			;5cdc
	push hl			;5cdd
	push de			;5cde
	pop ix		;5cdf
	xor a			;5ce1   ; 0xF000 = 0
	ld (0f000h),a		;5ce2
	call copias		;5ce5   ; copia
	pop hl			;5ce8
	inc hl			;5ce9
	ld e,(hl)			;5cea   ; la de cabeza abajo
	inc hl			;5ceb
	ld d,(hl)			;5cec
	push de			;5ced
	pop ix		;5cee
	ld hl,0f000h		;5cf0   ; 0xF000 = 1
	inc (hl)			;5cf3
	call copias		;5cf4   ; copia
	jp bancos_1_2_3		;5cf7   ; bancos_1_2_3: pone los bancos 1-2-3 (y su copia en 0xF0F1-3)

; ----------------------------------------------------------------------
; DATOS cambios_de_fase: 5 fichas de 6 bytes: [caracteres][copias en
;   espejo][copias cabeza abajo] que p00:5CCB lee con HL = 0x5CFA, 0x5D00,
;   0x5D06, 0x5D0C o 0x5D12 (p00:5C64-5CC8: segun la fase y la posicion del
;   scroll); lo leen p00:5CCE (30 bytes)
;   0x5cfa..0x5d18  (30 bytes)
DATA_cambios_de_fase:
	defb 095h,094h,0ech,094h,007h,095h	; 5cfa
	defb 09ch,094h,0f6h,094h,00bh,095h	; 5d00
	defb 0a9h,094h,0dch,094h,00ch,095h	; 5d06
	defb 0b6h,094h,0edh,094h,014h,095h	; 5d0c
	defb 0c3h,094h,006h,095h,015h,095h	; 5d12

; ======================================================================
; CODIGO 0x5d18..0x5e54  (316 bytes)
; ======================================================================


L_5D18:
	ld a,(0e227h)		;5d18   ; los dos jugadores
	or a			;5d1b
	jr z,L_5D25		;5d1c
	ld iy,0e380h		;5d1e   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	call L_5D2C		;5d22
L_5D25:
	ld iy,0e300h		;5d25   ; apunta a la ficha del jugador 1 (IY, 0x80 bytes)
	call L_5D2C		;5d29
L_5D2C:
	ld a,(iy+020h)		;5d2c   ; IY+20: el jugador en marcha?
	or a			;5d2f
	ret z			;5d30   ; no: fuera
	inc a			;5d31   ; 0xFF?
	jr nz,L_5D62		;5d32   ; no: p00:5D62
	push iy		;5d34   ; IY + 0x11: las armas
	pop hl			;5d36
	ld bc,00011h		;5d37
	add hl,bc			;5d3a
	ld a,(hl)			;5d3b   ; la elegida
	or a			;5d3c
	jr z,L_5D41		;5d3d   ; 0: se queda
	ld a,001h		;5d3f   ; si no, 1
L_5D41:
	ld (hl),a			;5d41   ; la elegida
	inc hl			;5d42
	xor a			;5d43   ; las demas a 0...
	ld (hl),a			;5d44
	inc hl			;5d45
	ld (hl),0ffh		;5d46   ; ...y una a 0xFF
	inc hl			;5d48
	ld (hl),a			;5d49
	inc hl			;5d4a
	ld (hl),a			;5d4b
	inc hl			;5d4c
	ld (hl),a			;5d4d
	inc hl			;5d4e
	ld (hl),a			;5d4f
	inc hl			;5d50
	ld (hl),a			;5d51
	ld a,(0e6a5h)		;5d52   ; 0xE6A5 (dos jugadores a la vez)?
	or a			;5d55
	jr z,L_5D62		;5d56   ; no: sigue
	ld a,(0e60bh)		;5d58   ; 0xE60B: 3 o mas...
	cp 003h		;5d5b
	jr c,L_5D62		;5d5d
	dec hl			;5d5f   ; ...la ultima a 0xFF
	ld (hl),0ffh		;5d60
L_5D62:
	ld a,(iy+042h)		;5d62   ; IY+42: el marcador de armas pintado?
	or a			;5d65
	jr nz,L_5D8E		;5d66   ; si: p00:5D8E
	ld hl,03acah		;5d68   ; el del 1 en 0x3ACA, caracteres desde 0x16...
	ld a,016h		;5d6b
	bit 0,(iy+021h)		;5d6d
	jr z,L_5D78		;5d71
	ld hl,03adah		;5d73   ; ...el del 2 en 0x3ADA, desde 0x1B
	ld a,01bh		;5d76
L_5D78:
	push af			;5d78
	call puerto_vdp		;5d79   ; el puerto del VDP
	pop af			;5d7c
	ld b,005h		;5d7d   ; 5 caracteres
L_5D7F:
	exx			;5d7f
	out (c),a		;5d80   ; al VDP
	inc a			;5d82   ; el siguiente
	exx			;5d83
	djnz L_5D7F		;5d84
	exx			;5d86
	xor a			;5d87   ; un hueco
	out (c),a		;5d88
	exx			;5d8a
	exx			;5d8b
	out (c),a		;5d8c   ; y otro
L_5D8E:
	ld hl,03aa1h		;5d8e   ; las casillas de las armas del 1 en 0x3AA1...
	bit 0,(iy+021h)		;5d91
	jr z,L_5D9A		;5d95
	ld hl,03ab1h		;5d97   ; ...o del 2 en 0x3AB1
L_5D9A:
	call puerto_vdp		;5d9a   ; puerto_vdp: C' = el puerto de datos del VDP (0x0007 de la BIOS) tras fijar la direccion (0x0053)
	push iy		;5d9d   ; IY + 0x12: el nivel de cada arma
	pop hl			;5d9f
	ld bc,00012h		;5da0
	add hl,bc			;5da3
	ld bc,00701h		;5da4   ; 7 casillas, empezando por la 1
L_5DA7:
	call L_5E2F		;5da7   ; p00:5E2F: una casilla
	inc hl			;5daa
	inc c			;5dab
	djnz L_5DA7		;5dac   ; las 7
	ld a,(iy+042h)		;5dae   ; IY+42?
	or a			;5db1
	ret nz			;5db2   ; si, fuera
	ld a,(0e630h)		;5db3   ; 0xE630 (el reloj)?
	or a			;5db6
	jr z,L_5DCC		;5db7   ; 0: p00:5DCC
	cp 007h		;5db9   ; el 7?
	jr nz,L_5DC5		;5dbb
	ld a,(0e631h)		;5dbd   ; con 0xE631 de 0x10 en adelante, fuera
	cp 010h		;5dc0
	ret nc			;5dc2
	jr L_5DCC		;5dc3
L_5DC5:
	ld a,(0e228h)		;5dc5   ; 0xE228 contra IY+21...
	xor (iy+021h)		;5dc8
	ret z			;5dcb   ; ...iguales, fuera
L_5DCC:
	ld a,(iy+011h)		;5dcc   ; el arma elegida (IY+11)
	ld b,a			;5dcf
	or a			;5dd0   ; ninguna: p00:5DF0
	jr z,L_5DF0		;5dd1
	push iy		;5dd3   ; su nivel (IY + 0x11 + arma)
	pop hl			;5dd5
	ld de,00011h		;5dd6
	add hl,de			;5dd9
	add a,l			;5dda
	ld l,a			;5ddb
	ld a,(hl)			;5ddc
	ld c,a			;5ddd
	cp 0ffh		;5dde   ; 0xFF: nada
	jr z,L_5DF0		;5de0
	ld hl,l5e52h		;5de2   ; la lista del arma (p00:5E52 + 2 x arma)
	ld a,b			;5de5
	call palabra_de_hl		;5de6   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ex de,hl			;5de9
	ld b,000h		;5dea   ; el nivel...
	add hl,bc			;5dec   ; ...en la lista
	ld a,(hl)			;5ded   ; la pieza que se pinta
	jr L_5DF1		;5dee
L_5DF0:
	xor a			;5df0   ; ninguna
L_5DF1:
	ld hl,030b0h		;5df1   ; la ventana del 1 en 0x30B0...
	bit 0,(iy+021h)		;5df4
	jr z,L_5DFD		;5df8
	ld hl,030d8h		;5dfa   ; ...o del 2 en 0x30D8
L_5DFD:
	push hl			;5dfd
	push af			;5dfe
	call bancos_14_15		;5dff   ; con el 14-15 en 0x8000-0xA000
	call puerto_vdp		;5e02   ; el puerto
	exx			;5e05
	pop af			;5e06
	ld b,a			;5e07   ; la pieza
	ld hl,08849h		;5e08   ; de la tabla de p14:8849
	call palabra_de_hl		;5e0b   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ex de,hl			;5e0e
	ld de,00500h		;5e0f   ; 5 filas
L_5E12:
	out (c),e		;5e12   ; la direccion: el byte bajo...
	nop			;5e14
	ld b,007h		;5e15   ; 7 caracteres
L_5E17:
	outi		;5e17   ; al VDP
	jp nz,L_5E17		;5e19
	nop			;5e1c
	dec d			;5e1d   ; las 5 filas
	jr nz,L_5E12		;5e1e
	ld a,(hl)			;5e20   ; el color, el byte 36
	pop hl			;5e21
	ld bc,0e000h		;5e22   ; y en la tabla de colores (0x30B0 + 0xE000)
	add hl,bc			;5e25
	ld bc,00028h		;5e26   ; 40 bytes
	call 00056h		;5e29   ; BIOS FILVRM - Fills VRAM with value | FILVRM
	jp bancos_2_3		;5e2c   ; bancos_2_3: pone los bancos 2-3 en 0x8000-0xA000 (y su copia en 0xF0F1-3)
L_5E2F:
	ld a,(hl)			;5e2f   ; el nivel
	inc a			;5e30   ; 0xFF?
	jr nz,L_5E40		;5e31   ; no: p00:5E40
	ld a,(iy+011h)		;5e33   ; la elegida?
	cp c			;5e36
	ld a,014h		;5e37   ; la casilla vacia, 0x14
	jr nz,L_5E4A		;5e39
	ld a,014h		;5e3b
	jp L_5E4A		;5e3d
L_5E40:
	ld a,(iy+011h)		;5e40   ; la elegida?
	cp c			;5e43
	ld a,010h		;5e44   ; 0x10: casilla llena
	jr nz,L_5E4A		;5e46
	ld a,012h		;5e48   ; 0x12: la elegida
L_5E4A:
	exx			;5e4a   ; el caracter de la izquierda
	out (c),a		;5e4b
	exx			;5e4d
	inc a			;5e4e   ; y el de la derecha
	exx			;5e4f
	out (c),a		;5e50
L_5E52:
	exx			;5e52
	ret			;5e53

; ----------------------------------------------------------------------
; DATOS listas_5E52: 7 punteros (B de 1 a 7: p00:5DE2 lee 0x5E52 + 2 x B con
;   p00:4E28); lo leen p00:5DE6 (14 bytes)
;   0x5e54..0x5e62  (14 bytes)
DATA_listas_5E52:
	defw 05e62h,05e69h,05e6ch,05e6fh,05e71h,05e74h,05e78h	; 5e54

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E62: lista de bytes de las entradas 0 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (7
;   bytes)
;   0x5e62..0x5e69  (7 bytes)
DATA_listas_5E52_5E62:
	defb 001h,001h,001h,001h,001h,001h,001h	; 5e62

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E69: lista de bytes de las entradas 1 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (3
;   bytes)
;   0x5e69..0x5e6c  (3 bytes)
DATA_listas_5E52_5E69:
	defb 002h,00ch,00dh	; 5e69

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E6C: lista de bytes de las entradas 2 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (3
;   bytes)
;   0x5e6c..0x5e6f  (3 bytes)
DATA_listas_5E52_5E6C:
	defb 003h,004h,005h	; 5e6c

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E6F: lista de bytes de las entradas 3 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (2
;   bytes)
;   0x5e6f..0x5e71  (2 bytes)
DATA_listas_5E52_5E6F:
	defb 006h,00eh	; 5e6f

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E71: lista de bytes de las entradas 4 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (3
;   bytes)
;   0x5e71..0x5e74  (3 bytes)
DATA_listas_5E52_5E71:
	defb 007h,009h,008h	; 5e71

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E74: lista de bytes de las entradas 5 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (4
;   bytes)
;   0x5e74..0x5e78  (4 bytes)
DATA_listas_5E52_5E74:
	defb 00ah,00ah,00ah,00ah	; 5e74

; ----------------------------------------------------------------------
; DATOS listas_5E52_5E78: lista de bytes de las entradas 6 de 0x5E54 que
;   p00:5DEC lee con C (acaba donde empieza la siguiente); lo leen p00:5DEC (1
;   bytes)
;   0x5e78..0x5e79  (1 bytes)
DATA_listas_5E52_5E78:
	defb 00bh	; 5e78

; ======================================================================
; CODIGO 0x5e79..0x6000  (391 bytes)
; ======================================================================


L_5E79:
	ld a,b			;5e79   ; la pieza B
	call L_5DF1		;5e7a
	ld a,(0e630h)		;5e7d   ; 0xE630 = 3?
	sub 003h		;5e80
	ret z			;5e82   ; si, fuera
L_5E83:
	ld a,(0e228h)		;5e83   ; el reloj de 0xE631...
	or a			;5e86
	ld hl,03aceh		;5e87   ; ...del 1 en 0x3ACE...
	jr z,L_5E8E		;5e8a
	ld l,0deh		;5e8c   ; ...o del 2 en 0x3ADE
L_5E8E:
	ld de,0e631h		;5e8e
	ld b,001h		;5e91   ; una cifra doble
	call L_5A63		;5e93
L_5E96:
	ld a,(0e631h)		;5e96   ; el reloj
	cp 004h		;5e99   ; menos de 4?
	jr nc,L_5EA2		;5e9b
	ld a,017h		;5e9d   ; el sonido 0x17: se acaba el tiempo
	call pide_sonido		;5e9f   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_5EA2:
	xor a			;5ea2   ; 0xE215 = 0
	ld (0e215h),a		;5ea3
	ret			;5ea6
L_5EA7:
	ld a,(0e215h)		;5ea7   ; 0xE215 = 1?
	dec a			;5eaa
	jr z,L_5EB1		;5eab
	dec a			;5ead   ; 2?
	jr z,L_5EC3		;5eae
	ret			;5eb0
L_5EB1:
	ld a,(0e630h)		;5eb1   ; el reloj, 0xE630: 5 o 7...
	cp 005h		;5eb4
	jr z,L_5E96		;5eb6
	cp 007h		;5eb8
	jr z,L_5E96		;5eba
	sub 003h		;5ebc   ; 3 o 4: nada
	cp 002h		;5ebe
	ret c			;5ec0
	jr L_5E83		;5ec1   ; si no, lo pinta
L_5EC3:
	call L_5EA2		;5ec3   ; se acabo el reloj
	ld hl,0e630h		;5ec6   ; 0xE630...
	ld a,(hl)			;5ec9
	ld (hl),000h		;5eca   ; ...a 0
	dec a			;5ecc   ; era 1?
	jp z,L_5EF7		;5ecd
	dec a			;5ed0   ; 2?
	jr z,L_5EF0		;5ed1
	sub 003h		;5ed3   ; 5?
	ret z			;5ed5
	dec a			;5ed6   ; 6?
	jr z,L_5EF7		;5ed7
	dec a			;5ed9   ; 7?
	ret nz			;5eda
	ld a,(0e228h)		;5edb   ; el jugador de 0xE228
	ld iy,0e300h		;5ede   ; apunta a la ficha del jugador 1 (IY, 0x80 bytes)
	xor (iy+021h)		;5ee2
	jr z,L_5EEB		;5ee5
	ld iy,0e380h		;5ee7   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
L_5EEB:
	call 094a3h		;5eeb   ; p02:94A3
	jr L_5EF7		;5eee
L_5EF0:
	xor a			;5ef0   ; 0xE334 y 0xE3B4 a 0
	ld (0e334h),a		;5ef1
	ld (0e3b4h),a		;5ef4
L_5EF7:
	ld a,(0e227h)		;5ef7   ; el marcador de armas de los dos
	cp 002h		;5efa
	jr nz,L_5F05		;5efc
	ld iy,0e380h		;5efe   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
	call L_5D62		;5f02
L_5F05:
	ld iy,0e300h		;5f05   ; apunta a la ficha del jugador 1 (IY, 0x80 bytes)
	jp L_5D62		;5f09
L_5F0C:
	ld iy,0e300h		;5f0c   ; los dos jugadores
	call L_5F17		;5f10
	ld iy,0e380h		;5f13   ; apunta a la ficha del jugador 2 (IY, 0x80 bytes)
L_5F17:
	ld a,(iy+020h)		;5f17   ; IY+20 en marcha?
	dec a			;5f1a
	ret m			;5f1b   ; no: fuera
	ld a,(iy+068h)		;5f1c   ; IY+68: la cuenta del parpadeo?
	or a			;5f1f
	ret z			;5f20   ; 0: fuera
	dec (iy+069h)		;5f21   ; - 1
	jr nz,L_5F2B		;5f24
	ld (iy+068h),000h		;5f26   ; acabada: IY+68 = 0
	ret			;5f2a
L_5F2B:
	bit 2,(iy+069h)		;5f2b   ; el bit 2 de la cuenta: parpadea
	ret z			;5f2f
	ld hl,03947h		;5f30   ; en 0x3947
	call puerto_vdp		;5f33   ; puerto_vdp: C' = el puerto de datos del VDP (0x0007 de la BIOS) tras fijar la direccion (0x0053)
	exx			;5f36
	bit 0,(iy+021h)		;5f37
	ld a,010h		;5f3b   ; 0x10 o 0x11 segun el jugador
	jr z,L_5F40		;5f3d
	inc a			;5f3f
L_5F40:
	out (c),a		;5f40
	exx			;5f42
	exx			;5f43
	ld a,014h		;5f44   ; 0x14
	out (c),a		;5f46
	exx			;5f48
	exx			;5f49
	xor a			;5f4a   ; un hueco
	out (c),a		;5f4b
	ld a,012h		;5f4d   ; y del 0x12 en adelante...
	ld b,00eh		;5f4f   ; ...14 caracteres
L_5F51:
	out (c),a		;5f51
	inc a			;5f53
	djnz L_5F51		;5f54
	ret			;5f56
L_5F57:
	xor a			;5f57   ; 0xE208 = 0
	ld (0e208h),a		;5f58
	ld hl,03b00h		;5f5b   ; los atributos de sprite de 0x3B00...
	ld bc,00100h		;5f5e   ; ...256 bytes...
	ld a,0e0h		;5f61   ; ...a 0xE0
	jp 00056h		;5f63   ; BIOS FILVRM - Fills VRAM with value
L_5F66:
	xor a			;5f66   ; la tabla de atributos de 0x3B00
	jr L_5F6D		;5f67
L_5F69:
	ld a,(0e208h)		;5f69   ; la que toca este cuadro (0xE208 bit 0)
	rra			;5f6c
L_5F6D:
	ld bc,07605h		;5f6d   ; el registro 5 del VDP: 0x76 (0x3B00)...
	jr nc,L_5F73		;5f70
	inc b			;5f72   ; ...o 0x77 (0x3B80)
L_5F73:
	jp 00047h		;5f73   ; BIOS WRTVDP - Writes data in the VDP-register | WRTVDP
L_5F76:
	ld hl,0e208h		;5f76   ; cambia de tabla cada cuadro
	inc (hl)			;5f79
	bit 0,(hl)		;5f7a   ; la otra...
	ld hl,03b00h		;5f7c   ; ...0x3B00...
	jr z,L_5F83		;5f7f
	ld l,080h		;5f81   ; ...o 0x3B80
L_5F83:
	call puerto_vdp		;5f83   ; el puerto
	exx			;5f86
	ld a,(0e6c0h)		;5f87   ; 0xE6C0?
	or a			;5f8a
	jr nz,L_5FB0		;5f8b   ; si: el orden de siempre (p00:5FB0)
	ld hl,0e604h		;5f8d   ; si no, el orden rota: 0xE604 + 0x1C...
	ld a,(hl)			;5f90
	add a,01ch		;5f91
	and 07ch		;5f93   ; ...en 32 pasos de 4
	ld (hl),a			;5f95
	ld e,a			;5f96   ; el primero
	ld d,020h		;5f97   ; 32 sprites
L_5F99:
	ld a,e			;5f99   ; desde 0xEF80 + E
	ld hl,0ef80h		;5f9a   ; apunta a los atributos de sprite en la RAM (32 x 4)
	add a,l			;5f9d
	ld l,a			;5f9e
	ld b,004h		;5f9f   ; 4 bytes
L_5FA1:
	outi		;5fa1   ; al VDP
	jp nz,L_5FA1		;5fa3
	ld a,e			;5fa6   ; el siguiente: 12 mas, en circulo
	add a,00ch		;5fa7
	and 07ch		;5fa9
	ld e,a			;5fab
	dec d			;5fac   ; los 32
	jr nz,L_5F99		;5fad
	ret			;5faf
L_5FB0:
	ld hl,0efe0h		;5fb0   ; los 8 de 0xEFE0 delante
	ld b,020h		;5fb3
L_5FB5:
	outi		;5fb5   ; al VDP
	jp nz,L_5FB5		;5fb7
	ld hl,0ef80h		;5fba   ; y los 24 de 0xEF80 detras
	ld b,060h		;5fbd
L_5FBF:
	outi		;5fbf   ; al VDP
	jp nz,L_5FBF		;5fc1
	ret			;5fc4
L_5FC5:
	ld a,(0e301h)		;5fc5   ; la fase 4?
	cp 004h		;5fc8
	jr nz,L_5FED		;5fca   ; no: p00:5FED
	ld hl,(0e302h)		;5fcc   ; el scroll...
	ld de,00100h		;5fcf
	rst 20h			;5fd2   ; ...pasado 0x100?
	jr c,L_5FED		;5fd3   ; no: p00:5FED
	ld e,050h		;5fd5   ; justo en 0x150...
	rst 20h			;5fd7
	push af			;5fd8
	call z,0603eh		;5fd9   ; ...p01:603E
	pop af			;5fdc
	jr nc,L_5FED		;5fdd   ; antes de 0x150: p00:5FED
	ld a,(0e630h)		;5fdf   ; 0xE630 = 3: p00:5FED
	cp 003h		;5fe2
	jr z,L_5FED		;5fe4
	ld a,(0e203h)		;5fe6   ; uno de cada 64 cuadros
	and 03fh		;5fe9
	jr nz,$+43		;5feb
L_5FED:
	ld hl,03800h		;5fed   ; el mapa de la RAM a la tabla de nombres: 0x3800
	call puerto_vdp		;5ff0   ; el puerto
	exx			;5ff3
	ld hl,0ca00h		;5ff4   ; desde 0xCA00
	ld a,(0e645h)		;5ff7   ; 0xE645?
	or a			;5ffa
	jr z,$+9		;5ffb
	ld de,00001h		;5ffd
