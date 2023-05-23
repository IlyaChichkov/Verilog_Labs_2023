
test_sw_emb.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <_stack_start-0x108000>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop
  20:	00000013          	nop
  24:	00000013          	nop
  28:	00000013          	nop
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop
  50:	00000013          	nop
  54:	00000013          	nop
  58:	00000013          	nop
  5c:	0ba0006f          	j	116 <ISR_I2C_ASM>
  60:	0ca0006f          	j	12a <ISR_UART_ASM>
  64:	0da0006f          	j	13e <ISR_GPIO_ASM>
  68:	0ea0006f          	j	152 <ISR_SPIM0_ASM>
  6c:	0fa0006f          	j	166 <ISR_SPIM1_ASM>
  70:	11e0006f          	j	18e <ISR_TA_OVF_ASM>
  74:	1060006f          	j	17a <ISR_TA_CMP_ASM>
  78:	13e0006f          	j	1b6 <ISR_TB_OVF_ASM>
  7c:	1260006f          	j	1a2 <ISR_TB_CMP_ASM>
  80:	00c0006f          	j	8c <_stext>
  84:	1460006f          	j	1ca <illegal_insn_handler>
  88:	1560006f          	j	1de <ecall_insn_handler>

Disassembly of section .text:

0000008c <_stext>:
  8c:	30501073          	csrw	mtvec,zero
  90:	00000093          	li	ra,0
  94:	8106                	mv	sp,ra
  96:	8186                	mv	gp,ra
  98:	8206                	mv	tp,ra
  9a:	8286                	mv	t0,ra
  9c:	8306                	mv	t1,ra
  9e:	8386                	mv	t2,ra
  a0:	8406                	mv	s0,ra
  a2:	8486                	mv	s1,ra
  a4:	8506                	mv	a0,ra
  a6:	8586                	mv	a1,ra
  a8:	8606                	mv	a2,ra
  aa:	8686                	mv	a3,ra
  ac:	8706                	mv	a4,ra
  ae:	8786                	mv	a5,ra
  b0:	8806                	mv	a6,ra
  b2:	8886                	mv	a7,ra
  b4:	8906                	mv	s2,ra
  b6:	8986                	mv	s3,ra
  b8:	8a06                	mv	s4,ra
  ba:	8a86                	mv	s5,ra
  bc:	8b06                	mv	s6,ra
  be:	8b86                	mv	s7,ra
  c0:	8c06                	mv	s8,ra
  c2:	8c86                	mv	s9,ra
  c4:	8d06                	mv	s10,ra
  c6:	8d86                	mv	s11,ra
  c8:	8e06                	mv	t3,ra
  ca:	8e86                	mv	t4,ra
  cc:	8f06                	mv	t5,ra
  ce:	8f86                	mv	t6,ra
  d0:	00108117          	auipc	sp,0x108
  d4:	f3010113          	add	sp,sp,-208 # 108000 <_stack_start>

000000d8 <_start>:
  d8:	00100d17          	auipc	s10,0x100
  dc:	048d0d13          	add	s10,s10,72 # 100120 <shiftPressed>
  e0:	00100d97          	auipc	s11,0x100
  e4:	044d8d93          	add	s11,s11,68 # 100124 <_bss_end>
  e8:	01bd5763          	bge	s10,s11,f6 <zero_loop_end>

000000ec <zero_loop>:
  ec:	000d2023          	sw	zero,0(s10)
  f0:	0d11                	add	s10,s10,4
  f2:	ffaddde3          	bge	s11,s10,ec <zero_loop>

000000f6 <zero_loop_end>:
  f6:	61f000ef          	jal	f14 <__DTOR_END__>

000000fa <main_entry>:
  fa:	4501                	li	a0,0
  fc:	4585                	li	a1,1
  fe:	1dd000ef          	jal	ada <uart_set_cfg>
 102:	4501                	li	a0,0
 104:	4581                	li	a1,0
 106:	69a000ef          	jal	7a0 <main>
 10a:	842a                	mv	s0,a0
 10c:	327000ef          	jal	c32 <uart_wait_tx_done>
 110:	8522                	mv	a0,s0
 112:	341000ef          	jal	c52 <exit>

00000116 <ISR_I2C_ASM>:
 116:	711d                	add	sp,sp,-96
 118:	ce86                	sw	ra,92(sp)
 11a:	0d8000ef          	jal	1f2 <store_regs>
 11e:	00000097          	auipc	ra,0x0
 122:	11e08093          	add	ra,ra,286 # 23c <end_except>
 126:	3cb0006f          	j	cf0 <ISR_I2C>

0000012a <ISR_UART_ASM>:
 12a:	711d                	add	sp,sp,-96
 12c:	ce86                	sw	ra,92(sp)
 12e:	0c4000ef          	jal	1f2 <store_regs>
 132:	00000097          	auipc	ra,0x0
 136:	10a08093          	add	ra,ra,266 # 23c <end_except>
 13a:	3bf0006f          	j	cf8 <ISR_UART>

0000013e <ISR_GPIO_ASM>:
 13e:	711d                	add	sp,sp,-96
 140:	ce86                	sw	ra,92(sp)
 142:	0b0000ef          	jal	1f2 <store_regs>
 146:	00000097          	auipc	ra,0x0
 14a:	0f608093          	add	ra,ra,246 # 23c <end_except>
 14e:	3b30006f          	j	d00 <ISR_GPIO>

00000152 <ISR_SPIM0_ASM>:
 152:	711d                	add	sp,sp,-96
 154:	ce86                	sw	ra,92(sp)
 156:	09c000ef          	jal	1f2 <store_regs>
 15a:	00000097          	auipc	ra,0x0
 15e:	0e208093          	add	ra,ra,226 # 23c <end_except>
 162:	3a70006f          	j	d08 <ISR_SPIM0>

00000166 <ISR_SPIM1_ASM>:
 166:	711d                	add	sp,sp,-96
 168:	ce86                	sw	ra,92(sp)
 16a:	088000ef          	jal	1f2 <store_regs>
 16e:	00000097          	auipc	ra,0x0
 172:	0ce08093          	add	ra,ra,206 # 23c <end_except>
 176:	39b0006f          	j	d10 <ISR_SPIM1>

0000017a <ISR_TA_CMP_ASM>:
 17a:	711d                	add	sp,sp,-96
 17c:	ce86                	sw	ra,92(sp)
 17e:	074000ef          	jal	1f2 <store_regs>
 182:	00000097          	auipc	ra,0x0
 186:	0ba08093          	add	ra,ra,186 # 23c <end_except>
 18a:	3970006f          	j	d20 <ISR_TA_CMP>

0000018e <ISR_TA_OVF_ASM>:
 18e:	711d                	add	sp,sp,-96
 190:	ce86                	sw	ra,92(sp)
 192:	060000ef          	jal	1f2 <store_regs>
 196:	00000097          	auipc	ra,0x0
 19a:	0a608093          	add	ra,ra,166 # 23c <end_except>
 19e:	37b0006f          	j	d18 <ISR_TA_OVF>

000001a2 <ISR_TB_CMP_ASM>:
 1a2:	711d                	add	sp,sp,-96
 1a4:	ce86                	sw	ra,92(sp)
 1a6:	04c000ef          	jal	1f2 <store_regs>
 1aa:	00000097          	auipc	ra,0x0
 1ae:	09208093          	add	ra,ra,146 # 23c <end_except>
 1b2:	37f0006f          	j	d30 <ISR_TB_CMP>

000001b6 <ISR_TB_OVF_ASM>:
 1b6:	711d                	add	sp,sp,-96
 1b8:	ce86                	sw	ra,92(sp)
 1ba:	038000ef          	jal	1f2 <store_regs>
 1be:	00000097          	auipc	ra,0x0
 1c2:	07e08093          	add	ra,ra,126 # 23c <end_except>
 1c6:	3630006f          	j	d28 <ISR_TB_OVF>

000001ca <illegal_insn_handler>:
 1ca:	711d                	add	sp,sp,-96
 1cc:	ce86                	sw	ra,92(sp)
 1ce:	024000ef          	jal	1f2 <store_regs>
 1d2:	00000097          	auipc	ra,0x0
 1d6:	06a08093          	add	ra,ra,106 # 23c <end_except>
 1da:	3670006f          	j	d40 <illegal_insn_handler_c>

000001de <ecall_insn_handler>:
 1de:	711d                	add	sp,sp,-96
 1e0:	ce86                	sw	ra,92(sp)
 1e2:	010000ef          	jal	1f2 <store_regs>
 1e6:	00000097          	auipc	ra,0x0
 1ea:	05608093          	add	ra,ra,86 # 23c <end_except>
 1ee:	35b0006f          	j	d48 <ecall_insn_handler_c>

000001f2 <store_regs>:
 1f2:	c00e                	sw	gp,0(sp)
 1f4:	c212                	sw	tp,4(sp)
 1f6:	c416                	sw	t0,8(sp)
 1f8:	c61a                	sw	t1,12(sp)
 1fa:	c81e                	sw	t2,16(sp)
 1fc:	ca2a                	sw	a0,20(sp)
 1fe:	cc2e                	sw	a1,24(sp)
 200:	ce32                	sw	a2,28(sp)
 202:	d036                	sw	a3,32(sp)
 204:	d23a                	sw	a4,36(sp)
 206:	d43e                	sw	a5,40(sp)
 208:	d642                	sw	a6,44(sp)
 20a:	d846                	sw	a7,48(sp)
 20c:	da72                	sw	t3,52(sp)
 20e:	dc76                	sw	t4,56(sp)
 210:	de7a                	sw	t5,60(sp)
 212:	c0fe                	sw	t6,64(sp)
 214:	7b002e73          	csrr	t3,dcsr
 218:	7b102ef3          	csrr	t4,dpc
 21c:	7b202f73          	csrr	t5,dscratch0
 220:	c2f2                	sw	t3,68(sp)
 222:	c4f6                	sw	t4,72(sp)
 224:	c6fa                	sw	t5,76(sp)
 226:	7b402e73          	csrr	t3,0x7b4
 22a:	7b502ef3          	csrr	t4,0x7b5
 22e:	7b602f73          	csrr	t5,0x7b6
 232:	c8f2                	sw	t3,80(sp)
 234:	caf6                	sw	t4,84(sp)
 236:	ccfa                	sw	t5,88(sp)
 238:	00008067          	ret

