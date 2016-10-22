   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 44 uint8_t ITC_GetCPUCC(void)
  32                     ; 45 {
  34                     	switch	.text
  35  0000               _ITC_GetCPUCC:
  39                     ; 47   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 48   _asm("pop a");
  47  0001 84            pop a
  49                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 74 void ITC_DeInit(void)
  75                     ; 75 {
  76                     	switch	.text
  77  0003               _ITC_DeInit:
  81                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0003 35ff7f70      	mov	32624,#255
  84                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0007 35ff7f71      	mov	32625,#255
  87                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  000b 35ff7f72      	mov	32626,#255
  90                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000f 35ff7f73      	mov	32627,#255
  93                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0013 35ff7f74      	mov	32628,#255
  96                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0017 35ff7f75      	mov	32629,#255
  99                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  001b 35ff7f76      	mov	32630,#255
 102                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001f 35ff7f77      	mov	32631,#255
 105                     ; 84 }
 108  0023 81            	ret
 133                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 92 {
 134                     	switch	.text
 135  0024               _ITC_GetSoftIntStatus:
 139                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 141  0024 adda          	call	_ITC_GetCPUCC
 143  0026 a428          	and	a,#40
 146  0028 81            	ret
 396                     .const:	section	.text
 397  0000               L62:
 398  0000 006a          	dc.w	L14
 399  0002 006a          	dc.w	L14
 400  0004 006a          	dc.w	L14
 401  0006 006a          	dc.w	L14
 402  0008 0073          	dc.w	L34
 403  000a 0073          	dc.w	L34
 404  000c 0073          	dc.w	L34
 405  000e 0073          	dc.w	L34
 406  0010 00a7          	dc.w	L502
 407  0012 00a7          	dc.w	L502
 408  0014 007c          	dc.w	L54
 409  0016 007c          	dc.w	L54
 410  0018 0085          	dc.w	L74
 411  001a 0085          	dc.w	L74
 412  001c 0085          	dc.w	L74
 413  001e 0085          	dc.w	L74
 414  0020 008e          	dc.w	L15
 415  0022 008e          	dc.w	L15
 416  0024 008e          	dc.w	L15
 417  0026 008e          	dc.w	L15
 418  0028 00a7          	dc.w	L502
 419  002a 00a7          	dc.w	L502
 420  002c 0097          	dc.w	L35
 421  002e 0097          	dc.w	L35
 422  0030 00a0          	dc.w	L55
 423                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 423                     ; 102 {
 424                     	switch	.text
 425  0029               _ITC_GetSoftwarePriority:
 427  0029 88            	push	a
 428  002a 89            	pushw	x
 429       00000002      OFST:	set	2
 432                     ; 104     uint8_t Value = 0;
 434  002b 0f02          	clr	(OFST+0,sp)
 435                     ; 105     uint8_t Mask = 0;
 437  002d 7b01          	ld	a,(OFST-1,sp)
 438  002f 97            	ld	xl,a
 439                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 441  0030 7b03          	ld	a,(OFST+1,sp)
 442  0032 a119          	cp	a,#25
 443  0034 2403          	jruge	L41
 444  0036 4f            	clr	a
 445  0037 2010          	jra	L61
 446  0039               L41:
 447  0039 ae006c        	ldw	x,#108
 448  003c 89            	pushw	x
 449  003d ae0000        	ldw	x,#0
 450  0040 89            	pushw	x
 451  0041 ae0064        	ldw	x,#L102
 452  0044 cd0000        	call	_assert_failed
 454  0047 5b04          	addw	sp,#4
 455  0049               L61:
 456                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 458  0049 7b03          	ld	a,(OFST+1,sp)
 459  004b a403          	and	a,#3
 460  004d 48            	sll	a
 461  004e 5f            	clrw	x
 462  004f 97            	ld	xl,a
 463  0050 a603          	ld	a,#3
 464  0052 5d            	tnzw	x
 465  0053 2704          	jreq	L02
 466  0055               L22:
 467  0055 48            	sll	a
 468  0056 5a            	decw	x
 469  0057 26fc          	jrne	L22
 470  0059               L02:
 471  0059 6b01          	ld	(OFST-1,sp),a
 472                     ; 113     switch (IrqNum)
 474  005b 7b03          	ld	a,(OFST+1,sp)
 476                     ; 185     default:
 476                     ; 186         break;
 477  005d a119          	cp	a,#25
 478  005f 2407          	jruge	L42
 479  0061 5f            	clrw	x
 480  0062 97            	ld	xl,a
 481  0063 58            	sllw	x
 482  0064 de0000        	ldw	x,(L62,x)
 483  0067 fc            	jp	(x)
 484  0068               L42:
 485  0068 203d          	jra	L502
 486  006a               L14:
 487                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 487                     ; 116     case ITC_IRQ_AWU:
 487                     ; 117     case ITC_IRQ_CLK:
 487                     ; 118     case ITC_IRQ_PORTA:
 487                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 489  006a c67f70        	ld	a,32624
 490  006d 1401          	and	a,(OFST-1,sp)
 491  006f 6b02          	ld	(OFST+0,sp),a
 492                     ; 120         break;
 494  0071 2034          	jra	L502
 495  0073               L34:
 496                     ; 121     case ITC_IRQ_PORTB:
 496                     ; 122     case ITC_IRQ_PORTC:
 496                     ; 123     case ITC_IRQ_PORTD:
 496                     ; 124     case ITC_IRQ_PORTE:
 496                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 498  0073 c67f71        	ld	a,32625
 499  0076 1401          	and	a,(OFST-1,sp)
 500  0078 6b02          	ld	(OFST+0,sp),a
 501                     ; 126         break;
 503  007a 202b          	jra	L502
 504  007c               L54:
 505                     ; 136     case ITC_IRQ_SPI:
 505                     ; 137     case ITC_IRQ_TIM1_OVF:
 505                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 507  007c c67f72        	ld	a,32626
 508  007f 1401          	and	a,(OFST-1,sp)
 509  0081 6b02          	ld	(OFST+0,sp),a
 510                     ; 139         break;
 512  0083 2022          	jra	L502
 513  0085               L74:
 514                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 514                     ; 141 #ifdef STM8S903
 514                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 514                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 514                     ; 144 #else
 514                     ; 145     case ITC_IRQ_TIM2_OVF:
 514                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 514                     ; 147 #endif /*STM8S903*/
 514                     ; 148 
 514                     ; 149     case ITC_IRQ_TIM3_OVF:
 514                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 516  0085 c67f73        	ld	a,32627
 517  0088 1401          	and	a,(OFST-1,sp)
 518  008a 6b02          	ld	(OFST+0,sp),a
 519                     ; 151         break;
 521  008c 2019          	jra	L502
 522  008e               L15:
 523                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 523                     ; 153     case ITC_IRQ_UART1_TX:
 523                     ; 154     case ITC_IRQ_UART1_RX:
 523                     ; 155     case ITC_IRQ_I2C:
 523                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 525  008e c67f74        	ld	a,32628
 526  0091 1401          	and	a,(OFST-1,sp)
 527  0093 6b02          	ld	(OFST+0,sp),a
 528                     ; 157         break;
 530  0095 2010          	jra	L502
 531  0097               L35:
 532                     ; 172     case ITC_IRQ_ADC1:
 532                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 532                     ; 174 
 532                     ; 175 #ifdef STM8S903
 532                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 532                     ; 177 #else
 532                     ; 178     case ITC_IRQ_TIM4_OVF:
 532                     ; 179 #endif /*STM8S903*/
 532                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 534  0097 c67f75        	ld	a,32629
 535  009a 1401          	and	a,(OFST-1,sp)
 536  009c 6b02          	ld	(OFST+0,sp),a
 537                     ; 181         break;
 539  009e 2007          	jra	L502
 540  00a0               L55:
 541                     ; 182     case ITC_IRQ_EEPROM_EEC:
 541                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 543  00a0 c67f76        	ld	a,32630
 544  00a3 1401          	and	a,(OFST-1,sp)
 545  00a5 6b02          	ld	(OFST+0,sp),a
 546                     ; 184         break;
 548  00a7               L75:
 549                     ; 185     default:
 549                     ; 186         break;
 551  00a7               L502:
 552                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 554  00a7 7b03          	ld	a,(OFST+1,sp)
 555  00a9 a403          	and	a,#3
 556  00ab 48            	sll	a
 557  00ac 5f            	clrw	x
 558  00ad 97            	ld	xl,a
 559  00ae 7b02          	ld	a,(OFST+0,sp)
 560  00b0 5d            	tnzw	x
 561  00b1 2704          	jreq	L03
 562  00b3               L23:
 563  00b3 44            	srl	a
 564  00b4 5a            	decw	x
 565  00b5 26fc          	jrne	L23
 566  00b7               L03:
 567  00b7 6b02          	ld	(OFST+0,sp),a
 568                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 570  00b9 7b02          	ld	a,(OFST+0,sp)
 573  00bb 5b03          	addw	sp,#3
 574  00bd 81            	ret
 640                     	switch	.const
 641  0032               L66:
 642  0032 0156          	dc.w	L702
 643  0034 0156          	dc.w	L702
 644  0036 0156          	dc.w	L702
 645  0038 0156          	dc.w	L702
 646  003a 0168          	dc.w	L112
 647  003c 0168          	dc.w	L112
 648  003e 0168          	dc.w	L112
 649  0040 0168          	dc.w	L112
 650  0042 01d2          	dc.w	L362
 651  0044 01d2          	dc.w	L362
 652  0046 017a          	dc.w	L312
 653  0048 017a          	dc.w	L312
 654  004a 018c          	dc.w	L512
 655  004c 018c          	dc.w	L512
 656  004e 018c          	dc.w	L512
 657  0050 018c          	dc.w	L512
 658  0052 019e          	dc.w	L712
 659  0054 019e          	dc.w	L712
 660  0056 019e          	dc.w	L712
 661  0058 019e          	dc.w	L712
 662  005a 01d2          	dc.w	L362
 663  005c 01d2          	dc.w	L362
 664  005e 01b0          	dc.w	L122
 665  0060 01b0          	dc.w	L122
 666  0062 01c2          	dc.w	L322
 667                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 667                     ; 209 {
 668                     	switch	.text
 669  00be               _ITC_SetSoftwarePriority:
 671  00be 89            	pushw	x
 672  00bf 89            	pushw	x
 673       00000002      OFST:	set	2
 676                     ; 211     uint8_t Mask = 0;
 678  00c0 7b01          	ld	a,(OFST-1,sp)
 679  00c2 97            	ld	xl,a
 680                     ; 212     uint8_t NewPriority = 0;
 682  00c3 7b02          	ld	a,(OFST+0,sp)
 683  00c5 97            	ld	xl,a
 684                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 686  00c6 7b03          	ld	a,(OFST+1,sp)
 687  00c8 a119          	cp	a,#25
 688  00ca 2403          	jruge	L63
 689  00cc 4f            	clr	a
 690  00cd 2010          	jra	L04
 691  00cf               L63:
 692  00cf ae00d7        	ldw	x,#215
 693  00d2 89            	pushw	x
 694  00d3 ae0000        	ldw	x,#0
 695  00d6 89            	pushw	x
 696  00d7 ae0064        	ldw	x,#L102
 697  00da cd0000        	call	_assert_failed
 699  00dd 5b04          	addw	sp,#4
 700  00df               L04:
 701                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 703  00df 7b04          	ld	a,(OFST+2,sp)
 704  00e1 a102          	cp	a,#2
 705  00e3 2710          	jreq	L44
 706  00e5 7b04          	ld	a,(OFST+2,sp)
 707  00e7 a101          	cp	a,#1
 708  00e9 270a          	jreq	L44
 709  00eb 0d04          	tnz	(OFST+2,sp)
 710  00ed 2706          	jreq	L44
 711  00ef 7b04          	ld	a,(OFST+2,sp)
 712  00f1 a103          	cp	a,#3
 713  00f3 2603          	jrne	L24
 714  00f5               L44:
 715  00f5 4f            	clr	a
 716  00f6 2010          	jra	L64
 717  00f8               L24:
 718  00f8 ae00d8        	ldw	x,#216
 719  00fb 89            	pushw	x
 720  00fc ae0000        	ldw	x,#0
 721  00ff 89            	pushw	x
 722  0100 ae0064        	ldw	x,#L102
 723  0103 cd0000        	call	_assert_failed
 725  0106 5b04          	addw	sp,#4
 726  0108               L64:
 727                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 729  0108 cd0024        	call	_ITC_GetSoftIntStatus
 731  010b a128          	cp	a,#40
 732  010d 2603          	jrne	L05
 733  010f 4f            	clr	a
 734  0110 2010          	jra	L25
 735  0112               L05:
 736  0112 ae00db        	ldw	x,#219
 737  0115 89            	pushw	x
 738  0116 ae0000        	ldw	x,#0
 739  0119 89            	pushw	x
 740  011a ae0064        	ldw	x,#L102
 741  011d cd0000        	call	_assert_failed
 743  0120 5b04          	addw	sp,#4
 744  0122               L25:
 745                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 747  0122 7b03          	ld	a,(OFST+1,sp)
 748  0124 a403          	and	a,#3
 749  0126 48            	sll	a
 750  0127 5f            	clrw	x
 751  0128 97            	ld	xl,a
 752  0129 a603          	ld	a,#3
 753  012b 5d            	tnzw	x
 754  012c 2704          	jreq	L45
 755  012e               L65:
 756  012e 48            	sll	a
 757  012f 5a            	decw	x
 758  0130 26fc          	jrne	L65
 759  0132               L45:
 760  0132 43            	cpl	a
 761  0133 6b01          	ld	(OFST-1,sp),a
 762                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 764  0135 7b03          	ld	a,(OFST+1,sp)
 765  0137 a403          	and	a,#3
 766  0139 48            	sll	a
 767  013a 5f            	clrw	x
 768  013b 97            	ld	xl,a
 769  013c 7b04          	ld	a,(OFST+2,sp)
 770  013e 5d            	tnzw	x
 771  013f 2704          	jreq	L06
 772  0141               L26:
 773  0141 48            	sll	a
 774  0142 5a            	decw	x
 775  0143 26fc          	jrne	L26
 776  0145               L06:
 777  0145 6b02          	ld	(OFST+0,sp),a
 778                     ; 228     switch (IrqNum)
 780  0147 7b03          	ld	a,(OFST+1,sp)
 782                     ; 314     default:
 782                     ; 315         break;
 783  0149 a119          	cp	a,#25
 784  014b 2407          	jruge	L46
 785  014d 5f            	clrw	x
 786  014e 97            	ld	xl,a
 787  014f 58            	sllw	x
 788  0150 de0032        	ldw	x,(L66,x)
 789  0153 fc            	jp	(x)
 790  0154               L46:
 791  0154 207c          	jra	L362
 792  0156               L702:
 793                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 793                     ; 232     case ITC_IRQ_AWU:
 793                     ; 233     case ITC_IRQ_CLK:
 793                     ; 234     case ITC_IRQ_PORTA:
 793                     ; 235         ITC->ISPR1 &= Mask;
 795  0156 c67f70        	ld	a,32624
 796  0159 1401          	and	a,(OFST-1,sp)
 797  015b c77f70        	ld	32624,a
 798                     ; 236         ITC->ISPR1 |= NewPriority;
 800  015e c67f70        	ld	a,32624
 801  0161 1a02          	or	a,(OFST+0,sp)
 802  0163 c77f70        	ld	32624,a
 803                     ; 237         break;
 805  0166 206a          	jra	L362
 806  0168               L112:
 807                     ; 239     case ITC_IRQ_PORTB:
 807                     ; 240     case ITC_IRQ_PORTC:
 807                     ; 241     case ITC_IRQ_PORTD:
 807                     ; 242     case ITC_IRQ_PORTE:
 807                     ; 243         ITC->ISPR2 &= Mask;
 809  0168 c67f71        	ld	a,32625
 810  016b 1401          	and	a,(OFST-1,sp)
 811  016d c77f71        	ld	32625,a
 812                     ; 244         ITC->ISPR2 |= NewPriority;
 814  0170 c67f71        	ld	a,32625
 815  0173 1a02          	or	a,(OFST+0,sp)
 816  0175 c77f71        	ld	32625,a
 817                     ; 245         break;
 819  0178 2058          	jra	L362
 820  017a               L312:
 821                     ; 255     case ITC_IRQ_SPI:
 821                     ; 256     case ITC_IRQ_TIM1_OVF:
 821                     ; 257         ITC->ISPR3 &= Mask;
 823  017a c67f72        	ld	a,32626
 824  017d 1401          	and	a,(OFST-1,sp)
 825  017f c77f72        	ld	32626,a
 826                     ; 258         ITC->ISPR3 |= NewPriority;
 828  0182 c67f72        	ld	a,32626
 829  0185 1a02          	or	a,(OFST+0,sp)
 830  0187 c77f72        	ld	32626,a
 831                     ; 259         break;
 833  018a 2046          	jra	L362
 834  018c               L512:
 835                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 835                     ; 262 #ifdef STM8S903
 835                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 835                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 835                     ; 265 #else
 835                     ; 266     case ITC_IRQ_TIM2_OVF:
 835                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 835                     ; 268 #endif /*STM8S903*/
 835                     ; 269 
 835                     ; 270     case ITC_IRQ_TIM3_OVF:
 835                     ; 271         ITC->ISPR4 &= Mask;
 837  018c c67f73        	ld	a,32627
 838  018f 1401          	and	a,(OFST-1,sp)
 839  0191 c77f73        	ld	32627,a
 840                     ; 272         ITC->ISPR4 |= NewPriority;
 842  0194 c67f73        	ld	a,32627
 843  0197 1a02          	or	a,(OFST+0,sp)
 844  0199 c77f73        	ld	32627,a
 845                     ; 273         break;
 847  019c 2034          	jra	L362
 848  019e               L712:
 849                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 849                     ; 276     case ITC_IRQ_UART1_TX:
 849                     ; 277     case ITC_IRQ_UART1_RX:
 849                     ; 278     case ITC_IRQ_I2C:
 849                     ; 279         ITC->ISPR5 &= Mask;
 851  019e c67f74        	ld	a,32628
 852  01a1 1401          	and	a,(OFST-1,sp)
 853  01a3 c77f74        	ld	32628,a
 854                     ; 280         ITC->ISPR5 |= NewPriority;
 856  01a6 c67f74        	ld	a,32628
 857  01a9 1a02          	or	a,(OFST+0,sp)
 858  01ab c77f74        	ld	32628,a
 859                     ; 281         break;
 861  01ae 2022          	jra	L362
 862  01b0               L122:
 863                     ; 297     case ITC_IRQ_ADC1:
 863                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 863                     ; 299 
 863                     ; 300 #ifdef STM8S903
 863                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 863                     ; 302 #else
 863                     ; 303     case ITC_IRQ_TIM4_OVF:
 863                     ; 304 #endif /*STM8S903*/
 863                     ; 305         ITC->ISPR6 &= Mask;
 865  01b0 c67f75        	ld	a,32629
 866  01b3 1401          	and	a,(OFST-1,sp)
 867  01b5 c77f75        	ld	32629,a
 868                     ; 306         ITC->ISPR6 |= NewPriority;
 870  01b8 c67f75        	ld	a,32629
 871  01bb 1a02          	or	a,(OFST+0,sp)
 872  01bd c77f75        	ld	32629,a
 873                     ; 307         break;
 875  01c0 2010          	jra	L362
 876  01c2               L322:
 877                     ; 309     case ITC_IRQ_EEPROM_EEC:
 877                     ; 310         ITC->ISPR7 &= Mask;
 879  01c2 c67f76        	ld	a,32630
 880  01c5 1401          	and	a,(OFST-1,sp)
 881  01c7 c77f76        	ld	32630,a
 882                     ; 311         ITC->ISPR7 |= NewPriority;
 884  01ca c67f76        	ld	a,32630
 885  01cd 1a02          	or	a,(OFST+0,sp)
 886  01cf c77f76        	ld	32630,a
 887                     ; 312         break;
 889  01d2               L522:
 890                     ; 314     default:
 890                     ; 315         break;
 892  01d2               L362:
 893                     ; 319 }
 896  01d2 5b04          	addw	sp,#4
 897  01d4 81            	ret
 910                     	xdef	_ITC_GetSoftwarePriority
 911                     	xdef	_ITC_SetSoftwarePriority
 912                     	xdef	_ITC_GetSoftIntStatus
 913                     	xdef	_ITC_DeInit
 914                     	xdef	_ITC_GetCPUCC
 915                     	xref	_assert_failed
 916                     	switch	.const
 917  0064               L102:
 918  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 919  0076 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 920  0088 685f64726976  	dc.b	"h_driver\src\stm8s"
 921  009a 5f6974632e63  	dc.b	"_itc.c",0
 941                     	end
