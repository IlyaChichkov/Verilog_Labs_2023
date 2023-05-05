
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
  dc:	f28d0d13          	add	s10,s10,-216 # 100000 <_bss_end>
  e0:	00100d97          	auipc	s11,0x100
  e4:	f20d8d93          	add	s11,s11,-224 # 100000 <_bss_end>
  e8:	01bd5763          	bge	s10,s11,f6 <zero_loop_end>

000000ec <zero_loop>:
  ec:	000d2023          	sw	zero,0(s10)
  f0:	0d11                	add	s10,s10,4
  f2:	ffaddde3          	bge	s11,s10,ec <zero_loop>

000000f6 <zero_loop_end>:
  f6:	0bf000ef          	jal	9b4 <__DTOR_END__>

000000fa <main_entry>:
  fa:	4501                	li	a0,0
  fc:	4585                	li	a1,1
  fe:	516000ef          	jal	614 <uart_set_cfg>
 102:	4501                	li	a0,0
 104:	4581                	li	a1,0
 106:	21c000ef          	jal	322 <main>
 10a:	842a                	mv	s0,a0
 10c:	660000ef          	jal	76c <uart_wait_tx_done>
 110:	8522                	mv	a0,s0
 112:	67a000ef          	jal	78c <exit>

00000116 <ISR_I2C_ASM>:
 116:	711d                	add	sp,sp,-96
 118:	ce86                	sw	ra,92(sp)
 11a:	0d8000ef          	jal	1f2 <store_regs>
 11e:	00000097          	auipc	ra,0x0
 122:	11e08093          	add	ra,ra,286 # 23c <end_except>
 126:	7040006f          	j	82a <ISR_I2C>

0000012a <ISR_UART_ASM>:
 12a:	711d                	add	sp,sp,-96
 12c:	ce86                	sw	ra,92(sp)
 12e:	0c4000ef          	jal	1f2 <store_regs>
 132:	00000097          	auipc	ra,0x0
 136:	10a08093          	add	ra,ra,266 # 23c <end_except>
 13a:	6f80006f          	j	832 <ISR_UART>

0000013e <ISR_GPIO_ASM>:
 13e:	711d                	add	sp,sp,-96
 140:	ce86                	sw	ra,92(sp)
 142:	0b0000ef          	jal	1f2 <store_regs>
 146:	00000097          	auipc	ra,0x0
 14a:	0f608093          	add	ra,ra,246 # 23c <end_except>
 14e:	6ec0006f          	j	83a <ISR_GPIO>

00000152 <ISR_SPIM0_ASM>:
 152:	711d                	add	sp,sp,-96
 154:	ce86                	sw	ra,92(sp)
 156:	09c000ef          	jal	1f2 <store_regs>
 15a:	00000097          	auipc	ra,0x0
 15e:	0e208093          	add	ra,ra,226 # 23c <end_except>
 162:	6e00006f          	j	842 <ISR_SPIM0>

00000166 <ISR_SPIM1_ASM>:
 166:	711d                	add	sp,sp,-96
 168:	ce86                	sw	ra,92(sp)
 16a:	088000ef          	jal	1f2 <store_regs>
 16e:	00000097          	auipc	ra,0x0
 172:	0ce08093          	add	ra,ra,206 # 23c <end_except>
 176:	6d40006f          	j	84a <ISR_SPIM1>

0000017a <ISR_TA_CMP_ASM>:
 17a:	711d                	add	sp,sp,-96
 17c:	ce86                	sw	ra,92(sp)
 17e:	074000ef          	jal	1f2 <store_regs>
 182:	00000097          	auipc	ra,0x0
 186:	0ba08093          	add	ra,ra,186 # 23c <end_except>
 18a:	6d00006f          	j	85a <ISR_TA_CMP>

0000018e <ISR_TA_OVF_ASM>:
 18e:	711d                	add	sp,sp,-96
 190:	ce86                	sw	ra,92(sp)
 192:	060000ef          	jal	1f2 <store_regs>
 196:	00000097          	auipc	ra,0x0
 19a:	0a608093          	add	ra,ra,166 # 23c <end_except>
 19e:	6b40006f          	j	852 <ISR_TA_OVF>

000001a2 <ISR_TB_CMP_ASM>:
 1a2:	711d                	add	sp,sp,-96
 1a4:	ce86                	sw	ra,92(sp)
 1a6:	04c000ef          	jal	1f2 <store_regs>
 1aa:	00000097          	auipc	ra,0x0
 1ae:	09208093          	add	ra,ra,146 # 23c <end_except>
 1b2:	6b80006f          	j	86a <ISR_TB_CMP>

000001b6 <ISR_TB_OVF_ASM>:
 1b6:	711d                	add	sp,sp,-96
 1b8:	ce86                	sw	ra,92(sp)
 1ba:	038000ef          	jal	1f2 <store_regs>
 1be:	00000097          	auipc	ra,0x0
 1c2:	07e08093          	add	ra,ra,126 # 23c <end_except>
 1c6:	69c0006f          	j	862 <ISR_TB_OVF>

000001ca <illegal_insn_handler>:
 1ca:	711d                	add	sp,sp,-96
 1cc:	ce86                	sw	ra,92(sp)
 1ce:	024000ef          	jal	1f2 <store_regs>
 1d2:	00000097          	auipc	ra,0x0
 1d6:	06a08093          	add	ra,ra,106 # 23c <end_except>
 1da:	6a00006f          	j	87a <illegal_insn_handler_c>

000001de <ecall_insn_handler>:
 1de:	711d                	add	sp,sp,-96
 1e0:	ce86                	sw	ra,92(sp)
 1e2:	010000ef          	jal	1f2 <store_regs>
 1e6:	00000097          	auipc	ra,0x0
 1ea:	05608093          	add	ra,ra,86 # 23c <end_except>
 1ee:	6940006f          	j	882 <ecall_insn_handler_c>

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