0000023c <end_except>:
 23c:	4e46                	lw	t3,80(sp)
 23e:	4ed6                	lw	t4,84(sp)
 240:	4f66                	lw	t5,88(sp)
 242:	7b4e1073          	csrw	0x7b4,t3
 246:	7b5e9073          	csrw	0x7b5,t4
 24a:	7b6f1073          	csrw	0x7b6,t5
 24e:	4e16                	lw	t3,68(sp)
 250:	4ea6                	lw	t4,72(sp)
 252:	4f36                	lw	t5,76(sp)
 254:	7b0e1073          	csrw	dcsr,t3
 258:	7b1e9073          	csrw	dpc,t4
 25c:	7b2f1073          	csrw	dscratch0,t5
 260:	4182                	lw	gp,0(sp)
 262:	4212                	lw	tp,4(sp)
 264:	42a2                	lw	t0,8(sp)
 266:	4332                	lw	t1,12(sp)
 268:	43c2                	lw	t2,16(sp)
 26a:	4552                	lw	a0,20(sp)
 26c:	45e2                	lw	a1,24(sp)
 26e:	4672                	lw	a2,28(sp)
 270:	5682                	lw	a3,32(sp)
 272:	5712                	lw	a4,36(sp)
 274:	57a2                	lw	a5,40(sp)
 276:	5832                	lw	a6,44(sp)
 278:	58c2                	lw	a7,48(sp)
 27a:	5e52                	lw	t3,52(sp)
 27c:	5ee2                	lw	t4,56(sp)
 27e:	5f72                	lw	t5,60(sp)
 280:	4f86                	lw	t6,64(sp)
 282:	40f6                	lw	ra,92(sp)
 284:	6125                	add	sp,sp,96
 286:	30200073          	mret

0000028a <_fini>:
 28a:	8082                	ret

