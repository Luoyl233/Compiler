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
  subu $sp, $sp, 600		#alloc for temp1
  subu $sp, $sp, 4		#alloc -604($fp) for dis
  la $t1, -600($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -608($fp) for temp2
  li $t2, 10
  move $t1, $t2
  subu $sp, $sp, 4		#alloc -612($fp) for d1
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -616($fp) for temp3
  li $t4, 5
  move $t3, $t4
  subu $sp, $sp, 4		#alloc -620($fp) for d2
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -624($fp) for temp4
  li $t6, 3
  move $t5, $t6
  subu $sp, $sp, 4		#alloc -628($fp) for d3
  move $t6, $t5
  subu $sp, $sp, 4		#alloc -632($fp) for temp5
  move $t7, $0
  subu $sp, $sp, 4		#alloc -636($fp) for i
  move $t8, $t7
  subu $sp, $sp, 4		#alloc -640($fp) for temp6
  move $t9, $0
  subu $sp, $sp, 4		#alloc -644($fp) for j
  move $s0, $t9
  subu $sp, $sp, 4		#alloc -648($fp) for temp7
  move $s1, $0
  subu $sp, $sp, 4		#alloc -652($fp) for k
  move $s2, $s1
  subu $sp, $sp, 4		#alloc -656($fp) for temp8
  move $s3, $0
  subu $sp, $sp, 4		#alloc -660($fp) for sum
  move $s4, $s3
  sw $t0, -604($fp)		#spill
  sw $t1, -608($fp)		#spill
  sw $t2, -612($fp)		#spill
  sw $t3, -616($fp)		#spill
  sw $t4, -620($fp)		#spill
  sw $t5, -624($fp)		#spill
  sw $t6, -628($fp)		#spill
  sw $t7, -632($fp)		#spill
  sw $t8, -636($fp)		#spill
  sw $t9, -640($fp)		#spill
  sw $s0, -644($fp)		#spill
  sw $s1, -648($fp)		#spill
  sw $s2, -652($fp)		#spill
  sw $s3, -656($fp)		#spill
  sw $s4, -660($fp)		#spill
label1:
  subu $sp, $sp, 4		#alloc -664($fp) for temp9
  lw $t1, -636($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -668($fp) for temp10
  lw $t3, -612($fp)
  move $t2, $t3
  sw $t0, -664($fp)		#spill
  sw $t1, -636($fp)		#spill
  sw $t2, -668($fp)		#spill
  sw $t3, -612($fp)		#spill
  lw $t0, -664($fp)
  lw $t1, -668($fp)
  blt $t0, $t1, label2
  sw $t0, -664($fp)		#spill
  sw $t1, -668($fp)		#spill
  j label3
label2:
  subu $sp, $sp, 4		#alloc -672($fp) for temp12
  move $t0, $0
  lw $t1, -644($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -676($fp) for temp11
  move $t2, $t1
  sw $t0, -672($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -676($fp)		#spill
label4:
  subu $sp, $sp, 4		#alloc -680($fp) for temp13
  lw $t1, -644($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -684($fp) for temp14
  lw $t3, -620($fp)
  move $t2, $t3
  sw $t0, -680($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -684($fp)		#spill
  sw $t3, -620($fp)		#spill
  lw $t0, -680($fp)
  lw $t1, -684($fp)
  blt $t0, $t1, label5
  sw $t0, -680($fp)		#spill
  sw $t1, -684($fp)		#spill
  j label6
label5:
  subu $sp, $sp, 4		#alloc -688($fp) for temp16
  move $t0, $0
  lw $t1, -652($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -692($fp) for temp15
  move $t2, $t1
  sw $t0, -688($fp)		#spill
  sw $t1, -652($fp)		#spill
  sw $t2, -692($fp)		#spill
label7:
  subu $sp, $sp, 4		#alloc -696($fp) for temp17
  lw $t1, -652($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -700($fp) for temp18
  lw $t3, -628($fp)
  move $t2, $t3
  sw $t0, -696($fp)		#spill
  sw $t1, -652($fp)		#spill
  sw $t2, -700($fp)		#spill
  sw $t3, -628($fp)		#spill
  lw $t0, -696($fp)
  lw $t1, -700($fp)
  blt $t0, $t1, label8
  sw $t0, -696($fp)		#spill
  sw $t1, -700($fp)		#spill
  j label9
label8:
  subu $sp, $sp, 4		#alloc -704($fp) for temp23
  lw $t1, -604($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -708($fp) for temp24
  lw $t3, -636($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -712($fp) for temp25
  li $t5, 60
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -716($fp) for temp22
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -720($fp) for temp26
  lw $t7, -644($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -724($fp) for temp27
  li $t9, 12
  mul $t8, $t9, $t6
  subu $sp, $sp, 4		#alloc -728($fp) for temp21
  add $t9, $t5, $t8
  subu $sp, $sp, 4		#alloc -732($fp) for temp28
  lw $s1, -652($fp)
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -736($fp) for temp29
  li $s3, 4
  mul $s2, $s3, $s0
  subu $sp, $sp, 4		#alloc -740($fp) for temp30
  add $s3, $t9, $s2
  subu $sp, $sp, 4		#alloc -744($fp) for temp36
  move $s4, $t3
  subu $sp, $sp, 4		#alloc -748($fp) for temp37
  lw $s6, -612($fp)
  move $s5, $s6
  subu $sp, $sp, 4		#alloc -752($fp) for temp34
  mul $s7, $s4, $s5
  subu $sp, $sp, 4		#alloc -756($fp) for temp38
  #spill 0
  sw $t0, -704($fp)		#spill
  move $t0, $t7
  subu $sp, $sp, 4		#alloc -760($fp) for temp39
  #spill 1
  sw $t1, -604($fp)		#spill
  #spill 2
  sw $t2, -708($fp)		#spill
  lw $t2, -620($fp)
  move $t1, $t2
  subu $sp, $sp, 4		#alloc -764($fp) for temp35
  #spill 3
  sw $t3, -636($fp)		#spill
  mul $t3, $t0, $t1
  subu $sp, $sp, 4		#alloc -768($fp) for temp32
  #spill 4
  sw $t4, -712($fp)		#spill
  add $t4, $s7, $t3
  subu $sp, $sp, 4		#alloc -772($fp) for temp40
  #spill 5
  sw $t5, -716($fp)		#spill
  #spill 6
  sw $t6, -720($fp)		#spill
  lw $t6, -628($fp)
  move $t5, $t6
  subu $sp, $sp, 4		#alloc -776($fp) for temp42
  #spill 7
  sw $t7, -644($fp)		#spill
  move $t7, $s1
  subu $sp, $sp, 4		#alloc -780($fp) for temp43
  #spill 8
  sw $t8, -724($fp)		#spill
  #spill 9
  sw $t9, -728($fp)		#spill
  li $t9, 1
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -784($fp) for temp41
  add $t9, $t7, $t8
  subu $sp, $sp, 4		#alloc -788($fp) for temp33
  #spill 0
  sw $t0, -756($fp)		#spill
  div $t0, $t5, $t9
  subu $sp, $sp, 4		#alloc -792($fp) for temp31
  #spill 1
  sw $t1, -760($fp)		#spill
  add $t1, $t4, $t0
  sw $t1, 0($s3)
  subu $sp, $sp, 4		#alloc -796($fp) for temp19
  #spill 2
  sw $t2, -620($fp)		#spill
  #spill 3
  sw $t3, -764($fp)		#spill
  lw $t3, 0($s3)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -800($fp) for temp46
  move $t3, $s1
  subu $sp, $sp, 4		#alloc -804($fp) for temp47
  #spill 4
  sw $t4, -768($fp)		#spill
  #spill 5
  sw $t5, -772($fp)		#spill
  li $t5, 1
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -808($fp) for temp45
  add $t5, $t3, $t4
  move $s1, $t5
  subu $sp, $sp, 4		#alloc -812($fp) for temp44
  #spill 6
  sw $t6, -628($fp)		#spill
  move $t6, $s1
  sw $t0, -788($fp)		#spill
  sw $t1, -792($fp)		#spill
  sw $t2, -796($fp)		#spill
  sw $t3, -800($fp)		#spill
  sw $t4, -804($fp)		#spill
  sw $t5, -808($fp)		#spill
  sw $t6, -812($fp)		#spill
  sw $t7, -776($fp)		#spill
  sw $t8, -780($fp)		#spill
  sw $t9, -784($fp)		#spill
  sw $s0, -732($fp)		#spill
  sw $s1, -652($fp)		#spill
  sw $s2, -736($fp)		#spill
  sw $s3, -740($fp)		#spill
  sw $s4, -744($fp)		#spill
  sw $s5, -748($fp)		#spill
  sw $s6, -612($fp)		#spill
  sw $s7, -752($fp)		#spill
  j label7
label9:
  subu $sp, $sp, 4		#alloc -816($fp) for temp50
  lw $t1, -644($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -820($fp) for temp51
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -824($fp) for temp49
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -828($fp) for temp48
  move $t4, $t1
  sw $t0, -816($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -820($fp)		#spill
  sw $t3, -824($fp)		#spill
  sw $t4, -828($fp)		#spill
  j label4
label6:
  subu $sp, $sp, 4		#alloc -832($fp) for temp54
  lw $t1, -636($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -836($fp) for temp55
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -840($fp) for temp53
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -844($fp) for temp52
  move $t4, $t1
  sw $t0, -832($fp)		#spill
  sw $t1, -636($fp)		#spill
  sw $t2, -836($fp)		#spill
  sw $t3, -840($fp)		#spill
  sw $t4, -844($fp)		#spill
  j label1
label3:
  subu $sp, $sp, 4		#alloc -848($fp) for temp57
  move $t0, $0
  lw $t1, -636($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -852($fp) for temp56
  move $t2, $t1
  subu $sp, $sp, 4		#alloc -856($fp) for temp59
  move $t3, $0
  lw $t4, -644($fp)
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -860($fp) for temp58
  move $t5, $t4
  subu $sp, $sp, 4		#alloc -864($fp) for temp61
  move $t6, $0
  lw $t7, -652($fp)
  move $t7, $t6
  subu $sp, $sp, 4		#alloc -868($fp) for temp60
  move $t8, $t7
  sw $t0, -848($fp)		#spill
  sw $t1, -636($fp)		#spill
  sw $t2, -852($fp)		#spill
  sw $t3, -856($fp)		#spill
  sw $t4, -644($fp)		#spill
  sw $t5, -860($fp)		#spill
  sw $t6, -864($fp)		#spill
  sw $t7, -652($fp)		#spill
  sw $t8, -868($fp)		#spill
label10:
  subu $sp, $sp, 4		#alloc -872($fp) for temp62
  lw $t1, -636($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -876($fp) for temp63
  lw $t3, -612($fp)
  move $t2, $t3
  sw $t0, -872($fp)		#spill
  sw $t1, -636($fp)		#spill
  sw $t2, -876($fp)		#spill
  sw $t3, -612($fp)		#spill
  lw $t0, -872($fp)
  lw $t1, -876($fp)
  blt $t0, $t1, label11
  sw $t0, -872($fp)		#spill
  sw $t1, -876($fp)		#spill
  j label12
label11:
  subu $sp, $sp, 4		#alloc -880($fp) for temp65
  move $t0, $0
  lw $t1, -644($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -884($fp) for temp64
  move $t2, $t1
  sw $t0, -880($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -884($fp)		#spill
label13:
  subu $sp, $sp, 4		#alloc -888($fp) for temp66
  lw $t1, -644($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -892($fp) for temp67
  lw $t3, -620($fp)
  move $t2, $t3
  sw $t0, -888($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -892($fp)		#spill
  sw $t3, -620($fp)		#spill
  lw $t0, -888($fp)
  lw $t1, -892($fp)
  blt $t0, $t1, label14
  sw $t0, -888($fp)		#spill
  sw $t1, -892($fp)		#spill
  j label15
label14:
  subu $sp, $sp, 4		#alloc -896($fp) for temp69
  move $t0, $0
  lw $t1, -652($fp)
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -900($fp) for temp68
  move $t2, $t1
  sw $t0, -896($fp)		#spill
  sw $t1, -652($fp)		#spill
  sw $t2, -900($fp)		#spill
label16:
  subu $sp, $sp, 4		#alloc -904($fp) for temp70
  lw $t1, -652($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -908($fp) for temp71
  lw $t3, -628($fp)
  move $t2, $t3
  sw $t0, -904($fp)		#spill
  sw $t1, -652($fp)		#spill
  sw $t2, -908($fp)		#spill
  sw $t3, -628($fp)		#spill
  lw $t0, -904($fp)
  lw $t1, -908($fp)
  blt $t0, $t1, label17
  sw $t0, -904($fp)		#spill
  sw $t1, -908($fp)		#spill
  j label18
label17:
  subu $sp, $sp, 4		#alloc -912($fp) for temp76
  lw $t1, -604($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -916($fp) for temp77
  lw $t3, -636($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -920($fp) for temp78
  li $t5, 60
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -924($fp) for temp75
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -928($fp) for temp79
  lw $t7, -644($fp)
  move $t6, $t7
  subu $sp, $sp, 4		#alloc -932($fp) for temp80
  li $t9, 12
  mul $t8, $t9, $t6
  subu $sp, $sp, 4		#alloc -936($fp) for temp74
  add $t9, $t5, $t8
  subu $sp, $sp, 4		#alloc -940($fp) for temp81
  lw $s1, -652($fp)
  move $s0, $s1
  subu $sp, $sp, 4		#alloc -944($fp) for temp82
  li $s3, 4
  mul $s2, $s3, $s0
  subu $sp, $sp, 4		#alloc -948($fp) for temp83
  add $s3, $t9, $s2
  subu $sp, $sp, 4		#alloc -952($fp) for temp86
  move $s4, $t1
  subu $sp, $sp, 4		#alloc -956($fp) for temp87
  move $s5, $0
  subu $sp, $sp, 4		#alloc -960($fp) for temp88
  li $s7, 60
  mul $s6, $s7, $s5
  subu $sp, $sp, 4		#alloc -964($fp) for temp85
  add $s7, $s4, $s6
  subu $sp, $sp, 4		#alloc -968($fp) for temp89
  #spill 0
  sw $t0, -912($fp)		#spill
  move $t0, $0
  subu $sp, $sp, 4		#alloc -972($fp) for temp90
  #spill 1
  sw $t1, -604($fp)		#spill
  #spill 2
  sw $t2, -916($fp)		#spill
  li $t2, 12
  mul $t1, $t2, $t0
  subu $sp, $sp, 4		#alloc -976($fp) for temp84
  add $t2, $s7, $t1
  subu $sp, $sp, 4		#alloc -980($fp) for temp91
  #spill 3
  sw $t3, -636($fp)		#spill
  move $t3, $0
  subu $sp, $sp, 4		#alloc -984($fp) for temp92
  #spill 4
  sw $t4, -920($fp)		#spill
  #spill 5
  sw $t5, -924($fp)		#spill
  li $t5, 4
  mul $t4, $t5, $t3
  subu $sp, $sp, 4		#alloc -988($fp) for temp93
  add $t5, $t2, $t4
  sw $t0, -968($fp)		#spill
  sw $t1, -972($fp)		#spill
  sw $t2, -976($fp)		#spill
  sw $t3, -980($fp)		#spill
  sw $t4, -984($fp)		#spill
  sw $t5, -988($fp)		#spill
  sw $t6, -928($fp)		#spill
  sw $t7, -644($fp)		#spill
  sw $t8, -932($fp)		#spill
  sw $t9, -936($fp)		#spill
  sw $s0, -940($fp)		#spill
  sw $s1, -652($fp)		#spill
  sw $s2, -944($fp)		#spill
  sw $s3, -948($fp)		#spill
  sw $s4, -952($fp)		#spill
  sw $s5, -956($fp)		#spill
  sw $s6, -960($fp)		#spill
  sw $s7, -964($fp)		#spill
  lw $t1, -948($fp)
  lw $t0, 0($t1)
  lw $t3, -988($fp)
  lw $t2, 0($t3)
  bgt $t0, $t2, label19
  sw $t1, -948($fp)		#spill
  sw $t3, -988($fp)		#spill
  j label20
label19:
  subu $sp, $sp, 4		#alloc -992($fp) for temp96
  lw $t1, -660($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -996($fp) for temp100
  lw $t3, -604($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1000($fp) for temp101
  lw $t5, -636($fp)
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -1004($fp) for temp102
  li $t7, 60
  mul $t6, $t7, $t4
  subu $sp, $sp, 4		#alloc -1008($fp) for temp99
  add $t7, $t2, $t6
  subu $sp, $sp, 4		#alloc -1012($fp) for temp103
  lw $t9, -644($fp)
  move $t8, $t9
  subu $sp, $sp, 4		#alloc -1016($fp) for temp104
  li $s1, 12
  mul $s0, $s1, $t8
  subu $sp, $sp, 4		#alloc -1020($fp) for temp98
  add $s1, $t7, $s0
  subu $sp, $sp, 4		#alloc -1024($fp) for temp105
  lw $s3, -652($fp)
  move $s2, $s3
  subu $sp, $sp, 4		#alloc -1028($fp) for temp106
  li $s5, 4
  mul $s4, $s5, $s2
  subu $sp, $sp, 4		#alloc -1032($fp) for temp107
  add $s5, $s1, $s4
  subu $sp, $sp, 4		#alloc -1036($fp) for temp95
  lw $s7, 0($s5)
  add $s6, $t0, $s7
  move $t1, $s6
  subu $sp, $sp, 4		#alloc -1040($fp) for temp94
  move $s7, $t1
  sw $t0, -992($fp)		#spill
  sw $t1, -660($fp)		#spill
  sw $t2, -996($fp)		#spill
  sw $t3, -604($fp)		#spill
  sw $t4, -1000($fp)		#spill
  sw $t5, -636($fp)		#spill
  sw $t6, -1004($fp)		#spill
  sw $t7, -1008($fp)		#spill
  sw $t8, -1012($fp)		#spill
  sw $t9, -644($fp)		#spill
  sw $s0, -1016($fp)		#spill
  sw $s1, -1020($fp)		#spill
  sw $s2, -1024($fp)		#spill
  sw $s3, -652($fp)		#spill
  sw $s4, -1028($fp)		#spill
  sw $s5, -1032($fp)		#spill
  sw $s6, -1036($fp)		#spill
  sw $s7, -1040($fp)		#spill
label20:
  subu $sp, $sp, 4		#alloc -1044($fp) for temp110
  lw $t1, -652($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1048($fp) for temp111
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1052($fp) for temp109
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -1056($fp) for temp108
  move $t4, $t1
  sw $t0, -1044($fp)		#spill
  sw $t1, -652($fp)		#spill
  sw $t2, -1048($fp)		#spill
  sw $t3, -1052($fp)		#spill
  sw $t4, -1056($fp)		#spill
  j label16
label18:
  subu $sp, $sp, 4		#alloc -1060($fp) for temp114
  lw $t1, -644($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1064($fp) for temp115
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1068($fp) for temp113
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -1072($fp) for temp112
  move $t4, $t1
  sw $t0, -1060($fp)		#spill
  sw $t1, -644($fp)		#spill
  sw $t2, -1064($fp)		#spill
  sw $t3, -1068($fp)		#spill
  sw $t4, -1072($fp)		#spill
  j label13
label15:
  subu $sp, $sp, 4		#alloc -1076($fp) for temp118
  lw $t1, -636($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -1080($fp) for temp119
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -1084($fp) for temp117
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -1088($fp) for temp116
  move $t4, $t1
  sw $t0, -1076($fp)		#spill
  sw $t1, -636($fp)		#spill
  sw $t2, -1080($fp)		#spill
  sw $t3, -1084($fp)		#spill
  sw $t4, -1088($fp)		#spill
  j label10
label12:
  subu $sp, $sp, 4		#alloc -1092($fp) for temp121
  lw $t1, -660($fp)
  move $t0, $t1
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -1096($fp) for temp122
  move $t2, $0
  move $v0, $t2
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
