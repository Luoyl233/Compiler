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
addi $sp, $sp, -4
li $t1, 1
move $t0, $t1
addi $sp, $sp, -4
li $t3, 2
move $t2, $t3
addi $sp, $sp, -4
add $t4, $t0, $t2
move $a0, $t4
addi $sp, $sp, -4
sw $ra, 0($sp)
jal write
lw $ra, 0($sp)
addi $sp, $sp, 4
li $t5, 0
move $v0, $t5
addi, $sp, $fp, 0
lw $ra, 4($sp)
lw $fp, 0($sp)
addi $sp, $sp, 8
jr $ra