0000028c <code2char>:
 28c:	7179                	add	sp,sp,-48
 28e:	d622                	sw	s0,44(sp)
 290:	1800                	add	s0,sp,48
 292:	fca42e23          	sw	a0,-36(s0)
 296:	fdc42703          	lw	a4,-36(s0)
 29a:	47c9                	li	a5,18
 29c:	00f70863          	beq	a4,a5,2ac <code2char+0x20>
 2a0:	fdc42703          	lw	a4,-36(s0)
 2a4:	05900793          	li	a5,89
 2a8:	00f71963          	bne	a4,a5,2ba <code2char+0x2e>
 2ac:	001007b7          	lui	a5,0x100
 2b0:	4705                	li	a4,1
 2b2:	12e7a023          	sw	a4,288(a5) # 100120 <shiftPressed>
 2b6:	4781                	li	a5,0
 2b8:	a1c5                	j	798 <code2char+0x50c>
 2ba:	fdc42703          	lw	a4,-36(s0)
 2be:	05a00793          	li	a5,90
 2c2:	00f71463          	bne	a4,a5,2ca <code2char+0x3e>
 2c6:	47a9                	li	a5,10
 2c8:	a9c1                	j	798 <code2char+0x50c>
 2ca:	fdc42783          	lw	a5,-36(s0)
 2ce:	17ad                	add	a5,a5,-21
 2d0:	04600713          	li	a4,70
 2d4:	4af76963          	bltu	a4,a5,786 <code2char+0x4fa>
 2d8:	00279713          	sll	a4,a5,0x2
 2dc:	001007b7          	lui	a5,0x100
 2e0:	00078793          	mv	a5,a5
 2e4:	97ba                	add	a5,a5,a4
 2e6:	439c                	lw	a5,0(a5)
 2e8:	8782                	jr	a5
 2ea:	001007b7          	lui	a5,0x100
 2ee:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 2f2:	e781                	bnez	a5,2fa <code2char+0x6e>
 2f4:	07100793          	li	a5,113
 2f8:	a019                	j	2fe <code2char+0x72>
 2fa:	05100793          	li	a5,81
 2fe:	fef407a3          	sb	a5,-17(s0)
 302:	a169                	j	78c <code2char+0x500>
 304:	001007b7          	lui	a5,0x100
 308:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 30c:	e781                	bnez	a5,314 <code2char+0x88>
 30e:	07700793          	li	a5,119
 312:	a019                	j	318 <code2char+0x8c>
 314:	05700793          	li	a5,87
 318:	fef407a3          	sb	a5,-17(s0)
 31c:	a985                	j	78c <code2char+0x500>
 31e:	001007b7          	lui	a5,0x100
 322:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 326:	e781                	bnez	a5,32e <code2char+0xa2>
 328:	06500793          	li	a5,101
 32c:	a019                	j	332 <code2char+0xa6>
 32e:	04500793          	li	a5,69
 332:	fef407a3          	sb	a5,-17(s0)
 336:	a999                	j	78c <code2char+0x500>
 338:	001007b7          	lui	a5,0x100
 33c:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 340:	e781                	bnez	a5,348 <code2char+0xbc>
 342:	07200793          	li	a5,114
 346:	a019                	j	34c <code2char+0xc0>
 348:	05200793          	li	a5,82
 34c:	fef407a3          	sb	a5,-17(s0)
 350:	a935                	j	78c <code2char+0x500>
 352:	001007b7          	lui	a5,0x100
 356:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 35a:	e781                	bnez	a5,362 <code2char+0xd6>
 35c:	07400793          	li	a5,116
 360:	a019                	j	366 <code2char+0xda>
 362:	05400793          	li	a5,84
 366:	fef407a3          	sb	a5,-17(s0)
 36a:	a10d                	j	78c <code2char+0x500>
 36c:	001007b7          	lui	a5,0x100
 370:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 374:	e781                	bnez	a5,37c <code2char+0xf0>
 376:	07900793          	li	a5,121
 37a:	a019                	j	380 <code2char+0xf4>
 37c:	05900793          	li	a5,89
 380:	fef407a3          	sb	a5,-17(s0)
 384:	a121                	j	78c <code2char+0x500>
 386:	001007b7          	lui	a5,0x100
 38a:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 38e:	e781                	bnez	a5,396 <code2char+0x10a>
 390:	07500793          	li	a5,117
 394:	a019                	j	39a <code2char+0x10e>
 396:	05500793          	li	a5,85
 39a:	fef407a3          	sb	a5,-17(s0)
 39e:	a6fd                	j	78c <code2char+0x500>
 3a0:	001007b7          	lui	a5,0x100
 3a4:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 3a8:	e781                	bnez	a5,3b0 <code2char+0x124>
 3aa:	06900793          	li	a5,105
 3ae:	a019                	j	3b4 <code2char+0x128>
 3b0:	04900793          	li	a5,73
 3b4:	fef407a3          	sb	a5,-17(s0)
 3b8:	aed1                	j	78c <code2char+0x500>
 3ba:	001007b7          	lui	a5,0x100
 3be:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 3c2:	e781                	bnez	a5,3ca <code2char+0x13e>
 3c4:	06f00793          	li	a5,111
 3c8:	a019                	j	3ce <code2char+0x142>
 3ca:	04f00793          	li	a5,79
 3ce:	fef407a3          	sb	a5,-17(s0)
 3d2:	ae6d                	j	78c <code2char+0x500>
 3d4:	001007b7          	lui	a5,0x100
 3d8:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 3dc:	e781                	bnez	a5,3e4 <code2char+0x158>
 3de:	07000793          	li	a5,112
 3e2:	a019                	j	3e8 <code2char+0x15c>
 3e4:	05000793          	li	a5,80
 3e8:	fef407a3          	sb	a5,-17(s0)
 3ec:	a645                	j	78c <code2char+0x500>
 3ee:	001007b7          	lui	a5,0x100
 3f2:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 3f6:	e781                	bnez	a5,3fe <code2char+0x172>
 3f8:	05b00793          	li	a5,91
 3fc:	a019                	j	402 <code2char+0x176>
 3fe:	07b00793          	li	a5,123
 402:	fef407a3          	sb	a5,-17(s0)
 406:	a659                	j	78c <code2char+0x500>
 408:	001007b7          	lui	a5,0x100
 40c:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 410:	e781                	bnez	a5,418 <code2char+0x18c>
 412:	05d00793          	li	a5,93
 416:	a019                	j	41c <code2char+0x190>
 418:	07d00793          	li	a5,125
 41c:	fef407a3          	sb	a5,-17(s0)
 420:	a6b5                	j	78c <code2char+0x500>
 422:	001007b7          	lui	a5,0x100
 426:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 42a:	e781                	bnez	a5,432 <code2char+0x1a6>
 42c:	06100793          	li	a5,97
 430:	a019                	j	436 <code2char+0x1aa>
 432:	04100793          	li	a5,65
 436:	fef407a3          	sb	a5,-17(s0)
 43a:	ae89                	j	78c <code2char+0x500>
 43c:	001007b7          	lui	a5,0x100
 440:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 444:	e781                	bnez	a5,44c <code2char+0x1c0>
 446:	07300793          	li	a5,115
 44a:	a019                	j	450 <code2char+0x1c4>
 44c:	05300793          	li	a5,83
 450:	fef407a3          	sb	a5,-17(s0)
 454:	ae25                	j	78c <code2char+0x500>
 456:	001007b7          	lui	a5,0x100
 45a:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 45e:	e781                	bnez	a5,466 <code2char+0x1da>
 460:	06400793          	li	a5,100
 464:	a019                	j	46a <code2char+0x1de>
 466:	04400793          	li	a5,68
 46a:	fef407a3          	sb	a5,-17(s0)
 46e:	ae39                	j	78c <code2char+0x500>
 470:	001007b7          	lui	a5,0x100
 474:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 478:	e781                	bnez	a5,480 <code2char+0x1f4>
 47a:	06600793          	li	a5,102
 47e:	a019                	j	484 <code2char+0x1f8>
 480:	04600793          	li	a5,70
 484:	fef407a3          	sb	a5,-17(s0)
 488:	a611                	j	78c <code2char+0x500>
 48a:	001007b7          	lui	a5,0x100
 48e:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 492:	e781                	bnez	a5,49a <code2char+0x20e>
 494:	06700793          	li	a5,103
 498:	a019                	j	49e <code2char+0x212>
 49a:	04700793          	li	a5,71
 49e:	fef407a3          	sb	a5,-17(s0)
 4a2:	a4ed                	j	78c <code2char+0x500>
 4a4:	001007b7          	lui	a5,0x100
 4a8:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 4ac:	e781                	bnez	a5,4b4 <code2char+0x228>
 4ae:	06800793          	li	a5,104
 4b2:	a019                	j	4b8 <code2char+0x22c>
 4b4:	04800793          	li	a5,72
 4b8:	fef407a3          	sb	a5,-17(s0)
 4bc:	acc1                	j	78c <code2char+0x500>
 4be:	001007b7          	lui	a5,0x100
 4c2:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 4c6:	e781                	bnez	a5,4ce <code2char+0x242>
 4c8:	06a00793          	li	a5,106
 4cc:	a019                	j	4d2 <code2char+0x246>
 4ce:	04a00793          	li	a5,74
 4d2:	fef407a3          	sb	a5,-17(s0)
 4d6:	ac5d                	j	78c <code2char+0x500>
 4d8:	001007b7          	lui	a5,0x100
 4dc:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 4e0:	e781                	bnez	a5,4e8 <code2char+0x25c>
 4e2:	06b00793          	li	a5,107
 4e6:	a019                	j	4ec <code2char+0x260>
 4e8:	04b00793          	li	a5,75
 4ec:	fef407a3          	sb	a5,-17(s0)
 4f0:	ac71                	j	78c <code2char+0x500>
 4f2:	001007b7          	lui	a5,0x100
 4f6:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 4fa:	e781                	bnez	a5,502 <code2char+0x276>
 4fc:	06c00793          	li	a5,108
 500:	a019                	j	506 <code2char+0x27a>
 502:	04c00793          	li	a5,76
 506:	fef407a3          	sb	a5,-17(s0)
 50a:	a449                	j	78c <code2char+0x500>
 50c:	001007b7          	lui	a5,0x100
 510:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 514:	e781                	bnez	a5,51c <code2char+0x290>
 516:	03b00793          	li	a5,59
 51a:	a019                	j	520 <code2char+0x294>
 51c:	03a00793          	li	a5,58
 520:	fef407a3          	sb	a5,-17(s0)
 524:	a4a5                	j	78c <code2char+0x500>
 526:	001007b7          	lui	a5,0x100
 52a:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 52e:	e781                	bnez	a5,536 <code2char+0x2aa>
 530:	02700793          	li	a5,39
 534:	a019                	j	53a <code2char+0x2ae>
 536:	02200793          	li	a5,34
 53a:	fef407a3          	sb	a5,-17(s0)
 53e:	a4b9                	j	78c <code2char+0x500>
 540:	001007b7          	lui	a5,0x100
 544:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 548:	e781                	bnez	a5,550 <code2char+0x2c4>
 54a:	07a00793          	li	a5,122
 54e:	a019                	j	554 <code2char+0x2c8>
 550:	05a00793          	li	a5,90
 554:	fef407a3          	sb	a5,-17(s0)
 558:	ac15                	j	78c <code2char+0x500>
 55a:	001007b7          	lui	a5,0x100
 55e:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 562:	e781                	bnez	a5,56a <code2char+0x2de>
 564:	07800793          	li	a5,120
 568:	a019                	j	56e <code2char+0x2e2>
 56a:	05800793          	li	a5,88
 56e:	fef407a3          	sb	a5,-17(s0)
 572:	ac29                	j	78c <code2char+0x500>
 574:	001007b7          	lui	a5,0x100
 578:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 57c:	e781                	bnez	a5,584 <code2char+0x2f8>
 57e:	06300793          	li	a5,99
 582:	a019                	j	588 <code2char+0x2fc>
 584:	04300793          	li	a5,67
 588:	fef407a3          	sb	a5,-17(s0)
 58c:	a401                	j	78c <code2char+0x500>
 58e:	001007b7          	lui	a5,0x100
 592:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 596:	e781                	bnez	a5,59e <code2char+0x312>
 598:	07600793          	li	a5,118
 59c:	a019                	j	5a2 <code2char+0x316>
 59e:	05600793          	li	a5,86
 5a2:	fef407a3          	sb	a5,-17(s0)
 5a6:	a2dd                	j	78c <code2char+0x500>
 5a8:	001007b7          	lui	a5,0x100
 5ac:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 5b0:	e781                	bnez	a5,5b8 <code2char+0x32c>
 5b2:	06200793          	li	a5,98
 5b6:	a019                	j	5bc <code2char+0x330>
 5b8:	04200793          	li	a5,66
 5bc:	fef407a3          	sb	a5,-17(s0)
 5c0:	a2f1                	j	78c <code2char+0x500>
 5c2:	001007b7          	lui	a5,0x100
 5c6:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 5ca:	e781                	bnez	a5,5d2 <code2char+0x346>
 5cc:	06e00793          	li	a5,110
 5d0:	a019                	j	5d6 <code2char+0x34a>
 5d2:	04e00793          	li	a5,78
 5d6:	fef407a3          	sb	a5,-17(s0)
 5da:	aa4d                	j	78c <code2char+0x500>
 5dc:	001007b7          	lui	a5,0x100
 5e0:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 5e4:	e781                	bnez	a5,5ec <code2char+0x360>
 5e6:	06d00793          	li	a5,109
 5ea:	a019                	j	5f0 <code2char+0x364>
 5ec:	04d00793          	li	a5,77
 5f0:	fef407a3          	sb	a5,-17(s0)
 5f4:	aa61                	j	78c <code2char+0x500>
 5f6:	001007b7          	lui	a5,0x100
 5fa:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 5fe:	e781                	bnez	a5,606 <code2char+0x37a>
 600:	02c00793          	li	a5,44
 604:	a019                	j	60a <code2char+0x37e>
 606:	03c00793          	li	a5,60
 60a:	fef407a3          	sb	a5,-17(s0)
 60e:	aabd                	j	78c <code2char+0x500>
 610:	001007b7          	lui	a5,0x100
 614:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 618:	e781                	bnez	a5,620 <code2char+0x394>
 61a:	02e00793          	li	a5,46
 61e:	a019                	j	624 <code2char+0x398>
 620:	03e00793          	li	a5,62
 624:	fef407a3          	sb	a5,-17(s0)
 628:	a295                	j	78c <code2char+0x500>
 62a:	001007b7          	lui	a5,0x100
 62e:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 632:	e781                	bnez	a5,63a <code2char+0x3ae>
 634:	02f00793          	li	a5,47
 638:	a019                	j	63e <code2char+0x3b2>
 63a:	03f00793          	li	a5,63
 63e:	fef407a3          	sb	a5,-17(s0)
 642:	a2a9                	j	78c <code2char+0x500>
 644:	001007b7          	lui	a5,0x100
 648:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 64c:	e781                	bnez	a5,654 <code2char+0x3c8>
 64e:	03100793          	li	a5,49
 652:	a019                	j	658 <code2char+0x3cc>
 654:	02100793          	li	a5,33
 658:	fef407a3          	sb	a5,-17(s0)
 65c:	aa05                	j	78c <code2char+0x500>
 65e:	001007b7          	lui	a5,0x100
 662:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 666:	e781                	bnez	a5,66e <code2char+0x3e2>
 668:	03200793          	li	a5,50
 66c:	a019                	j	672 <code2char+0x3e6>
 66e:	04000793          	li	a5,64
 672:	fef407a3          	sb	a5,-17(s0)
 676:	aa19                	j	78c <code2char+0x500>
 678:	001007b7          	lui	a5,0x100
 67c:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 680:	e781                	bnez	a5,688 <code2char+0x3fc>
 682:	03300793          	li	a5,51
 686:	a019                	j	68c <code2char+0x400>
 688:	02300793          	li	a5,35
 68c:	fef407a3          	sb	a5,-17(s0)
 690:	a8f5                	j	78c <code2char+0x500>
 692:	001007b7          	lui	a5,0x100
 696:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 69a:	e781                	bnez	a5,6a2 <code2char+0x416>
 69c:	03400793          	li	a5,52
 6a0:	a019                	j	6a6 <code2char+0x41a>
 6a2:	02400793          	li	a5,36
 6a6:	fef407a3          	sb	a5,-17(s0)
 6aa:	a0cd                	j	78c <code2char+0x500>
 6ac:	001007b7          	lui	a5,0x100
 6b0:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 6b4:	e781                	bnez	a5,6bc <code2char+0x430>
 6b6:	03500793          	li	a5,53
 6ba:	a019                	j	6c0 <code2char+0x434>
 6bc:	02500793          	li	a5,37
 6c0:	fef407a3          	sb	a5,-17(s0)
 6c4:	a0e1                	j	78c <code2char+0x500>
 6c6:	001007b7          	lui	a5,0x100
 6ca:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 6ce:	e781                	bnez	a5,6d6 <code2char+0x44a>
 6d0:	03600793          	li	a5,54
 6d4:	a019                	j	6da <code2char+0x44e>
 6d6:	05e00793          	li	a5,94
 6da:	fef407a3          	sb	a5,-17(s0)
 6de:	a07d                	j	78c <code2char+0x500>
 6e0:	001007b7          	lui	a5,0x100
 6e4:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 6e8:	e781                	bnez	a5,6f0 <code2char+0x464>
 6ea:	03700793          	li	a5,55
 6ee:	a019                	j	6f4 <code2char+0x468>
 6f0:	02600793          	li	a5,38
 6f4:	fef407a3          	sb	a5,-17(s0)
 6f8:	a851                	j	78c <code2char+0x500>
 6fa:	001007b7          	lui	a5,0x100
 6fe:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 702:	e781                	bnez	a5,70a <code2char+0x47e>
 704:	03800793          	li	a5,56
 708:	a019                	j	70e <code2char+0x482>
 70a:	02a00793          	li	a5,42
 70e:	fef407a3          	sb	a5,-17(s0)
 712:	a8ad                	j	78c <code2char+0x500>
 714:	001007b7          	lui	a5,0x100
 718:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 71c:	e781                	bnez	a5,724 <code2char+0x498>
 71e:	03900793          	li	a5,57
 722:	a019                	j	728 <code2char+0x49c>
 724:	02800793          	li	a5,40
 728:	fef407a3          	sb	a5,-17(s0)
 72c:	a085                	j	78c <code2char+0x500>
 72e:	001007b7          	lui	a5,0x100
 732:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 736:	e781                	bnez	a5,73e <code2char+0x4b2>
 738:	03000793          	li	a5,48
 73c:	a019                	j	742 <code2char+0x4b6>
 73e:	02900793          	li	a5,41
 742:	fef407a3          	sb	a5,-17(s0)
 746:	a099                	j	78c <code2char+0x500>
 748:	001007b7          	lui	a5,0x100
 74c:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 750:	e781                	bnez	a5,758 <code2char+0x4cc>
 752:	02d00793          	li	a5,45
 756:	a019                	j	75c <code2char+0x4d0>
 758:	04600793          	li	a5,70
 75c:	fef407a3          	sb	a5,-17(s0)
 760:	a035                	j	78c <code2char+0x500>
 762:	001007b7          	lui	a5,0x100
 766:	1207a783          	lw	a5,288(a5) # 100120 <shiftPressed>
 76a:	e781                	bnez	a5,772 <code2char+0x4e6>
 76c:	03d00793          	li	a5,61
 770:	a019                	j	776 <code2char+0x4ea>
 772:	04600793          	li	a5,70
 776:	fef407a3          	sb	a5,-17(s0)
 77a:	a809                	j	78c <code2char+0x500>
 77c:	02000793          	li	a5,32
 780:	fef407a3          	sb	a5,-17(s0)
 784:	a021                	j	78c <code2char+0x500>
 786:	fe0407a3          	sb	zero,-17(s0)
 78a:	0001                	nop
 78c:	001007b7          	lui	a5,0x100
 790:	1207a023          	sw	zero,288(a5) # 100120 <shiftPressed>
 794:	fef44783          	lbu	a5,-17(s0)
 798:	853e                	mv	a0,a5
 79a:	5432                	lw	s0,44(sp)
 79c:	6145                	add	sp,sp,48
 79e:	8082                	ret

