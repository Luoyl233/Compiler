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
  subu $sp, $sp, 4		#alloc -4($fp) for temp1
  li $t1, 2
  move $t0, $t1
  subu $sp, $sp, 4		#alloc -8($fp) for i
  move $t1, $t0
  subu $sp, $sp, 4		#alloc -12($fp) for temp2
  li $t3, 4
  move $t2, $t3
  subu $sp, $sp, 4		#alloc -16($fp) for j
  move $t3, $t2
  subu $sp, $sp, 4		#alloc -20($fp) for temp4
  move $t4, $t3
  subu $sp, $sp, 4		#alloc -24($fp) for temp5
  move $t5, $t1
  subu $sp, $sp, 4		#alloc -28($fp) for temp3
  div $t6, $t4, $t5
  subu $sp, $sp, 4		#alloc -32($fp) for n
  move $t7, $t6
  subu $sp, $sp, 4		#alloc -36($fp) for temp7
  move $t8, $t7
  move $a0, $t8
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  subu $sp, $sp, 4		#alloc -40($fp) for temp8
  move $t9, $0
  move $v0, $t9
  addi, $sp, $fp, 0
  lw $ra, 4($sp)
  lw $fp, 0($sp)
  addi $sp, $sp, 8
  jr $ra