0000028c <cipher>:
 28c:	715d                	add	sp,sp,-80
 28e:	c686                	sw	ra,76(sp)
 290:	c4a2                	sw	s0,72(sp)
 292:	0880                	add	s0,sp,80
 294:	fe042623          	sw	zero,-20(s0)
 298:	47bd                	li	a5,15
 29a:	fef42623          	sw	a5,-20(s0)
 29e:	a839                	j	2bc <cipher+0x30>
 2a0:	298d                	jal	712 <uart_getchar>
 2a2:	87aa                	mv	a5,a0
 2a4:	873e                	mv	a4,a5
 2a6:	fec42783          	lw	a5,-20(s0)
 2aa:	17c1                	add	a5,a5,-16
 2ac:	97a2                	add	a5,a5,s0
 2ae:	fee78623          	sb	a4,-20(a5)
 2b2:	fec42783          	lw	a5,-20(s0)
 2b6:	17fd                	add	a5,a5,-1
 2b8:	fef42623          	sw	a5,-20(s0)
 2bc:	fec42783          	lw	a5,-20(s0)
 2c0:	fe07d0e3          	bgez	a5,2a0 <cipher+0x14>
 2c4:	fdc40793          	add	a5,s0,-36
 2c8:	853e                	mv	a0,a5
 2ca:	2bd5                	jal	8be <cipher_write_data>
 2cc:	fcc40793          	add	a5,s0,-52
 2d0:	853e                	mv	a0,a5
 2d2:	2da9                	jal	92c <cipher_read_data>
 2d4:	fe042623          	sw	zero,-20(s0)
 2d8:	a02d                	j	302 <cipher+0x76>
 2da:	473d                	li	a4,15
 2dc:	fec42783          	lw	a5,-20(s0)
 2e0:	40f707b3          	sub	a5,a4,a5
 2e4:	fec42703          	lw	a4,-20(s0)
 2e8:	1741                	add	a4,a4,-16
 2ea:	9722                	add	a4,a4,s0
 2ec:	fdc74703          	lbu	a4,-36(a4)
 2f0:	17c1                	add	a5,a5,-16
 2f2:	97a2                	add	a5,a5,s0
 2f4:	fce78623          	sb	a4,-52(a5)
 2f8:	fec42783          	lw	a5,-20(s0)
 2fc:	0785                	add	a5,a5,1
 2fe:	fef42623          	sw	a5,-20(s0)
 302:	fec42703          	lw	a4,-20(s0)
 306:	47bd                	li	a5,15
 308:	fce7d9e3          	bge	a5,a4,2da <cipher+0x4e>
 30c:	fbc40793          	add	a5,s0,-68
 310:	45c1                	li	a1,16
 312:	853e                	mv	a0,a5
 314:	2671                	jal	6a0 <uart_send>
 316:	2999                	jal	76c <uart_wait_tx_done>
 318:	0001                	nop
 31a:	40b6                	lw	ra,76(sp)
 31c:	4426                	lw	s0,72(sp)
 31e:	6161                	add	sp,sp,80
 320:	8082                	ret

00000322 <main>:
 322:	1141                	add	sp,sp,-16
 324:	c606                	sw	ra,12(sp)
 326:	c422                	sw	s0,8(sp)
 328:	0800                	add	s0,sp,16
 32a:	14500593          	li	a1,325
 32e:	4501                	li	a0,0
 330:	24d5                	jal	614 <uart_set_cfg>
 332:	2ba1                	jal	88a <cipher_init>
 334:	3fa1                	jal	28c <cipher>
 336:	bffd                	j	334 <main+0x12>

00000338 <set_pin_function>:
 338:	7179                	add	sp,sp,-48
 33a:	d622                	sw	s0,44(sp)
 33c:	1800                	add	s0,sp,48
 33e:	fca42e23          	sw	a0,-36(s0)
 342:	fcb42c23          	sw	a1,-40(s0)
 346:	1a1077b7          	lui	a5,0x1a107
 34a:	439c                	lw	a5,0(a5)
 34c:	fef42623          	sw	a5,-20(s0)
 350:	fdc42783          	lw	a5,-36(s0)
 354:	4705                	li	a4,1
 356:	00f717b3          	sll	a5,a4,a5
 35a:	fff7c713          	not	a4,a5
 35e:	fec42783          	lw	a5,-20(s0)
 362:	8ff9                	and	a5,a5,a4
 364:	fef42623          	sw	a5,-20(s0)
 368:	fdc42783          	lw	a5,-36(s0)
 36c:	fd842703          	lw	a4,-40(s0)
 370:	00f71733          	sll	a4,a4,a5
 374:	fec42783          	lw	a5,-20(s0)
 378:	8fd9                	or	a5,a5,a4
 37a:	fef42623          	sw	a5,-20(s0)
 37e:	1a1077b7          	lui	a5,0x1a107
 382:	fec42703          	lw	a4,-20(s0)
 386:	c398                	sw	a4,0(a5)
 388:	0001                	nop
 38a:	5432                	lw	s0,44(sp)
 38c:	6145                	add	sp,sp,48
 38e:	8082                	ret

00000390 <get_pin_function>:
 390:	7179                	add	sp,sp,-48
 392:	d622                	sw	s0,44(sp)
 394:	1800                	add	s0,sp,48
 396:	fca42e23          	sw	a0,-36(s0)
 39a:	1a1077b7          	lui	a5,0x1a107
 39e:	439c                	lw	a5,0(a5)
 3a0:	fef42623          	sw	a5,-20(s0)
 3a4:	fec42703          	lw	a4,-20(s0)
 3a8:	fdc42783          	lw	a5,-36(s0)
 3ac:	40f757b3          	sra	a5,a4,a5
 3b0:	8b85                	and	a5,a5,1
 3b2:	fef42623          	sw	a5,-20(s0)
 3b6:	fec42783          	lw	a5,-20(s0)
 3ba:	853e                	mv	a0,a5
 3bc:	5432                	lw	s0,44(sp)
 3be:	6145                	add	sp,sp,48
 3c0:	8082                	ret

