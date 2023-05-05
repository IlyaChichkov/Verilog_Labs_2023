
boot_code.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00008000 <_stack_start-0x100000>:
    8000:	00000013          	nop
    8004:	00000013          	nop
    8008:	00000013          	nop
    800c:	00000013          	nop
    8010:	00000013          	nop
    8014:	00000013          	nop
    8018:	00000013          	nop
    801c:	00000013          	nop
    8020:	00000013          	nop
    8024:	00000013          	nop
    8028:	00000013          	nop
    802c:	00000013          	nop
    8030:	00000013          	nop
    8034:	00000013          	nop
    8038:	00000013          	nop
    803c:	00000013          	nop
    8040:	00000013          	nop
    8044:	00000013          	nop
    8048:	00000013          	nop
    804c:	00000013          	nop
    8050:	00000013          	nop
    8054:	00000013          	nop
    8058:	00000013          	nop
    805c:	00000013          	nop
    8060:	00000013          	nop
    8064:	00000013          	nop
    8068:	00000013          	nop
    806c:	00000013          	nop
    8070:	00000013          	nop
    8074:	00000013          	nop
    8078:	00000013          	nop
    807c:	0100006f          	j	808c <_stext>
    8080:	0100006f          	j	8090 <reset_handler>
    8084:	0080006f          	j	808c <_stext>
    8088:	0040006f          	j	808c <_stext>

Disassembly of section .text:

0000808c <_stext>:
    808c:	0000006f          	j	808c <_stext>

00008090 <reset_handler>:
    8090:	00000093          	li	ra,0
    8094:	8106                	mv	sp,ra
    8096:	8186                	mv	gp,ra
    8098:	8206                	mv	tp,ra
    809a:	8286                	mv	t0,ra
    809c:	8306                	mv	t1,ra
    809e:	8386                	mv	t2,ra
    80a0:	8406                	mv	s0,ra
    80a2:	8486                	mv	s1,ra
    80a4:	8506                	mv	a0,ra
    80a6:	8586                	mv	a1,ra
    80a8:	8606                	mv	a2,ra
    80aa:	8686                	mv	a3,ra
    80ac:	8706                	mv	a4,ra
    80ae:	8786                	mv	a5,ra
    80b0:	8806                	mv	a6,ra
    80b2:	8886                	mv	a7,ra
    80b4:	8906                	mv	s2,ra
    80b6:	8986                	mv	s3,ra
    80b8:	8a06                	mv	s4,ra
    80ba:	8a86                	mv	s5,ra
    80bc:	8b06                	mv	s6,ra
    80be:	8b86                	mv	s7,ra
    80c0:	8c06                	mv	s8,ra
    80c2:	8c86                	mv	s9,ra
    80c4:	8d06                	mv	s10,ra
    80c6:	8d86                	mv	s11,ra
    80c8:	8e06                	mv	t3,ra
    80ca:	8e86                	mv	t4,ra
    80cc:	8f06                	mv	t5,ra
    80ce:	8f86                	mv	t6,ra
    80d0:	00100117          	auipc	sp,0x100
    80d4:	f3010113          	add	sp,sp,-208 # 108000 <_stack_start>

000080d8 <_start>:
    80d8:	00000d17          	auipc	s10,0x0
    80dc:	3a4d0d13          	add	s10,s10,932 # 847c <_bss_end>
    80e0:	00000d97          	auipc	s11,0x0
    80e4:	39cd8d93          	add	s11,s11,924 # 847c <_bss_end>
    80e8:	01bd5763          	bge	s10,s11,80f6 <main_entry>

000080ec <zero_loop>:
    80ec:	000d2023          	sw	zero,0(s10)
    80f0:	0d11                	add	s10,s10,4
    80f2:	ffaddde3          	bge	s11,s10,80ec <zero_loop>

