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

main:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  subu $sp, $sp, 32		#alloc for temp1
  subu $sp, $sp, 4		#alloc -36($fp) for place
  la $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 32		#alloc for temp2
  subu $sp, $sp, 4		#alloc -72($fp) for row
  la $t2, -68($fp)
  move $t1, $t2
  subu $sp, $sp, 32		#alloc for temp3
  subu $sp, $sp, 4		#alloc -108($fp) for ldiag
  la $t3, -104($fp)
  move $t2, $t3
  subu $sp, $sp, 32		#alloc for temp4
  subu $sp, $sp, 4		#alloc -144($fp) for rdiag
  la $t4, -140($fp)
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -148($fp) for temp6
  move $t4, $0
  subu $sp, $sp, 4		#alloc -152($fp) for count
  move $t5, $t4
  subu $sp, $sp, 4		#alloc -156($fp) for temp5
  move $t6, $t5
  subu $sp, $sp, 4		#alloc -160($fp) for temp8
  move $t7, $0
  subu $sp, $sp, 4		#alloc -164($fp) for i
  move $t8, $t7
  subu $sp, $sp, 4		#alloc -168($fp) for temp7
  move $t9, $t8
  subu $sp, $sp, 4		#alloc -172($fp) for temp10
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $s0, $v0
  subu $sp, $sp, 4		#alloc -176($fp) for n
  move $s1, $s0
  subu $sp, $sp, 4		#alloc -180($fp) for temp9
  move $s2, $s1
  sw $t0, -36($fp)		#spill
  sw $t1, -72($fp)		#spill
  sw $t2, -108($fp)		#spill
  sw $t3, -144($fp)		#spill
  sw $t4, -148($fp)		#spill
  sw $t5, -152($fp)		#spill
  sw $t6, -156($fp)		#spill
  sw $t7, -160($fp)		#spill
  sw $t8, -164($fp)		#spill
  sw $t9, -168($fp)		#spill
  sw $s0, -172($fp)		#spill
  sw $s1, -176($fp)		#spill
  sw $s2, -180($fp)		#spill
