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

swap:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addiu $fp, $sp, 0
  subu $sp, $sp, 4		#alloc -4($fp) for a
  subu $sp, $sp, 4		#alloc -8($fp) for b
  subu $sp, $sp, 4		#alloc -12($fp) for temp1
  move $t0, $a0
  subu $sp, $sp, 4		#alloc -16($fp) for tem
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -20($fp) for temp3
  move $t2, $a1
  move $a0, $t2
  subu $sp, $sp, 4		#alloc -24($fp) for temp2
  move $t3, $a0
  subu $sp, $sp, 4		#alloc -28($fp) for temp5
  move $t4, $t1
  move $a1, $t4
  subu $sp, $sp, 4		#alloc -32($fp) for temp4
  move $t5, $a1
  subu $sp, $sp, 4		#alloc -36($fp) for temp7
  move $t6, $a0
  move $a0, $t6
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -40($fp) for temp9
  move $t7, $a1
  move $a0, $t7
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -44($fp) for temp10
  move $t8, $a0
  move $v0, $t8
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
  subu $sp, $sp, 20		#alloc for temp11
  subu $sp, $sp, 4		#alloc -24($fp) for x
  la $t1, -20($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -28($fp) for temp12
  move $t1, $0
  subu $sp, $sp, 4		#alloc -32($fp) for i
  move $t2, $t1
  sw $t0, -24($fp)		#spill
  sw $t1, -28($fp)		#spill
  sw $t2, -32($fp)		#spill
label1:
  subu $sp, $sp, 4		#alloc -36($fp) for temp13
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -40($fp) for temp14
  li $t3, 5
  move $t2, $t3
  sw $t0, -36($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -40($fp)		#spill
  lw $t0, -36($fp)
  lw $t1, -40($fp)
  blt $t0, $t1, label2
  sw $t0, -36($fp)		#spill
  sw $t1, -40($fp)		#spill
  j label3
label2:
  subu $sp, $sp, 4		#alloc -44($fp) for temp17
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -48($fp) for temp18
  lw $t3, -32($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -52($fp) for temp19
  li $t5, 4
  mul $t4, $t5, $t2
  subu $sp, $sp, 4		#alloc -56($fp) for temp20
  add $t5, $t0, $t4
  subu $sp, $sp, 4		#alloc -60($fp) for temp21
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t6, $v0
  sw $t6, 0($t5)
  subu $sp, $sp, 4		#alloc -64($fp) for temp15
  lw $t8, 0($t5)
  move $t7, $t8
  subu $sp, $sp, 4		#alloc -68($fp) for temp22
  move $t8, $t3
  subu $sp, $sp, 4		#alloc -72($fp) for temp23
  move $t9, $0
  sw $t0, -44($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -48($fp)		#spill
  sw $t3, -32($fp)		#spill
  sw $t4, -52($fp)		#spill
  sw $t5, -56($fp)		#spill
  sw $t6, -60($fp)		#spill
  sw $t7, -64($fp)		#spill
  sw $t8, -68($fp)		#spill
  sw $t9, -72($fp)		#spill
  lw $t0, -68($fp)
  lw $t1, -72($fp)
  bgt $t0, $t1, label4
  sw $t0, -68($fp)		#spill
  sw $t1, -72($fp)		#spill
  j label5
label4:
  subu $sp, $sp, 4		#alloc -76($fp) for temp26
  lw $t1, -24($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -80($fp) for temp28
  lw $t3, -32($fp)
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -84($fp) for temp29
  li $t5, 1
  move $t4, $t5
  subu $sp, $sp, 4		#alloc -88($fp) for temp27
  sub $t5, $t2, $t4
  subu $sp, $sp, 4		#alloc -92($fp) for temp30
  li $t7, 4
  mul $t6, $t7, $t5
  subu $sp, $sp, 4		#alloc -96($fp) for temp31
  add $t7, $t0, $t6
  subu $sp, $sp, 4		#alloc -100($fp) for temp33
  move $t8, $t1
  subu $sp, $sp, 4		#alloc -104($fp) for temp34
  move $t9, $t3
  subu $sp, $sp, 4		#alloc -108($fp) for temp35
  li $s1, 4
  mul $s0, $s1, $t9
  subu $sp, $sp, 4		#alloc -112($fp) for temp36
  add $s1, $t8, $s0
  lw $s2, 0($t7)
  move $a0, $s2
  lw $s3, 0($s1)
  move $a1, $s3
  sw $t0, -76($fp)		#spill
  sw $t1, -24($fp)		#spill
  sw $t2, -80($fp)		#spill
  sw $t3, -32($fp)		#spill
  sw $t4, -84($fp)		#spill
  sw $t5, -88($fp)		#spill
  sw $t6, -92($fp)		#spill
  sw $t7, -96($fp)		#spill
  sw $t8, -100($fp)		#spill
  sw $t9, -104($fp)		#spill
  sw $s0, -108($fp)		#spill
  sw $s1, -112($fp)		#spill
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal swap
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -116($fp) for temp24
  move $t0, $v0
  sw $t0, -116($fp)		#spill
label5:
  subu $sp, $sp, 4		#alloc -120($fp) for temp39
  lw $t1, -32($fp)
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -124($fp) for temp40
  li $t3, 1
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -128($fp) for temp38
  add $t3, $t0, $t2
  move $t1, $t3
  subu $sp, $sp, 4		#alloc -132($fp) for temp37
  move $t4, $t1
  sw $t0, -120($fp)		#spill
  sw $t1, -32($fp)		#spill
  sw $t2, -124($fp)		#spill
  sw $t3, -128($fp)		#spill
  sw $t4, -132($fp)		#spill
  j label1
label3:
  subu $sp, $sp, 4		#alloc -136($fp) for temp41
  move $t0, $0
  move $v0, $t0
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
