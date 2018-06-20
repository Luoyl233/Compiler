.data
_prompt: .asciiz "Enter an integer:"
_ret: .asciiz "\n"
.globl main
.text
read:
  li $v0, 4
  la $a0, _prompt
  syscall
  li $v0, 5
  syscall
  jr $ra
  
write:
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, _ret
  syscall
  move $v0, $0
  jr $ra

trap:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  subu $sp, $sp, 4		#alloc -4($fp) for temp1
  move $t0, $0
  subu $sp, $sp, 4		#alloc -8($fp) for lh
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -12($fp) for temp2
  move $t2, $0
  subu $sp, $sp, 4		#alloc -16($fp) for lIndex
  move $t3, $t2
  subu $sp, $sp, 4		#alloc -20($fp) for temp3
  move $t4, $0
  subu $sp, $sp, 4		#alloc -24($fp) for i
  move $t5, $t4
  subu $sp, $sp, 4		#alloc -28($fp) for temp4
  move $t6, $0
  subu $sp, $sp, 4		#alloc -32($fp) for count
  move $t7, $t6
  subu $sp, $sp, 4		#alloc -36($fp) for temp5
  move $t8, $0
  subu $sp, $sp, 4		#alloc -40($fp) for thisPool
  move $t9, $t8
  subu $sp, $sp, 4		#alloc -44($fp) for temp6
  li $s1, 12
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -48($fp) for n
  move $s1, $s0
  subu $sp, $sp, 4		#alloc -52($fp) for temp7
  move $s2, $0
  subu $sp, $sp, 4		#alloc -56($fp) for rh
  move $s3, $s2
  subu $sp, $sp, 48		#alloc for temp8
  subu $sp, $sp, 4		#alloc -108($fp) for height
  la $s5, -104($fp)
  move $s4, $s5
  sw $t0, -4($fp)		#spill
  sw $t1, -8($fp)		#spill
  sw $t2, -12($fp)		#spill
  sw $t3, -16($fp)		#spill
  sw $t4, -20($fp)		#spill
  sw $t5, -24($fp)		#spill
  sw $t6, -28($fp)		#spill
  sw $t7, -32($fp)		#spill
  sw $t8, -36($fp)		#spill
  sw $t9, -40($fp)		#spill
  sw $s0, -44($fp)		#spill
  sw $s1, -48($fp)		#spill
  sw $s2, -52($fp)		#spill
  sw $s3, -56($fp)		#spill
  sw $s4, -108($fp)		#spill