000007a0 <main>:
 7a0:	7139                	add	sp,sp,-64
 7a2:	de06                	sw	ra,60(sp)
 7a4:	dc22                	sw	s0,56(sp)
 7a6:	0080                	add	s0,sp,64
 7a8:	fe042623          	sw	zero,-20(s0)
 7ac:	45ed                	li	a1,27
 7ae:	4501                	li	a0,0
 7b0:	262d                	jal	ada <uart_set_cfg>
 7b2:	4589                	li	a1,2
 7b4:	001007b7          	lui	a5,0x100
 7b8:	11c78513          	add	a0,a5,284 # 10011c <__init_array_end+0x11c>
 7bc:	266d                	jal	b66 <uart_send>
 7be:	2995                	jal	c32 <uart_wait_tx_done>
 7c0:	4585                	li	a1,1
 7c2:	457d                	li	a0,31
 7c4:	282d                	jal	7fe <set_pin_function>
 7c6:	4585                	li	a1,1
 7c8:	457d                	li	a0,31
 7ca:	287d                	jal	888 <set_gpio_pin_direction>
 7cc:	4581                	li	a1,0
 7ce:	457d                	li	a0,31
 7d0:	22a9                	jal	91a <set_gpio_pin_value>
 7d2:	2bbd                	jal	d50 <sp2_init>
 7d4:	2d1d                	jal	e0a <read_usb_key>
 7d6:	fea42423          	sw	a0,-24(s0)
 7da:	fe842503          	lw	a0,-24(s0)
 7de:	2bdd                	jal	dd4 <getKeyCode>
 7e0:	87aa                	mv	a5,a0
 7e2:	853e                	mv	a0,a5
 7e4:	3465                	jal	28c <code2char>
 7e6:	87aa                	mv	a5,a0
 7e8:	fcf40223          	sb	a5,-60(s0)
 7ec:	fc0402a3          	sb	zero,-59(s0)
 7f0:	fc440793          	add	a5,s0,-60
 7f4:	4589                	li	a1,2
 7f6:	853e                	mv	a0,a5
 7f8:	26bd                	jal	b66 <uart_send>
 7fa:	2925                	jal	c32 <uart_wait_tx_done>
 7fc:	bfe1                	j	7d4 <main+0x34>

000007fe <set_pin_function>:
 7fe:	7179                	add	sp,sp,-48
 800:	d622                	sw	s0,44(sp)
 802:	1800                	add	s0,sp,48
 804:	fca42e23          	sw	a0,-36(s0)
 808:	fcb42c23          	sw	a1,-40(s0)
 80c:	1a1077b7          	lui	a5,0x1a107
 810:	439c                	lw	a5,0(a5)
 812:	fef42623          	sw	a5,-20(s0)
 816:	fdc42783          	lw	a5,-36(s0)
 81a:	4705                	li	a4,1
 81c:	00f717b3          	sll	a5,a4,a5
 820:	fff7c713          	not	a4,a5
 824:	fec42783          	lw	a5,-20(s0)
 828:	8ff9                	and	a5,a5,a4
 82a:	fef42623          	sw	a5,-20(s0)
 82e:	fdc42783          	lw	a5,-36(s0)
 832:	fd842703          	lw	a4,-40(s0)
 836:	00f71733          	sll	a4,a4,a5
 83a:	fec42783          	lw	a5,-20(s0)
 83e:	8fd9                	or	a5,a5,a4
 840:	fef42623          	sw	a5,-20(s0)
 844:	1a1077b7          	lui	a5,0x1a107
 848:	fec42703          	lw	a4,-20(s0)
 84c:	c398                	sw	a4,0(a5)
 84e:	0001                	nop
 850:	5432                	lw	s0,44(sp)
 852:	6145                	add	sp,sp,48
 854:	8082                	ret

00000856 <get_pin_function>:
 856:	7179                	add	sp,sp,-48
 858:	d622                	sw	s0,44(sp)
 85a:	1800                	add	s0,sp,48
 85c:	fca42e23          	sw	a0,-36(s0)
 860:	1a1077b7          	lui	a5,0x1a107
 864:	439c                	lw	a5,0(a5)
 866:	fef42623          	sw	a5,-20(s0)
 86a:	fec42703          	lw	a4,-20(s0)
 86e:	fdc42783          	lw	a5,-36(s0)
 872:	40f757b3          	sra	a5,a4,a5
 876:	8b85                	and	a5,a5,1
 878:	fef42623          	sw	a5,-20(s0)
 87c:	fec42783          	lw	a5,-20(s0)
 880:	853e                	mv	a0,a5
 882:	5432                	lw	s0,44(sp)
 884:	6145                	add	sp,sp,48
 886:	8082                	ret

00000888 <set_gpio_pin_direction>:
 888:	7179                	add	sp,sp,-48
 88a:	d622                	sw	s0,44(sp)
 88c:	1800                	add	s0,sp,48
 88e:	fca42e23          	sw	a0,-36(s0)
 892:	fcb42c23          	sw	a1,-40(s0)
 896:	1a1017b7          	lui	a5,0x1a101
 89a:	439c                	lw	a5,0(a5)
 89c:	fef42623          	sw	a5,-20(s0)
 8a0:	fd842783          	lw	a5,-40(s0)
 8a4:	ef91                	bnez	a5,8c0 <set_gpio_pin_direction+0x38>
 8a6:	fdc42783          	lw	a5,-36(s0)
 8aa:	4705                	li	a4,1
 8ac:	00f717b3          	sll	a5,a4,a5
 8b0:	fff7c713          	not	a4,a5
 8b4:	fec42783          	lw	a5,-20(s0)
 8b8:	8ff9                	and	a5,a5,a4
 8ba:	fef42623          	sw	a5,-20(s0)
 8be:	a819                	j	8d4 <set_gpio_pin_direction+0x4c>
 8c0:	fdc42783          	lw	a5,-36(s0)
 8c4:	4705                	li	a4,1
 8c6:	00f71733          	sll	a4,a4,a5
 8ca:	fec42783          	lw	a5,-20(s0)
 8ce:	8fd9                	or	a5,a5,a4
 8d0:	fef42623          	sw	a5,-20(s0)
 8d4:	1a1017b7          	lui	a5,0x1a101
 8d8:	fec42703          	lw	a4,-20(s0)
 8dc:	c398                	sw	a4,0(a5)
 8de:	0001                	nop
 8e0:	5432                	lw	s0,44(sp)
 8e2:	6145                	add	sp,sp,48
 8e4:	8082                	ret

000008e6 <get_gpio_pin_direction>:
 8e6:	7179                	add	sp,sp,-48
 8e8:	d622                	sw	s0,44(sp)
 8ea:	1800                	add	s0,sp,48
 8ec:	fca42e23          	sw	a0,-36(s0)
 8f0:	1a1017b7          	lui	a5,0x1a101
 8f4:	439c                	lw	a5,0(a5)
 8f6:	fef42623          	sw	a5,-20(s0)
 8fa:	fec42703          	lw	a4,-20(s0)
 8fe:	fdc42783          	lw	a5,-36(s0)
 902:	0786                	sll	a5,a5,0x1
 904:	40f757b3          	sra	a5,a4,a5
 908:	8b85                	and	a5,a5,1
 90a:	fef42623          	sw	a5,-20(s0)
 90e:	fec42783          	lw	a5,-20(s0)
 912:	853e                	mv	a0,a5
 914:	5432                	lw	s0,44(sp)
 916:	6145                	add	sp,sp,48
 918:	8082                	ret

0000091a <set_gpio_pin_value>:
 91a:	7179                	add	sp,sp,-48
 91c:	d622                	sw	s0,44(sp)
 91e:	1800                	add	s0,sp,48
 920:	fca42e23          	sw	a0,-36(s0)
 924:	fcb42c23          	sw	a1,-40(s0)
 928:	1a1017b7          	lui	a5,0x1a101
 92c:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
 92e:	439c                	lw	a5,0(a5)
 930:	fef42623          	sw	a5,-20(s0)
 934:	fd842783          	lw	a5,-40(s0)
 938:	ef91                	bnez	a5,954 <set_gpio_pin_value+0x3a>
 93a:	fdc42783          	lw	a5,-36(s0)
 93e:	4705                	li	a4,1
 940:	00f717b3          	sll	a5,a4,a5
 944:	fff7c713          	not	a4,a5
 948:	fec42783          	lw	a5,-20(s0)
 94c:	8ff9                	and	a5,a5,a4
 94e:	fef42623          	sw	a5,-20(s0)
 952:	a819                	j	968 <set_gpio_pin_value+0x4e>
 954:	fdc42783          	lw	a5,-36(s0)
 958:	4705                	li	a4,1
 95a:	00f71733          	sll	a4,a4,a5
 95e:	fec42783          	lw	a5,-20(s0)
 962:	8fd9                	or	a5,a5,a4
 964:	fef42623          	sw	a5,-20(s0)
 968:	1a1017b7          	lui	a5,0x1a101
 96c:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
 96e:	fec42703          	lw	a4,-20(s0)
 972:	c398                	sw	a4,0(a5)
 974:	0001                	nop
 976:	5432                	lw	s0,44(sp)
 978:	6145                	add	sp,sp,48
 97a:	8082                	ret

