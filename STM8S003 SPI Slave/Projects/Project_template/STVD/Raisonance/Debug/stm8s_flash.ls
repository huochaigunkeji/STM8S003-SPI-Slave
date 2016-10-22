   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  65                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  65                     ; 82 {
  67                     	switch	.text
  68  0000               _FLASH_Unlock:
  70  0000 88            	push	a
  71       00000000      OFST:	set	0
  74                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  76  0001 a1fd          	cp	a,#253
  77  0003 2704          	jreq	L01
  78  0005 a1f7          	cp	a,#247
  79  0007 2603          	jrne	L6
  80  0009               L01:
  81  0009 4f            	clr	a
  82  000a 2010          	jra	L21
  83  000c               L6:
  84  000c ae0054        	ldw	x,#84
  85  000f 89            	pushw	x
  86  0010 ae0000        	ldw	x,#0
  87  0013 89            	pushw	x
  88  0014 ae0010        	ldw	x,#L73
  89  0017 cd0000        	call	_assert_failed
  91  001a 5b04          	addw	sp,#4
  92  001c               L21:
  93                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  95  001c 7b01          	ld	a,(OFST+1,sp)
  96  001e a1fd          	cp	a,#253
  97  0020 260a          	jrne	L14
  98                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 100  0022 35565062      	mov	20578,#86
 101                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 103  0026 35ae5062      	mov	20578,#174
 105  002a 2008          	jra	L34
 106  002c               L14:
 107                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 109  002c 35ae5064      	mov	20580,#174
 110                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 112  0030 35565064      	mov	20580,#86
 113  0034               L34:
 114                     ; 98 }
 117  0034 84            	pop	a
 118  0035 81            	ret
 154                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 154                     ; 107 {
 155                     	switch	.text
 156  0036               _FLASH_Lock:
 158  0036 88            	push	a
 159       00000000      OFST:	set	0
 162                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 164  0037 a1fd          	cp	a,#253
 165  0039 2704          	jreq	L02
 166  003b a1f7          	cp	a,#247
 167  003d 2603          	jrne	L61
 168  003f               L02:
 169  003f 4f            	clr	a
 170  0040 2010          	jra	L22
 171  0042               L61:
 172  0042 ae006d        	ldw	x,#109
 173  0045 89            	pushw	x
 174  0046 ae0000        	ldw	x,#0
 175  0049 89            	pushw	x
 176  004a ae0010        	ldw	x,#L73
 177  004d cd0000        	call	_assert_failed
 179  0050 5b04          	addw	sp,#4
 180  0052               L22:
 181                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 183  0052 c6505f        	ld	a,20575
 184  0055 1401          	and	a,(OFST+1,sp)
 185  0057 c7505f        	ld	20575,a
 186                     ; 113 }
 189  005a 84            	pop	a
 190  005b 81            	ret
 213                     ; 120 void FLASH_DeInit(void)
 213                     ; 121 {
 214                     	switch	.text
 215  005c               _FLASH_DeInit:
 219                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 221  005c 725f505a      	clr	20570
 222                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 224  0060 725f505b      	clr	20571
 225                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 227  0064 35ff505c      	mov	20572,#255
 228                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 230  0068 7217505f      	bres	20575,#3
 231                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 233  006c 7213505f      	bres	20575,#1
 234                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 236  0070 c6505f        	ld	a,20575
 237  0073 97            	ld	xl,a
 238                     ; 128 }
 241  0074 81            	ret
 297                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 297                     ; 137 {
 298                     	switch	.text
 299  0075               _FLASH_ITConfig:
 301  0075 88            	push	a
 302       00000000      OFST:	set	0
 305                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 307  0076 4d            	tnz	a
 308  0077 2704          	jreq	L23
 309  0079 a101          	cp	a,#1
 310  007b 2603          	jrne	L03
 311  007d               L23:
 312  007d 4f            	clr	a
 313  007e 2010          	jra	L43
 314  0080               L03:
 315  0080 ae008b        	ldw	x,#139
 316  0083 89            	pushw	x
 317  0084 ae0000        	ldw	x,#0
 318  0087 89            	pushw	x
 319  0088 ae0010        	ldw	x,#L73
 320  008b cd0000        	call	_assert_failed
 322  008e 5b04          	addw	sp,#4
 323  0090               L43:
 324                     ; 141     if (NewState != DISABLE)
 326  0090 0d01          	tnz	(OFST+1,sp)
 327  0092 2706          	jreq	L121
 328                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 330  0094 7212505a      	bset	20570,#1
 332  0098 2004          	jra	L321
 333  009a               L121:
 334                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 336  009a 7213505a      	bres	20570,#1
 337  009e               L321:
 338                     ; 149 }
 341  009e 84            	pop	a
 342  009f 81            	ret
 377                     .const:	section	.text
 378  0000               L64:
 379  0000 00008000      	dc.l	32768
 380  0004               L05:
 381  0004 0000a000      	dc.l	40960
 382  0008               L25:
 383  0008 00004000      	dc.l	16384
 384  000c               L45:
 385  000c 00004280      	dc.l	17024
 386                     ; 158 void FLASH_EraseByte(uint32_t Address)
 386                     ; 159 {
 387                     	switch	.text
 388  00a0               _FLASH_EraseByte:
 390       00000000      OFST:	set	0
 393                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 395  00a0 96            	ldw	x,sp
 396  00a1 1c0003        	addw	x,#OFST+3
 397  00a4 cd0000        	call	c_ltor
 399  00a7 ae0000        	ldw	x,#L64
 400  00aa cd0000        	call	c_lcmp
 402  00ad 250f          	jrult	L44
 403  00af 96            	ldw	x,sp
 404  00b0 1c0003        	addw	x,#OFST+3
 405  00b3 cd0000        	call	c_ltor
 407  00b6 ae0004        	ldw	x,#L05
 408  00b9 cd0000        	call	c_lcmp
 410  00bc 251e          	jrult	L24
 411  00be               L44:
 412  00be 96            	ldw	x,sp
 413  00bf 1c0003        	addw	x,#OFST+3
 414  00c2 cd0000        	call	c_ltor
 416  00c5 ae0008        	ldw	x,#L25
 417  00c8 cd0000        	call	c_lcmp
 419  00cb 2512          	jrult	L04
 420  00cd 96            	ldw	x,sp
 421  00ce 1c0003        	addw	x,#OFST+3
 422  00d1 cd0000        	call	c_ltor
 424  00d4 ae000c        	ldw	x,#L45
 425  00d7 cd0000        	call	c_lcmp
 427  00da 2403          	jruge	L04
 428  00dc               L24:
 429  00dc 4f            	clr	a
 430  00dd 2010          	jra	L65
 431  00df               L04:
 432  00df ae00a1        	ldw	x,#161
 433  00e2 89            	pushw	x
 434  00e3 ae0000        	ldw	x,#0
 435  00e6 89            	pushw	x
 436  00e7 ae0010        	ldw	x,#L73
 437  00ea cd0000        	call	_assert_failed
 439  00ed 5b04          	addw	sp,#4
 440  00ef               L65:
 441                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 443  00ef 1e05          	ldw	x,(OFST+5,sp)
 444  00f1 7f            	clr	(x)
 445                     ; 166 }
 448  00f2 81            	ret
 492                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 492                     ; 177 {
 493                     	switch	.text
 494  00f3               _FLASH_ProgramByte:
 496       00000000      OFST:	set	0
 499                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 501  00f3 96            	ldw	x,sp
 502  00f4 1c0003        	addw	x,#OFST+3
 503  00f7 cd0000        	call	c_ltor
 505  00fa ae0000        	ldw	x,#L64
 506  00fd cd0000        	call	c_lcmp
 508  0100 250f          	jrult	L66
 509  0102 96            	ldw	x,sp
 510  0103 1c0003        	addw	x,#OFST+3
 511  0106 cd0000        	call	c_ltor
 513  0109 ae0004        	ldw	x,#L05
 514  010c cd0000        	call	c_lcmp
 516  010f 251e          	jrult	L46
 517  0111               L66:
 518  0111 96            	ldw	x,sp
 519  0112 1c0003        	addw	x,#OFST+3
 520  0115 cd0000        	call	c_ltor
 522  0118 ae0008        	ldw	x,#L25
 523  011b cd0000        	call	c_lcmp
 525  011e 2512          	jrult	L26
 526  0120 96            	ldw	x,sp
 527  0121 1c0003        	addw	x,#OFST+3
 528  0124 cd0000        	call	c_ltor
 530  0127 ae000c        	ldw	x,#L45
 531  012a cd0000        	call	c_lcmp
 533  012d 2403          	jruge	L26
 534  012f               L46:
 535  012f 4f            	clr	a
 536  0130 2010          	jra	L07
 537  0132               L26:
 538  0132 ae00b3        	ldw	x,#179
 539  0135 89            	pushw	x
 540  0136 ae0000        	ldw	x,#0
 541  0139 89            	pushw	x
 542  013a ae0010        	ldw	x,#L73
 543  013d cd0000        	call	_assert_failed
 545  0140 5b04          	addw	sp,#4
 546  0142               L07:
 547                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 549  0142 7b07          	ld	a,(OFST+7,sp)
 550  0144 1e05          	ldw	x,(OFST+5,sp)
 551  0146 f7            	ld	(x),a
 552                     ; 181 }
 555  0147 81            	ret
 590                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 590                     ; 191 {
 591                     	switch	.text
 592  0148               _FLASH_ReadByte:
 594       00000000      OFST:	set	0
 597                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 599  0148 96            	ldw	x,sp
 600  0149 1c0003        	addw	x,#OFST+3
 601  014c cd0000        	call	c_ltor
 603  014f ae0000        	ldw	x,#L64
 604  0152 cd0000        	call	c_lcmp
 606  0155 250f          	jrult	L001
 607  0157 96            	ldw	x,sp
 608  0158 1c0003        	addw	x,#OFST+3
 609  015b cd0000        	call	c_ltor
 611  015e ae0004        	ldw	x,#L05
 612  0161 cd0000        	call	c_lcmp
 614  0164 251e          	jrult	L67
 615  0166               L001:
 616  0166 96            	ldw	x,sp
 617  0167 1c0003        	addw	x,#OFST+3
 618  016a cd0000        	call	c_ltor
 620  016d ae0008        	ldw	x,#L25
 621  0170 cd0000        	call	c_lcmp
 623  0173 2512          	jrult	L47
 624  0175 96            	ldw	x,sp
 625  0176 1c0003        	addw	x,#OFST+3
 626  0179 cd0000        	call	c_ltor
 628  017c ae000c        	ldw	x,#L45
 629  017f cd0000        	call	c_lcmp
 631  0182 2403          	jruge	L47
 632  0184               L67:
 633  0184 4f            	clr	a
 634  0185 2010          	jra	L201
 635  0187               L47:
 636  0187 ae00c1        	ldw	x,#193
 637  018a 89            	pushw	x
 638  018b ae0000        	ldw	x,#0
 639  018e 89            	pushw	x
 640  018f ae0010        	ldw	x,#L73
 641  0192 cd0000        	call	_assert_failed
 643  0195 5b04          	addw	sp,#4
 644  0197               L201:
 645                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 647  0197 1e05          	ldw	x,(OFST+5,sp)
 648  0199 f6            	ld	a,(x)
 651  019a 81            	ret
 695                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 695                     ; 208 {
 696                     	switch	.text
 697  019b               _FLASH_ProgramWord:
 699       00000000      OFST:	set	0
 702                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 704  019b 96            	ldw	x,sp
 705  019c 1c0003        	addw	x,#OFST+3
 706  019f cd0000        	call	c_ltor
 708  01a2 ae0000        	ldw	x,#L64
 709  01a5 cd0000        	call	c_lcmp
 711  01a8 250f          	jrult	L211
 712  01aa 96            	ldw	x,sp
 713  01ab 1c0003        	addw	x,#OFST+3
 714  01ae cd0000        	call	c_ltor
 716  01b1 ae0004        	ldw	x,#L05
 717  01b4 cd0000        	call	c_lcmp
 719  01b7 251e          	jrult	L011
 720  01b9               L211:
 721  01b9 96            	ldw	x,sp
 722  01ba 1c0003        	addw	x,#OFST+3
 723  01bd cd0000        	call	c_ltor
 725  01c0 ae0008        	ldw	x,#L25
 726  01c3 cd0000        	call	c_lcmp
 728  01c6 2512          	jrult	L601
 729  01c8 96            	ldw	x,sp
 730  01c9 1c0003        	addw	x,#OFST+3
 731  01cc cd0000        	call	c_ltor
 733  01cf ae000c        	ldw	x,#L45
 734  01d2 cd0000        	call	c_lcmp
 736  01d5 2403          	jruge	L601
 737  01d7               L011:
 738  01d7 4f            	clr	a
 739  01d8 2010          	jra	L411
 740  01da               L601:
 741  01da ae00d2        	ldw	x,#210
 742  01dd 89            	pushw	x
 743  01de ae0000        	ldw	x,#0
 744  01e1 89            	pushw	x
 745  01e2 ae0010        	ldw	x,#L73
 746  01e5 cd0000        	call	_assert_failed
 748  01e8 5b04          	addw	sp,#4
 749  01ea               L411:
 750                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 752  01ea 721c505b      	bset	20571,#6
 753                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 755  01ee 721d505c      	bres	20572,#6
 756                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 758  01f2 7b07          	ld	a,(OFST+7,sp)
 759  01f4 1e05          	ldw	x,(OFST+5,sp)
 760  01f6 f7            	ld	(x),a
 761                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 763  01f7 7b08          	ld	a,(OFST+8,sp)
 764  01f9 1e05          	ldw	x,(OFST+5,sp)
 765  01fb e701          	ld	(1,x),a
 766                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 768  01fd 7b09          	ld	a,(OFST+9,sp)
 769  01ff 1e05          	ldw	x,(OFST+5,sp)
 770  0201 e702          	ld	(2,x),a
 771                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 773  0203 7b0a          	ld	a,(OFST+10,sp)
 774  0205 1e05          	ldw	x,(OFST+5,sp)
 775  0207 e703          	ld	(3,x),a
 776                     ; 224 }
 779  0209 81            	ret
 825                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 825                     ; 233 {
 826                     	switch	.text
 827  020a               _FLASH_ProgramOptionByte:
 829  020a 89            	pushw	x
 830       00000000      OFST:	set	0
 833                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 835  020b a34800        	cpw	x,#18432
 836  020e 2508          	jrult	L021
 837  0210 a34880        	cpw	x,#18560
 838  0213 2403          	jruge	L021
 839  0215 4f            	clr	a
 840  0216 2010          	jra	L221
 841  0218               L021:
 842  0218 ae00eb        	ldw	x,#235
 843  021b 89            	pushw	x
 844  021c ae0000        	ldw	x,#0
 845  021f 89            	pushw	x
 846  0220 ae0010        	ldw	x,#L73
 847  0223 cd0000        	call	_assert_failed
 849  0226 5b04          	addw	sp,#4
 850  0228               L221:
 851                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 853  0228 721e505b      	bset	20571,#7
 854                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 856  022c 721f505c      	bres	20572,#7
 857                     ; 242     if (Address == 0x4800)
 859  0230 1e01          	ldw	x,(OFST+1,sp)
 860  0232 a34800        	cpw	x,#18432
 861  0235 2607          	jrne	L742
 862                     ; 245        *((NEAR uint8_t*)Address) = Data;
 864  0237 7b05          	ld	a,(OFST+5,sp)
 865  0239 1e01          	ldw	x,(OFST+1,sp)
 866  023b f7            	ld	(x),a
 868  023c 200c          	jra	L152
 869  023e               L742:
 870                     ; 250        *((NEAR uint8_t*)Address) = Data;
 872  023e 7b05          	ld	a,(OFST+5,sp)
 873  0240 1e01          	ldw	x,(OFST+1,sp)
 874  0242 f7            	ld	(x),a
 875                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 877  0243 7b05          	ld	a,(OFST+5,sp)
 878  0245 43            	cpl	a
 879  0246 1e01          	ldw	x,(OFST+1,sp)
 880  0248 e701          	ld	(1,x),a
 881  024a               L152:
 882                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 884  024a a6fd          	ld	a,#253
 885  024c cd03f3        	call	_FLASH_WaitForLastOperation
 887                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 889  024f 721f505b      	bres	20571,#7
 890                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 892  0253 721e505c      	bset	20572,#7
 893                     ; 258 }
 896  0257 85            	popw	x
 897  0258 81            	ret
 934                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 934                     ; 266 {
 935                     	switch	.text
 936  0259               _FLASH_EraseOptionByte:
 938  0259 89            	pushw	x
 939       00000000      OFST:	set	0
 942                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 944  025a a34800        	cpw	x,#18432
 945  025d 2508          	jrult	L621
 946  025f a34880        	cpw	x,#18560
 947  0262 2403          	jruge	L621
 948  0264 4f            	clr	a
 949  0265 2010          	jra	L031
 950  0267               L621:
 951  0267 ae010c        	ldw	x,#268
 952  026a 89            	pushw	x
 953  026b ae0000        	ldw	x,#0
 954  026e 89            	pushw	x
 955  026f ae0010        	ldw	x,#L73
 956  0272 cd0000        	call	_assert_failed
 958  0275 5b04          	addw	sp,#4
 959  0277               L031:
 960                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 962  0277 721e505b      	bset	20571,#7
 963                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 965  027b 721f505c      	bres	20572,#7
 966                     ; 275      if (Address == 0x4800)
 968  027f 1e01          	ldw	x,(OFST+1,sp)
 969  0281 a34800        	cpw	x,#18432
 970  0284 2605          	jrne	L172
 971                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 973  0286 1e01          	ldw	x,(OFST+1,sp)
 974  0288 7f            	clr	(x)
 976  0289 2009          	jra	L372
 977  028b               L172:
 978                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 980  028b 1e01          	ldw	x,(OFST+1,sp)
 981  028d 7f            	clr	(x)
 982                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 984  028e 1e01          	ldw	x,(OFST+1,sp)
 985  0290 a6ff          	ld	a,#255
 986  0292 e701          	ld	(1,x),a
 987  0294               L372:
 988                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 990  0294 a6fd          	ld	a,#253
 991  0296 cd03f3        	call	_FLASH_WaitForLastOperation
 993                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 995  0299 721f505b      	bres	20571,#7
 996                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 998  029d 721e505c      	bset	20572,#7
 999                     ; 291 }
1002  02a1 85            	popw	x
1003  02a2 81            	ret
1067                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1067                     ; 298 {
1068                     	switch	.text
1069  02a3               _FLASH_ReadOptionByte:
1071  02a3 89            	pushw	x
1072  02a4 5204          	subw	sp,#4
1073       00000004      OFST:	set	4
1076                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1078  02a6 7b01          	ld	a,(OFST-3,sp)
1079  02a8 97            	ld	xl,a
1080                     ; 300     uint16_t res_value = 0;
1082  02a9 1e03          	ldw	x,(OFST-1,sp)
1083                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1085  02ab 1e05          	ldw	x,(OFST+1,sp)
1086  02ad a34800        	cpw	x,#18432
1087  02b0 250a          	jrult	L431
1088  02b2 1e05          	ldw	x,(OFST+1,sp)
1089  02b4 a34880        	cpw	x,#18560
1090  02b7 2403          	jruge	L431
1091  02b9 4f            	clr	a
1092  02ba 2010          	jra	L631
1093  02bc               L431:
1094  02bc ae012f        	ldw	x,#303
1095  02bf 89            	pushw	x
1096  02c0 ae0000        	ldw	x,#0
1097  02c3 89            	pushw	x
1098  02c4 ae0010        	ldw	x,#L73
1099  02c7 cd0000        	call	_assert_failed
1101  02ca 5b04          	addw	sp,#4
1102  02cc               L631:
1103                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1105  02cc 1e05          	ldw	x,(OFST+1,sp)
1106  02ce f6            	ld	a,(x)
1107  02cf 6b02          	ld	(OFST-2,sp),a
1108                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1110  02d1 1e05          	ldw	x,(OFST+1,sp)
1111  02d3 e601          	ld	a,(1,x)
1112  02d5 6b01          	ld	(OFST-3,sp),a
1113                     ; 310     if (Address == 0x4800)	 
1115  02d7 1e05          	ldw	x,(OFST+1,sp)
1116  02d9 a34800        	cpw	x,#18432
1117  02dc 2608          	jrne	L723
1118                     ; 312         res_value =	 value_optbyte;
1120  02de 7b02          	ld	a,(OFST-2,sp)
1121  02e0 5f            	clrw	x
1122  02e1 97            	ld	xl,a
1123  02e2 1f03          	ldw	(OFST-1,sp),x
1125  02e4 2023          	jra	L133
1126  02e6               L723:
1127                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1129  02e6 7b01          	ld	a,(OFST-3,sp)
1130  02e8 43            	cpl	a
1131  02e9 1102          	cp	a,(OFST-2,sp)
1132  02eb 2617          	jrne	L333
1133                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1135  02ed 7b02          	ld	a,(OFST-2,sp)
1136  02ef 5f            	clrw	x
1137  02f0 97            	ld	xl,a
1138  02f1 4f            	clr	a
1139  02f2 02            	rlwa	x,a
1140  02f3 1f03          	ldw	(OFST-1,sp),x
1141                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1143  02f5 7b01          	ld	a,(OFST-3,sp)
1144  02f7 5f            	clrw	x
1145  02f8 97            	ld	xl,a
1146  02f9 01            	rrwa	x,a
1147  02fa 1a04          	or	a,(OFST+0,sp)
1148  02fc 01            	rrwa	x,a
1149  02fd 1a03          	or	a,(OFST-1,sp)
1150  02ff 01            	rrwa	x,a
1151  0300 1f03          	ldw	(OFST-1,sp),x
1153  0302 2005          	jra	L133
1154  0304               L333:
1155                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1157  0304 ae5555        	ldw	x,#21845
1158  0307 1f03          	ldw	(OFST-1,sp),x
1159  0309               L133:
1160                     ; 326     return(res_value);
1162  0309 1e03          	ldw	x,(OFST-1,sp)
1165  030b 5b06          	addw	sp,#6
1166  030d 81            	ret
1241                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1241                     ; 336 {
1242                     	switch	.text
1243  030e               _FLASH_SetLowPowerMode:
1245  030e 88            	push	a
1246       00000000      OFST:	set	0
1249                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1251  030f a104          	cp	a,#4
1252  0311 270b          	jreq	L441
1253  0313 a108          	cp	a,#8
1254  0315 2707          	jreq	L441
1255  0317 4d            	tnz	a
1256  0318 2704          	jreq	L441
1257  031a a10c          	cp	a,#12
1258  031c 2603          	jrne	L241
1259  031e               L441:
1260  031e 4f            	clr	a
1261  031f 2010          	jra	L641
1262  0321               L241:
1263  0321 ae0152        	ldw	x,#338
1264  0324 89            	pushw	x
1265  0325 ae0000        	ldw	x,#0
1266  0328 89            	pushw	x
1267  0329 ae0010        	ldw	x,#L73
1268  032c cd0000        	call	_assert_failed
1270  032f 5b04          	addw	sp,#4
1271  0331               L641:
1272                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1274  0331 c6505a        	ld	a,20570
1275  0334 a4f3          	and	a,#243
1276  0336 c7505a        	ld	20570,a
1277                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1279  0339 c6505a        	ld	a,20570
1280  033c 1a01          	or	a,(OFST+1,sp)
1281  033e c7505a        	ld	20570,a
1282                     ; 345 }
1285  0341 84            	pop	a
1286  0342 81            	ret
1345                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1345                     ; 354 {
1346                     	switch	.text
1347  0343               _FLASH_SetProgrammingTime:
1349  0343 88            	push	a
1350       00000000      OFST:	set	0
1353                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1355  0344 4d            	tnz	a
1356  0345 2704          	jreq	L451
1357  0347 a101          	cp	a,#1
1358  0349 2603          	jrne	L251
1359  034b               L451:
1360  034b 4f            	clr	a
1361  034c 2010          	jra	L651
1362  034e               L251:
1363  034e ae0164        	ldw	x,#356
1364  0351 89            	pushw	x
1365  0352 ae0000        	ldw	x,#0
1366  0355 89            	pushw	x
1367  0356 ae0010        	ldw	x,#L73
1368  0359 cd0000        	call	_assert_failed
1370  035c 5b04          	addw	sp,#4
1371  035e               L651:
1372                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1374  035e 7211505a      	bres	20570,#0
1375                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1377  0362 c6505a        	ld	a,20570
1378  0365 1a01          	or	a,(OFST+1,sp)
1379  0367 c7505a        	ld	20570,a
1380                     ; 360 }
1383  036a 84            	pop	a
1384  036b 81            	ret
1409                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1409                     ; 368 {
1410                     	switch	.text
1411  036c               _FLASH_GetLowPowerMode:
1415                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1417  036c c6505a        	ld	a,20570
1418  036f a40c          	and	a,#12
1421  0371 81            	ret
1446                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1446                     ; 378 {
1447                     	switch	.text
1448  0372               _FLASH_GetProgrammingTime:
1452                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1454  0372 c6505a        	ld	a,20570
1455  0375 a401          	and	a,#1
1458  0377 81            	ret
1492                     ; 387 uint32_t FLASH_GetBootSize(void)
1492                     ; 388 {
1493                     	switch	.text
1494  0378               _FLASH_GetBootSize:
1496  0378 5204          	subw	sp,#4
1497       00000004      OFST:	set	4
1500                     ; 389     uint32_t temp = 0;
1502  037a ae0000        	ldw	x,#0
1503  037d 1f03          	ldw	(OFST-1,sp),x
1504  037f ae0000        	ldw	x,#0
1505  0382 1f01          	ldw	(OFST-3,sp),x
1506                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1508  0384 c6505d        	ld	a,20573
1509  0387 5f            	clrw	x
1510  0388 97            	ld	xl,a
1511  0389 90ae0200      	ldw	y,#512
1512  038d cd0000        	call	c_umul
1514  0390 96            	ldw	x,sp
1515  0391 1c0001        	addw	x,#OFST-3
1516  0394 cd0000        	call	c_rtol
1518                     ; 395     if (FLASH->FPR == 0xFF)
1520  0397 c6505d        	ld	a,20573
1521  039a a1ff          	cp	a,#255
1522  039c 2611          	jrne	L554
1523                     ; 397         temp += 512;
1525  039e ae0200        	ldw	x,#512
1526  03a1 bf02          	ldw	c_lreg+2,x
1527  03a3 ae0000        	ldw	x,#0
1528  03a6 bf00          	ldw	c_lreg,x
1529  03a8 96            	ldw	x,sp
1530  03a9 1c0001        	addw	x,#OFST-3
1531  03ac cd0000        	call	c_lgadd
1533  03af               L554:
1534                     ; 401     return(temp);
1536  03af 96            	ldw	x,sp
1537  03b0 1c0001        	addw	x,#OFST-3
1538  03b3 cd0000        	call	c_ltor
1542  03b6 5b04          	addw	sp,#4
1543  03b8 81            	ret
1646                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1646                     ; 413 {
1647                     	switch	.text
1648  03b9               _FLASH_GetFlagStatus:
1650  03b9 88            	push	a
1651  03ba 88            	push	a
1652       00000001      OFST:	set	1
1655                     ; 414     FlagStatus status = RESET;
1657  03bb 0f01          	clr	(OFST+0,sp)
1658                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1660  03bd a108          	cp	a,#8
1661  03bf 270c          	jreq	L271
1662  03c1 a104          	cp	a,#4
1663  03c3 2708          	jreq	L271
1664  03c5 a102          	cp	a,#2
1665  03c7 2704          	jreq	L271
1666  03c9 a101          	cp	a,#1
1667  03cb 2603          	jrne	L071
1668  03cd               L271:
1669  03cd 4f            	clr	a
1670  03ce 2010          	jra	L471
1671  03d0               L071:
1672  03d0 ae01a0        	ldw	x,#416
1673  03d3 89            	pushw	x
1674  03d4 ae0000        	ldw	x,#0
1675  03d7 89            	pushw	x
1676  03d8 ae0010        	ldw	x,#L73
1677  03db cd0000        	call	_assert_failed
1679  03de 5b04          	addw	sp,#4
1680  03e0               L471:
1681                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1683  03e0 c6505f        	ld	a,20575
1684  03e3 1502          	bcp	a,(OFST+1,sp)
1685  03e5 2706          	jreq	L525
1686                     ; 421         status = SET; /* FLASH_FLAG is set */
1688  03e7 a601          	ld	a,#1
1689  03e9 6b01          	ld	(OFST+0,sp),a
1691  03eb 2002          	jra	L725
1692  03ed               L525:
1693                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1695  03ed 0f01          	clr	(OFST+0,sp)
1696  03ef               L725:
1697                     ; 429     return status;
1699  03ef 7b01          	ld	a,(OFST+0,sp)
1702  03f1 85            	popw	x
1703  03f2 81            	ret
1788                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1788                     ; 532 {
1789                     	switch	.text
1790  03f3               _FLASH_WaitForLastOperation:
1792  03f3 5205          	subw	sp,#5
1793       00000005      OFST:	set	5
1796                     ; 533     uint8_t flagstatus = 0x00;
1798  03f5 0f05          	clr	(OFST+0,sp)
1799                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1801  03f7 aeffff        	ldw	x,#65535
1802  03fa 1f03          	ldw	(OFST-2,sp),x
1803  03fc ae000f        	ldw	x,#15
1804  03ff 1f01          	ldw	(OFST-4,sp),x
1806  0401 2010          	jra	L575
1807  0403               L175:
1808                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1810  0403 c6505f        	ld	a,20575
1811  0406 a405          	and	a,#5
1812  0408 6b05          	ld	(OFST+0,sp),a
1813                     ; 561         timeout--;
1815  040a 96            	ldw	x,sp
1816  040b 1c0001        	addw	x,#OFST-4
1817  040e a601          	ld	a,#1
1818  0410 cd0000        	call	c_lgsbc
1820  0413               L575:
1821                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1823  0413 0d05          	tnz	(OFST+0,sp)
1824  0415 2609          	jrne	L106
1826  0417 96            	ldw	x,sp
1827  0418 1c0001        	addw	x,#OFST-4
1828  041b cd0000        	call	c_lzmp
1830  041e 26e3          	jrne	L175
1831  0420               L106:
1832                     ; 566     if (timeout == 0x00 )
1834  0420 96            	ldw	x,sp
1835  0421 1c0001        	addw	x,#OFST-4
1836  0424 cd0000        	call	c_lzmp
1838  0427 2604          	jrne	L306
1839                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1841  0429 a602          	ld	a,#2
1842  042b 6b05          	ld	(OFST+0,sp),a
1843  042d               L306:
1844                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1846  042d 7b05          	ld	a,(OFST+0,sp)
1849  042f 5b05          	addw	sp,#5
1850  0431 81            	ret
1914                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1914                     ; 582 {
1915                     	switch	.text
1916  0432               _FLASH_EraseBlock:
1918  0432 89            	pushw	x
1919  0433 5206          	subw	sp,#6
1920       00000006      OFST:	set	6
1923                     ; 583   uint32_t startaddress = 0;
1925  0435 96            	ldw	x,sp
1926  0436 1c0003        	addw	x,#OFST-3
1927  0439 cd0000        	call	c_ltor
1929                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1931  043c 7b0b          	ld	a,(OFST+5,sp)
1932  043e a1fd          	cp	a,#253
1933  0440 2706          	jreq	L402
1934  0442 7b0b          	ld	a,(OFST+5,sp)
1935  0444 a1f7          	cp	a,#247
1936  0446 2603          	jrne	L202
1937  0448               L402:
1938  0448 4f            	clr	a
1939  0449 2010          	jra	L602
1940  044b               L202:
1941  044b ae0251        	ldw	x,#593
1942  044e 89            	pushw	x
1943  044f ae0000        	ldw	x,#0
1944  0452 89            	pushw	x
1945  0453 ae0010        	ldw	x,#L73
1946  0456 cd0000        	call	_assert_failed
1948  0459 5b04          	addw	sp,#4
1949  045b               L602:
1950                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1952  045b 7b0b          	ld	a,(OFST+5,sp)
1953  045d a1fd          	cp	a,#253
1954  045f 2626          	jrne	L736
1955                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1957  0461 1e07          	ldw	x,(OFST+1,sp)
1958  0463 a30080        	cpw	x,#128
1959  0466 2403          	jruge	L012
1960  0468 4f            	clr	a
1961  0469 2010          	jra	L212
1962  046b               L012:
1963  046b ae0254        	ldw	x,#596
1964  046e 89            	pushw	x
1965  046f ae0000        	ldw	x,#0
1966  0472 89            	pushw	x
1967  0473 ae0010        	ldw	x,#L73
1968  0476 cd0000        	call	_assert_failed
1970  0479 5b04          	addw	sp,#4
1971  047b               L212:
1972                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1974  047b ae8000        	ldw	x,#32768
1975  047e 1f05          	ldw	(OFST-1,sp),x
1976  0480 ae0000        	ldw	x,#0
1977  0483 1f03          	ldw	(OFST-3,sp),x
1979  0485 2024          	jra	L146
1980  0487               L736:
1981                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1983  0487 1e07          	ldw	x,(OFST+1,sp)
1984  0489 a3000a        	cpw	x,#10
1985  048c 2403          	jruge	L412
1986  048e 4f            	clr	a
1987  048f 2010          	jra	L612
1988  0491               L412:
1989  0491 ae0259        	ldw	x,#601
1990  0494 89            	pushw	x
1991  0495 ae0000        	ldw	x,#0
1992  0498 89            	pushw	x
1993  0499 ae0010        	ldw	x,#L73
1994  049c cd0000        	call	_assert_failed
1996  049f 5b04          	addw	sp,#4
1997  04a1               L612:
1998                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2000  04a1 ae4000        	ldw	x,#16384
2001  04a4 1f05          	ldw	(OFST-1,sp),x
2002  04a6 ae0000        	ldw	x,#0
2003  04a9 1f03          	ldw	(OFST-3,sp),x
2004  04ab               L146:
2005                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2007  04ab 1e07          	ldw	x,(OFST+1,sp)
2008  04ad a640          	ld	a,#64
2009  04af cd0000        	call	c_cmulx
2011  04b2 96            	ldw	x,sp
2012  04b3 1c0003        	addw	x,#OFST-3
2013  04b6 cd0000        	call	c_ladd
2015  04b9 be02          	ldw	x,c_lreg+2
2016  04bb 1f01          	ldw	(OFST-5,sp),x
2017                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2019  04bd 721a505b      	bset	20571,#5
2020                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2022  04c1 721b505c      	bres	20572,#5
2023                     ; 619     *pwFlash = (uint32_t)0;
2025  04c5 1e01          	ldw	x,(OFST-5,sp)
2026  04c7 a600          	ld	a,#0
2027  04c9 e703          	ld	(3,x),a
2028  04cb a600          	ld	a,#0
2029  04cd e702          	ld	(2,x),a
2030  04cf a600          	ld	a,#0
2031  04d1 e701          	ld	(1,x),a
2032  04d3 a600          	ld	a,#0
2033  04d5 f7            	ld	(x),a
2034                     ; 627 }
2037  04d6 5b08          	addw	sp,#8
2038  04d8 81            	ret
2143                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2143                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2143                     ; 640 {
2144                     	switch	.text
2145  04d9               _FLASH_ProgramBlock:
2147  04d9 89            	pushw	x
2148  04da 5206          	subw	sp,#6
2149       00000006      OFST:	set	6
2152                     ; 641     uint16_t Count = 0;
2154  04dc 1e05          	ldw	x,(OFST-1,sp)
2155                     ; 642     uint32_t startaddress = 0;
2157  04de 96            	ldw	x,sp
2158  04df 1c0001        	addw	x,#OFST-5
2159  04e2 cd0000        	call	c_ltor
2161                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2163  04e5 7b0b          	ld	a,(OFST+5,sp)
2164  04e7 a1fd          	cp	a,#253
2165  04e9 2706          	jreq	L422
2166  04eb 7b0b          	ld	a,(OFST+5,sp)
2167  04ed a1f7          	cp	a,#247
2168  04ef 2603          	jrne	L222
2169  04f1               L422:
2170  04f1 4f            	clr	a
2171  04f2 2010          	jra	L622
2172  04f4               L222:
2173  04f4 ae0285        	ldw	x,#645
2174  04f7 89            	pushw	x
2175  04f8 ae0000        	ldw	x,#0
2176  04fb 89            	pushw	x
2177  04fc ae0010        	ldw	x,#L73
2178  04ff cd0000        	call	_assert_failed
2180  0502 5b04          	addw	sp,#4
2181  0504               L622:
2182                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2184  0504 0d0c          	tnz	(OFST+6,sp)
2185  0506 2706          	jreq	L232
2186  0508 7b0c          	ld	a,(OFST+6,sp)
2187  050a a110          	cp	a,#16
2188  050c 2603          	jrne	L032
2189  050e               L232:
2190  050e 4f            	clr	a
2191  050f 2010          	jra	L432
2192  0511               L032:
2193  0511 ae0286        	ldw	x,#646
2194  0514 89            	pushw	x
2195  0515 ae0000        	ldw	x,#0
2196  0518 89            	pushw	x
2197  0519 ae0010        	ldw	x,#L73
2198  051c cd0000        	call	_assert_failed
2200  051f 5b04          	addw	sp,#4
2201  0521               L432:
2202                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2204  0521 7b0b          	ld	a,(OFST+5,sp)
2205  0523 a1fd          	cp	a,#253
2206  0525 2626          	jrne	L517
2207                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2209  0527 1e07          	ldw	x,(OFST+1,sp)
2210  0529 a30080        	cpw	x,#128
2211  052c 2403          	jruge	L632
2212  052e 4f            	clr	a
2213  052f 2010          	jra	L042
2214  0531               L632:
2215  0531 ae0289        	ldw	x,#649
2216  0534 89            	pushw	x
2217  0535 ae0000        	ldw	x,#0
2218  0538 89            	pushw	x
2219  0539 ae0010        	ldw	x,#L73
2220  053c cd0000        	call	_assert_failed
2222  053f 5b04          	addw	sp,#4
2223  0541               L042:
2224                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2226  0541 ae8000        	ldw	x,#32768
2227  0544 1f03          	ldw	(OFST-3,sp),x
2228  0546 ae0000        	ldw	x,#0
2229  0549 1f01          	ldw	(OFST-5,sp),x
2231  054b 2024          	jra	L717
2232  054d               L517:
2233                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2235  054d 1e07          	ldw	x,(OFST+1,sp)
2236  054f a3000a        	cpw	x,#10
2237  0552 2403          	jruge	L242
2238  0554 4f            	clr	a
2239  0555 2010          	jra	L442
2240  0557               L242:
2241  0557 ae028e        	ldw	x,#654
2242  055a 89            	pushw	x
2243  055b ae0000        	ldw	x,#0
2244  055e 89            	pushw	x
2245  055f ae0010        	ldw	x,#L73
2246  0562 cd0000        	call	_assert_failed
2248  0565 5b04          	addw	sp,#4
2249  0567               L442:
2250                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2252  0567 ae4000        	ldw	x,#16384
2253  056a 1f03          	ldw	(OFST-3,sp),x
2254  056c ae0000        	ldw	x,#0
2255  056f 1f01          	ldw	(OFST-5,sp),x
2256  0571               L717:
2257                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2259  0571 1e07          	ldw	x,(OFST+1,sp)
2260  0573 a640          	ld	a,#64
2261  0575 cd0000        	call	c_cmulx
2263  0578 96            	ldw	x,sp
2264  0579 1c0001        	addw	x,#OFST-5
2265  057c cd0000        	call	c_lgadd
2267                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2269  057f 0d0c          	tnz	(OFST+6,sp)
2270  0581 260a          	jrne	L127
2271                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2273  0583 7210505b      	bset	20571,#0
2274                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2276  0587 7211505c      	bres	20572,#0
2278  058b 2008          	jra	L327
2279  058d               L127:
2280                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2282  058d 7218505b      	bset	20571,#4
2283                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2285  0591 7219505c      	bres	20572,#4
2286  0595               L327:
2287                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2289  0595 5f            	clrw	x
2290  0596 1f05          	ldw	(OFST-1,sp),x
2291  0598               L527:
2292                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2294  0598 1e0d          	ldw	x,(OFST+7,sp)
2295  059a 72fb05        	addw	x,(OFST-1,sp)
2296  059d f6            	ld	a,(x)
2297  059e 1e03          	ldw	x,(OFST-3,sp)
2298  05a0 72fb05        	addw	x,(OFST-1,sp)
2299  05a3 f7            	ld	(x),a
2300                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2302  05a4 1e05          	ldw	x,(OFST-1,sp)
2303  05a6 1c0001        	addw	x,#1
2304  05a9 1f05          	ldw	(OFST-1,sp),x
2307  05ab 1e05          	ldw	x,(OFST-1,sp)
2308  05ad a30040        	cpw	x,#64
2309  05b0 25e6          	jrult	L527
2310                     ; 685 }
2313  05b2 5b08          	addw	sp,#8
2314  05b4 81            	ret
2327                     	xdef	_FLASH_WaitForLastOperation
2328                     	xdef	_FLASH_ProgramBlock
2329                     	xdef	_FLASH_EraseBlock
2330                     	xdef	_FLASH_GetFlagStatus
2331                     	xdef	_FLASH_GetBootSize
2332                     	xdef	_FLASH_GetProgrammingTime
2333                     	xdef	_FLASH_GetLowPowerMode
2334                     	xdef	_FLASH_SetProgrammingTime
2335                     	xdef	_FLASH_SetLowPowerMode
2336                     	xdef	_FLASH_EraseOptionByte
2337                     	xdef	_FLASH_ProgramOptionByte
2338                     	xdef	_FLASH_ReadOptionByte
2339                     	xdef	_FLASH_ProgramWord
2340                     	xdef	_FLASH_ReadByte
2341                     	xdef	_FLASH_ProgramByte
2342                     	xdef	_FLASH_EraseByte
2343                     	xdef	_FLASH_ITConfig
2344                     	xdef	_FLASH_DeInit
2345                     	xdef	_FLASH_Lock
2346                     	xdef	_FLASH_Unlock
2347                     	xref	_assert_failed
2348                     	switch	.const
2349  0010               L73:
2350  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2351  0022 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2352  0034 685f64726976  	dc.b	"h_driver\src\stm8s"
2353  0046 5f666c617368  	dc.b	"_flash.c",0
2354                     	xref.b	c_lreg
2355                     	xref.b	c_x
2356                     	xref.b	c_y
2376                     	xref	c_ladd
2377                     	xref	c_cmulx
2378                     	xref	c_lzmp
2379                     	xref	c_lgsbc
2380                     	xref	c_lgadd
2381                     	xref	c_rtol
2382                     	xref	c_umul
2383                     	xref	c_lcmp
2384                     	xref	c_ltor
2385                     	end
