	.file	"program.c"
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
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,18
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 18 */
.LM2:
	ldi r24,lo8(-1)
	out 58-32,r24
.LM3:
	movw r26,r28
	adiw r26,1
	ldi r30,lo8(C.0.1251)
	ldi r31,hi8(C.0.1251)
	ldi r24,lo8(18)
.L2:
	ld r0,Z+
	st X+,r0
	subi r24,lo8(-(-1))
	brne .L2
.LM4:
	ldi r17,lo8(63)
	movw r22,r28
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
.LBB12:
.LBB13:
.LBB14:
.LBB15:
.LM5:
	ldi r20,lo8(25)
	ldi r21,hi8(25)
.LBE15:
.LBE14:
.LBE13:
.LBE12:
.LM6:
	movw r18,r28
	subi r18,lo8(-(21))
	sbci r19,hi8(-(21))
.LVL0:
.L7:
.LM7:
	out 59-32,r17
	movw r26,r22
	rjmp .L3
.LVL1:
.L4:
.LBB19:
.LBB18:
.LBB17:
.LBB16:
.LM8:
	movw r30,r20
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r30,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE16:
.LBE17:
.LM9:
	sbiw r24,1
.LM10:
	brne .L4
.LBE18:
.LBE19:
.LM11:
	ld r24,X
.LVL2:
	out 59-32,r24
	adiw r26,2
.LM12:
	cp r26,r18
	cpc r27,r19
	breq .L7
.L3:
	ldi r24,lo8(5000)
	ldi r25,hi8(5000)
.LVL3:
	rjmp .L4
.LFE6:
	.size	main, .-main
	.data
	.type	C.0.1251, @object
	.size	C.0.1251, 18
C.0.1251:
	.word	6
	.word	91
	.word	79
	.word	102
	.word	109
	.word	125
	.word	39
	.word	127
	.word	111
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
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3-.Ltext0
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
	.long	0x13a
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF14
	.byte	0x1
	.long	.LASF15
	.long	.LASF16
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
	.long	.LASF17
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
	.long	.LASF18
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.long	0x33
	.long	.LFB6
	.long	.LFE6
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x12a
	.uleb128 0xa
	.string	"i"
	.byte	0x1
	.byte	0xa
	.long	0x33
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0xb
	.long	0x12a
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0xc
	.long	0x81
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.byte	0xf
	.uleb128 0xd
	.long	0x8e
	.uleb128 0xe
	.long	.Ldebug_ranges0+0x18
	.uleb128 0xf
	.long	0x99
	.long	.LLST1
	.uleb128 0x10
	.long	0xa4
	.uleb128 0xc
	.long	0x68
	.long	.Ldebug_ranges0+0x30
	.byte	0x3
	.byte	0x7b
	.uleb128 0x11
	.long	0x75
	.byte	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.long	0x33
	.long	0x13a
	.uleb128 0x13
	.long	0x13a
	.byte	0x8
	.byte	0x0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7
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
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0x2
	.uleb128 0xa
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x17
	.word	0x2
	.long	.Ldebug_info0
	.long	0x13e
	.long	0xb9
	.string	"main"
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
	.long	.LBB12-.Ltext0
	.long	.LBE12-.Ltext0
	.long	.LBB19-.Ltext0
	.long	.LBE19-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB13-.Ltext0
	.long	.LBE13-.Ltext0
	.long	.LBB18-.Ltext0
	.long	.LBE18-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB14-.Ltext0
	.long	.LBE14-.Ltext0
	.long	.LBB17-.Ltext0
	.long	.LBE17-.Ltext0
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
	.string	"program.c"
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
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x4
	.uleb128 0x2
	.byte	0x70
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -91
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM8
	.byte	0x4
	.uleb128 0x2
	.byte	0x70
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM9
	.byte	0x4
	.uleb128 0x3
	.byte	0x27
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM10
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -104
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0x12
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
	.string	"../program.c"
.LASF1:
	.string	"unsigned char"
.LASF7:
	.string	"_delay_loop_2"
.LASF4:
	.string	"long unsigned int"
.LASF8:
	.string	"_delay_ms"
.LASF14:
	.string	"GNU C 4.3.3"
.LASF13:
	.string	"double"
.LASF12:
	.string	"__tmp"
.LASF18:
	.string	"main"
.LASF2:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF16:
	.ascii	"C:\\OHM\\wo"
	.string	"rkspace\\microcontroladores\\pruebas-1\\contador-ATMEGA8535\\default"
.LASF9:
	.string	"__count"
.LASF17:
	.string	"uint16_t"
.LASF11:
	.string	"__ticks"
.LASF3:
	.string	"long int"
.LASF19:
	.string	"cont"
.LASF0:
	.string	"signed char"
.LASF10:
	.string	"__ms"
.global __do_copy_data
