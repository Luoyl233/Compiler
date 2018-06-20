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

countSort:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  subu $sp, $sp, 20		#alloc for temp1
  subu $sp, $sp, 4		#alloc -24($fp) for x
  la $t1, -20($fp)
  move $t0, $t1
  subu $sp, $sp, 40		#alloc for temp2
  subu $sp, $sp, 4		#alloc -68($fp) for count
  la $t2, -64($fp)
  move $t1, $t2
  subu $sp, $sp, 20		#alloc for temp3
  subu $sp, $sp, 4		#alloc -92($fp) for sorted
  la $t3, -88($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -96($fp) for temp5
  move $t3, $0
  subu $sp, $sp, 4		#alloc -100($fp) for i
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -104($fp) for temp4
  move $t5, $t4
  sw $t0, -24($fp)		#spill
  sw $t1, -68($fp)		#spill
  sw $t2, -92($fp)		#spill
  sw $t3, -96($fp)		#spill
  sw $t4, -100($fp)		#spill
  sw $t5, -104($fp)		#spill
label1:
  subu $sp, $sp, 4		#alloc -108($fp) for temp6
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -112($fp) for temp7
  li $t3, 10
  move $t2, $t3
  sw $t0, -108($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -112($fp)		#spill
  lw $t0, -108($fp)
  lw $t1, -112($fp)
  blt $t0, $t1, label2
  sw $t0, -108($fp)		#spill
  sw $t1, -112($fp)		#spill
  j label3
label2:
  subu $sp, $sp, 4		#alloc -116($fp) for temp10
  lw $t1, -68($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -120($fp) for temp11
  lw $t3, -100($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -124($fp) for temp12
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -128($fp) for temp13
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -132($fp) for temp14
  move $t6, $0
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -136($fp) for temp8
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -140($fp) for temp17
  move $t8, $t3
  subu $sp, $sp, 4		#alloc -144($fp) for temp18
  li $s0, 1
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -148($fp) for temp16
  add $s0, $t8, $t9
  move $t3, $s0
  subu $sp, $sp, 4		#alloc -152($fp) for temp15
  move $s1, $t3
  sw $t0, -116($fp)		#spill
  sw $t1, -68($fp)		#spill
  sw $t2, -120($fp)		#spill
  sw $t3, -100($fp)		#spill
  sw $t4, -124($fp)		#spill
  sw $t5, -128($fp)		#spill
  sw $t6, -132($fp)		#spill
  sw $t7, -136($fp)		#spill
  sw $t8, -140($fp)		#spill
  sw $t9, -144($fp)		#spill
  sw $s0, -148($fp)		#spill
  sw $s1, -152($fp)		#spill
  j label1
label3:
  subu $sp, $sp, 4		#alloc -156($fp) for temp20
  move $t0, $0
  lw $t1, -100($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -160($fp) for temp19
  move $t2, $t1
  sw $t0, -156($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -160($fp)		#spill
label4:
  subu $sp, $sp, 4		#alloc -164($fp) for temp21
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -168($fp) for temp22
  li $t3, 5
  move $t2, $t3
  sw $t0, -164($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -168($fp)		#spill
  lw $t0, -164($fp)
  lw $t1, -168($fp)
  blt $t0, $t1, label5
  sw $t0, -164($fp)		#spill
  sw $t1, -168($fp)		#spill
  j label6
label5:
  subu $sp, $sp, 4		#alloc -172($fp) for temp25
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -176($fp) for temp26
  lw $t3, -100($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -180($fp) for temp27
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -184($fp) for temp28
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -188($fp) for temp29
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t6, $v0
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -192($fp) for temp23
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -196($fp) for temp32
  lw $t9, -68($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -200($fp) for temp34
  move $s0, $t1
  subu $sp, $sp, 4		#alloc -204($fp) for temp35
  move $s1, $t3
  subu $sp, $sp, 4		#alloc -208($fp) for temp36
  li $s3, 4
  mul $s2, $s3, $s1
  subu $sp, $sp, 4		#alloc -212($fp) for temp37
  add $s3, $s0, $s2
  subu $sp, $sp, 4		#alloc -216($fp) for temp38
  li $s5, 4
  lw $s6, 0($s3)
  mul $s4, $s5, $s6
  subu $sp, $sp, 4		#alloc -220($fp) for temp39
  add $s5, $t8, $s4
  subu $sp, $sp, 4		#alloc -224($fp) for temp43
  move $s6, $t9
  subu $sp, $sp, 4		#alloc -228($fp) for temp45
  move $s7, $t1
  subu $sp, $sp, 4		#alloc -232($fp) for temp46
  #spill 0
  sw $t0, -172($fp)		#spill
  move $t0, $t3
  subu $sp, $sp, 4		#alloc -236($fp) for temp47
  #spill 1
  sw $t1, -24($fp)		#spill
  #spill 2
  sw $t2, -176($fp)		#spill
  li $t2, 4
  mul $t1, $t2, $t0
  subu $sp, $sp, 4		#alloc -240($fp) for temp48
  add $t2, $s7, $t1
  subu $sp, $sp, 4		#alloc -244($fp) for temp49
  #spill 3
  sw $t3, -100($fp)		#spill
  #spill 4
  sw $t4, -180($fp)		#spill
  li $t4, 4
  #spill 5
  sw $t5, -184($fp)		#spill
  lw $t5, 0($t2)
  mul $t3, $t4, $t5
  subu $sp, $sp, 4		#alloc -248($fp) for temp50
  add $t4, $s6, $t3
  subu $sp, $sp, 4		#alloc -252($fp) for temp42
  #spill 6
  sw $t6, -188($fp)		#spill
  li $t6, 1
  move $t5, $t6
  subu $sp, $sp, 4		#alloc -256($fp) for temp40
  #spill 7
  sw $t7, -192($fp)		#spill
  lw $t7, 0($t4)
  add $t6, $t7, $t5
  sw $t6, 0($s5)
  subu $sp, $sp, 4		#alloc -260($fp) for temp30
  #spill 8
  sw $t8, -196($fp)		#spill
  lw $t8, 0($s5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -264($fp) for temp53
  #spill 9
  sw $t9, -68($fp)		#spill
  lw $t9, -100($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -268($fp) for temp54
  #spill 0
  sw $t0, -232($fp)		#spill
  #spill 1
  sw $t1, -236($fp)		#spill
  li $t1, 1
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -272($fp) for temp52
  add $t1, $t8, $t0
  move $t9, $t1
  subu $sp, $sp, 4		#alloc -276($fp) for temp51
  #spill 2
  sw $t2, -240($fp)		#spill
  move $t2, $t9
  sw $t0, -268($fp)		#spill
  sw $t1, -272($fp)		#spill
  sw $t2, -276($fp)		#spill
  sw $t3, -244($fp)		#spill
  sw $t4, -248($fp)		#spill
  sw $t5, -252($fp)		#spill
  sw $t6, -256($fp)		#spill
  sw $t7, -260($fp)		#spill
  sw $t8, -264($fp)		#spill
  sw $t9, -100($fp)		#spill
  sw $s0, -200($fp)		#spill
  sw $s1, -204($fp)		#spill
  sw $s2, -208($fp)		#spill
  sw $s3, -212($fp)		#spill
  sw $s4, -216($fp)		#spill
  sw $s5, -220($fp)		#spill
  sw $s6, -224($fp)		#spill
  sw $s7, -228($fp)		#spill
  j label4
label6:
  subu $sp, $sp, 4		#alloc -280($fp) for temp56
  li $t1, 1
  move $t0, $t1
  lw $t1, -100($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -284($fp) for temp55
  move $t2, $t1
  sw $t0, -280($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -284($fp)		#spill
label7:
  subu $sp, $sp, 4		#alloc -288($fp) for temp57
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -292($fp) for temp58
  li $t3, 10
  move $t2, $t3
  sw $t0, -288($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -292($fp)		#spill
  lw $t0, -288($fp)
  lw $t1, -292($fp)
  blt $t0, $t1, label8
  sw $t0, -288($fp)		#spill
  sw $t1, -292($fp)		#spill
  j label9
label8:
  subu $sp, $sp, 4		#alloc -296($fp) for temp61
  lw $t1, -68($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -300($fp) for temp62
  lw $t3, -100($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -304($fp) for temp63
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -308($fp) for temp64
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -312($fp) for temp68
  move $t6, $t1
  subu $sp, $sp, 4		#alloc -316($fp) for temp69
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -320($fp) for temp70
  li $t9, 4
  mul $t8, $t9, $t7
  subu $sp, $sp, 4		#alloc -324($fp) for temp71
  add $t9, $t6, $t8
  subu $sp, $sp, 4		#alloc -328($fp) for temp72
  move $s0, $t1
  subu $sp, $sp, 4		#alloc -332($fp) for temp74
  move $s1, $t3
  subu $sp, $sp, 4		#alloc -336($fp) for temp75
  li $s3, 1
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -340($fp) for temp73
  sub $s3, $s1, $s2
  subu $sp, $sp, 4		#alloc -344($fp) for temp76
  li $s5, 4
  mul $s4, $s5, $s3
  subu $sp, $sp, 4		#alloc -348($fp) for temp77
  add $s5, $s0, $s4
  subu $sp, $sp, 4		#alloc -352($fp) for temp65
  lw $s7, 0($t9)
  #spill 0
  sw $t0, -296($fp)		#spill
  lw $t0, 0($s5)
  add $s6, $s7, $t0
  sw $s6, 0($t5)
  subu $sp, $sp, 4		#alloc -356($fp) for temp59
  lw $s7, 0($t5)
  move $t0, $s7
  subu $sp, $sp, 4		#alloc -360($fp) for temp80
  move $s7, $t3
  subu $sp, $sp, 4		#alloc -364($fp) for temp81
  #spill 1
  sw $t1, -68($fp)		#spill
  #spill 2
  sw $t2, -300($fp)		#spill
  li $t2, 1
  move $t1, $t2
  subu $sp, $sp, 4		#alloc -368($fp) for temp79
  add $t2, $s7, $t1
  move $t3, $t2
  subu $sp, $sp, 4		#alloc -372($fp) for temp78
  #spill 3
  sw $t3, -100($fp)		#spill
  #spill 4
  sw $t4, -304($fp)		#spill
  lw $t4, -100($fp)
  move $t3, $t4
  sw $t0, -356($fp)		#spill
  sw $t1, -364($fp)		#spill
  sw $t2, -368($fp)		#spill
  sw $t3, -372($fp)		#spill
  sw $t4, -100($fp)		#spill
  sw $t5, -308($fp)		#spill
  sw $t6, -312($fp)		#spill
  sw $t7, -316($fp)		#spill
  sw $t8, -320($fp)		#spill
  sw $t9, -324($fp)		#spill
  sw $s0, -328($fp)		#spill
  sw $s1, -332($fp)		#spill
  sw $s2, -336($fp)		#spill
  sw $s3, -340($fp)		#spill
  sw $s4, -344($fp)		#spill
  sw $s5, -348($fp)		#spill
  sw $s6, -352($fp)		#spill
  sw $s7, -360($fp)		#spill
  j label7
label9:
  subu $sp, $sp, 4		#alloc -376($fp) for temp83
  move $t0, $0
  lw $t1, -100($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -380($fp) for temp82
  move $t2, $t1
  sw $t0, -376($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -380($fp)		#spill
label10:
  subu $sp, $sp, 4		#alloc -384($fp) for temp84
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -388($fp) for temp85
  li $t3, 5
  move $t2, $t3
  sw $t0, -384($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -388($fp)		#spill
  lw $t0, -384($fp)
  lw $t1, -388($fp)
  blt $t0, $t1, label11
  sw $t0, -384($fp)		#spill
  sw $t1, -388($fp)		#spill
  j label12
label11:
  subu $sp, $sp, 4		#alloc -392($fp) for temp88
  lw $t1, -92($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -396($fp) for temp92
  lw $t3, -68($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -400($fp) for temp94
  lw $t5, -24($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -404($fp) for temp95
  lw $t7, -100($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -408($fp) for temp96
  li $t9, 4
  mul $t8, $t9, $t6
  subu $sp, $sp, 4		#alloc -412($fp) for temp97
  add $t9, $t4, $t8
  subu $sp, $sp, 4		#alloc -416($fp) for temp98
  li $s1, 4
  lw $s2, 0($t9)
  mul $s0, $s1, $s2
  subu $sp, $sp, 4		#alloc -420($fp) for temp99
  add $s1, $t2, $s0
  subu $sp, $sp, 4		#alloc -424($fp) for temp91
  li $s3, 1
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -428($fp) for temp89
  lw $s4, 0($s1)
  sub $s3, $s4, $s2
  subu $sp, $sp, 4		#alloc -432($fp) for temp100
  li $s5, 4
  mul $s4, $s5, $s3
  subu $sp, $sp, 4		#alloc -436($fp) for temp101
  add $s5, $t0, $s4
  subu $sp, $sp, 4		#alloc -440($fp) for temp103
  move $s6, $t5
  subu $sp, $sp, 4		#alloc -444($fp) for temp104
  move $s7, $t7
  subu $sp, $sp, 4		#alloc -448($fp) for temp105
  #spill 0
  sw $t0, -392($fp)		#spill
  #spill 1
  sw $t1, -92($fp)		#spill
  li $t1, 4
  mul $t0, $t1, $s7
  subu $sp, $sp, 4		#alloc -452($fp) for temp106
  add $t1, $s6, $t0
  #spill 2
  sw $t2, -396($fp)		#spill
  lw $t2, 0($t1)
  sw $t2, 0($s5)
  subu $sp, $sp, 4		#alloc -456($fp) for temp86
  #spill 3
  sw $t3, -68($fp)		#spill
  #spill 4
  sw $t4, -400($fp)		#spill
  lw $t4, 0($s5)
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -460($fp) for temp109
  #spill 5
  sw $t5, -24($fp)		#spill
  lw $t5, -68($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -464($fp) for temp111
  #spill 6
  sw $t6, -404($fp)		#spill
  #spill 7
  sw $t7, -100($fp)		#spill
  lw $t7, -24($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -468($fp) for temp112
  #spill 8
  sw $t8, -408($fp)		#spill
  #spill 9
  sw $t9, -412($fp)		#spill
  lw $t9, -100($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -472($fp) for temp113
  #spill 0
  sw $t0, -448($fp)		#spill
  #spill 1
  sw $t1, -452($fp)		#spill
  li $t1, 4
  mul $t0, $t1, $t8
  subu $sp, $sp, 4		#alloc -476($fp) for temp114
  add $t1, $t6, $t0
  subu $sp, $sp, 4		#alloc -480($fp) for temp115
  #spill 2
  #spill 3
  sw $t3, -456($fp)		#spill
  li $t3, 4
  #spill 4
  sw $t4, -460($fp)		#spill
  lw $t4, 0($t1)
  mul $t2, $t3, $t4
  subu $sp, $sp, 4		#alloc -484($fp) for temp116
  lw $t4, -460($fp)
  add $t3, $t4, $t2
  subu $sp, $sp, 4		#alloc -488($fp) for temp120
  #spill 5
  sw $t5, -68($fp)		#spill
  #spill 6
  sw $t6, -464($fp)		#spill
  lw $t6, -68($fp)
  move $t5, $t6
  subu $sp, $sp, 4		#alloc -492($fp) for temp122
  #spill 7
  sw $t7, -24($fp)		#spill
  #spill 8
  sw $t8, -468($fp)		#spill
  lw $t8, -24($fp)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -496($fp) for temp123
  #spill 9
  sw $t9, -100($fp)		#spill
  #spill 0
  sw $t0, -472($fp)		#spill
  lw $t0, -100($fp)
  move $t9, $t0
  subu $sp, $sp, 4		#alloc -500($fp) for temp124
  #spill 1
  sw $t1, -476($fp)		#spill
  #spill 2
  sw $t2, -480($fp)		#spill
  li $t2, 4
  mul $t1, $t2, $t9
  subu $sp, $sp, 4		#alloc -504($fp) for temp125
  add $t2, $t7, $t1
  subu $sp, $sp, 4		#alloc -508($fp) for temp126
  #spill 3
  sw $t3, -484($fp)		#spill
  #spill 4
  sw $t4, -460($fp)		#spill
  li $t4, 4
  #spill 5
  sw $t5, -488($fp)		#spill
  lw $t5, 0($t2)
  mul $t3, $t4, $t5
  subu $sp, $sp, 4		#alloc -512($fp) for temp127
  lw $t5, -488($fp)
  add $t4, $t5, $t3
  subu $sp, $sp, 4		#alloc -516($fp) for temp119
  #spill 6
  sw $t6, -68($fp)		#spill
  #spill 7
  sw $t7, -492($fp)		#spill
  li $t7, 1
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -520($fp) for temp117
  #spill 8
  sw $t8, -24($fp)		#spill
  lw $t8, 0($t4)
  sub $t7, $t8, $t6
  lw $t8, -484($fp)
  sw $t7, 0($t8)
  subu $sp, $sp, 4		#alloc -524($fp) for temp107
  #spill 9
  sw $t9, -496($fp)		#spill
  #spill 0
  sw $t0, -100($fp)		#spill
  lw $t0, 0($t8)
  move $t9, $t0
  subu $sp, $sp, 4		#alloc -528($fp) for temp130
  #spill 1
  sw $t1, -500($fp)		#spill
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -532($fp) for temp131
  #spill 2
  sw $t2, -504($fp)		#spill
  #spill 3
  sw $t3, -508($fp)		#spill
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -536($fp) for temp129
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -540($fp) for temp128
  #spill 4
  sw $t4, -512($fp)		#spill
  move $t4, $t1
  sw $t0, -528($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -532($fp)		#spill
  sw $t3, -536($fp)		#spill
  sw $t4, -540($fp)		#spill
  sw $t5, -488($fp)		#spill
  sw $t6, -516($fp)		#spill
  sw $t7, -520($fp)		#spill
  sw $t8, -484($fp)		#spill
  sw $t9, -524($fp)		#spill
  sw $s0, -416($fp)		#spill
  sw $s1, -420($fp)		#spill
  sw $s2, -424($fp)		#spill
  sw $s3, -428($fp)		#spill
  sw $s4, -432($fp)		#spill
  sw $s5, -436($fp)		#spill
  sw $s6, -440($fp)		#spill
  sw $s7, -444($fp)		#spill
  j label10
label12:
  subu $sp, $sp, 4		#alloc -544($fp) for temp133
  move $t0, $0
  lw $t1, -100($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -548($fp) for temp132
  move $t2, $t1
  sw $t0, -544($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -548($fp)		#spill
label13:
  subu $sp, $sp, 4		#alloc -552($fp) for temp134
  lw $t1, -100($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -556($fp) for temp135
  li $t3, 5
  move $t2, $t3
  sw $t0, -552($fp)		#spill
  sw $t1, -100($fp)		#spill
  sw $t2, -556($fp)		#spill
  lw $t0, -552($fp)
  lw $t1, -556($fp)
  blt $t0, $t1, label14
  sw $t0, -552($fp)		#spill
  sw $t1, -556($fp)		#spill
  j label15
label14:
  subu $sp, $sp, 4		#alloc -560($fp) for temp138
  lw $t1, -92($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -564($fp) for temp139
  lw $t3, -100($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -568($fp) for temp140
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -572($fp) for temp141
  add $t5, $t0, $t4
  lw $t6, 0($t5)
  move $a0, $t6
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -576($fp) for temp144
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -580($fp) for temp145
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -584($fp) for temp143
  add $t9, $t7, $t8
  move $t3, $t9
  subu $sp, $sp, 4		#alloc -588($fp) for temp142
  move $s0, $t3
  sw $t0, -560($fp)		#spill
  sw $t1, -92($fp)		#spill
  sw $t2, -564($fp)		#spill
  sw $t3, -100($fp)		#spill
  sw $t4, -568($fp)		#spill
  sw $t5, -572($fp)		#spill
  sw $t7, -576($fp)		#spill
  sw $t8, -580($fp)		#spill
  sw $t9, -584($fp)		#spill
  sw $s0, -588($fp)		#spill
  j label13
label15:
  subu $sp, $sp, 4		#alloc -592($fp) for temp146
  move $t0, $0
  move $v0, $t0
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra

bubbleSort:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  subu $sp, $sp, 20		#alloc for temp147
  subu $sp, $sp, 4		#alloc -24($fp) for a
  la $t1, -20($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -28($fp) for temp149
  move $t1, $0
  subu $sp, $sp, 4		#alloc -32($fp) for b
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -36($fp) for temp148
  move $t3, $t2
  sw $t0, -24($fp)		#spill
  sw $t1, -28($fp)		#spill
  sw $t2, -32($fp)		#spill
  sw $t3, -36($fp)		#spill
label16:
  subu $sp, $sp, 4		#alloc -40($fp) for temp150
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -44($fp) for temp151
  li $t3, 5
  move $t2, $t3
  sw $t0, -40($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -44($fp)		#spill
  lw $t0, -40($fp)
  lw $t1, -44($fp)
  blt $t0, $t1, label17
  sw $t0, -40($fp)		#spill
  sw $t1, -44($fp)		#spill
  j label18
label17:
  subu $sp, $sp, 4		#alloc -48($fp) for temp154
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -52($fp) for temp155
  lw $t3, -32($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -56($fp) for temp156
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -60($fp) for temp157
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -64($fp) for temp158
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t6, $v0
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -68($fp) for temp152
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -72($fp) for temp161
  move $t8, $t3
  subu $sp, $sp, 4		#alloc -76($fp) for temp162
  li $s0, 1
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -80($fp) for temp160
  add $s0, $t8, $t9
  move $t3, $s0
  subu $sp, $sp, 4		#alloc -84($fp) for temp159
  move $s1, $t3
  sw $t0, -48($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -52($fp)		#spill
  sw $t3, -32($fp)		#spill
  sw $t4, -56($fp)		#spill
  sw $t5, -60($fp)		#spill
  sw $t6, -64($fp)		#spill
  sw $t7, -68($fp)		#spill
  sw $t8, -72($fp)		#spill
  sw $t9, -76($fp)		#spill
  sw $s0, -80($fp)		#spill
  sw $s1, -84($fp)		#spill
  j label16
label18:
  subu $sp, $sp, 4		#alloc -88($fp) for temp164
  li $t1, 1
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -92($fp) for c
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -96($fp) for temp163
  move $t2, $t1
  sw $t0, -88($fp)		#spill
  sw $t1, -92($fp)		#spill
  sw $t2, -96($fp)		#spill
label19:
  subu $sp, $sp, 4		#alloc -100($fp) for temp165
  lw $t1, -92($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -104($fp) for temp166
  li $t3, 1
  move $t2, $t3
  sw $t0, -100($fp)		#spill
  sw $t1, -92($fp)		#spill
  sw $t2, -104($fp)		#spill
  lw $t0, -100($fp)
  lw $t1, -104($fp)
  beq $t0, $t1, label20
  sw $t0, -100($fp)		#spill
  sw $t1, -104($fp)		#spill
  j label21
label20:
  subu $sp, $sp, 4		#alloc -108($fp) for temp168
  move $t0, $0
  lw $t1, -92($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -112($fp) for temp167
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -116($fp) for temp170
  li $t4, 1
  move $t3, $t4
  lw $t4, -32($fp)
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -120($fp) for temp169
  move $t5, $t4
  sw $t0, -108($fp)		#spill
  sw $t1, -92($fp)		#spill
  sw $t2, -112($fp)		#spill
  sw $t3, -116($fp)		#spill
  sw $t4, -32($fp)		#spill
  sw $t5, -120($fp)		#spill
label22:
  subu $sp, $sp, 4		#alloc -124($fp) for temp171
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -128($fp) for temp172
  li $t3, 5
  move $t2, $t3
  sw $t0, -124($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -128($fp)		#spill
  lw $t0, -124($fp)
  lw $t1, -128($fp)
  blt $t0, $t1, label23
  sw $t0, -124($fp)		#spill
  sw $t1, -128($fp)		#spill
  j label24
label23:
  subu $sp, $sp, 4		#alloc -132($fp) for temp175
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -136($fp) for temp176
  lw $t3, -32($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -140($fp) for temp177
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -144($fp) for temp178
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -148($fp) for temp179
  move $t6, $t1
  subu $sp, $sp, 4		#alloc -152($fp) for temp181
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -156($fp) for temp182
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -160($fp) for temp180
  sub $t9, $t7, $t8
  subu $sp, $sp, 4		#alloc -164($fp) for temp183
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -168($fp) for temp184
  add $s1, $t6, $s0
  sw $t0, -132($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -136($fp)		#spill
  sw $t3, -32($fp)		#spill
  sw $t4, -140($fp)		#spill
  sw $t5, -144($fp)		#spill
  sw $t6, -148($fp)		#spill
  sw $t7, -152($fp)		#spill
  sw $t8, -156($fp)		#spill
  sw $t9, -160($fp)		#spill
  sw $s0, -164($fp)		#spill
  sw $s1, -168($fp)		#spill
  lw $t1, -144($fp)
  lw $t0, 0($t1)
  lw $t3, -168($fp)
  lw $t2, 0($t3)
  blt $t0, $t2, label25
  sw $t1, -144($fp)		#spill
  sw $t3, -168($fp)		#spill
  j label26
label25:
  subu $sp, $sp, 4		#alloc -172($fp) for temp186
  li $t1, 1
  move $t0, $t1
  lw $t1, -92($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -176($fp) for temp185
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -180($fp) for temp189
  lw $t4, -24($fp)
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -184($fp) for temp191
  lw $t6, -32($fp)
  move $t5, $t6
  subu $sp, $sp, 4		#alloc -188($fp) for temp192
  li $t8, 1
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -192($fp) for temp190
  sub $t8, $t5, $t7
  subu $sp, $sp, 4		#alloc -196($fp) for temp193
  li $s0, 4
  mul $t9, $s0, $t8
  subu $sp, $sp, 4		#alloc -200($fp) for temp194
  add $s0, $t3, $t9
  subu $sp, $sp, 4		#alloc -204($fp) for tem
  lw $s2, 0($s0)
  move $s1, $s2
  subu $sp, $sp, 4		#alloc -208($fp) for temp187
  move $s2, $s1
  subu $sp, $sp, 4		#alloc -212($fp) for temp197
  move $s3, $t4
  subu $sp, $sp, 4		#alloc -216($fp) for temp199
  move $s4, $t6
  subu $sp, $sp, 4		#alloc -220($fp) for temp200
  li $s6, 1
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -224($fp) for temp198
  sub $s6, $s4, $s5
  subu $sp, $sp, 4		#alloc -228($fp) for temp201
  #spill 0
  sw $t0, -172($fp)		#spill
  li $t0, 4
  mul $s7, $t0, $s6
  subu $sp, $sp, 4		#alloc -232($fp) for temp202
  add $t0, $s3, $s7
  subu $sp, $sp, 4		#alloc -236($fp) for temp204
  #spill 1
  sw $t1, -92($fp)		#spill
  move $t1, $t4
  subu $sp, $sp, 4		#alloc -240($fp) for temp205
  #spill 2
  sw $t2, -176($fp)		#spill
  move $t2, $t6
  subu $sp, $sp, 4		#alloc -244($fp) for temp206
  #spill 3
  sw $t3, -180($fp)		#spill
  #spill 4
  sw $t4, -24($fp)		#spill
  li $t4, 4
  mul $t3, $t4, $t2
  subu $sp, $sp, 4		#alloc -248($fp) for temp207
  add $t4, $t1, $t3
  #spill 5
  sw $t5, -184($fp)		#spill
  lw $t5, 0($t4)
  sw $t5, 0($t0)
  subu $sp, $sp, 4		#alloc -252($fp) for temp195
  #spill 6
  sw $t6, -32($fp)		#spill
  #spill 7
  sw $t7, -188($fp)		#spill
  lw $t7, 0($t0)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -256($fp) for temp210
  #spill 8
  sw $t8, -192($fp)		#spill
  lw $t8, -24($fp)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -260($fp) for temp211
  #spill 9
  sw $t9, -196($fp)		#spill
  #spill 0
  sw $t0, -232($fp)		#spill
  lw $t0, -32($fp)
  move $t9, $t0
  subu $sp, $sp, 4		#alloc -264($fp) for temp212
  #spill 1
  sw $t1, -236($fp)		#spill
  #spill 2
  sw $t2, -240($fp)		#spill
  li $t2, 4
  mul $t1, $t2, $t9
  subu $sp, $sp, 4		#alloc -268($fp) for temp213
  add $t2, $t7, $t1
  subu $sp, $sp, 4		#alloc -272($fp) for temp214
  #spill 3
  sw $t3, -244($fp)		#spill
  move $t3, $s1
  sw $t3, 0($t2)
  subu $sp, $sp, 4		#alloc -276($fp) for temp208
  #spill 4
  sw $t4, -248($fp)		#spill
  #spill 5
  lw $t5, 0($t2)
  move $t4, $t5
  sw $t0, -32($fp)		#spill
  sw $t1, -264($fp)		#spill
  sw $t2, -268($fp)		#spill
  sw $t3, -272($fp)		#spill
  sw $t4, -276($fp)		#spill
  sw $t6, -252($fp)		#spill
  sw $t7, -256($fp)		#spill
  sw $t8, -24($fp)		#spill
  sw $t9, -260($fp)		#spill
  sw $s0, -200($fp)		#spill
  sw $s1, -204($fp)		#spill
  sw $s2, -208($fp)		#spill
  sw $s3, -212($fp)		#spill
  sw $s4, -216($fp)		#spill
  sw $s5, -220($fp)		#spill
  sw $s6, -224($fp)		#spill
  sw $s7, -228($fp)		#spill
label26:
  subu $sp, $sp, 4		#alloc -280($fp) for temp217
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -284($fp) for temp218
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -288($fp) for temp216
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -292($fp) for temp215
  move $t4, $t1
  sw $t0, -280($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -284($fp)		#spill
  sw $t3, -288($fp)		#spill
  sw $t4, -292($fp)		#spill
  j label22
label24:
  j label19
label21:
  subu $sp, $sp, 4		#alloc -296($fp) for temp220
  move $t0, $0
  lw $t1, -32($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -300($fp) for temp219
  move $t2, $t1
  sw $t0, -296($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -300($fp)		#spill
label27:
  subu $sp, $sp, 4		#alloc -304($fp) for temp221
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -308($fp) for temp222
  li $t3, 5
  move $t2, $t3
  sw $t0, -304($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -308($fp)		#spill
  lw $t0, -304($fp)
  lw $t1, -308($fp)
  blt $t0, $t1, label28
  sw $t0, -304($fp)		#spill
  sw $t1, -308($fp)		#spill
  j label29
label28:
  subu $sp, $sp, 4		#alloc -312($fp) for temp225
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -316($fp) for temp226
  lw $t3, -32($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -320($fp) for temp227
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -324($fp) for temp228
  add $t5, $t0, $t4
  lw $t6, 0($t5)
  move $a0, $t6
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -328($fp) for temp231
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -332($fp) for temp232
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -336($fp) for temp230
  add $t9, $t7, $t8
  move $t3, $t9
  subu $sp, $sp, 4		#alloc -340($fp) for temp229
  move $s0, $t3
  sw $t0, -312($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -316($fp)		#spill
  sw $t3, -32($fp)		#spill
  sw $t4, -320($fp)		#spill
  sw $t5, -324($fp)		#spill
  sw $t7, -328($fp)		#spill
  sw $t8, -332($fp)		#spill
  sw $t9, -336($fp)		#spill
  sw $s0, -340($fp)		#spill
  j label27
label29:
  subu $sp, $sp, 4		#alloc -344($fp) for temp233
  move $t0, $0
  move $v0, $t0
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
  jal countSort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -4($fp) for temp234
  move $t0, $v0
  sw $t0, -4($fp)		#spill
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal bubbleSort
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -8($fp) for temp235
  move $t0, $v0
  subu $sp, $sp, 4		#alloc -12($fp) for temp236
  move $t1, $0
  move $v0, $t1
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