000080f6 <main_entry>:
    80f6:	4501                	li	a0,0
    80f8:	4581                	li	a1,0
    80fa:	004000ef          	jal	80fe <main>

000080fe <main>:
    80fe:	1101                	add	sp,sp,-32
    8100:	ce06                	sw	ra,28(sp)
    8102:	cc22                	sw	s0,24(sp)
    8104:	1000                	add	s0,sp,32
    8106:	4585                	li	a1,1
    8108:	457d                	li	a0,31
    810a:	2051                	jal	818e <set_pin_function>
    810c:	4585                	li	a1,1
    810e:	457d                	li	a0,31
    8110:	2221                	jal	8218 <set_gpio_pin_direction>
    8112:	4581                	li	a1,0
    8114:	457d                	li	a0,31
    8116:	2a51                	jal	82aa <set_gpio_pin_value>
    8118:	fe042623          	sw	zero,-20(s0)
    811c:	a039                	j	812a <main+0x2c>
    811e:	0001                	nop
    8120:	fec42783          	lw	a5,-20(s0)
    8124:	0785                	add	a5,a5,1
    8126:	fef42623          	sw	a5,-20(s0)
    812a:	fec42703          	lw	a4,-20(s0)
    812e:	47a5                	li	a5,9
    8130:	fee7d7e3          	bge	a5,a4,811e <main+0x20>
    8134:	4585                	li	a1,1
    8136:	457d                	li	a0,31
    8138:	2a8d                	jal	82aa <set_gpio_pin_value>
    813a:	fe042423          	sw	zero,-24(s0)
    813e:	a039                	j	814c <main+0x4e>
    8140:	0001                	nop
    8142:	fe842783          	lw	a5,-24(s0)
    8146:	0785                	add	a5,a5,1
    8148:	fef42423          	sw	a5,-24(s0)
    814c:	fe842703          	lw	a4,-24(s0)
    8150:	47a5                	li	a5,9
    8152:	fee7d7e3          	bge	a5,a4,8140 <main+0x42>
    8156:	4581                	li	a1,0
    8158:	457d                	li	a0,31
    815a:	2a81                	jal	82aa <set_gpio_pin_value>
    815c:	08000513          	li	a0,128
    8160:	2039                	jal	816e <jump_and_start>
    8162:	4781                	li	a5,0
    8164:	853e                	mv	a0,a5
    8166:	40f2                	lw	ra,28(sp)
    8168:	4462                	lw	s0,24(sp)
    816a:	6105                	add	sp,sp,32
    816c:	8082                	ret

0000816e <jump_and_start>:
    816e:	1101                	add	sp,sp,-32
    8170:	ce22                	sw	s0,28(sp)
    8172:	1000                	add	s0,sp,32
    8174:	fea42623          	sw	a0,-20(s0)
    8178:	fec42783          	lw	a5,-20(s0)
    817c:	00078067          	jr	a5
    8180:	0001                	nop
    8182:	0001                	nop
    8184:	0001                	nop
    8186:	0001                	nop
    8188:	4472                	lw	s0,28(sp)
    818a:	6105                	add	sp,sp,32
    818c:	8082                	ret