000003c2 <set_gpio_pin_direction>:
 3c2:	7179                	add	sp,sp,-48
 3c4:	d622                	sw	s0,44(sp)
 3c6:	1800                	add	s0,sp,48
 3c8:	fca42e23          	sw	a0,-36(s0)
 3cc:	fcb42c23          	sw	a1,-40(s0)
 3d0:	1a1017b7          	lui	a5,0x1a101
 3d4:	439c                	lw	a5,0(a5)
 3d6:	fef42623          	sw	a5,-20(s0)
 3da:	fd842783          	lw	a5,-40(s0)
 3de:	ef91                	bnez	a5,3fa <set_gpio_pin_direction+0x38>
 3e0:	fdc42783          	lw	a5,-36(s0)
 3e4:	4705                	li	a4,1
 3e6:	00f717b3          	sll	a5,a4,a5
 3ea:	fff7c713          	not	a4,a5
 3ee:	fec42783          	lw	a5,-20(s0)
 3f2:	8ff9                	and	a5,a5,a4
 3f4:	fef42623          	sw	a5,-20(s0)
 3f8:	a819                	j	40e <set_gpio_pin_direction+0x4c>
 3fa:	fdc42783          	lw	a5,-36(s0)
 3fe:	4705                	li	a4,1
 400:	00f71733          	sll	a4,a4,a5
 404:	fec42783          	lw	a5,-20(s0)
 408:	8fd9                	or	a5,a5,a4
 40a:	fef42623          	sw	a5,-20(s0)
 40e:	1a1017b7          	lui	a5,0x1a101
 412:	fec42703          	lw	a4,-20(s0)
 416:	c398                	sw	a4,0(a5)
 418:	0001                	nop
 41a:	5432                	lw	s0,44(sp)
 41c:	6145                	add	sp,sp,48
 41e:	8082                	ret

00000420 <get_gpio_pin_direction>:
 420:	7179                	add	sp,sp,-48
 422:	d622                	sw	s0,44(sp)
 424:	1800                	add	s0,sp,48
 426:	fca42e23          	sw	a0,-36(s0)
 42a:	1a1017b7          	lui	a5,0x1a101
 42e:	439c                	lw	a5,0(a5)
 430:	fef42623          	sw	a5,-20(s0)
 434:	fec42703          	lw	a4,-20(s0)
 438:	fdc42783          	lw	a5,-36(s0)
 43c:	0786                	sll	a5,a5,0x1
 43e:	40f757b3          	sra	a5,a4,a5
 442:	8b85                	and	a5,a5,1
 444:	fef42623          	sw	a5,-20(s0)
 448:	fec42783          	lw	a5,-20(s0)
 44c:	853e                	mv	a0,a5
 44e:	5432                	lw	s0,44(sp)
 450:	6145                	add	sp,sp,48
 452:	8082                	ret

00000454 <set_gpio_pin_value>:
 454:	7179                	add	sp,sp,-48
 456:	d622                	sw	s0,44(sp)
 458:	1800                	add	s0,sp,48
 45a:	fca42e23          	sw	a0,-36(s0)
 45e:	fcb42c23          	sw	a1,-40(s0)
 462:	1a1017b7          	lui	a5,0x1a101
 466:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
 468:	439c                	lw	a5,0(a5)
 46a:	fef42623          	sw	a5,-20(s0)
 46e:	fd842783          	lw	a5,-40(s0)
 472:	ef91                	bnez	a5,48e <set_gpio_pin_value+0x3a>
 474:	fdc42783          	lw	a5,-36(s0)
 478:	4705                	li	a4,1
 47a:	00f717b3          	sll	a5,a4,a5
 47e:	fff7c713          	not	a4,a5
 482:	fec42783          	lw	a5,-20(s0)
 486:	8ff9                	and	a5,a5,a4
 488:	fef42623          	sw	a5,-20(s0)
 48c:	a819                	j	4a2 <set_gpio_pin_value+0x4e>
 48e:	fdc42783          	lw	a5,-36(s0)
 492:	4705                	li	a4,1
 494:	00f71733          	sll	a4,a4,a5
 498:	fec42783          	lw	a5,-20(s0)
 49c:	8fd9                	or	a5,a5,a4
 49e:	fef42623          	sw	a5,-20(s0)
 4a2:	1a1017b7          	lui	a5,0x1a101
 4a6:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
 4a8:	fec42703          	lw	a4,-20(s0)
 4ac:	c398                	sw	a4,0(a5)
 4ae:	0001                	nop
 4b0:	5432                	lw	s0,44(sp)
 4b2:	6145                	add	sp,sp,48
 4b4:	8082                	ret

000004b6 <get_gpio_pin_value>:
 4b6:	7179                	add	sp,sp,-48
 4b8:	d622                	sw	s0,44(sp)
 4ba:	1800                	add	s0,sp,48
 4bc:	fca42e23          	sw	a0,-36(s0)
 4c0:	1a1017b7          	lui	a5,0x1a101
 4c4:	0791                	add	a5,a5,4 # 1a101004 <_stack_start+0x19ff9004>
 4c6:	439c                	lw	a5,0(a5)
 4c8:	fef42623          	sw	a5,-20(s0)
 4cc:	fec42703          	lw	a4,-20(s0)
 4d0:	fdc42783          	lw	a5,-36(s0)
 4d4:	40f757b3          	sra	a5,a4,a5
 4d8:	8b85                	and	a5,a5,1
 4da:	fef42623          	sw	a5,-20(s0)
 4de:	fec42783          	lw	a5,-20(s0)
 4e2:	853e                	mv	a0,a5
 4e4:	5432                	lw	s0,44(sp)
 4e6:	6145                	add	sp,sp,48
 4e8:	8082                	ret