0000097c <get_gpio_pin_value>:
 97c:	7179                	add	sp,sp,-48
 97e:	d622                	sw	s0,44(sp)
 980:	1800                	add	s0,sp,48
 982:	fca42e23          	sw	a0,-36(s0)
 986:	1a1017b7          	lui	a5,0x1a101
 98a:	0791                	add	a5,a5,4 # 1a101004 <_stack_start+0x19ff9004>
 98c:	439c                	lw	a5,0(a5)
 98e:	fef42623          	sw	a5,-20(s0)
 992:	fec42703          	lw	a4,-20(s0)
 996:	fdc42783          	lw	a5,-36(s0)
 99a:	40f757b3          	sra	a5,a4,a5
 99e:	8b85                	and	a5,a5,1
 9a0:	fef42623          	sw	a5,-20(s0)
 9a4:	fec42783          	lw	a5,-20(s0)
 9a8:	853e                	mv	a0,a5
 9aa:	5432                	lw	s0,44(sp)
 9ac:	6145                	add	sp,sp,48
 9ae:	8082                	ret

000009b0 <set_gpio_pin_irq_en>:
 9b0:	7179                	add	sp,sp,-48
 9b2:	d622                	sw	s0,44(sp)
 9b4:	1800                	add	s0,sp,48
 9b6:	fca42e23          	sw	a0,-36(s0)
 9ba:	fcb42c23          	sw	a1,-40(s0)
 9be:	1a1017b7          	lui	a5,0x1a101
 9c2:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
 9c4:	439c                	lw	a5,0(a5)
 9c6:	fef42623          	sw	a5,-20(s0)
 9ca:	fd842783          	lw	a5,-40(s0)
 9ce:	ef91                	bnez	a5,9ea <set_gpio_pin_irq_en+0x3a>
 9d0:	fdc42783          	lw	a5,-36(s0)
 9d4:	4705                	li	a4,1
 9d6:	00f717b3          	sll	a5,a4,a5
 9da:	fff7c793          	not	a5,a5
 9de:	fec42703          	lw	a4,-20(s0)
 9e2:	8ff9                	and	a5,a5,a4
 9e4:	fef42623          	sw	a5,-20(s0)
 9e8:	a819                	j	9fe <set_gpio_pin_irq_en+0x4e>
 9ea:	fdc42783          	lw	a5,-36(s0)
 9ee:	4705                	li	a4,1
 9f0:	00f717b3          	sll	a5,a4,a5
 9f4:	fec42703          	lw	a4,-20(s0)
 9f8:	8fd9                	or	a5,a5,a4
 9fa:	fef42623          	sw	a5,-20(s0)
 9fe:	1a1017b7          	lui	a5,0x1a101
 a02:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
 a04:	fec42703          	lw	a4,-20(s0)
 a08:	c398                	sw	a4,0(a5)
 a0a:	0001                	nop
 a0c:	5432                	lw	s0,44(sp)
 a0e:	6145                	add	sp,sp,48
 a10:	8082                	ret

00000a12 <set_gpio_pin_irq_type>:
 a12:	7179                	add	sp,sp,-48
 a14:	d622                	sw	s0,44(sp)
 a16:	1800                	add	s0,sp,48
 a18:	fca42e23          	sw	a0,-36(s0)
 a1c:	fcb42c23          	sw	a1,-40(s0)
 a20:	1a1017b7          	lui	a5,0x1a101
 a24:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
 a26:	439c                	lw	a5,0(a5)
 a28:	fef42623          	sw	a5,-20(s0)
 a2c:	1a1017b7          	lui	a5,0x1a101
 a30:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
 a32:	439c                	lw	a5,0(a5)
 a34:	fef42423          	sw	a5,-24(s0)
 a38:	fd842783          	lw	a5,-40(s0)
 a3c:	8b85                	and	a5,a5,1
 a3e:	ef91                	bnez	a5,a5a <set_gpio_pin_irq_type+0x48>
 a40:	fdc42783          	lw	a5,-36(s0)
 a44:	4705                	li	a4,1
 a46:	00f717b3          	sll	a5,a4,a5
 a4a:	fff7c793          	not	a5,a5
 a4e:	fec42703          	lw	a4,-20(s0)
 a52:	8ff9                	and	a5,a5,a4
 a54:	fef42623          	sw	a5,-20(s0)
 a58:	a819                	j	a6e <set_gpio_pin_irq_type+0x5c>
 a5a:	fdc42783          	lw	a5,-36(s0)
 a5e:	4705                	li	a4,1
 a60:	00f717b3          	sll	a5,a4,a5
 a64:	fec42703          	lw	a4,-20(s0)
 a68:	8fd9                	or	a5,a5,a4
 a6a:	fef42623          	sw	a5,-20(s0)
 a6e:	fd842783          	lw	a5,-40(s0)
 a72:	8b89                	and	a5,a5,2
 a74:	ef91                	bnez	a5,a90 <set_gpio_pin_irq_type+0x7e>
 a76:	fdc42783          	lw	a5,-36(s0)
 a7a:	4705                	li	a4,1
 a7c:	00f717b3          	sll	a5,a4,a5
 a80:	fff7c793          	not	a5,a5
 a84:	fe842703          	lw	a4,-24(s0)
 a88:	8ff9                	and	a5,a5,a4
 a8a:	fef42423          	sw	a5,-24(s0)
 a8e:	a819                	j	aa4 <set_gpio_pin_irq_type+0x92>
 a90:	fdc42783          	lw	a5,-36(s0)
 a94:	4705                	li	a4,1
 a96:	00f717b3          	sll	a5,a4,a5
 a9a:	fe842703          	lw	a4,-24(s0)
 a9e:	8fd9                	or	a5,a5,a4
 aa0:	fef42423          	sw	a5,-24(s0)
 aa4:	1a1017b7          	lui	a5,0x1a101
 aa8:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
 aaa:	fec42703          	lw	a4,-20(s0)
 aae:	c398                	sw	a4,0(a5)
 ab0:	1a1017b7          	lui	a5,0x1a101
 ab4:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
 ab6:	fe842703          	lw	a4,-24(s0)
 aba:	c398                	sw	a4,0(a5)
 abc:	0001                	nop
 abe:	5432                	lw	s0,44(sp)
 ac0:	6145                	add	sp,sp,48
 ac2:	8082                	ret

00000ac4 <get_gpio_irq_status>:
 ac4:	1141                	add	sp,sp,-16
 ac6:	c622                	sw	s0,12(sp)
 ac8:	0800                	add	s0,sp,16
 aca:	1a1017b7          	lui	a5,0x1a101
 ace:	07e1                	add	a5,a5,24 # 1a101018 <_stack_start+0x19ff9018>
 ad0:	439c                	lw	a5,0(a5)
 ad2:	853e                	mv	a0,a5
 ad4:	4432                	lw	s0,12(sp)
 ad6:	0141                	add	sp,sp,16
 ad8:	8082                	ret

00000ada <uart_set_cfg>:
 ada:	1101                	add	sp,sp,-32
 adc:	ce22                	sw	s0,28(sp)
 ade:	1000                	add	s0,sp,32
 ae0:	fea42623          	sw	a0,-20(s0)
 ae4:	87ae                	mv	a5,a1
 ae6:	fef41523          	sh	a5,-22(s0)
 aea:	1a1077b7          	lui	a5,0x1a107
 aee:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 af0:	4398                	lw	a4,0(a5)
 af2:	1a1077b7          	lui	a5,0x1a107
 af6:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 af8:	00276713          	or	a4,a4,2
 afc:	c398                	sw	a4,0(a5)
 afe:	1a1007b7          	lui	a5,0x1a100
 b02:	07b1                	add	a5,a5,12 # 1a10000c <_stack_start+0x19ff800c>
 b04:	08300713          	li	a4,131
 b08:	c398                	sw	a4,0(a5)
 b0a:	fea45783          	lhu	a5,-22(s0)
 b0e:	83a1                	srl	a5,a5,0x8
 b10:	07c2                	sll	a5,a5,0x10
 b12:	83c1                	srl	a5,a5,0x10
 b14:	873e                	mv	a4,a5
 b16:	1a1007b7          	lui	a5,0x1a100
 b1a:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 b1c:	0ff77713          	zext.b	a4,a4
 b20:	c398                	sw	a4,0(a5)
 b22:	fea45703          	lhu	a4,-22(s0)
 b26:	1a1007b7          	lui	a5,0x1a100
 b2a:	0ff77713          	zext.b	a4,a4
 b2e:	c398                	sw	a4,0(a5)
 b30:	1a1007b7          	lui	a5,0x1a100
 b34:	07a1                	add	a5,a5,8 # 1a100008 <_stack_start+0x19ff8008>
 b36:	0a700713          	li	a4,167
 b3a:	c398                	sw	a4,0(a5)
 b3c:	1a1007b7          	lui	a5,0x1a100
 b40:	07b1                	add	a5,a5,12 # 1a10000c <_stack_start+0x19ff800c>
 b42:	470d                	li	a4,3
 b44:	c398                	sw	a4,0(a5)
 b46:	1a1007b7          	lui	a5,0x1a100
 b4a:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 b4c:	439c                	lw	a5,0(a5)
 b4e:	0f07f713          	and	a4,a5,240
 b52:	1a1007b7          	lui	a5,0x1a100
 b56:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 b58:	00276713          	or	a4,a4,2
 b5c:	c398                	sw	a4,0(a5)
 b5e:	0001                	nop
 b60:	4472                	lw	s0,28(sp)
 b62:	6105                	add	sp,sp,32
 b64:	8082                	ret