label1:
  subu $sp, $sp, 4		#alloc -184($fp) for temp11
  lw $t1, -164($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -188($fp) for temp12
  lw $t3, -176($fp)
  move $t2, $t3
  sw $t0, -184($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -188($fp)		#spill
  sw $t3, -176($fp)		#spill
  lw $t0, -184($fp)
  lw $t1, -188($fp)
  blt $t0, $t1, label2
  sw $t0, -184($fp)		#spill
  sw $t1, -188($fp)		#spill
  j label3
label2:
  subu $sp, $sp, 4		#alloc -192($fp) for temp15
  lw $t1, -36($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -196($fp) for temp16
  lw $t3, -164($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -200($fp) for temp17
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -204($fp) for temp18
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -208($fp) for temp20
  li $t7, 1
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -212($fp) for temp19
  sub $t7, $0, $t6
  sw $t7, 0($t5)
  subu $sp, $sp, 4		#alloc -216($fp) for temp13
  lw $t9, 0($t5)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -220($fp) for temp23
  move $t9, $t3
  subu $sp, $sp, 4		#alloc -224($fp) for temp24
  li $s1, 1
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -228($fp) for temp22
  add $s1, $t9, $s0
  move $t3, $s1
  subu $sp, $sp, 4		#alloc -232($fp) for temp21
  move $s2, $t3
  sw $t0, -192($fp)		#spill
  sw $t1, -36($fp)		#spill
  sw $t2, -196($fp)		#spill
  sw $t3, -164($fp)		#spill
  sw $t4, -200($fp)		#spill
  sw $t5, -204($fp)		#spill
  sw $t6, -208($fp)		#spill
  sw $t7, -212($fp)		#spill
  sw $t8, -216($fp)		#spill
  sw $t9, -220($fp)		#spill
  sw $s0, -224($fp)		#spill
  sw $s1, -228($fp)		#spill
  sw $s2, -232($fp)		#spill
  j label1
label3:
  subu $sp, $sp, 4		#alloc -236($fp) for temp26
  move $t0, $0
  lw $t1, -164($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -240($fp) for temp25
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -244($fp) for temp28
  li $t4, 1
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -248($fp) for cont
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -252($fp) for temp27
  move $t5, $t4
  sw $t0, -236($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -240($fp)		#spill
  sw $t3, -244($fp)		#spill
  sw $t4, -248($fp)		#spill
  sw $t5, -252($fp)		#spill
label4:
  subu $sp, $sp, 4		#alloc -256($fp) for temp29
  lw $t1, -248($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -260($fp) for temp30
  li $t3, 1
  move $t2, $t3
  sw $t0, -256($fp)		#spill
  sw $t1, -248($fp)		#spill
  sw $t2, -260($fp)		#spill
  lw $t0, -256($fp)
  lw $t1, -260($fp)
  beq $t0, $t1, label5
  sw $t0, -256($fp)		#spill
  sw $t1, -260($fp)		#spill
  j label6
label5:
  subu $sp, $sp, 4		#alloc -264($fp) for temp31
  lw $t1, -164($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -268($fp) for temp32
  lw $t3, -176($fp)
  move $t2, $t3
  sw $t0, -264($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -268($fp)		#spill
  sw $t3, -176($fp)		#spill
  lw $t0, -264($fp)
  lw $t1, -268($fp)
  beq $t0, $t1, label7
  sw $t0, -264($fp)		#spill
  sw $t1, -268($fp)		#spill
  j label8
label7:
  subu $sp, $sp, 4		#alloc -272($fp) for temp34
  li $t1, 1
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -276($fp) for valid
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -280($fp) for temp33
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -284($fp) for temp36
  move $t3, $0
  subu $sp, $sp, 4		#alloc -288($fp) for j
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -292($fp) for temp35
  move $t5, $t4
  sw $t0, -272($fp)		#spill
  sw $t1, -276($fp)		#spill
  sw $t2, -280($fp)		#spill
  sw $t3, -284($fp)		#spill
  sw $t4, -288($fp)		#spill
  sw $t5, -292($fp)		#spill
label10:
  subu $sp, $sp, 4		#alloc -296($fp) for temp37
  lw $t1, -288($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -300($fp) for temp38
  lw $t3, -176($fp)
  move $t2, $t3
  sw $t0, -296($fp)		#spill
  sw $t1, -288($fp)		#spill
  sw $t2, -300($fp)		#spill
  sw $t3, -176($fp)		#spill
  lw $t0, -296($fp)
  lw $t1, -300($fp)
  blt $t0, $t1, label11
  sw $t0, -296($fp)		#spill
  sw $t1, -300($fp)		#spill
  j label12
label11:
  subu $sp, $sp, 4		#alloc -304($fp) for temp41
  lw $t1, -72($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -308($fp) for temp42
  lw $t3, -288($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -312($fp) for temp43
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -316($fp) for temp44
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -320($fp) for temp45
  li $t7, 1
  move $t6, $t7
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -324($fp) for temp39
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -328($fp) for temp48
  lw $t9, -108($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -332($fp) for temp49
  move $s0, $t3
  subu $sp, $sp, 4		#alloc -336($fp) for temp50
  li $s2, 4
  mul $s1, $s2, $s0
  subu $sp, $sp, 4		#alloc -340($fp) for temp51
  add $s2, $t8, $s1
  subu $sp, $sp, 4		#alloc -344($fp) for temp52
  li $s4, 1
  move $s3, $s4
  sw $s3, 0($s2)
  subu $sp, $sp, 4		#alloc -348($fp) for temp46
  lw $s5, 0($s2)
  move $s4, $s5
  subu $sp, $sp, 4		#alloc -352($fp) for temp55
  lw $s6, -144($fp)
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -356($fp) for temp56
  move $s7, $t3
  subu $sp, $sp, 4		#alloc -360($fp) for temp57
  #spill 0
  sw $t0, -304($fp)		#spill
  #spill 1
  sw $t1, -72($fp)		#spill
  li $t1, 4
  mul $t0, $t1, $s7
  subu $sp, $sp, 4		#alloc -364($fp) for temp58
  add $t1, $s5, $t0
  subu $sp, $sp, 4		#alloc -368($fp) for temp59
  #spill 2
  sw $t2, -308($fp)		#spill
  #spill 3
  sw $t3, -288($fp)		#spill
  li $t3, 1
  move $t2, $t3
  sw $t2, 0($t1)
  subu $sp, $sp, 4		#alloc -372($fp) for temp53
  #spill 4
  sw $t4, -312($fp)		#spill
  lw $t4, 0($t1)
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -376($fp) for temp62
  #spill 5
  sw $t5, -316($fp)		#spill
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -380($fp) for temp63
  #spill 6
  sw $t6, -320($fp)		#spill
  #spill 7
  sw $t7, -324($fp)		#spill
  li $t7, 1
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -384($fp) for temp61
  add $t7, $t4, $t6
  move $t5, $t7
  subu $sp, $sp, 4		#alloc -388($fp) for temp60
  #spill 8
  sw $t8, -328($fp)		#spill
  move $t8, $t5
  sw $t0, -360($fp)		#spill
  sw $t1, -364($fp)		#spill
  sw $t2, -368($fp)		#spill
  sw $t3, -372($fp)		#spill
  sw $t4, -376($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -380($fp)		#spill
  sw $t7, -384($fp)		#spill
  sw $t8, -388($fp)		#spill
  sw $t9, -108($fp)		#spill
  sw $s0, -332($fp)		#spill
  sw $s1, -336($fp)		#spill
  sw $s2, -340($fp)		#spill
  sw $s3, -344($fp)		#spill
  sw $s4, -348($fp)		#spill
  sw $s5, -352($fp)		#spill
  sw $s6, -144($fp)		#spill
  sw $s7, -356($fp)		#spill
  j label10
label12:
  subu $sp, $sp, 4		#alloc -392($fp) for temp65
  move $t0, $0
  lw $t1, -288($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -396($fp) for temp64
  move $t2, $t1
  sw $t0, -392($fp)		#spill
  sw $t1, -288($fp)		#spill
  sw $t2, -396($fp)		#spill
label13:
  subu $sp, $sp, 4		#alloc -400($fp) for temp66
  lw $t1, -288($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -404($fp) for temp67
  lw $t3, -176($fp)
  move $t2, $t3
  sw $t0, -400($fp)		#spill
  sw $t1, -288($fp)		#spill
  sw $t2, -404($fp)		#spill
  sw $t3, -176($fp)		#spill
  lw $t0, -400($fp)
  lw $t1, -404($fp)
  blt $t0, $t1, label14
  sw $t0, -400($fp)		#spill
  sw $t1, -404($fp)		#spill
  j label15
label14:
  subu $sp, $sp, 4		#alloc -408($fp) for temp70
  lw $t1, -72($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -412($fp) for temp72
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -416($fp) for temp73
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -420($fp) for temp74
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -424($fp) for temp75
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -428($fp) for temp76
  li $t9, 4
  lw $s0, 0($t7)
  mul $t8, $t9, $s0
  subu $sp, $sp, 4		#alloc -432($fp) for temp77
  add $t9, $t0, $t8
  subu $sp, $sp, 4		#alloc -436($fp) for temp69
  li $s1, 1
  move $s0, $s1
  sw $t0, -408($fp)		#spill
  sw $t1, -72($fp)		#spill
  sw $t2, -412($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -416($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -420($fp)		#spill
  sw $t7, -424($fp)		#spill
  sw $t8, -428($fp)		#spill
  sw $t9, -432($fp)		#spill
  sw $s0, -436($fp)		#spill
  lw $t1, -432($fp)
  lw $t0, 0($t1)
  lw $t2, -436($fp)
  bne $t0, $t2, label16
  sw $t1, -432($fp)		#spill
  sw $t2, -436($fp)		#spill
  j label20
label20:
  subu $sp, $sp, 4		#alloc -440($fp) for temp80
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -444($fp) for temp82
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -448($fp) for temp83
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -452($fp) for temp84
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -456($fp) for temp85
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -460($fp) for temp86
  li $t9, 4
  lw $s0, 0($t7)
  mul $t8, $t9, $s0
  subu $sp, $sp, 4		#alloc -464($fp) for temp87
  add $t9, $t0, $t8
  subu $sp, $sp, 4		#alloc -468($fp) for temp79
  li $s1, 1
  move $s0, $s1
  sw $t0, -440($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -444($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -448($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -452($fp)		#spill
  sw $t7, -456($fp)		#spill
  sw $t8, -460($fp)		#spill
  sw $t9, -464($fp)		#spill
  sw $s0, -468($fp)		#spill
  lw $t1, -464($fp)
  lw $t0, 0($t1)
  lw $t2, -468($fp)
  bne $t0, $t2, label16
  sw $t1, -464($fp)		#spill
  sw $t2, -468($fp)		#spill
  j label19
label19:
  subu $sp, $sp, 4		#alloc -472($fp) for temp90
  lw $t1, -144($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -476($fp) for temp92
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -480($fp) for temp93
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -484($fp) for temp94
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -488($fp) for temp95
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -492($fp) for temp96
  li $t9, 4
  lw $s0, 0($t7)
  mul $t8, $t9, $s0
  subu $sp, $sp, 4		#alloc -496($fp) for temp97
  add $t9, $t0, $t8
  subu $sp, $sp, 4		#alloc -500($fp) for temp89
  li $s1, 1
  move $s0, $s1
  sw $t0, -472($fp)		#spill
  sw $t1, -144($fp)		#spill
  sw $t2, -476($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -480($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -484($fp)		#spill
  sw $t7, -488($fp)		#spill
  sw $t8, -492($fp)		#spill
  sw $t9, -496($fp)		#spill
  sw $s0, -500($fp)		#spill
  lw $t1, -496($fp)
  lw $t0, 0($t1)
  lw $t2, -500($fp)
  bne $t0, $t2, label16
  sw $t1, -496($fp)		#spill
  sw $t2, -500($fp)		#spill
  j label17
label16:
  subu $sp, $sp, 4		#alloc -504($fp) for temp99
  move $t0, $0
  lw $t1, -276($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -508($fp) for temp98
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -512($fp) for temp101
  lw $t4, -176($fp)
  move $t3, $t4
  lw $t5, -288($fp)
  move $t5, $t3
  subu $sp, $sp, 4		#alloc -516($fp) for temp100
  move $t6, $t5
  sw $t0, -504($fp)		#spill
  sw $t1, -276($fp)		#spill
  sw $t2, -508($fp)		#spill
  sw $t3, -512($fp)		#spill
  sw $t4, -176($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -516($fp)		#spill
  j label18
label17:
  subu $sp, $sp, 4		#alloc -520($fp) for temp104
  lw $t1, -72($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -524($fp) for temp106
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -528($fp) for temp107
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -532($fp) for temp108
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -536($fp) for temp109
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -540($fp) for temp110
  li $t9, 4
  lw $s0, 0($t7)
  mul $t8, $t9, $s0
  subu $sp, $sp, 4		#alloc -544($fp) for temp111
  add $t9, $t0, $t8
  subu $sp, $sp, 4		#alloc -548($fp) for temp112
  move $s0, $0
  sw $s0, 0($t9)
  subu $sp, $sp, 4		#alloc -552($fp) for temp102
  lw $s2, 0($t9)
  move $s1, $s2
  subu $sp, $sp, 4		#alloc -556($fp) for temp114
  move $s2, $0
  subu $sp, $sp, 4		#alloc -560($fp) for k
  move $s3, $s2
  subu $sp, $sp, 4		#alloc -564($fp) for temp113
  move $s4, $s3
  sw $t0, -520($fp)		#spill
  sw $t1, -72($fp)		#spill
  sw $t2, -524($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -528($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -532($fp)		#spill
  sw $t7, -536($fp)		#spill
  sw $t8, -540($fp)		#spill
  sw $t9, -544($fp)		#spill
  sw $s0, -548($fp)		#spill
  sw $s1, -552($fp)		#spill
  sw $s2, -556($fp)		#spill
  sw $s3, -560($fp)		#spill
  sw $s4, -564($fp)		#spill
label21:
  subu $sp, $sp, 4		#alloc -568($fp) for temp115
  lw $t1, -560($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -572($fp) for temp117
  lw $t3, -176($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -576($fp) for temp118
  li $t5, 1
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -580($fp) for temp116
  sub $t5, $t2, $t4
  sw $t0, -568($fp)		#spill
  sw $t1, -560($fp)		#spill
  sw $t2, -572($fp)		#spill
  sw $t3, -176($fp)		#spill
  sw $t4, -576($fp)		#spill
  sw $t5, -580($fp)		#spill
  lw $t0, -568($fp)
  lw $t1, -580($fp)
  blt $t0, $t1, label22
  sw $t0, -568($fp)		#spill
  sw $t1, -580($fp)		#spill
  j label23
label22:
  subu $sp, $sp, 4		#alloc -584($fp) for temp121
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -588($fp) for temp122
  lw $t3, -560($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -592($fp) for temp123
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -596($fp) for temp124
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -600($fp) for temp126
  move $t6, $t1
  subu $sp, $sp, 4		#alloc -604($fp) for temp128
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -608($fp) for temp129
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -612($fp) for temp127
  add $t9, $t7, $t8
  subu $sp, $sp, 4		#alloc -616($fp) for temp130
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -620($fp) for temp131
  add $s1, $t6, $s0
  lw $s2, 0($s1)
  sw $s2, 0($t5)
  subu $sp, $sp, 4		#alloc -624($fp) for temp119
  lw $s4, 0($t5)
  move $s3, $s4
  subu $sp, $sp, 4		#alloc -628($fp) for temp134
  move $s4, $t3
  subu $sp, $sp, 4		#alloc -632($fp) for temp135
  li $s6, 1
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -636($fp) for temp133
  add $s6, $s4, $s5
  move $t3, $s6
  subu $sp, $sp, 4		#alloc -640($fp) for temp132
  move $s7, $t3
  sw $t0, -584($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -588($fp)		#spill
  sw $t3, -560($fp)		#spill
  sw $t4, -592($fp)		#spill
  sw $t5, -596($fp)		#spill
  sw $t6, -600($fp)		#spill
  sw $t7, -604($fp)		#spill
  sw $t8, -608($fp)		#spill
  sw $t9, -612($fp)		#spill
  sw $s0, -616($fp)		#spill
  sw $s1, -620($fp)		#spill
  sw $s3, -624($fp)		#spill
  sw $s4, -628($fp)		#spill
  sw $s5, -632($fp)		#spill
  sw $s6, -636($fp)		#spill
  sw $s7, -640($fp)		#spill
  j label21
label23:
  subu $sp, $sp, 4		#alloc -644($fp) for temp138
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -648($fp) for temp140
  lw $t3, -176($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -652($fp) for temp141
  li $t5, 1
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -656($fp) for temp139
  sub $t5, $t2, $t4
  subu $sp, $sp, 4		#alloc -660($fp) for temp142
  li $t7, 4
  mul $t6, $t7, $t5
  subu $sp, $sp, 4		#alloc -664($fp) for temp143
  add $t7, $t0, $t6
  subu $sp, $sp, 4		#alloc -668($fp) for temp144
  li $t9, 1
  move $t8, $t9
  sw $t8, 0($t7)
  subu $sp, $sp, 4		#alloc -672($fp) for temp136
  lw $s0, 0($t7)
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -676($fp) for temp147
  lw $s1, -36($fp)
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -680($fp) for temp148
  lw $s3, -288($fp)
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -684($fp) for temp149
  li $s5, 4
  mul $s4, $s5, $s2
  subu $sp, $sp, 4		#alloc -688($fp) for temp150
  add $s5, $s0, $s4
  subu $sp, $sp, 4		#alloc -692($fp) for temp146
  move $s6, $0
  sw $t0, -644($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -648($fp)		#spill
  sw $t3, -176($fp)		#spill
  sw $t4, -652($fp)		#spill
  sw $t5, -656($fp)		#spill
  sw $t6, -660($fp)		#spill
  sw $t7, -664($fp)		#spill
  sw $t8, -668($fp)		#spill
  sw $t9, -672($fp)		#spill
  sw $s0, -676($fp)		#spill
  sw $s1, -36($fp)		#spill
  sw $s2, -680($fp)		#spill
  sw $s3, -288($fp)		#spill
  sw $s4, -684($fp)		#spill
  sw $s5, -688($fp)		#spill
  sw $s6, -692($fp)		#spill
  lw $t1, -688($fp)
  lw $t0, 0($t1)
  lw $t2, -692($fp)
  bne $t0, $t2, label24
  sw $t1, -688($fp)		#spill
  sw $t2, -692($fp)		#spill
  j label25
label24:
  subu $sp, $sp, 4		#alloc -696($fp) for temp153
  lw $t1, -108($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -700($fp) for temp157
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -704($fp) for temp158
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -708($fp) for temp159
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -712($fp) for temp160
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -716($fp) for temp156
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -720($fp) for temp154
  lw $s0, 0($t7)
  sub $t9, $s0, $t8
  subu $sp, $sp, 4		#alloc -724($fp) for temp161
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -728($fp) for temp162
  add $s1, $t0, $s0
  subu $sp, $sp, 4		#alloc -732($fp) for temp163
  move $s2, $0
  sw $s2, 0($s1)
  subu $sp, $sp, 4		#alloc -736($fp) for temp151
  lw $s4, 0($s1)
  move $s3, $s4
  sw $t0, -696($fp)		#spill
  sw $t1, -108($fp)		#spill
  sw $t2, -700($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -704($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -708($fp)		#spill
  sw $t7, -712($fp)		#spill
  sw $t8, -716($fp)		#spill
  sw $t9, -720($fp)		#spill
  sw $s0, -724($fp)		#spill
  sw $s1, -728($fp)		#spill
  sw $s2, -732($fp)		#spill
  sw $s3, -736($fp)		#spill
label25:
  subu $sp, $sp, 4		#alloc -740($fp) for temp166
  lw $t1, -176($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -744($fp) for temp167
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -748($fp) for temp165
  sub $t3, $t0, $t2
  lw $t4, -560($fp)
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -752($fp) for temp164
  move $t5, $t4
  sw $t0, -740($fp)		#spill
  sw $t1, -176($fp)		#spill
  sw $t2, -744($fp)		#spill
  sw $t3, -748($fp)		#spill
  sw $t4, -560($fp)		#spill
  sw $t5, -752($fp)		#spill
label26:
  subu $sp, $sp, 4		#alloc -756($fp) for temp168
  lw $t1, -560($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -760($fp) for temp169
  move $t2, $0
  sw $t0, -756($fp)		#spill
  sw $t1, -560($fp)		#spill
  sw $t2, -760($fp)		#spill
  lw $t0, -756($fp)
  lw $t1, -760($fp)
  bgt $t0, $t1, label27
  sw $t0, -756($fp)		#spill
  sw $t1, -760($fp)		#spill
  j label28
label27:
  subu $sp, $sp, 4		#alloc -764($fp) for temp172
  lw $t1, -144($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -768($fp) for temp173
  lw $t3, -560($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -772($fp) for temp174
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -776($fp) for temp175
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -780($fp) for temp177
  move $t6, $t1
  subu $sp, $sp, 4		#alloc -784($fp) for temp179
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -788($fp) for temp180
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -792($fp) for temp178
  sub $t9, $t7, $t8
  subu $sp, $sp, 4		#alloc -796($fp) for temp181
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -800($fp) for temp182
  add $s1, $t6, $s0
  lw $s2, 0($s1)
  sw $s2, 0($t5)
  subu $sp, $sp, 4		#alloc -804($fp) for temp170
  lw $s4, 0($t5)
  move $s3, $s4
  subu $sp, $sp, 4		#alloc -808($fp) for temp185
  move $s4, $t3
  subu $sp, $sp, 4		#alloc -812($fp) for temp186
  li $s6, 1
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -816($fp) for temp184
  sub $s6, $s4, $s5
  move $t3, $s6
  subu $sp, $sp, 4		#alloc -820($fp) for temp183
  move $s7, $t3
  sw $t0, -764($fp)		#spill
  sw $t1, -144($fp)		#spill
  sw $t2, -768($fp)		#spill
  sw $t3, -560($fp)		#spill
  sw $t4, -772($fp)		#spill
  sw $t5, -776($fp)		#spill
  sw $t6, -780($fp)		#spill
  sw $t7, -784($fp)		#spill
  sw $t8, -788($fp)		#spill
  sw $t9, -792($fp)		#spill
  sw $s0, -796($fp)		#spill
  sw $s1, -800($fp)		#spill
  sw $s3, -804($fp)		#spill
  sw $s4, -808($fp)		#spill
  sw $s5, -812($fp)		#spill
  sw $s6, -816($fp)		#spill
  sw $s7, -820($fp)		#spill
  j label26
label28:
  subu $sp, $sp, 4		#alloc -824($fp) for temp189
  lw $t1, -144($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -828($fp) for temp190
  move $t2, $0
  subu $sp, $sp, 4		#alloc -832($fp) for temp191
  li $t4, 4
  mul $t3, $t4, $t2
  subu $sp, $sp, 4		#alloc -836($fp) for temp192
  add $t4, $t0, $t3
  subu $sp, $sp, 4		#alloc -840($fp) for temp193
  li $t6, 1
  move $t5, $t6
  sw $t5, 0($t4)
  subu $sp, $sp, 4		#alloc -844($fp) for temp187
  lw $t7, 0($t4)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -848($fp) for temp196
  lw $t8, -36($fp)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -852($fp) for temp197
  lw $s0, -288($fp)
  move $t9, $s0
  subu $sp, $sp, 4		#alloc -856($fp) for temp198
  li $s2, 4
  mul $s1, $s2, $t9
  subu $sp, $sp, 4		#alloc -860($fp) for temp199
  add $s2, $t7, $s1
  subu $sp, $sp, 4		#alloc -864($fp) for temp200
  lw $s4, -176($fp)
  move $s3, $s4
  subu $sp, $sp, 4		#alloc -868($fp) for temp201
  li $s6, 1
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -872($fp) for temp195
  sub $s6, $s3, $s5
  sw $t0, -824($fp)		#spill
  sw $t1, -144($fp)		#spill
  sw $t2, -828($fp)		#spill
  sw $t3, -832($fp)		#spill
  sw $t4, -836($fp)		#spill
  sw $t5, -840($fp)		#spill
  sw $t6, -844($fp)		#spill
  sw $t7, -848($fp)		#spill
  sw $t8, -36($fp)		#spill
  sw $t9, -852($fp)		#spill
  sw $s0, -288($fp)		#spill
  sw $s1, -856($fp)		#spill
  sw $s2, -860($fp)		#spill
  sw $s3, -864($fp)		#spill
  sw $s4, -176($fp)		#spill
  sw $s5, -868($fp)		#spill
  sw $s6, -872($fp)		#spill
  lw $t1, -860($fp)
  lw $t0, 0($t1)
  lw $t2, -872($fp)
  bne $t0, $t2, label29
  sw $t1, -860($fp)		#spill
  sw $t2, -872($fp)		#spill
  j label30
label29:
  subu $sp, $sp, 4		#alloc -876($fp) for temp204
  lw $t1, -144($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -880($fp) for temp208
  lw $t3, -36($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -884($fp) for temp209
  lw $t5, -288($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -888($fp) for temp210
  li $t7, 4
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -892($fp) for temp211
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -896($fp) for temp207
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -900($fp) for temp205
  lw $s0, 0($t7)
  add $t9, $s0, $t8
  subu $sp, $sp, 4		#alloc -904($fp) for temp212
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -908($fp) for temp213
  add $s1, $t0, $s0
  subu $sp, $sp, 4		#alloc -912($fp) for temp214
  move $s2, $0
  sw $s2, 0($s1)
  subu $sp, $sp, 4		#alloc -916($fp) for temp202
  lw $s4, 0($s1)
  move $s3, $s4
  sw $t0, -876($fp)		#spill
  sw $t1, -144($fp)		#spill
  sw $t2, -880($fp)		#spill
  sw $t3, -36($fp)		#spill
  sw $t4, -884($fp)		#spill
  sw $t5, -288($fp)		#spill
  sw $t6, -888($fp)		#spill
  sw $t7, -892($fp)		#spill
  sw $t8, -896($fp)		#spill
  sw $t9, -900($fp)		#spill
  sw $s0, -904($fp)		#spill
  sw $s1, -908($fp)		#spill
  sw $s2, -912($fp)		#spill
  sw $s3, -916($fp)		#spill
label30:
  subu $sp, $sp, 4		#alloc -920($fp) for temp217
  lw $t1, -288($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -924($fp) for temp218
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -928($fp) for temp216
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -932($fp) for temp215
  move $t4, $t1
  sw $t0, -920($fp)		#spill
  sw $t1, -288($fp)		#spill
  sw $t2, -924($fp)		#spill
  sw $t3, -928($fp)		#spill
  sw $t4, -932($fp)		#spill
label18:
  j label13
label15:
  subu $sp, $sp, 4		#alloc -936($fp) for temp219
  lw $t1, -276($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -940($fp) for temp220
  li $t3, 1
  move $t2, $t3
  sw $t0, -936($fp)		#spill
  sw $t1, -276($fp)		#spill
  sw $t2, -940($fp)		#spill
  lw $t0, -936($fp)
  lw $t1, -940($fp)
  beq $t0, $t1, label31
  sw $t0, -936($fp)		#spill
  sw $t1, -940($fp)		#spill
  j label32
label31:
  subu $sp, $sp, 4		#alloc -944($fp) for temp223
  lw $t1, -152($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -948($fp) for temp224
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -952($fp) for temp222
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -956($fp) for temp221
  move $t4, $t1
  sw $t0, -944($fp)		#spill
  sw $t1, -152($fp)		#spill
  sw $t2, -948($fp)		#spill
  sw $t3, -952($fp)		#spill
  sw $t4, -956($fp)		#spill
label32:
  subu $sp, $sp, 4		#alloc -960($fp) for temp227
  lw $t1, -164($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -964($fp) for temp228
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -968($fp) for temp226
  sub $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -972($fp) for temp225
  move $t4, $t1
  sw $t0, -960($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -964($fp)		#spill
  sw $t3, -968($fp)		#spill
  sw $t4, -972($fp)		#spill
  j label9
label8:
label33:
  subu $sp, $sp, 4		#alloc -976($fp) for temp229
  lw $t1, -164($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -980($fp) for temp230
  move $t2, $0
  sw $t0, -976($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -980($fp)		#spill
  lw $t0, -976($fp)
  lw $t1, -980($fp)
  bge $t0, $t1, label36
  sw $t0, -976($fp)		#spill
  sw $t1, -980($fp)		#spill
  j label35
label36:
  subu $sp, $sp, 4		#alloc -984($fp) for temp233
  lw $t1, -36($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -988($fp) for temp234
  lw $t3, -164($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -992($fp) for temp235
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -996($fp) for temp236
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -1000($fp) for temp237
  lw $t7, -176($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -1004($fp) for temp238
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -1008($fp) for temp232
  sub $t9, $t6, $t8
  sw $t0, -984($fp)		#spill
  sw $t1, -36($fp)		#spill
  sw $t2, -988($fp)		#spill
  sw $t3, -164($fp)		#spill
  sw $t4, -992($fp)		#spill
  sw $t5, -996($fp)		#spill
  sw $t6, -1000($fp)		#spill
  sw $t7, -176($fp)		#spill
  sw $t8, -1004($fp)		#spill
  sw $t9, -1008($fp)		#spill
  lw $t1, -996($fp)
  lw $t0, 0($t1)
  lw $t2, -1008($fp)
  bge $t0, $t2, label34
  sw $t1, -996($fp)		#spill
  sw $t2, -1008($fp)		#spill
  j label35
label34:
  subu $sp, $sp, 4		#alloc -1012($fp) for temp241
  lw $t1, -36($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1016($fp) for temp242
  lw $t3, -164($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1020($fp) for temp243
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -1024($fp) for temp244
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -1028($fp) for temp246
  li $t7, 1
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -1032($fp) for temp245
  sub $t7, $0, $t6
  sw $t7, 0($t5)
  subu $sp, $sp, 4		#alloc -1036($fp) for temp239
  lw $t9, 0($t5)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -1040($fp) for temp249
  move $t9, $t3
  subu $sp, $sp, 4		#alloc -1044($fp) for temp250
  li $s1, 1
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -1048($fp) for temp248
  sub $s1, $t9, $s0
  move $t3, $s1
  subu $sp, $sp, 4		#alloc -1052($fp) for temp247
  move $s2, $t3
  sw $t0, -1012($fp)		#spill
  sw $t1, -36($fp)		#spill
  sw $t2, -1016($fp)		#spill
  sw $t3, -164($fp)		#spill
  sw $t4, -1020($fp)		#spill
  sw $t5, -1024($fp)		#spill
  sw $t6, -1028($fp)		#spill
  sw $t7, -1032($fp)		#spill
  sw $t8, -1036($fp)		#spill
  sw $t9, -1040($fp)		#spill
  sw $s0, -1044($fp)		#spill
  sw $s1, -1048($fp)		#spill
  sw $s2, -1052($fp)		#spill
  j label33
label35:
  subu $sp, $sp, 4		#alloc -1056($fp) for temp251
  lw $t1, -164($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1060($fp) for temp253
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1064($fp) for temp252
  sub $t3, $0, $t2
  sw $t0, -1056($fp)		#spill
  sw $t1, -164($fp)		#spill
  sw $t2, -1060($fp)		#spill
  sw $t3, -1064($fp)		#spill
  lw $t0, -1056($fp)
  lw $t1, -1064($fp)
  beq $t0, $t1, label37
  sw $t0, -1056($fp)		#spill
  sw $t1, -1064($fp)		#spill
  j label38
label37:
  subu $sp, $sp, 4		#alloc -1068($fp) for temp255
  move $t0, $0
  lw $t1, -248($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -1072($fp) for temp254
  move $t2, $t1
  sw $t0, -1068($fp)		#spill
  sw $t1, -248($fp)		#spill
  sw $t2, -1072($fp)		#spill
  j label39
label38:
  subu $sp, $sp, 4		#alloc -1076($fp) for temp258
  lw $t1, -36($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1080($fp) for temp259
  lw $t3, -164($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1084($fp) for temp260
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -1088($fp) for temp261
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -1092($fp) for temp265
  move $t6, $t1
  subu $sp, $sp, 4		#alloc -1096($fp) for temp266
  move $t7, $t3
  subu $sp, $sp, 4		#alloc -1100($fp) for temp267
  li $t9, 4
  mul $t8, $t9, $t7
  subu $sp, $sp, 4		#alloc -1104($fp) for temp268
  add $t9, $t6, $t8
  subu $sp, $sp, 4		#alloc -1108($fp) for temp264
  li $s1, 1
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -1112($fp) for temp262
  lw $s2, 0($t9)
  add $s1, $s2, $s0
  sw $s1, 0($t5)
  subu $sp, $sp, 4		#alloc -1116($fp) for temp256
  lw $s3, 0($t5)
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -1120($fp) for temp271
  move $s3, $t3
  subu $sp, $sp, 4		#alloc -1124($fp) for temp272
  li $s5, 1
  move $s4, $s5
  subu $sp, $sp, 4		#alloc -1128($fp) for temp270
  add $s5, $s3, $s4
  move $t3, $s5
  subu $sp, $sp, 4		#alloc -1132($fp) for temp269
  move $s6, $t3
  sw $t0, -1076($fp)		#spill
  sw $t1, -36($fp)		#spill
  sw $t2, -1080($fp)		#spill
  sw $t3, -164($fp)		#spill
  sw $t4, -1084($fp)		#spill
  sw $t5, -1088($fp)		#spill
  sw $t6, -1092($fp)		#spill
  sw $t7, -1096($fp)		#spill
  sw $t8, -1100($fp)		#spill
  sw $t9, -1104($fp)		#spill
  sw $s0, -1108($fp)		#spill
  sw $s1, -1112($fp)		#spill
  sw $s2, -1116($fp)		#spill
  sw $s3, -1120($fp)		#spill
  sw $s4, -1124($fp)		#spill
  sw $s5, -1128($fp)		#spill
  sw $s6, -1132($fp)		#spill
label39:
label9:
  j label4
label6:
  subu $sp, $sp, 4		#alloc -1136($fp) for temp274
  lw $t1, -152($fp)
  move $t0, $t1
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -1140($fp) for temp275
  move $t2, $0
  move $v0, $t2
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