000004ea <set_gpio_pin_irq_en>:
 4ea:	7179                	add	sp,sp,-48
 4ec:	d622                	sw	s0,44(sp)
 4ee:	1800                	add	s0,sp,48
 4f0:	fca42e23          	sw	a0,-36(s0)
 4f4:	fcb42c23          	sw	a1,-40(s0)
 4f8:	1a1017b7          	lui	a5,0x1a101
 4fc:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
 4fe:	439c                	lw	a5,0(a5)
 500:	fef42623          	sw	a5,-20(s0)
 504:	fd842783          	lw	a5,-40(s0)
 508:	ef91                	bnez	a5,524 <set_gpio_pin_irq_en+0x3a>
 50a:	fdc42783          	lw	a5,-36(s0)
 50e:	4705                	li	a4,1
 510:	00f717b3          	sll	a5,a4,a5
 514:	fff7c793          	not	a5,a5
 518:	fec42703          	lw	a4,-20(s0)
 51c:	8ff9                	and	a5,a5,a4
 51e:	fef42623          	sw	a5,-20(s0)
 522:	a819                	j	538 <set_gpio_pin_irq_en+0x4e>
 524:	fdc42783          	lw	a5,-36(s0)
 528:	4705                	li	a4,1
 52a:	00f717b3          	sll	a5,a4,a5
 52e:	fec42703          	lw	a4,-20(s0)
 532:	8fd9                	or	a5,a5,a4
 534:	fef42623          	sw	a5,-20(s0)
 538:	1a1017b7          	lui	a5,0x1a101
 53c:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
 53e:	fec42703          	lw	a4,-20(s0)
 542:	c398                	sw	a4,0(a5)
 544:	0001                	nop
 546:	5432                	lw	s0,44(sp)
 548:	6145                	add	sp,sp,48
 54a:	8082                	ret

0000054c <set_gpio_pin_irq_type>:
 54c:	7179                	add	sp,sp,-48
 54e:	d622                	sw	s0,44(sp)
 550:	1800                	add	s0,sp,48
 552:	fca42e23          	sw	a0,-36(s0)
 556:	fcb42c23          	sw	a1,-40(s0)
 55a:	1a1017b7          	lui	a5,0x1a101
 55e:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
 560:	439c                	lw	a5,0(a5)
 562:	fef42623          	sw	a5,-20(s0)
 566:	1a1017b7          	lui	a5,0x1a101
 56a:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
 56c:	439c                	lw	a5,0(a5)
 56e:	fef42423          	sw	a5,-24(s0)
 572:	fd842783          	lw	a5,-40(s0)
 576:	8b85                	and	a5,a5,1
 578:	ef91                	bnez	a5,594 <set_gpio_pin_irq_type+0x48>
 57a:	fdc42783          	lw	a5,-36(s0)
 57e:	4705                	li	a4,1
 580:	00f717b3          	sll	a5,a4,a5
 584:	fff7c793          	not	a5,a5
 588:	fec42703          	lw	a4,-20(s0)
 58c:	8ff9                	and	a5,a5,a4
 58e:	fef42623          	sw	a5,-20(s0)
 592:	a819                	j	5a8 <set_gpio_pin_irq_type+0x5c>
 594:	fdc42783          	lw	a5,-36(s0)
 598:	4705                	li	a4,1
 59a:	00f717b3          	sll	a5,a4,a5
 59e:	fec42703          	lw	a4,-20(s0)
 5a2:	8fd9                	or	a5,a5,a4
 5a4:	fef42623          	sw	a5,-20(s0)
 5a8:	fd842783          	lw	a5,-40(s0)
 5ac:	8b89                	and	a5,a5,2
 5ae:	ef91                	bnez	a5,5ca <set_gpio_pin_irq_type+0x7e>
 5b0:	fdc42783          	lw	a5,-36(s0)
 5b4:	4705                	li	a4,1
 5b6:	00f717b3          	sll	a5,a4,a5
 5ba:	fff7c793          	not	a5,a5
 5be:	fe842703          	lw	a4,-24(s0)
 5c2:	8ff9                	and	a5,a5,a4
 5c4:	fef42423          	sw	a5,-24(s0)
 5c8:	a819                	j	5de <set_gpio_pin_irq_type+0x92>
 5ca:	fdc42783          	lw	a5,-36(s0)
 5ce:	4705                	li	a4,1
 5d0:	00f717b3          	sll	a5,a4,a5
 5d4:	fe842703          	lw	a4,-24(s0)
 5d8:	8fd9                	or	a5,a5,a4
 5da:	fef42423          	sw	a5,-24(s0)
 5de:	1a1017b7          	lui	a5,0x1a101
 5e2:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
 5e4:	fec42703          	lw	a4,-20(s0)
 5e8:	c398                	sw	a4,0(a5)
 5ea:	1a1017b7          	lui	a5,0x1a101
 5ee:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
 5f0:	fe842703          	lw	a4,-24(s0)
 5f4:	c398                	sw	a4,0(a5)
 5f6:	0001                	nop
 5f8:	5432                	lw	s0,44(sp)
 5fa:	6145                	add	sp,sp,48
 5fc:	8082                	ret

000005fe <get_gpio_irq_status>:
 5fe:	1141                	add	sp,sp,-16
 600:	c622                	sw	s0,12(sp)
 602:	0800                	add	s0,sp,16
 604:	1a1017b7          	lui	a5,0x1a101
 608:	07e1                	add	a5,a5,24 # 1a101018 <_stack_start+0x19ff9018>
 60a:	439c                	lw	a5,0(a5)
 60c:	853e                	mv	a0,a5
 60e:	4432                	lw	s0,12(sp)
 610:	0141                	add	sp,sp,16
 612:	8082                	ret

