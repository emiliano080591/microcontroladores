	.file	"practica.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
.global	main
	.type	main, @function
main:
.LFB6:
.LM1:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
.LM2:
	ldi r24,lo8(-1)
	out 58-32,r24
.LM3:
	out 59-32,__zero_reg__
.LM4:
	out 55-32,r24
.LM5:
	out 56-32,__zero_reg__
.LM6:
	ldi r24,lo8(15)
	out 52-32,r24
.LM7:
	ldi r24,lo8(-16)
	out 53-32,r24
.LM8:
	out 49-32,__zero_reg__
.LM9:
	out 50-32,__zero_reg__
.LM10:
	out 83-32,__zero_reg__
.LM11:
	out 82-32,__zero_reg__
.LM12:
	out 92-32,__zero_reg__
.LM13:
	out 79-32,__zero_reg__
.LM14:
	out 78-32,__zero_reg__
.LM15:
	out 77-32,__zero_reg__
.LM16:
	out 76-32,__zero_reg__
.LM17:
	out 71-32,__zero_reg__
.LM18:
	out 70-32,__zero_reg__
.LM19:
	out 75-32,__zero_reg__
.LM20:
	out 74-32,__zero_reg__
.LM21:
	out 73-32,__zero_reg__
.LM22:
	out 72-32,__zero_reg__
.LM23:
	out 66-32,__zero_reg__
.LM24:
	out 69-32,__zero_reg__
.LM25:
	out 68-32,__zero_reg__
.LM26:
	out 67-32,__zero_reg__
.LM27:
	out 89-32,__zero_reg__
.LM28:
	out 85-32,__zero_reg__
.LM29:
	out 84-32,__zero_reg__
.LM30:
	out 42-32,__zero_reg__
.LM31:
	ldi r24,lo8(-128)
	out 40-32,r24
.LM32:
	out 80-32,__zero_reg__
.LM33:
	out 38-32,__zero_reg__
.LM34:
	out 45-32,__zero_reg__
.LM35:
	out 86-32,__zero_reg__
	lds r18,tecla
	lds r25,aux4
	lds r21,aux3
	lds r20,aux2
	lds r19,aux1
.LM36:
	ldi r16,lo8(-9)
.LM37:
	ldi r17,lo8(-5)
.LM38:
	ldi r27,lo8(-3)
.LM39:
	ldi r26,lo8(-2)
.LBB30:
.LBB31:
.LBB32:
.LBB33:
.LM40:
	ldi r22,lo8(2000)
	ldi r23,hi8(2000)
.LVL0:
.L19:
.LBE33:
.LBE32:
.LBE31:
.LBE30:
.LM41:
	out 53-32,r16
.LM42:
	in r24,51-32
.LVL1:
	andi r24,lo8(-16)
.LM43:
	cpi r24,lo8(-32)
	brne .L2
	ldi r18,lo8(10)
	rjmp .L3
.L2:
.LM44:
	cpi r24,lo8(-48)
	brne .L4
	ldi r18,lo8(11)
	rjmp .L3
.L4:
.LM45:
	cpi r24,lo8(-80)
	brne .L5
	ldi r18,lo8(12)
	rjmp .L3
.L5:
.LM46:
	cpi r24,lo8(112)
	brne .L3
	ldi r18,lo8(13)
.L3:
.LM47:
	out 53-32,r17
.LM48:
	in r24,51-32
	andi r24,lo8(-16)
.LM49:
	cpi r24,lo8(-32)
	brne .L6
	ldi r18,lo8(9)
	rjmp .L7
.L6:
.LM50:
	cpi r24,lo8(-48)
	brne .L8
	ldi r18,lo8(6)
	rjmp .L7
.L8:
.LM51:
	cpi r24,lo8(-80)
	brne .L9
	ldi r18,lo8(3)
	rjmp .L7
.L9:
.LM52:
	cpi r24,lo8(112)
	brne .L7
	ldi r18,lo8(14)
.L7:
.LM53:
	out 53-32,r27