0000818e <set_pin_function>:
    818e:	7179                	add	sp,sp,-48
    8190:	d622                	sw	s0,44(sp)
    8192:	1800                	add	s0,sp,48
    8194:	fca42e23          	sw	a0,-36(s0)
    8198:	fcb42c23          	sw	a1,-40(s0)
    819c:	1a1077b7          	lui	a5,0x1a107
    81a0:	439c                	lw	a5,0(a5)
    81a2:	fef42623          	sw	a5,-20(s0)
    81a6:	fdc42783          	lw	a5,-36(s0)
    81aa:	4705                	li	a4,1
    81ac:	00f717b3          	sll	a5,a4,a5
    81b0:	fff7c713          	not	a4,a5
    81b4:	fec42783          	lw	a5,-20(s0)
    81b8:	8ff9                	and	a5,a5,a4
    81ba:	fef42623          	sw	a5,-20(s0)
    81be:	fdc42783          	lw	a5,-36(s0)
    81c2:	fd842703          	lw	a4,-40(s0)
    81c6:	00f71733          	sll	a4,a4,a5
    81ca:	fec42783          	lw	a5,-20(s0)
    81ce:	8fd9                	or	a5,a5,a4
    81d0:	fef42623          	sw	a5,-20(s0)
    81d4:	1a1077b7          	lui	a5,0x1a107
    81d8:	fec42703          	lw	a4,-20(s0)
    81dc:	c398                	sw	a4,0(a5)
    81de:	0001                	nop
    81e0:	5432                	lw	s0,44(sp)
    81e2:	6145                	add	sp,sp,48
    81e4:	8082                	ret

000081e6 <get_pin_function>:
    81e6:	7179                	add	sp,sp,-48
    81e8:	d622                	sw	s0,44(sp)
    81ea:	1800                	add	s0,sp,48
    81ec:	fca42e23          	sw	a0,-36(s0)
    81f0:	1a1077b7          	lui	a5,0x1a107
    81f4:	439c                	lw	a5,0(a5)
    81f6:	fef42623          	sw	a5,-20(s0)
    81fa:	fec42703          	lw	a4,-20(s0)
    81fe:	fdc42783          	lw	a5,-36(s0)
    8202:	40f757b3          	sra	a5,a4,a5
    8206:	8b85                	and	a5,a5,1
    8208:	fef42623          	sw	a5,-20(s0)
    820c:	fec42783          	lw	a5,-20(s0)
    8210:	853e                	mv	a0,a5
    8212:	5432                	lw	s0,44(sp)
    8214:	6145                	add	sp,sp,48
    8216:	8082                	ret

00008218 <set_gpio_pin_direction>:
    8218:	7179                	add	sp,sp,-48
    821a:	d622                	sw	s0,44(sp)
    821c:	1800                	add	s0,sp,48
    821e:	fca42e23          	sw	a0,-36(s0)
    8222:	fcb42c23          	sw	a1,-40(s0)
    8226:	1a1017b7          	lui	a5,0x1a101
    822a:	439c                	lw	a5,0(a5)
    822c:	fef42623          	sw	a5,-20(s0)
    8230:	fd842783          	lw	a5,-40(s0)
    8234:	ef91                	bnez	a5,8250 <set_gpio_pin_direction+0x38>
    8236:	fdc42783          	lw	a5,-36(s0)
    823a:	4705                	li	a4,1
    823c:	00f717b3          	sll	a5,a4,a5
    8240:	fff7c713          	not	a4,a5
    8244:	fec42783          	lw	a5,-20(s0)
    8248:	8ff9                	and	a5,a5,a4
    824a:	fef42623          	sw	a5,-20(s0)
    824e:	a819                	j	8264 <set_gpio_pin_direction+0x4c>
    8250:	fdc42783          	lw	a5,-36(s0)
    8254:	4705                	li	a4,1
    8256:	00f71733          	sll	a4,a4,a5
    825a:	fec42783          	lw	a5,-20(s0)
    825e:	8fd9                	or	a5,a5,a4
    8260:	fef42623          	sw	a5,-20(s0)
    8264:	1a1017b7          	lui	a5,0x1a101
    8268:	fec42703          	lw	a4,-20(s0)
    826c:	c398                	sw	a4,0(a5)
    826e:	0001                	nop
    8270:	5432                	lw	s0,44(sp)
    8272:	6145                	add	sp,sp,48
    8274:	8082                	ret

