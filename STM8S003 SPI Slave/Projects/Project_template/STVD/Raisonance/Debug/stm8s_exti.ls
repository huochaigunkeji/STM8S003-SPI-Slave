   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 47 void EXTI_DeInit(void)
  32                     ; 48 {
  34                     	switch	.text
  35  0000               _EXTI_DeInit:
  39                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  41  0000 725f50a0      	clr	20640
  42                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  44  0004 725f50a1      	clr	20641
  45                     ; 51 }
  48  0008 81            	ret
 174                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 174                     ; 65 {
 175                     	switch	.text
 176  0009               _EXTI_SetExtIntSensitivity:
 178  0009 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 184  000a 9e            	ld	a,xh
 185  000b 4d            	tnz	a
 186  000c 2714          	jreq	L21
 187  000e 9e            	ld	a,xh
 188  000f a101          	cp	a,#1
 189  0011 270f          	jreq	L21
 190  0013 9e            	ld	a,xh
 191  0014 a102          	cp	a,#2
 192  0016 270a          	jreq	L21
 193  0018 9e            	ld	a,xh
 194  0019 a103          	cp	a,#3
 195  001b 2705          	jreq	L21
 196  001d 9e            	ld	a,xh
 197  001e a104          	cp	a,#4
 198  0020 2603          	jrne	L01
 199  0022               L21:
 200  0022 4f            	clr	a
 201  0023 2010          	jra	L41
 202  0025               L01:
 203  0025 ae0044        	ldw	x,#68
 204  0028 89            	pushw	x
 205  0029 ae0000        	ldw	x,#0
 206  002c 89            	pushw	x
 207  002d ae0000        	ldw	x,#L111
 208  0030 cd0000        	call	_assert_failed
 210  0033 5b04          	addw	sp,#4
 211  0035               L41:
 212                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 214  0035 0d02          	tnz	(OFST+2,sp)
 215  0037 2712          	jreq	L02
 216  0039 7b02          	ld	a,(OFST+2,sp)
 217  003b a101          	cp	a,#1
 218  003d 270c          	jreq	L02
 219  003f 7b02          	ld	a,(OFST+2,sp)
 220  0041 a102          	cp	a,#2
 221  0043 2706          	jreq	L02
 222  0045 7b02          	ld	a,(OFST+2,sp)
 223  0047 a103          	cp	a,#3
 224  0049 2603          	jrne	L61
 225  004b               L02:
 226  004b 4f            	clr	a
 227  004c 2010          	jra	L22
 228  004e               L61:
 229  004e ae0045        	ldw	x,#69
 230  0051 89            	pushw	x
 231  0052 ae0000        	ldw	x,#0
 232  0055 89            	pushw	x
 233  0056 ae0000        	ldw	x,#L111
 234  0059 cd0000        	call	_assert_failed
 236  005c 5b04          	addw	sp,#4
 237  005e               L22:
 238                     ; 72     switch (Port)
 240  005e 7b01          	ld	a,(OFST+1,sp)
 242                     ; 94     default:
 242                     ; 95         break;
 243  0060 4d            	tnz	a
 244  0061 270e          	jreq	L12
 245  0063 4a            	dec	a
 246  0064 271d          	jreq	L32
 247  0066 4a            	dec	a
 248  0067 272e          	jreq	L52
 249  0069 4a            	dec	a
 250  006a 2742          	jreq	L72
 251  006c 4a            	dec	a
 252  006d 2756          	jreq	L13
 253  006f 2064          	jra	L511
 254  0071               L12:
 255                     ; 74     case EXTI_PORT_GPIOA:
 255                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 257  0071 c650a0        	ld	a,20640
 258  0074 a4fc          	and	a,#252
 259  0076 c750a0        	ld	20640,a
 260                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 262  0079 c650a0        	ld	a,20640
 263  007c 1a02          	or	a,(OFST+2,sp)
 264  007e c750a0        	ld	20640,a
 265                     ; 77         break;
 267  0081 2052          	jra	L511
 268  0083               L32:
 269                     ; 78     case EXTI_PORT_GPIOB:
 269                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 271  0083 c650a0        	ld	a,20640
 272  0086 a4f3          	and	a,#243
 273  0088 c750a0        	ld	20640,a
 274                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 276  008b 7b02          	ld	a,(OFST+2,sp)
 277  008d 48            	sll	a
 278  008e 48            	sll	a
 279  008f ca50a0        	or	a,20640
 280  0092 c750a0        	ld	20640,a
 281                     ; 81         break;
 283  0095 203e          	jra	L511
 284  0097               L52:
 285                     ; 82     case EXTI_PORT_GPIOC:
 285                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 287  0097 c650a0        	ld	a,20640
 288  009a a4cf          	and	a,#207
 289  009c c750a0        	ld	20640,a
 290                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 292  009f 7b02          	ld	a,(OFST+2,sp)
 293  00a1 97            	ld	xl,a
 294  00a2 a610          	ld	a,#16
 295  00a4 42            	mul	x,a
 296  00a5 9f            	ld	a,xl
 297  00a6 ca50a0        	or	a,20640
 298  00a9 c750a0        	ld	20640,a
 299                     ; 85         break;
 301  00ac 2027          	jra	L511
 302  00ae               L72:
 303                     ; 86     case EXTI_PORT_GPIOD:
 303                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 305  00ae c650a0        	ld	a,20640
 306  00b1 a43f          	and	a,#63
 307  00b3 c750a0        	ld	20640,a
 308                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 310  00b6 7b02          	ld	a,(OFST+2,sp)
 311  00b8 97            	ld	xl,a
 312  00b9 a640          	ld	a,#64
 313  00bb 42            	mul	x,a
 314  00bc 9f            	ld	a,xl
 315  00bd ca50a0        	or	a,20640
 316  00c0 c750a0        	ld	20640,a
 317                     ; 89         break;
 319  00c3 2010          	jra	L511
 320  00c5               L13:
 321                     ; 90     case EXTI_PORT_GPIOE:
 321                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 323  00c5 c650a1        	ld	a,20641
 324  00c8 a4fc          	and	a,#252
 325  00ca c750a1        	ld	20641,a
 326                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 328  00cd c650a1        	ld	a,20641
 329  00d0 1a02          	or	a,(OFST+2,sp)
 330  00d2 c750a1        	ld	20641,a
 331                     ; 93         break;
 333  00d5               L33:
 334                     ; 94     default:
 334                     ; 95         break;
 336  00d5               L511:
 337                     ; 97 }
 340  00d5 85            	popw	x
 341  00d6 81            	ret
 400                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 400                     ; 107 {
 401                     	switch	.text
 402  00d7               _EXTI_SetTLISensitivity:
 404  00d7 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 410  00d8 4d            	tnz	a
 411  00d9 2704          	jreq	L03
 412  00db a104          	cp	a,#4
 413  00dd 2603          	jrne	L62
 414  00df               L03:
 415  00df 4f            	clr	a
 416  00e0 2010          	jra	L23
 417  00e2               L62:
 418  00e2 ae006d        	ldw	x,#109
 419  00e5 89            	pushw	x
 420  00e6 ae0000        	ldw	x,#0
 421  00e9 89            	pushw	x
 422  00ea ae0000        	ldw	x,#L111
 423  00ed cd0000        	call	_assert_failed
 425  00f0 5b04          	addw	sp,#4
 426  00f2               L23:
 427                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 429  00f2 721550a1      	bres	20641,#2
 430                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 432  00f6 c650a1        	ld	a,20641
 433  00f9 1a01          	or	a,(OFST+1,sp)
 434  00fb c750a1        	ld	20641,a
 435                     ; 114 }
 438  00fe 84            	pop	a
 439  00ff 81            	ret
 486                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 486                     ; 122 {
 487                     	switch	.text
 488  0100               _EXTI_GetExtIntSensitivity:
 490  0100 88            	push	a
 491  0101 88            	push	a
 492       00000001      OFST:	set	1
 495                     ; 123     uint8_t value = 0;
 497  0102 0f01          	clr	(OFST+0,sp)
 498                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 500  0104 4d            	tnz	a
 501  0105 2710          	jreq	L04
 502  0107 a101          	cp	a,#1
 503  0109 270c          	jreq	L04
 504  010b a102          	cp	a,#2
 505  010d 2708          	jreq	L04
 506  010f a103          	cp	a,#3
 507  0111 2704          	jreq	L04
 508  0113 a104          	cp	a,#4
 509  0115 2603          	jrne	L63
 510  0117               L04:
 511  0117 4f            	clr	a
 512  0118 2010          	jra	L24
 513  011a               L63:
 514  011a ae007e        	ldw	x,#126
 515  011d 89            	pushw	x
 516  011e ae0000        	ldw	x,#0
 517  0121 89            	pushw	x
 518  0122 ae0000        	ldw	x,#L111
 519  0125 cd0000        	call	_assert_failed
 521  0128 5b04          	addw	sp,#4
 522  012a               L24:
 523                     ; 128     switch (Port)
 525  012a 7b02          	ld	a,(OFST+1,sp)
 527                     ; 145     default:
 527                     ; 146         break;
 528  012c 4d            	tnz	a
 529  012d 270e          	jreq	L541
 530  012f 4a            	dec	a
 531  0130 2714          	jreq	L741
 532  0132 4a            	dec	a
 533  0133 271c          	jreq	L151
 534  0135 4a            	dec	a
 535  0136 2725          	jreq	L351
 536  0138 4a            	dec	a
 537  0139 2730          	jreq	L551
 538  013b 2035          	jra	L502
 539  013d               L541:
 540                     ; 130     case EXTI_PORT_GPIOA:
 540                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 542  013d c650a0        	ld	a,20640
 543  0140 a403          	and	a,#3
 544  0142 6b01          	ld	(OFST+0,sp),a
 545                     ; 132         break;
 547  0144 202c          	jra	L502
 548  0146               L741:
 549                     ; 133     case EXTI_PORT_GPIOB:
 549                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 551  0146 c650a0        	ld	a,20640
 552  0149 a40c          	and	a,#12
 553  014b 44            	srl	a
 554  014c 44            	srl	a
 555  014d 6b01          	ld	(OFST+0,sp),a
 556                     ; 135         break;
 558  014f 2021          	jra	L502
 559  0151               L151:
 560                     ; 136     case EXTI_PORT_GPIOC:
 560                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 562  0151 c650a0        	ld	a,20640
 563  0154 a430          	and	a,#48
 564  0156 4e            	swap	a
 565  0157 a40f          	and	a,#15
 566  0159 6b01          	ld	(OFST+0,sp),a
 567                     ; 138         break;
 569  015b 2015          	jra	L502
 570  015d               L351:
 571                     ; 139     case EXTI_PORT_GPIOD:
 571                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 573  015d c650a0        	ld	a,20640
 574  0160 a4c0          	and	a,#192
 575  0162 4e            	swap	a
 576  0163 44            	srl	a
 577  0164 44            	srl	a
 578  0165 a403          	and	a,#3
 579  0167 6b01          	ld	(OFST+0,sp),a
 580                     ; 141         break;
 582  0169 2007          	jra	L502
 583  016b               L551:
 584                     ; 142     case EXTI_PORT_GPIOE:
 584                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 586  016b c650a1        	ld	a,20641
 587  016e a403          	and	a,#3
 588  0170 6b01          	ld	(OFST+0,sp),a
 589                     ; 144         break;
 591  0172               L751:
 592                     ; 145     default:
 592                     ; 146         break;
 594  0172               L502:
 595                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 597  0172 7b01          	ld	a,(OFST+0,sp)
 600  0174 85            	popw	x
 601  0175 81            	ret
 637                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 637                     ; 158 {
 638                     	switch	.text
 639  0176               _EXTI_GetTLISensitivity:
 641  0176 88            	push	a
 642       00000001      OFST:	set	1
 645                     ; 160     uint8_t value = 0;
 647  0177 0f01          	clr	(OFST+0,sp)
 648                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 650  0179 c650a1        	ld	a,20641
 651  017c a404          	and	a,#4
 652  017e 6b01          	ld	(OFST+0,sp),a
 653                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 655  0180 7b01          	ld	a,(OFST+0,sp)
 658  0182 5b01          	addw	sp,#1
 659  0184 81            	ret
 672                     	xdef	_EXTI_GetTLISensitivity
 673                     	xdef	_EXTI_GetExtIntSensitivity
 674                     	xdef	_EXTI_SetTLISensitivity
 675                     	xdef	_EXTI_SetExtIntSensitivity
 676                     	xdef	_EXTI_DeInit
 677                     	xref	_assert_failed
 678                     .const:	section	.text
 679  0000               L111:
 680  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 681  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 682  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 683  0036 5f657874692e  	dc.b	"_exti.c",0
 703                     	end