00000614 <uart_set_cfg>:
 614:	1101                	add	sp,sp,-32
 616:	ce22                	sw	s0,28(sp)
 618:	1000                	add	s0,sp,32
 61a:	fea42623          	sw	a0,-20(s0)
 61e:	87ae                	mv	a5,a1
 620:	fef41523          	sh	a5,-22(s0)
 624:	1a1077b7          	lui	a5,0x1a107
 628:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 62a:	4398                	lw	a4,0(a5)
 62c:	1a1077b7          	lui	a5,0x1a107
 630:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 632:	00276713          	or	a4,a4,2
 636:	c398                	sw	a4,0(a5)
 638:	1a1007b7          	lui	a5,0x1a100
 63c:	07b1                	add	a5,a5,12 # 1a10000c <_stack_start+0x19ff800c>
 63e:	08300713          	li	a4,131
 642:	c398                	sw	a4,0(a5)
 644:	fea45783          	lhu	a5,-22(s0)
 648:	83a1                	srl	a5,a5,0x8
 64a:	07c2                	sll	a5,a5,0x10
 64c:	83c1                	srl	a5,a5,0x10
 64e:	873e                	mv	a4,a5
 650:	1a1007b7          	lui	a5,0x1a100
 654:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 656:	0ff77713          	zext.b	a4,a4
 65a:	c398                	sw	a4,0(a5)
 65c:	fea45703          	lhu	a4,-22(s0)
 660:	1a1007b7          	lui	a5,0x1a100
 664:	0ff77713          	zext.b	a4,a4
 668:	c398                	sw	a4,0(a5)
 66a:	1a1007b7          	lui	a5,0x1a100
 66e:	07a1                	add	a5,a5,8 # 1a100008 <_stack_start+0x19ff8008>
 670:	0a700713          	li	a4,167
 674:	c398                	sw	a4,0(a5)
 676:	1a1007b7          	lui	a5,0x1a100
 67a:	07b1                	add	a5,a5,12 # 1a10000c <_stack_start+0x19ff800c>
 67c:	470d                	li	a4,3
 67e:	c398                	sw	a4,0(a5)
 680:	1a1007b7          	lui	a5,0x1a100
 684:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 686:	439c                	lw	a5,0(a5)
 688:	0f07f713          	and	a4,a5,240
 68c:	1a1007b7          	lui	a5,0x1a100
 690:	0791                	add	a5,a5,4 # 1a100004 <_stack_start+0x19ff8004>
 692:	00276713          	or	a4,a4,2
 696:	c398                	sw	a4,0(a5)
 698:	0001                	nop
 69a:	4472                	lw	s0,28(sp)
 69c:	6105                	add	sp,sp,32
 69e:	8082                	ret

000006a0 <uart_send>:
 6a0:	7179                	add	sp,sp,-48
 6a2:	d622                	sw	s0,44(sp)
 6a4:	1800                	add	s0,sp,48
 6a6:	fca42e23          	sw	a0,-36(s0)
 6aa:	fcb42c23          	sw	a1,-40(s0)
 6ae:	a891                	j	702 <uart_send+0x62>
 6b0:	0001                	nop
 6b2:	1a1007b7          	lui	a5,0x1a100
 6b6:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 6b8:	439c                	lw	a5,0(a5)
 6ba:	0207f793          	and	a5,a5,32
 6be:	dbf5                	beqz	a5,6b2 <uart_send+0x12>
 6c0:	fe042623          	sw	zero,-20(s0)
 6c4:	a035                	j	6f0 <uart_send+0x50>
 6c6:	fdc42783          	lw	a5,-36(s0)
 6ca:	00178713          	add	a4,a5,1
 6ce:	fce42e23          	sw	a4,-36(s0)
 6d2:	0007c703          	lbu	a4,0(a5)
 6d6:	1a1007b7          	lui	a5,0x1a100
 6da:	c398                	sw	a4,0(a5)
 6dc:	fd842783          	lw	a5,-40(s0)
 6e0:	17fd                	add	a5,a5,-1 # 1a0fffff <_stack_start+0x19ff7fff>
 6e2:	fcf42c23          	sw	a5,-40(s0)
 6e6:	fec42783          	lw	a5,-20(s0)
 6ea:	0785                	add	a5,a5,1
 6ec:	fef42623          	sw	a5,-20(s0)
 6f0:	fec42703          	lw	a4,-20(s0)
 6f4:	03f00793          	li	a5,63
 6f8:	00e7e563          	bltu	a5,a4,702 <uart_send+0x62>
 6fc:	fd842783          	lw	a5,-40(s0)
 700:	f3f9                	bnez	a5,6c6 <uart_send+0x26>
 702:	fd842783          	lw	a5,-40(s0)
 706:	f7cd                	bnez	a5,6b0 <uart_send+0x10>
 708:	0001                	nop
 70a:	0001                	nop
 70c:	5432                	lw	s0,44(sp)
 70e:	6145                	add	sp,sp,48
 710:	8082                	ret

00000712 <uart_getchar>:
 712:	1141                	add	sp,sp,-16
 714:	c622                	sw	s0,12(sp)
 716:	0800                	add	s0,sp,16
 718:	0001                	nop
 71a:	1a1007b7          	lui	a5,0x1a100
 71e:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 720:	439c                	lw	a5,0(a5)
 722:	0017f713          	and	a4,a5,1
 726:	4785                	li	a5,1
 728:	fef719e3          	bne	a4,a5,71a <uart_getchar+0x8>
 72c:	1a1007b7          	lui	a5,0x1a100
 730:	439c                	lw	a5,0(a5)
 732:	0ff7f793          	zext.b	a5,a5
 736:	853e                	mv	a0,a5
 738:	4432                	lw	s0,12(sp)
 73a:	0141                	add	sp,sp,16
 73c:	8082                	ret