00008276 <get_gpio_pin_direction>:
    8276:	7179                	add	sp,sp,-48
    8278:	d622                	sw	s0,44(sp)
    827a:	1800                	add	s0,sp,48
    827c:	fca42e23          	sw	a0,-36(s0)
    8280:	1a1017b7          	lui	a5,0x1a101
    8284:	439c                	lw	a5,0(a5)
    8286:	fef42623          	sw	a5,-20(s0)
    828a:	fec42703          	lw	a4,-20(s0)
    828e:	fdc42783          	lw	a5,-36(s0)
    8292:	0786                	sll	a5,a5,0x1
    8294:	40f757b3          	sra	a5,a4,a5
    8298:	8b85                	and	a5,a5,1
    829a:	fef42623          	sw	a5,-20(s0)
    829e:	fec42783          	lw	a5,-20(s0)
    82a2:	853e                	mv	a0,a5
    82a4:	5432                	lw	s0,44(sp)
    82a6:	6145                	add	sp,sp,48
    82a8:	8082                	ret

000082aa <set_gpio_pin_value>:
    82aa:	7179                	add	sp,sp,-48
    82ac:	d622                	sw	s0,44(sp)
    82ae:	1800                	add	s0,sp,48
    82b0:	fca42e23          	sw	a0,-36(s0)
    82b4:	fcb42c23          	sw	a1,-40(s0)
    82b8:	1a1017b7          	lui	a5,0x1a101
    82bc:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
    82be:	439c                	lw	a5,0(a5)
    82c0:	fef42623          	sw	a5,-20(s0)
    82c4:	fd842783          	lw	a5,-40(s0)
    82c8:	ef91                	bnez	a5,82e4 <set_gpio_pin_value+0x3a>
    82ca:	fdc42783          	lw	a5,-36(s0)
    82ce:	4705                	li	a4,1
    82d0:	00f717b3          	sll	a5,a4,a5
    82d4:	fff7c713          	not	a4,a5
    82d8:	fec42783          	lw	a5,-20(s0)
    82dc:	8ff9                	and	a5,a5,a4
    82de:	fef42623          	sw	a5,-20(s0)
    82e2:	a819                	j	82f8 <set_gpio_pin_value+0x4e>
    82e4:	fdc42783          	lw	a5,-36(s0)
    82e8:	4705                	li	a4,1
    82ea:	00f71733          	sll	a4,a4,a5
    82ee:	fec42783          	lw	a5,-20(s0)
    82f2:	8fd9                	or	a5,a5,a4
    82f4:	fef42623          	sw	a5,-20(s0)
    82f8:	1a1017b7          	lui	a5,0x1a101
    82fc:	07a1                	add	a5,a5,8 # 1a101008 <_stack_start+0x19ff9008>
    82fe:	fec42703          	lw	a4,-20(s0)
    8302:	c398                	sw	a4,0(a5)
    8304:	0001                	nop
    8306:	5432                	lw	s0,44(sp)
    8308:	6145                	add	sp,sp,48
    830a:	8082                	ret

0000830c <get_gpio_pin_value>:
    830c:	7179                	add	sp,sp,-48
    830e:	d622                	sw	s0,44(sp)
    8310:	1800                	add	s0,sp,48
    8312:	fca42e23          	sw	a0,-36(s0)
    8316:	1a1017b7          	lui	a5,0x1a101
    831a:	0791                	add	a5,a5,4 # 1a101004 <_stack_start+0x19ff9004>
    831c:	439c                	lw	a5,0(a5)
    831e:	fef42623          	sw	a5,-20(s0)
    8322:	fec42703          	lw	a4,-20(s0)
    8326:	fdc42783          	lw	a5,-36(s0)
    832a:	40f757b3          	sra	a5,a4,a5
    832e:	8b85                	and	a5,a5,1
    8330:	fef42623          	sw	a5,-20(s0)
    8334:	fec42783          	lw	a5,-20(s0)
    8338:	853e                	mv	a0,a5
    833a:	5432                	lw	s0,44(sp)
    833c:	6145                	add	sp,sp,48
    833e:	8082                	ret