.LM54:
	in r24,51-32
	andi r24,lo8(-16)
.LM55:
	cpi r24,lo8(-32)
	brne .L10
	ldi r18,lo8(8)
	rjmp .L11
.L10:
.LM56:
	cpi r24,lo8(-48)
	brne .L12
	ldi r18,lo8(5)
	rjmp .L11
.L12:
.LM57:
	cpi r24,lo8(-80)
	brne .L13
	ldi r18,lo8(2)
	rjmp .L11
.L13:
.LM58:
	cpi r24,lo8(112)
	brne .L11
	ldi r18,lo8(0)
.L11:
.LM59:
	out 53-32,r26
.LM60:
	in r24,51-32
	andi r24,lo8(-16)
.LM61:
	cpi r24,lo8(-32)
	brne .L14
	ldi r18,lo8(7)
	rjmp .L15
.L14:
.LM62:
	cpi r24,lo8(-48)
	brne .L16
	ldi r18,lo8(4)
	rjmp .L15
.L16:
.LM63:
	cpi r24,lo8(-80)
	brne .L17
	ldi r18,lo8(1)
	rjmp .L15
.L17:
.LM64:
	cpi r24,lo8(112)
	brne .L15
	ldi r18,lo8(15)
.L15:
.LM65:
	mov r30,r18
	ldi r31,lo8(0)
	subi r30,lo8(-(tabla7segmentos))
	sbci r31,hi8(-(tabla7segmentos))
	ld r30,Z
	cp r30,r19
	brne .L18
	mov r19,r20
	mov r20,r21
	mov r21,r25
.L18:
.LM66:
	out 56-32,r26
.LM67:
	out 59-32,r30
.LBB37:
.LBB36:
.LBB35:
.LBB34:
.LM68:
	movw r24,r22
.LVL2:
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE34:
.LBE35:
.LBE36:
.LBE37:
.LM69:
	out 56-32,r27
.LM70:
	out 59-32,r19
.LBB38:
.LBB39:
.LBB40:
.LBB41:
.LM71:
	movw r24,r22
.LVL3:
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE41:
.LBE40:
.LBE39:
.LBE38:
.LM72:
	out 56-32,r17
.LM73:
	out 59-32,r20
.LBB42:
.LBB43:
.LBB44:
.LBB45:
.LM74:
	movw r24,r22
.LVL4:
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE45:
.LBE44:
.LBE43:
.LBE42:
.LM75:
	out 56-32,r16
.LM76:
	out 59-32,r21
.LBB46:
.LBB47:
.LBB48:
.LBB49:
.LM77:
	movw r24,r22
.LVL5:
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	mov r25,r21
	mov r21,r20
	mov r20,r19
	mov r19,r30
	rjmp .L19
.LBE49:
.LBE48:
.LBE47:
.LBE46:
.LFE6:
	.size	main, .-main
.global	tecla
.global	tecla
	.section .bss
	.type	tecla, @object
	.size	tecla, 1
tecla:
	.skip 1,0
.global	lectura
.global	lectura
	.type	lectura, @object
	.size	lectura, 1
lectura:
	.skip 1,0
.global	tecla_anterior
.global	tecla_anterior
	.type	tecla_anterior, @object
	.size	tecla_anterior, 1
tecla_anterior:
	.skip 1,0
.global	tabla7segmentos
	.data
	.type	tabla7segmentos, @object
	.size	tabla7segmentos, 16
tabla7segmentos:
	.byte	63
	.byte	6
	.byte	91
	.byte	79
	.byte	102
	.byte	109
	.byte	125
	.byte	7
	.byte	127
	.byte	111
	.byte	119
	.byte	124
	.byte	57
	.byte	94
	.byte	121
	.byte	113
.global	aux1
.global	aux1
	.section .bss
	.type	aux1, @object
	.size	aux1, 1
aux1:
	.skip 1,0
.global	aux2
.global	aux2
	.type	aux2, @object
	.size	aux2, 1
aux2:
	.skip 1,0