0000073e <uart_sendchar>:
 73e:	1101                	add	sp,sp,-32
 740:	ce22                	sw	s0,28(sp)
 742:	1000                	add	s0,sp,32
 744:	87aa                	mv	a5,a0
 746:	fef407a3          	sb	a5,-17(s0)
 74a:	0001                	nop
 74c:	1a1007b7          	lui	a5,0x1a100
 750:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 752:	439c                	lw	a5,0(a5)
 754:	0207f793          	and	a5,a5,32
 758:	dbf5                	beqz	a5,74c <uart_sendchar+0xe>
 75a:	1a1007b7          	lui	a5,0x1a100
 75e:	fef44703          	lbu	a4,-17(s0)
 762:	c398                	sw	a4,0(a5)
 764:	0001                	nop
 766:	4472                	lw	s0,28(sp)
 768:	6105                	add	sp,sp,32
 76a:	8082                	ret

0000076c <uart_wait_tx_done>:
 76c:	1141                	add	sp,sp,-16
 76e:	c622                	sw	s0,12(sp)
 770:	0800                	add	s0,sp,16
 772:	0001                	nop
 774:	1a1007b7          	lui	a5,0x1a100
 778:	07d1                	add	a5,a5,20 # 1a100014 <_stack_start+0x19ff8014>
 77a:	439c                	lw	a5,0(a5)
 77c:	0407f793          	and	a5,a5,64
 780:	dbf5                	beqz	a5,774 <uart_wait_tx_done+0x8>
 782:	0001                	nop
 784:	0001                	nop
 786:	4432                	lw	s0,12(sp)
 788:	0141                	add	sp,sp,16
 78a:	8082                	ret

0000078c <exit>:
 78c:	1101                	add	sp,sp,-32
 78e:	ce06                	sw	ra,28(sp)
 790:	cc22                	sw	s0,24(sp)
 792:	1000                	add	s0,sp,32
 794:	fea42623          	sw	a0,-20(s0)
 798:	fec42503          	lw	a0,-20(s0)
 79c:	2011                	jal	7a0 <eoc>
 79e:	a001                	j	79e <exit+0x12>

000007a0 <eoc>:
 7a0:	1101                	add	sp,sp,-32
 7a2:	ce06                	sw	ra,28(sp)
 7a4:	cc22                	sw	s0,24(sp)
 7a6:	1000                	add	s0,sp,32
 7a8:	fea42623          	sw	a0,-20(s0)
 7ac:	fec42783          	lw	a5,-20(s0)
 7b0:	c799                	beqz	a5,7be <eoc+0x1e>
 7b2:	1a1077b7          	lui	a5,0x1a107
 7b6:	07d1                	add	a5,a5,20 # 1a107014 <_stack_start+0x19fff014>
 7b8:	4705                	li	a4,1
 7ba:	c398                	sw	a4,0(a5)
 7bc:	a031                	j	7c8 <eoc+0x28>
 7be:	1a1077b7          	lui	a5,0x1a107
 7c2:	07d1                	add	a5,a5,20 # 1a107014 <_stack_start+0x19fff014>
 7c4:	0007a023          	sw	zero,0(a5)
 7c8:	1a1077b7          	lui	a5,0x1a107
 7cc:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 7ce:	4398                	lw	a4,0(a5)
 7d0:	1a1077b7          	lui	a5,0x1a107
 7d4:	0791                	add	a5,a5,4 # 1a107004 <_stack_start+0x19fff004>
 7d6:	00476713          	or	a4,a4,4
 7da:	c398                	sw	a4,0(a5)
 7dc:	4585                	li	a1,1
 7de:	4521                	li	a0,8
 7e0:	3ea1                	jal	338 <set_pin_function>
 7e2:	4585                	li	a1,1
 7e4:	4521                	li	a0,8
 7e6:	3ef1                	jal	3c2 <set_gpio_pin_direction>
 7e8:	4585                	li	a1,1
 7ea:	4521                	li	a0,8
 7ec:	31a5                	jal	454 <set_gpio_pin_value>
 7ee:	0001                	nop
 7f0:	40f2                	lw	ra,28(sp)
 7f2:	4462                	lw	s0,24(sp)
 7f4:	6105                	add	sp,sp,32
 7f6:	8082                	ret

000007f8 <sleep_busy>:
 7f8:	7179                	add	sp,sp,-48
 7fa:	d622                	sw	s0,44(sp)
 7fc:	1800                	add	s0,sp,48
 7fe:	fca42e23          	sw	a0,-36(s0)
 802:	fe042623          	sw	zero,-20(s0)
 806:	a039                	j	814 <sleep_busy+0x1c>
 808:	0001                	nop
 80a:	fec42783          	lw	a5,-20(s0)
 80e:	0785                	add	a5,a5,1
 810:	fef42623          	sw	a5,-20(s0)
 814:	fdc42783          	lw	a5,-36(s0)
 818:	fec42703          	lw	a4,-20(s0)
 81c:	fef746e3          	blt	a4,a5,808 <sleep_busy+0x10>
 820:	0001                	nop
 822:	0001                	nop
 824:	5432                	lw	s0,44(sp)
 826:	6145                	add	sp,sp,48
 828:	8082                	ret

0000082a <ISR_I2C>:
 82a:	1141                	add	sp,sp,-16
 82c:	c622                	sw	s0,12(sp)
 82e:	0800                	add	s0,sp,16
 830:	a001                	j	830 <ISR_I2C+0x6>

00000832 <ISR_UART>:
 832:	1141                	add	sp,sp,-16
 834:	c622                	sw	s0,12(sp)
 836:	0800                	add	s0,sp,16
 838:	a001                	j	838 <ISR_UART+0x6>