00008340 <set_gpio_pin_irq_en>:
    8340:	7179                	add	sp,sp,-48
    8342:	d622                	sw	s0,44(sp)
    8344:	1800                	add	s0,sp,48
    8346:	fca42e23          	sw	a0,-36(s0)
    834a:	fcb42c23          	sw	a1,-40(s0)
    834e:	1a1017b7          	lui	a5,0x1a101
    8352:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
    8354:	439c                	lw	a5,0(a5)
    8356:	fef42623          	sw	a5,-20(s0)
    835a:	fd842783          	lw	a5,-40(s0)
    835e:	ef91                	bnez	a5,837a <set_gpio_pin_irq_en+0x3a>
    8360:	fdc42783          	lw	a5,-36(s0)
    8364:	4705                	li	a4,1
    8366:	00f717b3          	sll	a5,a4,a5
    836a:	fff7c793          	not	a5,a5
    836e:	fec42703          	lw	a4,-20(s0)
    8372:	8ff9                	and	a5,a5,a4
    8374:	fef42623          	sw	a5,-20(s0)
    8378:	a819                	j	838e <set_gpio_pin_irq_en+0x4e>
    837a:	fdc42783          	lw	a5,-36(s0)
    837e:	4705                	li	a4,1
    8380:	00f717b3          	sll	a5,a4,a5
    8384:	fec42703          	lw	a4,-20(s0)
    8388:	8fd9                	or	a5,a5,a4
    838a:	fef42623          	sw	a5,-20(s0)
    838e:	1a1017b7          	lui	a5,0x1a101
    8392:	07b1                	add	a5,a5,12 # 1a10100c <_stack_start+0x19ff900c>
    8394:	fec42703          	lw	a4,-20(s0)
    8398:	c398                	sw	a4,0(a5)
    839a:	0001                	nop
    839c:	5432                	lw	s0,44(sp)
    839e:	6145                	add	sp,sp,48
    83a0:	8082                	ret

000083a2 <set_gpio_pin_irq_type>:
    83a2:	7179                	add	sp,sp,-48
    83a4:	d622                	sw	s0,44(sp)
    83a6:	1800                	add	s0,sp,48
    83a8:	fca42e23          	sw	a0,-36(s0)
    83ac:	fcb42c23          	sw	a1,-40(s0)
    83b0:	1a1017b7          	lui	a5,0x1a101
    83b4:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
    83b6:	439c                	lw	a5,0(a5)
    83b8:	fef42623          	sw	a5,-20(s0)
    83bc:	1a1017b7          	lui	a5,0x1a101
    83c0:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
    83c2:	439c                	lw	a5,0(a5)
    83c4:	fef42423          	sw	a5,-24(s0)
    83c8:	fd842783          	lw	a5,-40(s0)
    83cc:	8b85                	and	a5,a5,1
    83ce:	ef91                	bnez	a5,83ea <set_gpio_pin_irq_type+0x48>
    83d0:	fdc42783          	lw	a5,-36(s0)
    83d4:	4705                	li	a4,1
    83d6:	00f717b3          	sll	a5,a4,a5
    83da:	fff7c793          	not	a5,a5
    83de:	fec42703          	lw	a4,-20(s0)
    83e2:	8ff9                	and	a5,a5,a4
    83e4:	fef42623          	sw	a5,-20(s0)
    83e8:	a819                	j	83fe <set_gpio_pin_irq_type+0x5c>
    83ea:	fdc42783          	lw	a5,-36(s0)
    83ee:	4705                	li	a4,1
    83f0:	00f717b3          	sll	a5,a4,a5
    83f4:	fec42703          	lw	a4,-20(s0)
    83f8:	8fd9                	or	a5,a5,a4
    83fa:	fef42623          	sw	a5,-20(s0)
    83fe:	fd842783          	lw	a5,-40(s0)
    8402:	8b89                	and	a5,a5,2
    8404:	ef91                	bnez	a5,8420 <set_gpio_pin_irq_type+0x7e>
    8406:	fdc42783          	lw	a5,-36(s0)
    840a:	4705                	li	a4,1
    840c:	00f717b3          	sll	a5,a4,a5
    8410:	fff7c793          	not	a5,a5
    8414:	fe842703          	lw	a4,-24(s0)
    8418:	8ff9                	and	a5,a5,a4
    841a:	fef42423          	sw	a5,-24(s0)
    841e:	a819                	j	8434 <set_gpio_pin_irq_type+0x92>
    8420:	fdc42783          	lw	a5,-36(s0)
    8424:	4705                	li	a4,1
    8426:	00f717b3          	sll	a5,a4,a5
    842a:	fe842703          	lw	a4,-24(s0)
    842e:	8fd9                	or	a5,a5,a4
    8430:	fef42423          	sw	a5,-24(s0)
    8434:	1a1017b7          	lui	a5,0x1a101
    8438:	07c1                	add	a5,a5,16 # 1a101010 <_stack_start+0x19ff9010>
    843a:	fec42703          	lw	a4,-20(s0)
    843e:	c398                	sw	a4,0(a5)
    8440:	1a1017b7          	lui	a5,0x1a101
    8444:	07d1                	add	a5,a5,20 # 1a101014 <_stack_start+0x19ff9014>
    8446:	fe842703          	lw	a4,-24(s0)
    844a:	c398                	sw	a4,0(a5)
    844c:	0001                	nop
    844e:	5432                	lw	s0,44(sp)
    8450:	6145                	add	sp,sp,48
    8452:	8082                	ret