00000b66 <uart_send>:
 b66:	7179                	add	sp,sp,-48
 b68:	d622                	sw	s0,44(sp)
 b6a:	1800                	add	s0,sp,48
 b6c:	fca42e23          	sw	a0,-36(s0)
 b70:	fcb42c23          	sw	a1,-40(s0)
 b74:	a891                	j	bc8 <uart_send+0x62>
 b76:	0001                	nop
 b78:	1a1007b7          	lui	a5,0x1a100
 b7c:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 b7e:	439c                	lw	a5,0(a5)
 b80:	0207f793          	and	a5,a5,32
 b84:	dbf5                	beqz	a5,b78 <uart_send+0x12>
 b86:	fe042623          	sw	zero,-20(s0)
 b8a:	a035                	j	bb6 <uart_send+0x50>
 b8c:	fdc42783          	lw	a5,-36(s0)
 b90:	00178713          	add	a4,a5,1
 b94:	fce42e23          	sw	a4,-36(s0)
 b98:	0007c703          	lbu	a4,0(a5)
 b9c:	1a1007b7          	lui	a5,0x1a100
 ba0:	c398                	sw	a4,0(a5)
 ba2:	fd842783          	lw	a5,-40(s0)
 ba6:	17fd                	add	a5,a5,-1 # 1a0fffff <_stack_start+0x19ff7fff>
 ba8:	fcf42c23          	sw	a5,-40(s0)
 bac:	fec42783          	lw	a5,-20(s0)
 bb0:	0785                	add	a5,a5,1
 bb2:	fef42623          	sw	a5,-20(s0)
 bb6:	fec42703          	lw	a4,-20(s0)
 bba:	03f00793          	li	a5,63
 bbe:	00e7e563          	bltu	a5,a4,bc8 <uart_send+0x62>
 bc2:	fd842783          	lw	a5,-40(s0)
 bc6:	f3f9                	bnez	a5,b8c <uart_send+0x26>
 bc8:	fd842783          	lw	a5,-40(s0)
 bcc:	f7cd                	bnez	a5,b76 <uart_send+0x10>
 bce:	0001                	nop
 bd0:	0001                	nop
 bd2:	5432                	lw	s0,44(sp)
 bd4:	6145                	add	sp,sp,48
 bd6:	8082                	ret

00000bd8 <uart_getchar>:
 bd8:	1141                	add	sp,sp,-16
 bda:	c622                	sw	s0,12(sp)
 bdc:	0800                	add	s0,sp,16
 bde:	0001                	nop
 be0:	1a1007b7          	lui	a5,0x1a100
 be4:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 be6:	439c                	lw	a5,0(a5)
 be8:	0017f713          	and	a4,a5,1
 bec:	4785                	li	a5,1
 bee:	fef719e3          	bne	a4,a5,be0 <uart_getchar+0x8>
 bf2:	1a1007b7          	lui	a5,0x1a100
 bf6:	439c                	lw	a5,0(a5)
 bf8:	0ff7f793          	zext.b	a5,a5
 bfc:	853e                	mv	a0,a5
 bfe:	4432                	lw	s0,12(sp)
 c00:	0141                	add	sp,sp,16
 c02:	8082                	ret

00000c04 <uart_sendchar>:
 c04:	1101                	add	sp,sp,-32
 c06:	ce22                	sw	s0,28(sp)
 c08:	1000                	add	s0,sp,32
 c0a:	87aa                	mv	a5,a0
 c0c:	fef407a3          	sb	a5,-17(s0)
 c10:	0001                	nop
 c12:	1a1007b7          	lui	a5,0x1a100
 c16:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 c18:	439c                	lw	a5,0(a5)
 c1a:	0207f793          	and	a5,a5,32
 c1e:	dbf5                	beqz	a5,c12 <uart_sendchar+0xe>
 c20:	1a1007b7          	lui	a5,0x1a100
 c24:	fef44703          	lbu	a4,-17(s0)
 c28:	c398                	sw	a4,0(a5)
 c2a:	0001                	nop
 c2c:	4472                	lw	s0,28(sp)
 c2e:	6105                	add	sp,sp,32
 c30:	8082                	ret

00000c32 <uart_wait_tx_done>:
 c32:	1141                	add	sp,sp,-16
 c34:	c622                	sw	s0,12(sp)
 c36:	0800                	add	s0,sp,16
 c38:	0001                	nop
 c3a:	1a1007b7          	lui	a5,0x1a100
 c3e:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 c40:	439c                	lw	a5,0(a5)
 c42:	0407f793          	and	a5,a5,64
 c46:	dbf5                	beqz	a5,c3a <uart_wait_tx_done+0x8>
 c48:	0001                	nop
 c4a:	0001                	nop
 c4c:	4432                	lw	s0,12(sp)
 c4e:	0141                	add	sp,sp,16
 c50:	8082                	ret

00000c52 <exit>:
 c52:	1101                	add	sp,sp,-32
 c54:	ce06                	sw	ra,28(sp)
 c56:	cc22                	sw	s0,24(sp)
 c58:	1000                	add	s0,sp,32
 c5a:	fea42623          	sw	a0,-20(s0)
 c5e:	fec42503          	lw	a0,-20(s0)
 c62:	2011                	jal	c66 <eoc>
 c64:	a001                	j	c64 <exit+0x12>

00000c66 <eoc>:
 c66:	1101                	add	sp,sp,-32
 c68:	ce06                	sw	ra,28(sp)
 c6a:	cc22                	sw	s0,24(sp)
 c6c:	1000                	add	s0,sp,32
 c6e:	fea42623          	sw	a0,-20(s0)
 c72:	fec42783          	lw	a5,-20(s0)
 c76:	c799                	beqz	a5,c84 <eoc+0x1e>
 c78:	1a1077b7          	lui	a5,0x1a107
 c7c:	07d1                	add	a5,a5,20 # 1a107014 <_stack_start+0x19fff014>
 c7e:	4705                	li	a4,1
 c80:	c398                	sw	a4,0(a5)
 c82:	a031                	j	c8e <eoc+0x28>
 c84:	1a1077b7          	lui	a5,0x1a107
 c88:	07d1                	add	a5,a5,20 # 1a107014 <_stack_start+0x19fff014>
 c8a:	0007a023          	sw	zero,0(a5)
 c8e:	1a1077b7          	lui	a5,0x1a107
 c92:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 c94:	4398                	lw	a4,0(a5)
 c96:	1a1077b7          	lui	a5,0x1a107
 c9a:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 c9c:	00476713          	or	a4,a4,4
 ca0:	c398                	sw	a4,0(a5)
 ca2:	4585                	li	a1,1
 ca4:	4521                	li	a0,8
 ca6:	3ea1                	jal	7fe <set_pin_function>
 ca8:	4585                	li	a1,1
 caa:	4521                	li	a0,8
 cac:	3ef1                	jal	888 <set_gpio_pin_direction>
 cae:	4585                	li	a1,1
 cb0:	4521                	li	a0,8
 cb2:	31a5                	jal	91a <set_gpio_pin_value>
 cb4:	0001                	nop
 cb6:	40f2                	lw	ra,28(sp)
 cb8:	4462                	lw	s0,24(sp)
 cba:	6105                	add	sp,sp,32
 cbc:	8082                	ret

00000cbe <sleep_busy>:
 cbe:	7179                	add	sp,sp,-48
 cc0:	d622                	sw	s0,44(sp)
 cc2:	1800                	add	s0,sp,48
 cc4:	fca42e23          	sw	a0,-36(s0)
 cc8:	fe042623          	sw	zero,-20(s0)
 ccc:	a039                	j	cda <sleep_busy+0x1c>
 cce:	0001                	nop
 cd0:	fec42783          	lw	a5,-20(s0)
 cd4:	0785                	add	a5,a5,1
 cd6:	fef42623          	sw	a5,-20(s0)
 cda:	fdc42783          	lw	a5,-36(s0)
 cde:	fec42703          	lw	a4,-20(s0)
 ce2:	fef746e3          	blt	a4,a5,cce <sleep_busy+0x10>
 ce6:	0001                	nop
 ce8:	0001                	nop
 cea:	5432                	lw	s0,44(sp)
 cec:	6145                	add	sp,sp,48
 cee:	8082                	ret

00000cf0 <ISR_I2C>:
 cf0:	1141                	add	sp,sp,-16
 cf2:	c622                	sw	s0,12(sp)
 cf4:	0800                	add	s0,sp,16
 cf6:	a001                	j	cf6 <ISR_I2C+0x6>

00000cf8 <ISR_UART>:
 cf8:	1141                	add	sp,sp,-16
 cfa:	c622                	sw	s0,12(sp)
 cfc:	0800                	add	s0,sp,16
 cfe:	a001                	j	cfe <ISR_UART+0x6>

00000d00 <ISR_GPIO>:
 d00:	1141                	add	sp,sp,-16
 d02:	c622                	sw	s0,12(sp)
 d04:	0800                	add	s0,sp,16
 d06:	a001                	j	d06 <ISR_GPIO+0x6>

00000d08 <ISR_SPIM0>:
 d08:	1141                	add	sp,sp,-16
 d0a:	c622                	sw	s0,12(sp)
 d0c:	0800                	add	s0,sp,16
 d0e:	a001                	j	d0e <ISR_SPIM0+0x6>

00000d10 <ISR_SPIM1>:
 d10:	1141                	add	sp,sp,-16
 d12:	c622                	sw	s0,12(sp)
 d14:	0800                	add	s0,sp,16
 d16:	a001                	j	d16 <ISR_SPIM1+0x6>

00000d18 <ISR_TA_OVF>:
 d18:	1141                	add	sp,sp,-16
 d1a:	c622                	sw	s0,12(sp)
 d1c:	0800                	add	s0,sp,16
 d1e:	a001                	j	d1e <ISR_TA_OVF+0x6>

00000d20 <ISR_TA_CMP>:
 d20:	1141                	add	sp,sp,-16
 d22:	c622                	sw	s0,12(sp)
 d24:	0800                	add	s0,sp,16
 d26:	a001                	j	d26 <ISR_TA_CMP+0x6>

00000d28 <ISR_TB_OVF>:
 d28:	1141                	add	sp,sp,-16
 d2a:	c622                	sw	s0,12(sp)
 d2c:	0800                	add	s0,sp,16
 d2e:	a001                	j	d2e <ISR_TB_OVF+0x6>

00000d30 <ISR_TB_CMP>:
 d30:	1141                	add	sp,sp,-16
 d32:	c622                	sw	s0,12(sp)
 d34:	0800                	add	s0,sp,16
 d36:	a001                	j	d36 <ISR_TB_CMP+0x6>

00000d38 <default_exception_handler_c>:
 d38:	1141                	add	sp,sp,-16
 d3a:	c622                	sw	s0,12(sp)
 d3c:	0800                	add	s0,sp,16
 d3e:	a001                	j	d3e <default_exception_handler_c+0x6>

00000d40 <illegal_insn_handler_c>:
 d40:	1141                	add	sp,sp,-16
 d42:	c622                	sw	s0,12(sp)
 d44:	0800                	add	s0,sp,16
 d46:	a001                	j	d46 <illegal_insn_handler_c+0x6>

00000d48 <ecall_insn_handler_c>:
 d48:	1141                	add	sp,sp,-16
 d4a:	c622                	sw	s0,12(sp)
 d4c:	0800                	add	s0,sp,16
 d4e:	a001                	j	d4e <ecall_insn_handler_c+0x6>