.global	aux3
.global	aux3
	.type	aux3, @object
	.size	aux3, 1
aux3:
	.skip 1,0
.global	aux4
.global	aux4
	.type	aux4, @object
	.size	aux4, 1
aux4:
	.skip 1,0
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -1
	.byte	0x24
	.byte	0xc
	.uleb128 0x20
	.uleb128 0x0
	.p2align	2
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.p2align	2
.LEFDE0:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL5-.Ltext0
	.long	.LFE6-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x24e
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF23
	.byte	0x1
	.long	.LASF24
	.long	.LASF25
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF26
	.byte	0x4
	.byte	0x7c
	.long	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x5
	.long	.LASF7
	.byte	0x2
	.byte	0x68
	.byte	0x1
	.byte	0x3
	.long	0x81
	.uleb128 0x6
	.long	.LASF9
	.byte	0x2
	.byte	0x67
	.long	0x3a
	.byte	0x0
	.uleb128 0x5
	.long	.LASF8
	.byte	0x3
	.byte	0x6f
	.byte	0x1
	.byte	0x3
	.long	0xb2
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0x6e
	.long	0xb2
	.uleb128 0x7
	.long	.LASF11
	.byte	0x3
	.byte	0x70
	.long	0x3a
	.uleb128 0x7
	.long	.LASF12
	.byte	0x3
	.byte	0x71
	.long	0xb2
	.uleb128 0x8
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF13
	.uleb128 0x9
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x23
	.byte	0x1
	.long	0x33
	.long	.LFB6
	.long	.LFE6
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1a2
	.uleb128 0xa
	.long	0x81
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.byte	0xc8
	.long	0x100
	.uleb128 0xb
	.long	.Ldebug_ranges0+0x18
	.uleb128 0xc
	.long	0x68
	.long	.Ldebug_ranges0+0x30
	.byte	0x3
	.byte	0x82
	.uleb128 0xd
	.long	0x75
	.long	.LLST1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x81
	.long	.LBB38
	.long	.LBE38
	.byte	0x1
	.byte	0xcb
	.long	0x137
	.uleb128 0xf
	.long	.LBB39
	.long	.LBE39
	.uleb128 0x10
	.long	0x68
	.long	.LBB40
	.long	.LBE40
	.byte	0x3
	.byte	0x82
	.uleb128 0xd
	.long	0x75
	.long	.LLST2
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x81
	.long	.LBB42
	.long	.LBE42
	.byte	0x1
	.byte	0xce
	.long	0x16e
	.uleb128 0xf
	.long	.LBB43
	.long	.LBE43
	.uleb128 0x10
	.long	0x68
	.long	.LBB44
	.long	.LBE44
	.byte	0x3
	.byte	0x82
	.uleb128 0xd
	.long	0x75
	.long	.LLST3
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.long	0x81
	.long	.LBB46
	.long	.LBE46
	.byte	0x1
	.byte	0xd1
	.uleb128 0xf
	.long	.LBB47
	.long	.LBE47
	.uleb128 0x10
	.long	0x68
	.long	.LBB48
	.long	.LBE48
	.byte	0x3
	.byte	0x82
	.uleb128 0xd
	.long	0x75
	.long	.LLST4
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.long	.LASF14
	.byte	0x1
	.byte	0x1e
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tecla
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.byte	0x1e
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lectura
	.uleb128 0x11
	.long	.LASF16
	.byte	0x1
	.byte	0x1e
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tecla_anterior
	.uleb128 0x12
	.long	0x1eb
	.long	0x1e8
	.uleb128 0x13
	.long	0x1e8
	.byte	0xf
	.byte	0x0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF17
	.uleb128 0x11
	.long	.LASF18
	.byte	0x1
	.byte	0x1f
	.long	0x204
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tabla7segmentos
	.uleb128 0x15
	.long	0x1d8
	.uleb128 0x11
	.long	.LASF19
	.byte	0x1
	.byte	0x20
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	aux1
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x20
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	aux2
	.uleb128 0x11
	.long	.LASF21
	.byte	0x1
	.byte	0x20
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	aux3
	.uleb128 0x11
	.long	.LASF22
	.byte	0x1
	.byte	0x20
	.long	0x2c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	aux4
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x78
	.word	0x2
	.long	.Ldebug_info0
	.long	0x252
	.long	0xb9
	.string	"main"
	.long	0x1a2
	.string	"tecla"
	.long	0x1b4
	.string	"lectura"
	.long	0x1c6
	.string	"tecla_anterior"
	.long	0x1f2
	.string	"tabla7segmentos"
	.long	0x209
	.string	"aux1"
	.long	0x21b
	.string	"aux2"
	.long	0x22d
	.string	"aux3"
	.long	0x23f
	.string	"aux4"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB30-.Ltext0
	.long	.LBE30-.Ltext0
	.long	.LBB37-.Ltext0
	.long	.LBE37-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB31-.Ltext0
	.long	.LBE31-.Ltext0
	.long	.LBB36-.Ltext0
	.long	.LBE36-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB32-.Ltext0
	.long	.LBE32-.Ltext0
	.long	.LBB35-.Ltext0
	.long	.LBE35-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_line
	.long	.LELT0-.LSLT0
