   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 44 void SPI_DeInit(void)
  32                     ; 45 {
  34                     	switch	.text
  35  0000               _SPI_DeInit:
  39                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  41  0000 725f5200      	clr	20992
  42                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  44  0004 725f5201      	clr	20993
  45                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  47  0008 725f5202      	clr	20994
  48                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  50  000c 35025203      	mov	20995,#2
  51                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  53  0010 35075205      	mov	20997,#7
  54                     ; 51 }
  57  0014 81            	ret
 374                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 374                     ; 73 {
 375                     	switch	.text
 376  0015               _SPI_Init:
 378  0015 89            	pushw	x
 379  0016 88            	push	a
 380       00000001      OFST:	set	1
 383                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 385  0017 9e            	ld	a,xh
 386  0018 4d            	tnz	a
 387  0019 2705          	jreq	L21
 388  001b 9e            	ld	a,xh
 389  001c a180          	cp	a,#128
 390  001e 2603          	jrne	L01
 391  0020               L21:
 392  0020 4f            	clr	a
 393  0021 2010          	jra	L41
 394  0023               L01:
 395  0023 ae004b        	ldw	x,#75
 396  0026 89            	pushw	x
 397  0027 ae0000        	ldw	x,#0
 398  002a 89            	pushw	x
 399  002b ae0000        	ldw	x,#L302
 400  002e cd0000        	call	_assert_failed
 402  0031 5b04          	addw	sp,#4
 403  0033               L41:
 404                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 406  0033 0d03          	tnz	(OFST+2,sp)
 407  0035 272a          	jreq	L02
 408  0037 7b03          	ld	a,(OFST+2,sp)
 409  0039 a108          	cp	a,#8
 410  003b 2724          	jreq	L02
 411  003d 7b03          	ld	a,(OFST+2,sp)
 412  003f a110          	cp	a,#16
 413  0041 271e          	jreq	L02
 414  0043 7b03          	ld	a,(OFST+2,sp)
 415  0045 a118          	cp	a,#24
 416  0047 2718          	jreq	L02
 417  0049 7b03          	ld	a,(OFST+2,sp)
 418  004b a120          	cp	a,#32
 419  004d 2712          	jreq	L02
 420  004f 7b03          	ld	a,(OFST+2,sp)
 421  0051 a128          	cp	a,#40
 422  0053 270c          	jreq	L02
 423  0055 7b03          	ld	a,(OFST+2,sp)
 424  0057 a130          	cp	a,#48
 425  0059 2706          	jreq	L02
 426  005b 7b03          	ld	a,(OFST+2,sp)
 427  005d a138          	cp	a,#56
 428  005f 2603          	jrne	L61
 429  0061               L02:
 430  0061 4f            	clr	a
 431  0062 2010          	jra	L22
 432  0064               L61:
 433  0064 ae004c        	ldw	x,#76
 434  0067 89            	pushw	x
 435  0068 ae0000        	ldw	x,#0
 436  006b 89            	pushw	x
 437  006c ae0000        	ldw	x,#L302
 438  006f cd0000        	call	_assert_failed
 440  0072 5b04          	addw	sp,#4
 441  0074               L22:
 442                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 444  0074 7b06          	ld	a,(OFST+5,sp)
 445  0076 a104          	cp	a,#4
 446  0078 2704          	jreq	L62
 447  007a 0d06          	tnz	(OFST+5,sp)
 448  007c 2603          	jrne	L42
 449  007e               L62:
 450  007e 4f            	clr	a
 451  007f 2010          	jra	L03
 452  0081               L42:
 453  0081 ae004d        	ldw	x,#77
 454  0084 89            	pushw	x
 455  0085 ae0000        	ldw	x,#0
 456  0088 89            	pushw	x
 457  0089 ae0000        	ldw	x,#L302
 458  008c cd0000        	call	_assert_failed
 460  008f 5b04          	addw	sp,#4
 461  0091               L03:
 462                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 464  0091 0d07          	tnz	(OFST+6,sp)
 465  0093 2706          	jreq	L43
 466  0095 7b07          	ld	a,(OFST+6,sp)
 467  0097 a102          	cp	a,#2
 468  0099 2603          	jrne	L23
 469  009b               L43:
 470  009b 4f            	clr	a
 471  009c 2010          	jra	L63
 472  009e               L23:
 473  009e ae004e        	ldw	x,#78
 474  00a1 89            	pushw	x
 475  00a2 ae0000        	ldw	x,#0
 476  00a5 89            	pushw	x
 477  00a6 ae0000        	ldw	x,#L302
 478  00a9 cd0000        	call	_assert_failed
 480  00ac 5b04          	addw	sp,#4
 481  00ae               L63:
 482                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 484  00ae 0d08          	tnz	(OFST+7,sp)
 485  00b0 2706          	jreq	L24
 486  00b2 7b08          	ld	a,(OFST+7,sp)
 487  00b4 a101          	cp	a,#1
 488  00b6 2603          	jrne	L04
 489  00b8               L24:
 490  00b8 4f            	clr	a
 491  00b9 2010          	jra	L44
 492  00bb               L04:
 493  00bb ae004f        	ldw	x,#79
 494  00be 89            	pushw	x
 495  00bf ae0000        	ldw	x,#0
 496  00c2 89            	pushw	x
 497  00c3 ae0000        	ldw	x,#L302
 498  00c6 cd0000        	call	_assert_failed
 500  00c9 5b04          	addw	sp,#4
 501  00cb               L44:
 502                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 504  00cb 0d09          	tnz	(OFST+8,sp)
 505  00cd 2712          	jreq	L05
 506  00cf 7b09          	ld	a,(OFST+8,sp)
 507  00d1 a104          	cp	a,#4
 508  00d3 270c          	jreq	L05
 509  00d5 7b09          	ld	a,(OFST+8,sp)
 510  00d7 a180          	cp	a,#128
 511  00d9 2706          	jreq	L05
 512  00db 7b09          	ld	a,(OFST+8,sp)
 513  00dd a1c0          	cp	a,#192
 514  00df 2603          	jrne	L64
 515  00e1               L05:
 516  00e1 4f            	clr	a
 517  00e2 2010          	jra	L25
 518  00e4               L64:
 519  00e4 ae0050        	ldw	x,#80
 520  00e7 89            	pushw	x
 521  00e8 ae0000        	ldw	x,#0
 522  00eb 89            	pushw	x
 523  00ec ae0000        	ldw	x,#L302
 524  00ef cd0000        	call	_assert_failed
 526  00f2 5b04          	addw	sp,#4
 527  00f4               L25:
 528                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 530  00f4 7b0a          	ld	a,(OFST+9,sp)
 531  00f6 a102          	cp	a,#2
 532  00f8 2704          	jreq	L65
 533  00fa 0d0a          	tnz	(OFST+9,sp)
 534  00fc 2603          	jrne	L45
 535  00fe               L65:
 536  00fe 4f            	clr	a
 537  00ff 2010          	jra	L06
 538  0101               L45:
 539  0101 ae0051        	ldw	x,#81
 540  0104 89            	pushw	x
 541  0105 ae0000        	ldw	x,#0
 542  0108 89            	pushw	x
 543  0109 ae0000        	ldw	x,#L302
 544  010c cd0000        	call	_assert_failed
 546  010f 5b04          	addw	sp,#4
 547  0111               L06:
 548                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 550  0111 0d0b          	tnz	(OFST+10,sp)
 551  0113 2703          	jreq	L26
 552  0115 4f            	clr	a
 553  0116 2010          	jra	L46
 554  0118               L26:
 555  0118 ae0052        	ldw	x,#82
 556  011b 89            	pushw	x
 557  011c ae0000        	ldw	x,#0
 558  011f 89            	pushw	x
 559  0120 ae0000        	ldw	x,#L302
 560  0123 cd0000        	call	_assert_failed
 562  0126 5b04          	addw	sp,#4
 563  0128               L46:
 564                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 564                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 566  0128 7b07          	ld	a,(OFST+6,sp)
 567  012a 1a08          	or	a,(OFST+7,sp)
 568  012c 6b01          	ld	(OFST+0,sp),a
 569  012e 7b02          	ld	a,(OFST+1,sp)
 570  0130 1a03          	or	a,(OFST+2,sp)
 571  0132 1a01          	or	a,(OFST+0,sp)
 572  0134 c75200        	ld	20992,a
 573                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 575  0137 7b09          	ld	a,(OFST+8,sp)
 576  0139 1a0a          	or	a,(OFST+9,sp)
 577  013b c75201        	ld	20993,a
 578                     ; 91     if (Mode == SPI_MODE_MASTER)
 580  013e 7b06          	ld	a,(OFST+5,sp)
 581  0140 a104          	cp	a,#4
 582  0142 2606          	jrne	L502
 583                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 585  0144 72105201      	bset	20993,#0
 587  0148 2004          	jra	L702
 588  014a               L502:
 589                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 591  014a 72115201      	bres	20993,#0
 592  014e               L702:
 593                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 595  014e c65200        	ld	a,20992
 596  0151 1a06          	or	a,(OFST+5,sp)
 597  0153 c75200        	ld	20992,a
 598                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 600  0156 7b0b          	ld	a,(OFST+10,sp)
 601  0158 c75205        	ld	20997,a
 602                     ; 105 }
 605  015b 5b03          	addw	sp,#3
 606  015d 81            	ret
 662                     ; 113 void SPI_Cmd(FunctionalState NewState)
 662                     ; 114 {
 663                     	switch	.text
 664  015e               _SPI_Cmd:
 666  015e 88            	push	a
 667       00000000      OFST:	set	0
 670                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 672  015f 4d            	tnz	a
 673  0160 2704          	jreq	L27
 674  0162 a101          	cp	a,#1
 675  0164 2603          	jrne	L07
 676  0166               L27:
 677  0166 4f            	clr	a
 678  0167 2010          	jra	L47
 679  0169               L07:
 680  0169 ae0074        	ldw	x,#116
 681  016c 89            	pushw	x
 682  016d ae0000        	ldw	x,#0
 683  0170 89            	pushw	x
 684  0171 ae0000        	ldw	x,#L302
 685  0174 cd0000        	call	_assert_failed
 687  0177 5b04          	addw	sp,#4
 688  0179               L47:
 689                     ; 118     if (NewState != DISABLE)
 691  0179 0d01          	tnz	(OFST+1,sp)
 692  017b 2706          	jreq	L732
 693                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 695  017d 721c5200      	bset	20992,#6
 697  0181 2004          	jra	L142
 698  0183               L732:
 699                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 701  0183 721d5200      	bres	20992,#6
 702  0187               L142:
 703                     ; 126 }
 706  0187 84            	pop	a
 707  0188 81            	ret
 817                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 817                     ; 136 {
 818                     	switch	.text
 819  0189               _SPI_ITConfig:
 821  0189 89            	pushw	x
 822  018a 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 137     uint8_t itpos = 0;
 828  018b 0f01          	clr	(OFST+0,sp)
 829                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 831  018d 9e            	ld	a,xh
 832  018e a117          	cp	a,#23
 833  0190 270f          	jreq	L201
 834  0192 9e            	ld	a,xh
 835  0193 a106          	cp	a,#6
 836  0195 270a          	jreq	L201
 837  0197 9e            	ld	a,xh
 838  0198 a105          	cp	a,#5
 839  019a 2705          	jreq	L201
 840  019c 9e            	ld	a,xh
 841  019d a134          	cp	a,#52
 842  019f 2603          	jrne	L001
 843  01a1               L201:
 844  01a1 4f            	clr	a
 845  01a2 2010          	jra	L401
 846  01a4               L001:
 847  01a4 ae008b        	ldw	x,#139
 848  01a7 89            	pushw	x
 849  01a8 ae0000        	ldw	x,#0
 850  01ab 89            	pushw	x
 851  01ac ae0000        	ldw	x,#L302
 852  01af cd0000        	call	_assert_failed
 854  01b2 5b04          	addw	sp,#4
 855  01b4               L401:
 856                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 858  01b4 0d03          	tnz	(OFST+2,sp)
 859  01b6 2706          	jreq	L011
 860  01b8 7b03          	ld	a,(OFST+2,sp)
 861  01ba a101          	cp	a,#1
 862  01bc 2603          	jrne	L601
 863  01be               L011:
 864  01be 4f            	clr	a
 865  01bf 2010          	jra	L211
 866  01c1               L601:
 867  01c1 ae008c        	ldw	x,#140
 868  01c4 89            	pushw	x
 869  01c5 ae0000        	ldw	x,#0
 870  01c8 89            	pushw	x
 871  01c9 ae0000        	ldw	x,#L302
 872  01cc cd0000        	call	_assert_failed
 874  01cf 5b04          	addw	sp,#4
 875  01d1               L211:
 876                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 878  01d1 7b02          	ld	a,(OFST+1,sp)
 879  01d3 a40f          	and	a,#15
 880  01d5 5f            	clrw	x
 881  01d6 97            	ld	xl,a
 882  01d7 a601          	ld	a,#1
 883  01d9 5d            	tnzw	x
 884  01da 2704          	jreq	L411
 885  01dc               L611:
 886  01dc 48            	sll	a
 887  01dd 5a            	decw	x
 888  01de 26fc          	jrne	L611
 889  01e0               L411:
 890  01e0 6b01          	ld	(OFST+0,sp),a
 891                     ; 145     if (NewState != DISABLE)
 893  01e2 0d03          	tnz	(OFST+2,sp)
 894  01e4 270a          	jreq	L313
 895                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 897  01e6 c65202        	ld	a,20994
 898  01e9 1a01          	or	a,(OFST+0,sp)
 899  01eb c75202        	ld	20994,a
 901  01ee 2009          	jra	L513
 902  01f0               L313:
 903                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 905  01f0 7b01          	ld	a,(OFST+0,sp)
 906  01f2 43            	cpl	a
 907  01f3 c45202        	and	a,20994
 908  01f6 c75202        	ld	20994,a
 909  01f9               L513:
 910                     ; 153 }
 913  01f9 5b03          	addw	sp,#3
 914  01fb 81            	ret
 948                     ; 159 void SPI_SendData(uint8_t Data)
 948                     ; 160 {
 949                     	switch	.text
 950  01fc               _SPI_SendData:
 954                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 956  01fc c75204        	ld	20996,a
 957                     ; 162 }
 960  01ff 81            	ret
 983                     ; 169 uint8_t SPI_ReceiveData(void)
 983                     ; 170 {
 984                     	switch	.text
 985  0200               _SPI_ReceiveData:
 989                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 991  0200 c65204        	ld	a,20996
 994  0203 81            	ret
1031                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1031                     ; 181 {
1032                     	switch	.text
1033  0204               _SPI_NSSInternalSoftwareCmd:
1035  0204 88            	push	a
1036       00000000      OFST:	set	0
1039                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1041  0205 4d            	tnz	a
1042  0206 2704          	jreq	L031
1043  0208 a101          	cp	a,#1
1044  020a 2603          	jrne	L621
1045  020c               L031:
1046  020c 4f            	clr	a
1047  020d 2010          	jra	L231
1048  020f               L621:
1049  020f ae00b7        	ldw	x,#183
1050  0212 89            	pushw	x
1051  0213 ae0000        	ldw	x,#0
1052  0216 89            	pushw	x
1053  0217 ae0000        	ldw	x,#L302
1054  021a cd0000        	call	_assert_failed
1056  021d 5b04          	addw	sp,#4
1057  021f               L231:
1058                     ; 185     if (NewState != DISABLE)
1060  021f 0d01          	tnz	(OFST+1,sp)
1061  0221 2706          	jreq	L363
1062                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1064  0223 72105201      	bset	20993,#0
1066  0227 2004          	jra	L563
1067  0229               L363:
1068                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1070  0229 72115201      	bres	20993,#0
1071  022d               L563:
1072                     ; 193 }
1075  022d 84            	pop	a
1076  022e 81            	ret
1099                     ; 200 void SPI_TransmitCRC(void)
1099                     ; 201 {
1100                     	switch	.text
1101  022f               _SPI_TransmitCRC:
1105                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1107  022f 72185201      	bset	20993,#4
1108                     ; 203 }
1111  0233 81            	ret
1148                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
1148                     ; 212 {
1149                     	switch	.text
1150  0234               _SPI_CalculateCRCCmd:
1152  0234 88            	push	a
1153       00000000      OFST:	set	0
1156                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1158  0235 4d            	tnz	a
1159  0236 2704          	jreq	L241
1160  0238 a101          	cp	a,#1
1161  023a 2603          	jrne	L041
1162  023c               L241:
1163  023c 4f            	clr	a
1164  023d 2010          	jra	L441
1165  023f               L041:
1166  023f ae00d6        	ldw	x,#214
1167  0242 89            	pushw	x
1168  0243 ae0000        	ldw	x,#0
1169  0246 89            	pushw	x
1170  0247 ae0000        	ldw	x,#L302
1171  024a cd0000        	call	_assert_failed
1173  024d 5b04          	addw	sp,#4
1174  024f               L441:
1175                     ; 216     if (NewState != DISABLE)
1177  024f 0d01          	tnz	(OFST+1,sp)
1178  0251 2706          	jreq	L514
1179                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1181  0253 721a5201      	bset	20993,#5
1183  0257 2004          	jra	L714
1184  0259               L514:
1185                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1187  0259 721b5201      	bres	20993,#5
1188  025d               L714:
1189                     ; 224 }
1192  025d 84            	pop	a
1193  025e 81            	ret
1258                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1258                     ; 232 {
1259                     	switch	.text
1260  025f               _SPI_GetCRC:
1262  025f 88            	push	a
1263  0260 88            	push	a
1264       00000001      OFST:	set	1
1267                     ; 233     uint8_t crcreg = 0;
1269  0261 0f01          	clr	(OFST+0,sp)
1270                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1272  0263 a101          	cp	a,#1
1273  0265 2703          	jreq	L251
1274  0267 4d            	tnz	a
1275  0268 2603          	jrne	L051
1276  026a               L251:
1277  026a 4f            	clr	a
1278  026b 2010          	jra	L451
1279  026d               L051:
1280  026d ae00ec        	ldw	x,#236
1281  0270 89            	pushw	x
1282  0271 ae0000        	ldw	x,#0
1283  0274 89            	pushw	x
1284  0275 ae0000        	ldw	x,#L302
1285  0278 cd0000        	call	_assert_failed
1287  027b 5b04          	addw	sp,#4
1288  027d               L451:
1289                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1291  027d 0d02          	tnz	(OFST+1,sp)
1292  027f 2707          	jreq	L354
1293                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1295  0281 c65207        	ld	a,20999
1296  0284 6b01          	ld	(OFST+0,sp),a
1298  0286 2005          	jra	L554
1299  0288               L354:
1300                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1302  0288 c65206        	ld	a,20998
1303  028b 6b01          	ld	(OFST+0,sp),a
1304  028d               L554:
1305                     ; 248     return crcreg;
1307  028d 7b01          	ld	a,(OFST+0,sp)
1310  028f 85            	popw	x
1311  0290 81            	ret
1336                     ; 256 void SPI_ResetCRC(void)
1336                     ; 257 {
1337                     	switch	.text
1338  0291               _SPI_ResetCRC:
1342                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1344  0291 a601          	ld	a,#1
1345  0293 ad9f          	call	_SPI_CalculateCRCCmd
1347                     ; 263     SPI_Cmd(ENABLE);
1349  0295 a601          	ld	a,#1
1350  0297 cd015e        	call	_SPI_Cmd
1352                     ; 264 }
1355  029a 81            	ret
1379                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1379                     ; 272 {
1380                     	switch	.text
1381  029b               _SPI_GetCRCPolynomial:
1385                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1387  029b c65205        	ld	a,20997
1390  029e 81            	ret
1447                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1447                     ; 282 {
1448                     	switch	.text
1449  029f               _SPI_BiDirectionalLineConfig:
1451  029f 88            	push	a
1452       00000000      OFST:	set	0
1455                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1457  02a0 4d            	tnz	a
1458  02a1 2704          	jreq	L661
1459  02a3 a101          	cp	a,#1
1460  02a5 2603          	jrne	L461
1461  02a7               L661:
1462  02a7 4f            	clr	a
1463  02a8 2010          	jra	L071
1464  02aa               L461:
1465  02aa ae011c        	ldw	x,#284
1466  02ad 89            	pushw	x
1467  02ae ae0000        	ldw	x,#0
1468  02b1 89            	pushw	x
1469  02b2 ae0000        	ldw	x,#L302
1470  02b5 cd0000        	call	_assert_failed
1472  02b8 5b04          	addw	sp,#4
1473  02ba               L071:
1474                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1476  02ba 0d01          	tnz	(OFST+1,sp)
1477  02bc 2706          	jreq	L525
1478                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1480  02be 721c5201      	bset	20993,#6
1482  02c2 2004          	jra	L725
1483  02c4               L525:
1484                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1486  02c4 721d5201      	bres	20993,#6
1487  02c8               L725:
1488                     ; 294 }
1491  02c8 84            	pop	a
1492  02c9 81            	ret
1614                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1614                     ; 305 {
1615                     	switch	.text
1616  02ca               _SPI_GetFlagStatus:
1618  02ca 88            	push	a
1619  02cb 88            	push	a
1620       00000001      OFST:	set	1
1623                     ; 306     FlagStatus status = RESET;
1625  02cc 0f01          	clr	(OFST+0,sp)
1626                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1628  02ce a140          	cp	a,#64
1629  02d0 2718          	jreq	L671
1630  02d2 a120          	cp	a,#32
1631  02d4 2714          	jreq	L671
1632  02d6 a110          	cp	a,#16
1633  02d8 2710          	jreq	L671
1634  02da a108          	cp	a,#8
1635  02dc 270c          	jreq	L671
1636  02de a102          	cp	a,#2
1637  02e0 2708          	jreq	L671
1638  02e2 a101          	cp	a,#1
1639  02e4 2704          	jreq	L671
1640  02e6 a180          	cp	a,#128
1641  02e8 2603          	jrne	L471
1642  02ea               L671:
1643  02ea 4f            	clr	a
1644  02eb 2010          	jra	L002
1645  02ed               L471:
1646  02ed ae0134        	ldw	x,#308
1647  02f0 89            	pushw	x
1648  02f1 ae0000        	ldw	x,#0
1649  02f4 89            	pushw	x
1650  02f5 ae0000        	ldw	x,#L302
1651  02f8 cd0000        	call	_assert_failed
1653  02fb 5b04          	addw	sp,#4
1654  02fd               L002:
1655                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1657  02fd c65203        	ld	a,20995
1658  0300 1502          	bcp	a,(OFST+1,sp)
1659  0302 2706          	jreq	L506
1660                     ; 313         status = SET; /* SPI_FLAG is set */
1662  0304 a601          	ld	a,#1
1663  0306 6b01          	ld	(OFST+0,sp),a
1665  0308 2002          	jra	L706
1666  030a               L506:
1667                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1669  030a 0f01          	clr	(OFST+0,sp)
1670  030c               L706:
1671                     ; 321     return status;
1673  030c 7b01          	ld	a,(OFST+0,sp)
1676  030e 85            	popw	x
1677  030f 81            	ret
1713                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1713                     ; 340 {
1714                     	switch	.text
1715  0310               _SPI_ClearFlag:
1717  0310 88            	push	a
1718       00000000      OFST:	set	0
1721                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1723  0311 a110          	cp	a,#16
1724  0313 2704          	jreq	L602
1725  0315 a108          	cp	a,#8
1726  0317 2603          	jrne	L402
1727  0319               L602:
1728  0319 4f            	clr	a
1729  031a 2010          	jra	L012
1730  031c               L402:
1731  031c ae0155        	ldw	x,#341
1732  031f 89            	pushw	x
1733  0320 ae0000        	ldw	x,#0
1734  0323 89            	pushw	x
1735  0324 ae0000        	ldw	x,#L302
1736  0327 cd0000        	call	_assert_failed
1738  032a 5b04          	addw	sp,#4
1739  032c               L012:
1740                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1742  032c 7b01          	ld	a,(OFST+1,sp)
1743  032e 43            	cpl	a
1744  032f c75203        	ld	20995,a
1745                     ; 344 }
1748  0332 84            	pop	a
1749  0333 81            	ret
1832                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1832                     ; 360 {
1833                     	switch	.text
1834  0334               _SPI_GetITStatus:
1836  0334 88            	push	a
1837  0335 89            	pushw	x
1838       00000002      OFST:	set	2
1841                     ; 361     ITStatus pendingbitstatus = RESET;
1843  0336 7b02          	ld	a,(OFST+0,sp)
1844  0338 97            	ld	xl,a
1845                     ; 362     uint8_t itpos = 0;
1847  0339 7b01          	ld	a,(OFST-1,sp)
1848  033b 97            	ld	xl,a
1849                     ; 363     uint8_t itmask1 = 0;
1851  033c 7b02          	ld	a,(OFST+0,sp)
1852  033e 97            	ld	xl,a
1853                     ; 364     uint8_t itmask2 = 0;
1855  033f 7b02          	ld	a,(OFST+0,sp)
1856  0341 97            	ld	xl,a
1857                     ; 365     uint8_t enablestatus = 0;
1859  0342 7b02          	ld	a,(OFST+0,sp)
1860  0344 97            	ld	xl,a
1861                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1863  0345 7b03          	ld	a,(OFST+1,sp)
1864  0347 a165          	cp	a,#101
1865  0349 271e          	jreq	L612
1866  034b 7b03          	ld	a,(OFST+1,sp)
1867  034d a155          	cp	a,#85
1868  034f 2718          	jreq	L612
1869  0351 7b03          	ld	a,(OFST+1,sp)
1870  0353 a145          	cp	a,#69
1871  0355 2712          	jreq	L612
1872  0357 7b03          	ld	a,(OFST+1,sp)
1873  0359 a134          	cp	a,#52
1874  035b 270c          	jreq	L612
1875  035d 7b03          	ld	a,(OFST+1,sp)
1876  035f a117          	cp	a,#23
1877  0361 2706          	jreq	L612
1878  0363 7b03          	ld	a,(OFST+1,sp)
1879  0365 a106          	cp	a,#6
1880  0367 2603          	jrne	L412
1881  0369               L612:
1882  0369 4f            	clr	a
1883  036a 2010          	jra	L022
1884  036c               L412:
1885  036c ae016e        	ldw	x,#366
1886  036f 89            	pushw	x
1887  0370 ae0000        	ldw	x,#0
1888  0373 89            	pushw	x
1889  0374 ae0000        	ldw	x,#L302
1890  0377 cd0000        	call	_assert_failed
1892  037a 5b04          	addw	sp,#4
1893  037c               L022:
1894                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1896  037c 7b03          	ld	a,(OFST+1,sp)
1897  037e a40f          	and	a,#15
1898  0380 5f            	clrw	x
1899  0381 97            	ld	xl,a
1900  0382 a601          	ld	a,#1
1901  0384 5d            	tnzw	x
1902  0385 2704          	jreq	L222
1903  0387               L422:
1904  0387 48            	sll	a
1905  0388 5a            	decw	x
1906  0389 26fc          	jrne	L422
1907  038b               L222:
1908  038b 6b01          	ld	(OFST-1,sp),a
1909                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1911  038d 7b03          	ld	a,(OFST+1,sp)
1912  038f 4e            	swap	a
1913  0390 a40f          	and	a,#15
1914  0392 6b02          	ld	(OFST+0,sp),a
1915                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1917  0394 7b02          	ld	a,(OFST+0,sp)
1918  0396 5f            	clrw	x
1919  0397 97            	ld	xl,a
1920  0398 a601          	ld	a,#1
1921  039a 5d            	tnzw	x
1922  039b 2704          	jreq	L622
1923  039d               L032:
1924  039d 48            	sll	a
1925  039e 5a            	decw	x
1926  039f 26fc          	jrne	L032
1927  03a1               L622:
1928  03a1 6b02          	ld	(OFST+0,sp),a
1929                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1931  03a3 c65203        	ld	a,20995
1932  03a6 1402          	and	a,(OFST+0,sp)
1933  03a8 6b02          	ld	(OFST+0,sp),a
1934                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1936  03aa c65202        	ld	a,20994
1937  03ad 1501          	bcp	a,(OFST-1,sp)
1938  03af 270a          	jreq	L176
1940  03b1 0d02          	tnz	(OFST+0,sp)
1941  03b3 2706          	jreq	L176
1942                     ; 380         pendingbitstatus = SET;
1944  03b5 a601          	ld	a,#1
1945  03b7 6b02          	ld	(OFST+0,sp),a
1947  03b9 2002          	jra	L376
1948  03bb               L176:
1949                     ; 385         pendingbitstatus = RESET;
1951  03bb 0f02          	clr	(OFST+0,sp)
1952  03bd               L376:
1953                     ; 388     return  pendingbitstatus;
1955  03bd 7b02          	ld	a,(OFST+0,sp)
1958  03bf 5b03          	addw	sp,#3
1959  03c1 81            	ret
2005                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
2005                     ; 405 {
2006                     	switch	.text
2007  03c2               _SPI_ClearITPendingBit:
2009  03c2 88            	push	a
2010  03c3 88            	push	a
2011       00000001      OFST:	set	1
2014                     ; 406     uint8_t itpos = 0;
2016  03c4 0f01          	clr	(OFST+0,sp)
2017                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
2019  03c6 a145          	cp	a,#69
2020  03c8 2704          	jreq	L632
2021  03ca a134          	cp	a,#52
2022  03cc 2603          	jrne	L432
2023  03ce               L632:
2024  03ce 4f            	clr	a
2025  03cf 2010          	jra	L042
2026  03d1               L432:
2027  03d1 ae0197        	ldw	x,#407
2028  03d4 89            	pushw	x
2029  03d5 ae0000        	ldw	x,#0
2030  03d8 89            	pushw	x
2031  03d9 ae0000        	ldw	x,#L302
2032  03dc cd0000        	call	_assert_failed
2034  03df 5b04          	addw	sp,#4
2035  03e1               L042:
2036                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2038  03e1 7b02          	ld	a,(OFST+1,sp)
2039  03e3 a4f0          	and	a,#240
2040  03e5 4e            	swap	a
2041  03e6 a40f          	and	a,#15
2042  03e8 5f            	clrw	x
2043  03e9 97            	ld	xl,a
2044  03ea a601          	ld	a,#1
2045  03ec 5d            	tnzw	x
2046  03ed 2704          	jreq	L242
2047  03ef               L442:
2048  03ef 48            	sll	a
2049  03f0 5a            	decw	x
2050  03f1 26fc          	jrne	L442
2051  03f3               L242:
2052  03f3 6b01          	ld	(OFST+0,sp),a
2053                     ; 414     SPI->SR = (uint8_t)(~itpos);
2055  03f5 7b01          	ld	a,(OFST+0,sp)
2056  03f7 43            	cpl	a
2057  03f8 c75203        	ld	20995,a
2058                     ; 416 }
2061  03fb 85            	popw	x
2062  03fc 81            	ret
2075                     	xdef	_SPI_ClearITPendingBit
2076                     	xdef	_SPI_GetITStatus
2077                     	xdef	_SPI_ClearFlag
2078                     	xdef	_SPI_GetFlagStatus
2079                     	xdef	_SPI_BiDirectionalLineConfig
2080                     	xdef	_SPI_GetCRCPolynomial
2081                     	xdef	_SPI_ResetCRC
2082                     	xdef	_SPI_GetCRC
2083                     	xdef	_SPI_CalculateCRCCmd
2084                     	xdef	_SPI_TransmitCRC
2085                     	xdef	_SPI_NSSInternalSoftwareCmd
2086                     	xdef	_SPI_ReceiveData
2087                     	xdef	_SPI_SendData
2088                     	xdef	_SPI_ITConfig
2089                     	xdef	_SPI_Cmd
2090                     	xdef	_SPI_Init
2091                     	xdef	_SPI_DeInit
2092                     	xref	_assert_failed
2093                     .const:	section	.text
2094  0000               L302:
2095  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2096  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2097  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
2098  0036 5f7370692e63  	dc.b	"_spi.c",0
2118                     	end