0000083a <ISR_GPIO>:
 83a:	1141                	add	sp,sp,-16
 83c:	c622                	sw	s0,12(sp)
 83e:	0800                	add	s0,sp,16
 840:	a001                	j	840 <ISR_GPIO+0x6>

00000842 <ISR_SPIM0>:
 842:	1141                	add	sp,sp,-16
 844:	c622                	sw	s0,12(sp)
 846:	0800                	add	s0,sp,16
 848:	a001                	j	848 <ISR_SPIM0+0x6>

0000084a <ISR_SPIM1>:
 84a:	1141                	add	sp,sp,-16
 84c:	c622                	sw	s0,12(sp)
 84e:	0800                	add	s0,sp,16
 850:	a001                	j	850 <ISR_SPIM1+0x6>

00000852 <ISR_TA_OVF>:
 852:	1141                	add	sp,sp,-16
 854:	c622                	sw	s0,12(sp)
 856:	0800                	add	s0,sp,16
 858:	a001                	j	858 <ISR_TA_OVF+0x6>

0000085a <ISR_TA_CMP>:
 85a:	1141                	add	sp,sp,-16
 85c:	c622                	sw	s0,12(sp)
 85e:	0800                	add	s0,sp,16
 860:	a001                	j	860 <ISR_TA_CMP+0x6>

00000862 <ISR_TB_OVF>:
 862:	1141                	add	sp,sp,-16
 864:	c622                	sw	s0,12(sp)
 866:	0800                	add	s0,sp,16
 868:	a001                	j	868 <ISR_TB_OVF+0x6>

0000086a <ISR_TB_CMP>:
 86a:	1141                	add	sp,sp,-16
 86c:	c622                	sw	s0,12(sp)
 86e:	0800                	add	s0,sp,16
 870:	a001                	j	870 <ISR_TB_CMP+0x6>

00000872 <default_exception_handler_c>:
 872:	1141                	add	sp,sp,-16
 874:	c622                	sw	s0,12(sp)
 876:	0800                	add	s0,sp,16
 878:	a001                	j	878 <default_exception_handler_c+0x6>

0000087a <illegal_insn_handler_c>:
 87a:	1141                	add	sp,sp,-16
 87c:	c622                	sw	s0,12(sp)
 87e:	0800                	add	s0,sp,16
 880:	a001                	j	880 <illegal_insn_handler_c+0x6>

00000882 <ecall_insn_handler_c>:
 882:	1141                	add	sp,sp,-16
 884:	c622                	sw	s0,12(sp)
 886:	0800                	add	s0,sp,16
 888:	a001                	j	888 <ecall_insn_handler_c+0x6>

0000088a <cipher_init>:
 88a:	1141                	add	sp,sp,-16
 88c:	c622                	sw	s0,12(sp)
 88e:	0800                	add	s0,sp,16
 890:	1a1087b7          	lui	a5,0x1a108
 894:	4705                	li	a4,1
 896:	c398                	sw	a4,0(a5)
 898:	0001                	nop
 89a:	4432                	lw	s0,12(sp)
 89c:	0141                	add	sp,sp,16
 89e:	8082                	ret

000008a0 <cipher_reset>:
 8a0:	1141                	add	sp,sp,-16
 8a2:	c622                	sw	s0,12(sp)
 8a4:	0800                	add	s0,sp,16
 8a6:	1a1087b7          	lui	a5,0x1a108
 8aa:	0007a023          	sw	zero,0(a5) # 1a108000 <_stack_start+0x1a000000>
 8ae:	1a1087b7          	lui	a5,0x1a108
 8b2:	4705                	li	a4,1
 8b4:	c398                	sw	a4,0(a5)
 8b6:	0001                	nop
 8b8:	4432                	lw	s0,12(sp)
 8ba:	0141                	add	sp,sp,16
 8bc:	8082                	ret

000008be <cipher_write_data>:
 8be:	7179                	add	sp,sp,-48
 8c0:	d622                	sw	s0,44(sp)
 8c2:	1800                	add	s0,sp,48
 8c4:	fca42e23          	sw	a0,-36(s0)
 8c8:	4785                	li	a5,1
 8ca:	fef42623          	sw	a5,-20(s0)
 8ce:	1a1087b7          	lui	a5,0x1a108
 8d2:	07c1                	add	a5,a5,16 # 1a108010 <_stack_start+0x1a000010>
 8d4:	439c                	lw	a5,0(a5)
 8d6:	fef42623          	sw	a5,-20(s0)
 8da:	fec42783          	lw	a5,-20(s0)
 8de:	fbe5                	bnez	a5,8ce <cipher_write_data+0x10>
 8e0:	1a1087b7          	lui	a5,0x1a108
 8e4:	07d1                	add	a5,a5,20 # 1a108014 <_stack_start+0x1a000014>
 8e6:	fdc42703          	lw	a4,-36(s0)
 8ea:	4318                	lw	a4,0(a4)
 8ec:	c398                	sw	a4,0(a5)
 8ee:	1a1087b7          	lui	a5,0x1a108
 8f2:	07e1                	add	a5,a5,24 # 1a108018 <_stack_start+0x1a000018>
 8f4:	fdc42703          	lw	a4,-36(s0)
 8f8:	4358                	lw	a4,4(a4)
 8fa:	c398                	sw	a4,0(a5)
 8fc:	1a1087b7          	lui	a5,0x1a108
 900:	07f1                	add	a5,a5,28 # 1a10801c <_stack_start+0x1a00001c>
 902:	fdc42703          	lw	a4,-36(s0)
 906:	4718                	lw	a4,8(a4)
 908:	c398                	sw	a4,0(a5)
 90a:	1a1087b7          	lui	a5,0x1a108
 90e:	02078793          	add	a5,a5,32 # 1a108020 <_stack_start+0x1a000020>
 912:	fdc42703          	lw	a4,-36(s0)
 916:	4758                	lw	a4,12(a4)
 918:	c398                	sw	a4,0(a5)
 91a:	1a1087b7          	lui	a5,0x1a108
 91e:	0791                	add	a5,a5,4 # 1a108004 <_stack_start+0x1a000004>
 920:	4705                	li	a4,1
 922:	c398                	sw	a4,0(a5)
 924:	0001                	nop
 926:	5432                	lw	s0,44(sp)
 928:	6145                	add	sp,sp,48
 92a:	8082                	ret