00008454 <get_gpio_irq_status>:
    8454:	1141                	add	sp,sp,-16
    8456:	c622                	sw	s0,12(sp)
    8458:	0800                	add	s0,sp,16
    845a:	1a1017b7          	lui	a5,0x1a101
    845e:	07e1                	add	a5,a5,24 # 1a101018 <_stack_start+0x19ff9018>
    8460:	439c                	lw	a5,0(a5)
    8462:	853e                	mv	a0,a5
    8464:	4432                	lw	s0,12(sp)
    8466:	0141                	add	sp,sp,16
    8468:	8082                	ret

0000846a <__CTOR_LIST__>:
	...

00008472 <__CTOR_END__>:
	...

Disassembly of section .rodata:

0000847a <.rodata>:
	...

Disassembly of section .stack:

00106000 <_stack-0x1000>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2e41                	jal	390 <__DYNAMIC+0x390>
   2:	0000                	unimp
   4:	7200                	.2byte	0x7200
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	0024                	add	s1,sp,8
   e:	0000                	unimp
  10:	1004                	add	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	.2byte	0x3376
  16:	6932                	.2byte	0x6932
  18:	7032                	.2byte	0x7032
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	jal	fffff9c6 <_stack_start+0xffef79c6>
  1e:	3070                	.2byte	0x3070
  20:	635f 7032 5f30      	.byte	0x5f, 0x63, 0x32, 0x70, 0x30, 0x5f
  26:	6d7a                	.2byte	0x6d7a
  28:	756d                	lui	a0,0xffffb
  2a:	316c                	.2byte	0x316c
  2c:	3070                	.2byte	0x3070
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.4byte	0x3a434347
   4:	2820                	.2byte	0x2820
   6:	65653267          	.4byte	0x65653267
   a:	6535                	lui	a0,0xd
   c:	3334                	.2byte	0x3334
   e:	3030                	.2byte	0x3030
  10:	3831                	jal	fffff82c <_stack_start+0xffef782c>
  12:	2029                	jal	1c <__DYNAMIC+0x1c>
  14:	3231                	jal	fffff920 <_stack_start+0xffef7920>
  16:	322e                	.2byte	0x322e
  18:	302e                	.2byte	0x302e
	...