label1:
  subu $sp, $sp, 4		#alloc -112($fp) for temp9
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -116($fp) for temp10
  lw $t3, -48($fp)
  move $t2, $t3
  sw $t0, -112($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -116($fp)		#spill
  sw $t3, -48($fp)		#spill
  lw $t0, -112($fp)
  lw $t1, -116($fp)
  blt $t0, $t1, label2
  sw $t0, -112($fp)		#spill
  sw $t1, -116($fp)		#spill
  j label3
label2:
  subu $sp, $sp, 4		#alloc -120($fp) for temp13
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -124($fp) for temp14
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -128($fp) for temp15
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -132($fp) for temp16
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -136($fp) for temp17
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t6, $v0
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -140($fp) for temp11
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -144($fp) for temp20
  move $t8, $t3
  subu $sp, $sp, 4		#alloc -148($fp) for temp21
  li $s0, 1
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -152($fp) for temp19
  add $s0, $t8, $t9
  move $t3, $s0
  subu $sp, $sp, 4		#alloc -156($fp) for temp18
  move $s1, $t3
  sw $t0, -120($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -124($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -128($fp)		#spill
  sw $t5, -132($fp)		#spill
  sw $t6, -136($fp)		#spill
  sw $t7, -140($fp)		#spill
  sw $t8, -144($fp)		#spill
  sw $t9, -148($fp)		#spill
  sw $s0, -152($fp)		#spill
  sw $s1, -156($fp)		#spill
  j label1
label3:
  subu $sp, $sp, 4		#alloc -160($fp) for temp23
  move $t0, $0
  lw $t1, -24($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -164($fp) for temp22
  move $t2, $t1
  sw $t0, -160($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -164($fp)		#spill
label4:
  subu $sp, $sp, 4		#alloc -168($fp) for temp24
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -172($fp) for temp25
  lw $t3, -48($fp)
  move $t2, $t3
  sw $t0, -168($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -172($fp)		#spill
  sw $t3, -48($fp)		#spill
  lw $t0, -168($fp)
  lw $t1, -172($fp)
  blt $t0, $t1, label7
  sw $t0, -168($fp)		#spill
  sw $t1, -172($fp)		#spill
  j label6
label7:
  subu $sp, $sp, 4		#alloc -176($fp) for temp28
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -180($fp) for temp29
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -184($fp) for temp30
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -188($fp) for temp31
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -192($fp) for temp27
  move $t6, $0
  sw $t0, -176($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -180($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -184($fp)		#spill
  sw $t5, -188($fp)		#spill
  sw $t6, -192($fp)		#spill
  lw $t1, -188($fp)
  lw $t0, 0($t1)
  lw $t2, -192($fp)
  beq $t0, $t2, label5
  sw $t1, -188($fp)		#spill
  sw $t2, -192($fp)		#spill
  j label6
label5:
  subu $sp, $sp, 4		#alloc -196($fp) for temp34
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -200($fp) for temp35
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -204($fp) for temp33
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -208($fp) for temp32
  move $t4, $t1
  sw $t0, -196($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -200($fp)		#spill
  sw $t3, -204($fp)		#spill
  sw $t4, -208($fp)		#spill
  j label4
label6:
  subu $sp, $sp, 4		#alloc -212($fp) for temp36
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -216($fp) for temp37
  lw $t3, -48($fp)
  move $t2, $t3
  sw $t0, -212($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -216($fp)		#spill
  sw $t3, -48($fp)		#spill
  lw $t0, -212($fp)
  lw $t1, -216($fp)
  bge $t0, $t1, label8
  sw $t0, -212($fp)		#spill
  sw $t1, -216($fp)		#spill
  j label9
label8:
  subu $sp, $sp, 4		#alloc -220($fp) for temp38
  move $t0, $0
  move $v0, $t0
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
  sw $t0, -220($fp)		#spill
label9:
  subu $sp, $sp, 4		#alloc -224($fp) for temp41
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -228($fp) for temp42
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -232($fp) for temp43
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -236($fp) for temp44
  add $t5, $t0, $t4
  lw $t6, -8($fp)
  lw $t7, 0($t5)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -240($fp) for temp39
  move $t7, $t6
  subu $sp, $sp, 4		#alloc -244($fp) for temp46
  move $t8, $t3
  lw $t9, -16($fp)
  move $t9, $t8
  subu $sp, $sp, 4		#alloc -248($fp) for temp45
  move $s0, $t9
  subu $sp, $sp, 4		#alloc -252($fp) for temp48
  move $s1, $0
  lw $s2, -40($fp)
  move $s2, $s1
  subu $sp, $sp, 4		#alloc -256($fp) for temp47
  move $s3, $s2
  subu $sp, $sp, 4		#alloc -260($fp) for temp51
  move $s4, $t3
  subu $sp, $sp, 4		#alloc -264($fp) for temp52
  li $s6, 1
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -268($fp) for temp50
  add $s6, $s4, $s5
  move $t3, $s6
  subu $sp, $sp, 4		#alloc -272($fp) for temp49
  move $s7, $t3
  sw $t0, -224($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -228($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -232($fp)		#spill
  sw $t5, -236($fp)		#spill
  sw $t6, -8($fp)		#spill
  sw $t7, -240($fp)		#spill
  sw $t8, -244($fp)		#spill
  sw $t9, -16($fp)		#spill
  sw $s0, -248($fp)		#spill
  sw $s1, -252($fp)		#spill
  sw $s2, -40($fp)		#spill
  sw $s3, -256($fp)		#spill
  sw $s4, -260($fp)		#spill
  sw $s5, -264($fp)		#spill
  sw $s6, -268($fp)		#spill
  sw $s7, -272($fp)		#spill
label10:
  subu $sp, $sp, 4		#alloc -276($fp) for temp53
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -280($fp) for temp54
  lw $t3, -48($fp)
  move $t2, $t3
  sw $t0, -276($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -280($fp)		#spill
  sw $t3, -48($fp)		#spill
  lw $t0, -276($fp)
  lw $t1, -280($fp)
  blt $t0, $t1, label11
  sw $t0, -276($fp)		#spill
  sw $t1, -280($fp)		#spill
  j label12
label11:
  subu $sp, $sp, 4		#alloc -284($fp) for temp57
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -288($fp) for temp58
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -292($fp) for temp59
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -296($fp) for temp60
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -300($fp) for temp56
  lw $t7, -8($fp)
  move $t6, $t7
  sw $t0, -284($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -288($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -292($fp)		#spill
  sw $t5, -296($fp)		#spill
  sw $t6, -300($fp)		#spill
  sw $t7, -8($fp)		#spill
  lw $t1, -296($fp)
  lw $t0, 0($t1)
  lw $t2, -300($fp)
  blt $t0, $t2, label13
  sw $t1, -296($fp)		#spill
  sw $t2, -300($fp)		#spill
  j label14
label13:
  subu $sp, $sp, 4		#alloc -304($fp) for temp63
  lw $t1, -40($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -308($fp) for temp65
  lw $t3, -8($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -312($fp) for temp67
  lw $t5, -108($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -316($fp) for temp68
  lw $t7, -24($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -320($fp) for temp69
  li $t9, 4
  mul $t8, $t9, $t6
  subu $sp, $sp, 4		#alloc -324($fp) for temp70
  add $t9, $t4, $t8
  subu $sp, $sp, 4		#alloc -328($fp) for temp64
  lw $s1, 0($t9)
  sub $s0, $t2, $s1
  subu $sp, $sp, 4		#alloc -332($fp) for temp62
  add $s1, $t0, $s0
  move $t1, $s1
  subu $sp, $sp, 4		#alloc -336($fp) for temp61
  move $s2, $t1
  sw $t0, -304($fp)		#spill
  sw $t1, -40($fp)		#spill
  sw $t2, -308($fp)		#spill
  sw $t3, -8($fp)		#spill
  sw $t4, -312($fp)		#spill
  sw $t5, -108($fp)		#spill
  sw $t6, -316($fp)		#spill
  sw $t7, -24($fp)		#spill
  sw $t8, -320($fp)		#spill
  sw $t9, -324($fp)		#spill
  sw $s0, -328($fp)		#spill
  sw $s1, -332($fp)		#spill
  sw $s2, -336($fp)		#spill
  j label15
label14:
  subu $sp, $sp, 4		#alloc -340($fp) for temp73
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -344($fp) for temp74
  lw $t3, -40($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -348($fp) for temp72
  add $t4, $t0, $t2
  move $t1, $t4
  subu $sp, $sp, 4		#alloc -352($fp) for temp71
  move $t5, $t1
  subu $sp, $sp, 4		#alloc -356($fp) for temp77
  lw $t7, -108($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -360($fp) for temp78
  lw $t9, -24($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -364($fp) for temp79
  li $s1, 4
  mul $s0, $s1, $t8
  subu $sp, $sp, 4		#alloc -368($fp) for temp80
  add $s1, $t6, $s0
  lw $s2, -8($fp)
  lw $s3, 0($s1)
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -372($fp) for temp75
  move $s3, $s2
  subu $sp, $sp, 4		#alloc -376($fp) for temp82
  move $s4, $t9
  lw $s5, -16($fp)
  move $s5, $s4
  subu $sp, $sp, 4		#alloc -380($fp) for temp81
  move $s6, $s5
  subu $sp, $sp, 4		#alloc -384($fp) for temp84
  move $s7, $0
  move $t3, $s7
  subu $sp, $sp, 4		#alloc -388($fp) for temp83
  #spill 0
  sw $t0, -340($fp)		#spill
  move $t0, $t3
  sw $t0, -388($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -344($fp)		#spill
  sw $t3, -40($fp)		#spill
  sw $t4, -348($fp)		#spill
  sw $t5, -352($fp)		#spill
  sw $t6, -356($fp)		#spill
  sw $t7, -108($fp)		#spill
  sw $t8, -360($fp)		#spill
  sw $t9, -24($fp)		#spill
  sw $s0, -364($fp)		#spill
  sw $s1, -368($fp)		#spill
  sw $s2, -8($fp)		#spill
  sw $s3, -372($fp)		#spill
  sw $s4, -376($fp)		#spill
  sw $s5, -16($fp)		#spill
  sw $s6, -380($fp)		#spill
  sw $s7, -384($fp)		#spill
label15:
  subu $sp, $sp, 4		#alloc -392($fp) for temp87
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -396($fp) for temp88
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -400($fp) for temp86
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -404($fp) for temp85
  move $t4, $t1
  sw $t0, -392($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -396($fp)		#spill
  sw $t3, -400($fp)		#spill
  sw $t4, -404($fp)		#spill
  j label10
label12:
  subu $sp, $sp, 4		#alloc -408($fp) for temp90
  move $t0, $0
  lw $t1, -40($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -412($fp) for temp89
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -416($fp) for temp92
  move $t3, $0
  lw $t4, -56($fp)
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -420($fp) for temp91
  move $t5, $t4
  subu $sp, $sp, 4		#alloc -424($fp) for temp95
  lw $t7, -48($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -428($fp) for temp96
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -432($fp) for temp94
  sub $t9, $t6, $t8
  lw $s0, -24($fp)
  move $s0, $t9
  subu $sp, $sp, 4		#alloc -436($fp) for temp93
  move $s1, $s0
  sw $t0, -408($fp)		#spill
  sw $t1, -40($fp)		#spill
  sw $t2, -412($fp)		#spill
  sw $t3, -416($fp)		#spill
  sw $t4, -56($fp)		#spill
  sw $t5, -420($fp)		#spill
  sw $t6, -424($fp)		#spill
  sw $t7, -48($fp)		#spill
  sw $t8, -428($fp)		#spill
  sw $t9, -432($fp)		#spill
  sw $s0, -24($fp)		#spill
  sw $s1, -436($fp)		#spill
label16:
  subu $sp, $sp, 4		#alloc -440($fp) for temp97
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -444($fp) for temp98
  lw $t3, -16($fp)
  move $t2, $t3
  sw $t0, -440($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -444($fp)		#spill
  sw $t3, -16($fp)		#spill
  lw $t0, -440($fp)
  lw $t1, -444($fp)
  bgt $t0, $t1, label19
  sw $t0, -440($fp)		#spill
  sw $t1, -444($fp)		#spill
  j label18
label19:
  subu $sp, $sp, 4		#alloc -448($fp) for temp101
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -452($fp) for temp102
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -456($fp) for temp103
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -460($fp) for temp104
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -464($fp) for temp100
  move $t6, $0
  sw $t0, -448($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -452($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -456($fp)		#spill
  sw $t5, -460($fp)		#spill
  sw $t6, -464($fp)		#spill
  lw $t1, -460($fp)
  lw $t0, 0($t1)
  lw $t2, -464($fp)
  beq $t0, $t2, label17
  sw $t1, -460($fp)		#spill
  sw $t2, -464($fp)		#spill
  j label18
label17:
  subu $sp, $sp, 4		#alloc -468($fp) for temp107
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -472($fp) for temp108
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -476($fp) for temp106
  sub $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -480($fp) for temp105
  move $t4, $t1
  sw $t0, -468($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -472($fp)		#spill
  sw $t3, -476($fp)		#spill
  sw $t4, -480($fp)		#spill
  j label16
label18:
  subu $sp, $sp, 4		#alloc -484($fp) for temp111
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -488($fp) for temp112
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -492($fp) for temp113
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -496($fp) for temp114
  add $t5, $t0, $t4
  lw $t6, -56($fp)
  lw $t7, 0($t5)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -500($fp) for temp109
  move $t7, $t6
  subu $sp, $sp, 4		#alloc -504($fp) for temp117
  move $t8, $t3
  subu $sp, $sp, 4		#alloc -508($fp) for temp118
  li $s0, 1
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -512($fp) for temp116
  sub $s0, $t8, $t9
  move $t3, $s0
  subu $sp, $sp, 4		#alloc -516($fp) for temp115
  move $s1, $t3
  sw $t0, -484($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -488($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -492($fp)		#spill
  sw $t5, -496($fp)		#spill
  sw $t6, -56($fp)		#spill
  sw $t7, -500($fp)		#spill
  sw $t8, -504($fp)		#spill
  sw $t9, -508($fp)		#spill
  sw $s0, -512($fp)		#spill
  sw $s1, -516($fp)		#spill
label20:
  subu $sp, $sp, 4		#alloc -520($fp) for temp119
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -524($fp) for temp120
  lw $t3, -16($fp)
  move $t2, $t3
  sw $t0, -520($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -524($fp)		#spill
  sw $t3, -16($fp)		#spill
  lw $t0, -520($fp)
  lw $t1, -524($fp)
  bgt $t0, $t1, label21
  sw $t0, -520($fp)		#spill
  sw $t1, -524($fp)		#spill
  j label22
label21:
  subu $sp, $sp, 4		#alloc -528($fp) for temp123
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -532($fp) for temp124
  lw $t3, -24($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -536($fp) for temp125
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -540($fp) for temp126
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -544($fp) for temp122
  lw $t7, -56($fp)
  move $t6, $t7
  sw $t0, -528($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -532($fp)		#spill
  sw $t3, -24($fp)		#spill
  sw $t4, -536($fp)		#spill
  sw $t5, -540($fp)		#spill
  sw $t6, -544($fp)		#spill
  sw $t7, -56($fp)		#spill
  lw $t1, -540($fp)
  lw $t0, 0($t1)
  lw $t2, -544($fp)
  blt $t0, $t2, label23
  sw $t1, -540($fp)		#spill
  sw $t2, -544($fp)		#spill
  j label24
label23:
  subu $sp, $sp, 4		#alloc -548($fp) for temp129
  lw $t1, -40($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -552($fp) for temp131
  lw $t3, -56($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -556($fp) for temp133
  lw $t5, -108($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -560($fp) for temp134
  lw $t7, -24($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -564($fp) for temp135
  li $t9, 4
  mul $t8, $t9, $t6
  subu $sp, $sp, 4		#alloc -568($fp) for temp136
  add $t9, $t4, $t8
  subu $sp, $sp, 4		#alloc -572($fp) for temp130
  lw $s1, 0($t9)
  sub $s0, $t2, $s1
  subu $sp, $sp, 4		#alloc -576($fp) for temp128
  add $s1, $t0, $s0
  move $t1, $s1
  subu $sp, $sp, 4		#alloc -580($fp) for temp127
  move $s2, $t1
  sw $t0, -548($fp)		#spill
  sw $t1, -40($fp)		#spill
  sw $t2, -552($fp)		#spill
  sw $t3, -56($fp)		#spill
  sw $t4, -556($fp)		#spill
  sw $t5, -108($fp)		#spill
  sw $t6, -560($fp)		#spill
  sw $t7, -24($fp)		#spill
  sw $t8, -564($fp)		#spill
  sw $t9, -568($fp)		#spill
  sw $s0, -572($fp)		#spill
  sw $s1, -576($fp)		#spill
  sw $s2, -580($fp)		#spill
  j label25
label24:
  subu $sp, $sp, 4		#alloc -584($fp) for temp139
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -588($fp) for temp140
  lw $t3, -40($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -592($fp) for temp138
  add $t4, $t0, $t2
  move $t1, $t4
  subu $sp, $sp, 4		#alloc -596($fp) for temp137
  move $t5, $t1
  subu $sp, $sp, 4		#alloc -600($fp) for temp143
  lw $t7, -108($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -604($fp) for temp144
  lw $t9, -24($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -608($fp) for temp145
  li $s1, 4
  mul $s0, $s1, $t8
  subu $sp, $sp, 4		#alloc -612($fp) for temp146
  add $s1, $t6, $s0
  lw $s2, -56($fp)
  lw $s3, 0($s1)
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -616($fp) for temp141
  move $s3, $s2
  subu $sp, $sp, 4		#alloc -620($fp) for temp148
  move $s4, $0
  move $t3, $s4
  subu $sp, $sp, 4		#alloc -624($fp) for temp147
  move $s5, $t3
  sw $t0, -584($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -588($fp)		#spill
  sw $t3, -40($fp)		#spill
  sw $t4, -592($fp)		#spill
  sw $t5, -596($fp)		#spill
  sw $t6, -600($fp)		#spill
  sw $t7, -108($fp)		#spill
  sw $t8, -604($fp)		#spill
  sw $t9, -24($fp)		#spill
  sw $s0, -608($fp)		#spill
  sw $s1, -612($fp)		#spill
  sw $s2, -56($fp)		#spill
  sw $s3, -616($fp)		#spill
  sw $s4, -620($fp)		#spill
  sw $s5, -624($fp)		#spill
label25:
  subu $sp, $sp, 4		#alloc -628($fp) for temp151
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -632($fp) for temp152
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -636($fp) for temp150
  sub $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -640($fp) for temp149
  move $t4, $t1
  sw $t0, -628($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -632($fp)		#spill
  sw $t3, -636($fp)		#spill
  sw $t4, -640($fp)		#spill
  j label20
label22:
  subu $sp, $sp, 4		#alloc -644($fp) for temp154
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -648($fp) for temp155
  lw $t3, -40($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -652($fp) for temp153
  add $t4, $t0, $t2
  move $v0, $t4
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra

main:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal trap
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -4($fp) for temp156
  move $t0, $v0
  subu $sp, $sp, 4		#alloc -8($fp) for result
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -12($fp) for temp158
  move $t2, $t1
  move $a0, $t2
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -16($fp) for temp159
  move $t3, $0
  move $v0, $t3
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