00000d50 <sp2_init>:
 d50:	1141                	add	sp,sp,-16
 d52:	c622                	sw	s0,12(sp)
 d54:	0800                	add	s0,sp,16
 d56:	1a1087b7          	lui	a5,0x1a108
 d5a:	4705                	li	a4,1
 d5c:	c398                	sw	a4,0(a5)
 d5e:	0001                	nop
 d60:	4432                	lw	s0,12(sp)
 d62:	0141                	add	sp,sp,16
 d64:	8082                	ret

00000d66 <uint2bits>:
 d66:	7179                	add	sp,sp,-48
 d68:	d622                	sw	s0,44(sp)
 d6a:	1800                	add	s0,sp,48
 d6c:	fca42e23          	sw	a0,-36(s0)
 d70:	fcb42c23          	sw	a1,-40(s0)
 d74:	fe042623          	sw	zero,-20(s0)
 d78:	47fd                	li	a5,31
 d7a:	fef42623          	sw	a5,-20(s0)
 d7e:	a091                	j	dc2 <uint2bits+0x5c>
 d80:	fec42783          	lw	a5,-20(s0)
 d84:	fd842703          	lw	a4,-40(s0)
 d88:	00f757b3          	srl	a5,a4,a5
 d8c:	8b85                	and	a5,a5,1
 d8e:	fef42423          	sw	a5,-24(s0)
 d92:	fe842783          	lw	a5,-24(s0)
 d96:	0ff7f713          	zext.b	a4,a5
 d9a:	46fd                	li	a3,31
 d9c:	fec42783          	lw	a5,-20(s0)
 da0:	40f687b3          	sub	a5,a3,a5
 da4:	86be                	mv	a3,a5
 da6:	fdc42783          	lw	a5,-36(s0)
 daa:	97b6                	add	a5,a5,a3
 dac:	03070713          	add	a4,a4,48
 db0:	0ff77713          	zext.b	a4,a4
 db4:	00e78023          	sb	a4,0(a5) # 1a108000 <_stack_start+0x1a000000>
 db8:	fec42783          	lw	a5,-20(s0)
 dbc:	17fd                	add	a5,a5,-1
 dbe:	fef42623          	sw	a5,-20(s0)
 dc2:	fec42783          	lw	a5,-20(s0)
 dc6:	fa07dde3          	bgez	a5,d80 <uint2bits+0x1a>
 dca:	0001                	nop
 dcc:	0001                	nop
 dce:	5432                	lw	s0,44(sp)
 dd0:	6145                	add	sp,sp,48
 dd2:	8082                	ret

00000dd4 <getKeyCode>:
 dd4:	1101                	add	sp,sp,-32
 dd6:	ce22                	sw	s0,28(sp)
 dd8:	1000                	add	s0,sp,32
 dda:	fea42623          	sw	a0,-20(s0)
 dde:	fec42783          	lw	a5,-20(s0)
 de2:	0ff7f793          	zext.b	a5,a5
 de6:	853e                	mv	a0,a5
 de8:	4472                	lw	s0,28(sp)
 dea:	6105                	add	sp,sp,32
 dec:	8082                	ret

00000dee <getServiceCode>:
 dee:	1101                	add	sp,sp,-32
 df0:	ce22                	sw	s0,28(sp)
 df2:	1000                	add	s0,sp,32
 df4:	fea42623          	sw	a0,-20(s0)
 df8:	fec42783          	lw	a5,-20(s0)
 dfc:	83a1                	srl	a5,a5,0x8
 dfe:	0ff7f793          	zext.b	a5,a5
 e02:	853e                	mv	a0,a5
 e04:	4472                	lw	s0,28(sp)
 e06:	6105                	add	sp,sp,32
 e08:	8082                	ret

00000e0a <read_usb_key>:
 e0a:	1101                	add	sp,sp,-32
 e0c:	ce22                	sw	s0,28(sp)
 e0e:	1000                	add	s0,sp,32
 e10:	1a1087b7          	lui	a5,0x1a108
 e14:	0791                	add	a5,a5,4 # 1a108004 <_stack_start+0x1a000004>
 e16:	4705                	li	a4,1
 e18:	c398                	sw	a4,0(a5)
 e1a:	4785                	li	a5,1
 e1c:	fef42623          	sw	a5,-20(s0)
 e20:	a039                	j	e2e <read_usb_key+0x24>
 e22:	1a1087b7          	lui	a5,0x1a108
 e26:	07c1                	add	a5,a5,16 # 1a108010 <_stack_start+0x1a000010>
 e28:	439c                	lw	a5,0(a5)
 e2a:	fef42623          	sw	a5,-20(s0)
 e2e:	fec42783          	lw	a5,-20(s0)
 e32:	fbe5                	bnez	a5,e22 <read_usb_key+0x18>
 e34:	1a1087b7          	lui	a5,0x1a108
 e38:	07d1                	add	a5,a5,20 # 1a108014 <_stack_start+0x1a000014>
 e3a:	439c                	lw	a5,0(a5)
 e3c:	853e                	mv	a0,a5
 e3e:	4472                	lw	s0,28(sp)
 e40:	6105                	add	sp,sp,32
 e42:	8082                	ret

00000e44 <getKeycodeFromArray>:
 e44:	7179                	add	sp,sp,-48
 e46:	d622                	sw	s0,44(sp)
 e48:	1800                	add	s0,sp,48
 e4a:	fca42e23          	sw	a0,-36(s0)
 e4e:	fe042623          	sw	zero,-20(s0)
 e52:	47e1                	li	a5,24
 e54:	fef42623          	sw	a5,-20(s0)
 e58:	a025                	j	e80 <getKeycodeFromArray+0x3c>
 e5a:	fec42783          	lw	a5,-20(s0)
 e5e:	fdc42703          	lw	a4,-36(s0)
 e62:	973e                	add	a4,a4,a5
 e64:	fec42783          	lw	a5,-20(s0)
 e68:	17a1                	add	a5,a5,-24
 e6a:	00074703          	lbu	a4,0(a4)
 e6e:	17c1                	add	a5,a5,-16
 e70:	97a2                	add	a5,a5,s0
 e72:	fee78a23          	sb	a4,-12(a5)
 e76:	fec42783          	lw	a5,-20(s0)
 e7a:	0785                	add	a5,a5,1
 e7c:	fef42623          	sw	a5,-20(s0)
 e80:	fec42703          	lw	a4,-20(s0)
 e84:	47f9                	li	a5,30
 e86:	fce7dae3          	bge	a5,a4,e5a <getKeycodeFromArray+0x16>
 e8a:	fe440793          	add	a5,s0,-28
 e8e:	853e                	mv	a0,a5
 e90:	5432                	lw	s0,44(sp)
 e92:	6145                	add	sp,sp,48
 e94:	8082                	ret

00000e96 <getReleasedKeycode>:
 e96:	1101                	add	sp,sp,-32
 e98:	ce22                	sw	s0,28(sp)
 e9a:	1000                	add	s0,sp,32
 e9c:	1a1087b7          	lui	a5,0x1a108
 ea0:	0791                	add	a5,a5,4 # 1a108004 <_stack_start+0x1a000004>
 ea2:	4705                	li	a4,1
 ea4:	c398                	sw	a4,0(a5)
 ea6:	4785                	li	a5,1
 ea8:	fef42623          	sw	a5,-20(s0)
 eac:	fe042423          	sw	zero,-24(s0)
 eb0:	a039                	j	ebe <getReleasedKeycode+0x28>
 eb2:	1a1087b7          	lui	a5,0x1a108
 eb6:	07c1                	add	a5,a5,16 # 1a108010 <_stack_start+0x1a000010>
 eb8:	439c                	lw	a5,0(a5)
 eba:	fef42623          	sw	a5,-20(s0)
 ebe:	fec42783          	lw	a5,-20(s0)
 ec2:	fbe5                	bnez	a5,eb2 <getReleasedKeycode+0x1c>
 ec4:	a039                	j	ed2 <getReleasedKeycode+0x3c>
 ec6:	1a1087b7          	lui	a5,0x1a108
 eca:	07d1                	add	a5,a5,20 # 1a108014 <_stack_start+0x1a000014>
 ecc:	439c                	lw	a5,0(a5)
 ece:	fef42423          	sw	a5,-24(s0)
 ed2:	fe842703          	lw	a4,-24(s0)
 ed6:	0f000793          	li	a5,240
 eda:	fef716e3          	bne	a4,a5,ec6 <getReleasedKeycode+0x30>
 ede:	a039                	j	eec <getReleasedKeycode+0x56>
 ee0:	1a1087b7          	lui	a5,0x1a108
 ee4:	07d1                	add	a5,a5,20 # 1a108014 <_stack_start+0x1a000014>
 ee6:	439c                	lw	a5,0(a5)
 ee8:	fef42423          	sw	a5,-24(s0)
 eec:	fe842703          	lw	a4,-24(s0)
 ef0:	0f000793          	li	a5,240
 ef4:	fef706e3          	beq	a4,a5,ee0 <getReleasedKeycode+0x4a>
 ef8:	fe842783          	lw	a5,-24(s0)
 efc:	853e                	mv	a0,a5
 efe:	4472                	lw	s0,28(sp)
 f00:	6105                	add	sp,sp,32
 f02:	8082                	ret

00000f04 <__CTOR_LIST__>:
	...

00000f0c <__CTOR_END__>:
	...

Disassembly of section .text.__libc_init_array:

00000f14 <__libc_init_array>:
 f14:	ff010113          	add	sp,sp,-16
 f18:	00812423          	sw	s0,8(sp)
 f1c:	001007b7          	lui	a5,0x100
 f20:	00100437          	lui	s0,0x100
 f24:	01212023          	sw	s2,0(sp)
 f28:	00078793          	mv	a5,a5
 f2c:	00040713          	mv	a4,s0
 f30:	00112623          	sw	ra,12(sp)
 f34:	00912223          	sw	s1,4(sp)
 f38:	40e78933          	sub	s2,a5,a4
 f3c:	02e78263          	beq	a5,a4,f60 <__libc_init_array+0x4c>
 f40:	40295913          	sra	s2,s2,0x2
 f44:	00040413          	mv	s0,s0
 f48:	00000493          	li	s1,0
 f4c:	00042783          	lw	a5,0(s0) # 100000 <__init_array_end>
 f50:	00148493          	add	s1,s1,1
 f54:	00440413          	add	s0,s0,4
 f58:	000780e7          	jalr	a5 # 100000 <__init_array_end>
 f5c:	ff24e8e3          	bltu	s1,s2,f4c <__libc_init_array+0x38>
 f60:	00100437          	lui	s0,0x100
 f64:	001007b7          	lui	a5,0x100
 f68:	00078793          	mv	a5,a5
 f6c:	00040713          	mv	a4,s0
 f70:	40e78933          	sub	s2,a5,a4
 f74:	40295913          	sra	s2,s2,0x2
 f78:	02e78063          	beq	a5,a4,f98 <__libc_init_array+0x84>
 f7c:	00040413          	mv	s0,s0
 f80:	00000493          	li	s1,0
 f84:	00042783          	lw	a5,0(s0) # 100000 <__init_array_end>
 f88:	00148493          	add	s1,s1,1
 f8c:	00440413          	add	s0,s0,4
 f90:	000780e7          	jalr	a5 # 100000 <__init_array_end>
 f94:	ff24e8e3          	bltu	s1,s2,f84 <__libc_init_array+0x70>
 f98:	00c12083          	lw	ra,12(sp)
 f9c:	00812403          	lw	s0,8(sp)
 fa0:	00412483          	lw	s1,4(sp)
 fa4:	00012903          	lw	s2,0(sp)
 fa8:	01010113          	add	sp,sp,16
 fac:	00008067          	ret

Disassembly of section .rodata:

00100000 <__init_array_end>:
  100000:	02ea                	.2byte	0x2ea
  100002:	0000                	.2byte	0x0
  100004:	0644                	.2byte	0x644
  100006:	0000                	.2byte	0x0
  100008:	0786                	.2byte	0x786
  10000a:	0000                	.2byte	0x0
  10000c:	0786                	.2byte	0x786
  10000e:	0000                	.2byte	0x0
  100010:	0786                	.2byte	0x786
  100012:	0000                	.2byte	0x0
  100014:	0540                	.2byte	0x540
  100016:	0000                	.2byte	0x0
  100018:	043c                	.2byte	0x43c
  10001a:	0000                	.2byte	0x0
  10001c:	0422                	.2byte	0x422
  10001e:	0000                	.2byte	0x0
  100020:	0304                	.2byte	0x304
  100022:	0000                	.2byte	0x0
  100024:	065e                	.2byte	0x65e
  100026:	0000                	.2byte	0x0
  100028:	0786                	.2byte	0x786
  10002a:	0000                	.2byte	0x0
  10002c:	0786                	.2byte	0x786
  10002e:	0000                	.2byte	0x0
  100030:	0574                	.2byte	0x574
  100032:	0000                	.2byte	0x0
  100034:	055a                	.2byte	0x55a
  100036:	0000                	.2byte	0x0
  100038:	0456                	.2byte	0x456
  10003a:	0000                	.2byte	0x0
  10003c:	031e                	.2byte	0x31e
  10003e:	0000                	.2byte	0x0
  100040:	0692                	.2byte	0x692
  100042:	0000                	.2byte	0x0
  100044:	0678                	.2byte	0x678
  100046:	0000                	.2byte	0x0
  100048:	0786                	.2byte	0x786
  10004a:	0000                	.2byte	0x0
  10004c:	0786                	.2byte	0x786
  10004e:	0000                	.2byte	0x0
  100050:	077c                	.2byte	0x77c
  100052:	0000                	.2byte	0x0
  100054:	058e                	.2byte	0x58e
  100056:	0000                	.2byte	0x0
  100058:	0470                	.2byte	0x470
  10005a:	0000                	.2byte	0x0
  10005c:	0352                	.2byte	0x352
  10005e:	0000                	.2byte	0x0
  100060:	0338                	.2byte	0x338
  100062:	0000                	.2byte	0x0
  100064:	06ac                	.2byte	0x6ac
  100066:	0000                	.2byte	0x0
  100068:	0786                	.2byte	0x786
  10006a:	0000                	.2byte	0x0
  10006c:	0786                	.2byte	0x786
  10006e:	0000                	.2byte	0x0
  100070:	05c2                	.2byte	0x5c2
  100072:	0000                	.2byte	0x0
  100074:	05a8                	.2byte	0x5a8
  100076:	0000                	.2byte	0x0
  100078:	04a4                	.2byte	0x4a4
  10007a:	0000                	.2byte	0x0
  10007c:	048a                	.2byte	0x48a
  10007e:	0000                	.2byte	0x0
  100080:	036c                	.2byte	0x36c
  100082:	0000                	.2byte	0x0
  100084:	06c6                	.2byte	0x6c6
  100086:	0000                	.2byte	0x0
  100088:	0786                	.2byte	0x786
  10008a:	0000                	.2byte	0x0
  10008c:	0786                	.2byte	0x786
  10008e:	0000                	.2byte	0x0
  100090:	0786                	.2byte	0x786
  100092:	0000                	.2byte	0x0
  100094:	05dc                	.2byte	0x5dc
  100096:	0000                	.2byte	0x0
  100098:	04be                	.2byte	0x4be
  10009a:	0000                	.2byte	0x0
  10009c:	0386                	.2byte	0x386
  10009e:	0000                	.2byte	0x0
  1000a0:	06e0                	.2byte	0x6e0
  1000a2:	0000                	.2byte	0x0
  1000a4:	06fa                	.2byte	0x6fa
  1000a6:	0000                	.2byte	0x0
  1000a8:	0786                	.2byte	0x786
  1000aa:	0000                	.2byte	0x0
  1000ac:	0786                	.2byte	0x786
  1000ae:	0000                	.2byte	0x0
  1000b0:	05f6                	.2byte	0x5f6
  1000b2:	0000                	.2byte	0x0
  1000b4:	04d8                	.2byte	0x4d8
  1000b6:	0000                	.2byte	0x0
  1000b8:	03a0                	.2byte	0x3a0
  1000ba:	0000                	.2byte	0x0
  1000bc:	03ba                	.2byte	0x3ba
  1000be:	0000                	.2byte	0x0
  1000c0:	072e                	.2byte	0x72e
  1000c2:	0000                	.2byte	0x0
  1000c4:	0714                	.2byte	0x714
  1000c6:	0000                	.2byte	0x0
  1000c8:	0786                	.2byte	0x786
  1000ca:	0000                	.2byte	0x0
  1000cc:	0786                	.2byte	0x786
  1000ce:	0000                	.2byte	0x0
  1000d0:	0610                	.2byte	0x610
  1000d2:	0000                	.2byte	0x0
  1000d4:	062a                	.2byte	0x62a
  1000d6:	0000                	.2byte	0x0
  1000d8:	04f2                	.2byte	0x4f2
  1000da:	0000                	.2byte	0x0
  1000dc:	050c                	.2byte	0x50c
  1000de:	0000                	.2byte	0x0
  1000e0:	03d4                	.2byte	0x3d4
  1000e2:	0000                	.2byte	0x0
  1000e4:	0748                	.2byte	0x748
  1000e6:	0000                	.2byte	0x0
  1000e8:	0786                	.2byte	0x786
  1000ea:	0000                	.2byte	0x0
  1000ec:	0786                	.2byte	0x786
  1000ee:	0000                	.2byte	0x0
  1000f0:	0786                	.2byte	0x786
  1000f2:	0000                	.2byte	0x0
  1000f4:	0526                	.2byte	0x526
  1000f6:	0000                	.2byte	0x0
  1000f8:	0786                	.2byte	0x786
  1000fa:	0000                	.2byte	0x0
  1000fc:	03ee                	.2byte	0x3ee
  1000fe:	0000                	.2byte	0x0
  100100:	0762                	.2byte	0x762
  100102:	0000                	.2byte	0x0
  100104:	0786                	.2byte	0x786
  100106:	0000                	.2byte	0x0
  100108:	0786                	.2byte	0x786
  10010a:	0000                	.2byte	0x0
  10010c:	0786                	.2byte	0x786
  10010e:	0000                	.2byte	0x0
  100110:	0786                	.2byte	0x786
  100112:	0000                	.2byte	0x0
  100114:	0786                	.2byte	0x786
  100116:	0000                	.2byte	0x0
  100118:	0408                	.2byte	0x408
  10011a:	0000                	.2byte	0x0
  10011c:	0a2d                	.2byte	0xa2d
	...

Disassembly of section .shbss:

0010011f <.shbss>:
	...

Disassembly of section .bss:

00100120 <shiftPressed>:
  100120:	0000                	.2byte	0x0
	...

Disassembly of section .stack:

00106000 <_stack-0x1000>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	3241                	.2byte	0x3241
   2:	0000                	.2byte	0x0
   4:	7200                	.2byte	0x7200
   6:	7369                	.2byte	0x7369
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	0028                	.2byte	0x28
   e:	0000                	.2byte	0x0
  10:	1004                	.2byte	0x1004
  12:	7205                	.2byte	0x7205
  14:	3376                	.2byte	0x3376
  16:	6932                	.2byte	0x6932
  18:	7032                	.2byte	0x7032
  1a:	5f30                	.2byte	0x5f30
  1c:	326d                	.2byte	0x326d
  1e:	3070                	.2byte	0x3070
  20:	635f 7032 5f30      	.byte	0x5f, 0x63, 0x32, 0x70, 0x30, 0x5f
  26:	6d7a                	.2byte	0x6d7a
  28:	756d                	.2byte	0x756d
  2a:	316c                	.2byte	0x316c
  2c:	3070                	.2byte	0x3070
  2e:	0800                	.2byte	0x800
  30:	0a01                	.2byte	0xa01
  32:	0b              	Address 0x32 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.4byte	0x3a434347
   4:	2820                	.2byte	0x2820
   6:	65653267          	.4byte	0x65653267
   a:	6535                	.2byte	0x6535
   c:	3334                	.2byte	0x3334
   e:	3030                	.2byte	0x3030
  10:	3831                	.2byte	0x3831
  12:	2029                	.2byte	0x2029
  14:	3231                	.2byte	0x3231
  16:	322e                	.2byte	0x322e
  18:	302e                	.2byte	0x302e
  1a:	4700                	.2byte	0x4700
  1c:	203a4343          	.4byte	0x203a4343
  20:	4728                	.2byte	0x4728
  22:	554e                	.2byte	0x554e
  24:	2029                	.2byte	0x2029
  26:	3231                	.2byte	0x3231
  28:	322e                	.2byte	0x322e
  2a:	302e                	.2byte	0x302e
	...