0000092c <cipher_read_data>:
 92c:	7179                	add	sp,sp,-48
 92e:	d622                	sw	s0,44(sp)
 930:	1800                	add	s0,sp,48
 932:	fca42e23          	sw	a0,-36(s0)
 936:	fe042623          	sw	zero,-20(s0)
 93a:	1a1087b7          	lui	a5,0x1a108
 93e:	07b1                	add	a5,a5,12 # 1a10800c <_stack_start+0x1a00000c>
 940:	439c                	lw	a5,0(a5)
 942:	fef42623          	sw	a5,-20(s0)
 946:	fec42783          	lw	a5,-20(s0)
 94a:	dbe5                	beqz	a5,93a <cipher_read_data+0xe>
 94c:	1a1087b7          	lui	a5,0x1a108
 950:	02478793          	add	a5,a5,36 # 1a108024 <_stack_start+0x1a000024>
 954:	4398                	lw	a4,0(a5)
 956:	fdc42783          	lw	a5,-36(s0)
 95a:	c398                	sw	a4,0(a5)
 95c:	1a1087b7          	lui	a5,0x1a108
 960:	02878713          	add	a4,a5,40 # 1a108028 <_stack_start+0x1a000028>
 964:	fdc42783          	lw	a5,-36(s0)
 968:	0791                	add	a5,a5,4
 96a:	4318                	lw	a4,0(a4)
 96c:	c398                	sw	a4,0(a5)
 96e:	1a1087b7          	lui	a5,0x1a108
 972:	02c78713          	add	a4,a5,44 # 1a10802c <_stack_start+0x1a00002c>
 976:	fdc42783          	lw	a5,-36(s0)
 97a:	07a1                	add	a5,a5,8
 97c:	4318                	lw	a4,0(a4)
 97e:	c398                	sw	a4,0(a5)
 980:	1a1087b7          	lui	a5,0x1a108
 984:	03078713          	add	a4,a5,48 # 1a108030 <_stack_start+0x1a000030>
 988:	fdc42783          	lw	a5,-36(s0)
 98c:	07b1                	add	a5,a5,12
 98e:	4318                	lw	a4,0(a4)
 990:	c398                	sw	a4,0(a5)
 992:	1a1087b7          	lui	a5,0x1a108
 996:	07a1                	add	a5,a5,8 # 1a108008 <_stack_start+0x1a000008>
 998:	4705                	li	a4,1
 99a:	c398                	sw	a4,0(a5)
 99c:	0001                	nop
 99e:	5432                	lw	s0,44(sp)
 9a0:	6145                	add	sp,sp,48
 9a2:	8082                	ret

000009a4 <__CTOR_LIST__>:
	...

000009ac <__CTOR_END__>:
	...

Disassembly of section .text.__libc_init_array:

000009b4 <__libc_init_array>:
 9b4:	ff010113          	add	sp,sp,-16
 9b8:	00812423          	sw	s0,8(sp)
 9bc:	001007b7          	lui	a5,0x100
 9c0:	00100437          	lui	s0,0x100
 9c4:	01212023          	sw	s2,0(sp)
 9c8:	00078793          	mv	a5,a5
 9cc:	00040713          	mv	a4,s0
 9d0:	00112623          	sw	ra,12(sp)
 9d4:	00912223          	sw	s1,4(sp)
 9d8:	40e78933          	sub	s2,a5,a4
 9dc:	02e78263          	beq	a5,a4,a00 <__libc_init_array+0x4c>
 9e0:	40295913          	sra	s2,s2,0x2
 9e4:	00040413          	mv	s0,s0
 9e8:	00000493          	li	s1,0
 9ec:	00042783          	lw	a5,0(s0) # 100000 <__init_array_end>
 9f0:	00148493          	add	s1,s1,1
 9f4:	00440413          	add	s0,s0,4
 9f8:	000780e7          	jalr	a5 # 100000 <__init_array_end>
 9fc:	ff24e8e3          	bltu	s1,s2,9ec <__libc_init_array+0x38>
 a00:	00100437          	lui	s0,0x100
 a04:	001007b7          	lui	a5,0x100
 a08:	00078793          	mv	a5,a5
 a0c:	00040713          	mv	a4,s0
 a10:	40e78933          	sub	s2,a5,a4
 a14:	40295913          	sra	s2,s2,0x2
 a18:	02e78063          	beq	a5,a4,a38 <__libc_init_array+0x84>
 a1c:	00040413          	mv	s0,s0
 a20:	00000493          	li	s1,0
 a24:	00042783          	lw	a5,0(s0) # 100000 <__init_array_end>
 a28:	00148493          	add	s1,s1,1
 a2c:	00440413          	add	s0,s0,4
 a30:	000780e7          	jalr	a5 # 100000 <__init_array_end>
 a34:	ff24e8e3          	bltu	s1,s2,a24 <__libc_init_array+0x70>
 a38:	00c12083          	lw	ra,12(sp)
 a3c:	00812403          	lw	s0,8(sp)
 a40:	00412483          	lw	s1,4(sp)
 a44:	00012903          	lw	s2,0(sp)
 a48:	01010113          	add	sp,sp,16
 a4c:	00008067          	ret

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