.LSLT0:
	.word	0x2
	.long	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	".."
	.byte	0
	.ascii	"c:/winavr-20100110/lib/gcc/../../avr/include"
	.byte	0
	.ascii	"c:/winavr-20100110/lib/gcc/../../avr/include/util"
	.byte	0
	.byte	0x0
	.string	"practica.c"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"util/delay_basic.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"util/delay.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1
	.byte	0x36
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM8
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM9
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM10
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM18
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM19
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM20
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM21
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM22
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM23
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM25
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM27
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM28
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM29
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM30
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM31
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM32
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM33
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM34
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM35
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM36
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM37
	.byte	0x20
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM38
	.byte	0x20
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM39
	.byte	0x20
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM40
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -73
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM41
	.byte	0x4
	.uleb128 0x1
	.byte	0x39
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM42
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM44
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM45
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM46
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM48
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM49
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM50
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM51
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM52
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM53
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM54
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM55
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM56
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM57
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM58
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM59
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM61
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM62
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM63
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM64
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM65
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM66
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM67
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM68
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -94
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM69
	.byte	0x4
	.uleb128 0x1
	.byte	0x74
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM70
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM71
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -97
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM72
	.byte	0x4
	.uleb128 0x1
	.byte	0x77
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM73
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM74
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -100
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM75
	.byte	0x4
	.uleb128 0x1
	.byte	0x7a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM77
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -103
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"lectura"
.LASF19:
	.string	"aux1"
.LASF1:
	.string	"unsigned char"
.LASF21:
	.string	"aux3"
.LASF25:
	.ascii	"C:\\\\OH"
	.string	"M\\\\workspace\\\\microcontroladores\\\\practica-10\\\\codigo-c\\\\default"
.LASF7:
	.string	"_delay_loop_2"
.LASF4:
	.string	"long unsigned int"
.LASF8:
	.string	"_delay_ms"
.LASF23:
	.string	"GNU C 4.3.3"
.LASF18:
	.string	"tabla7segmentos"
.LASF24:
	.string	"../practica.c"
.LASF13:
	.string	"double"
.LASF12:
	.string	"__tmp"
.LASF27:
	.string	"main"
.LASF2:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF14:
	.string	"tecla"
.LASF5:
	.string	"long long int"
.LASF17:
	.string	"char"
.LASF16:
	.string	"tecla_anterior"
.LASF9:
	.string	"__count"
.LASF26:
	.string	"uint16_t"
.LASF11:
	.string	"__ticks"
.LASF3:
	.string	"long int"
.LASF20:
	.string	"aux2"
.LASF0:
	.string	"signed char"
.LASF22:
	.string	"aux4"
.LASF10:
	.string	"__ms"
.global __do_copy_data
.global __do_clear_bss
