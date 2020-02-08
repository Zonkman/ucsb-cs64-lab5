# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	.align 4
	arr: .word 1 2 3 4 5 6 7 8 9 10
	alength: .word 10
	msg_content: .asciiz "The contents of the array are:\n"
	newline: .asciiz "\n"

.text
printA:
	#iterator
	add $t0, $zero, $zero
	#limit
	lw $t1, alength($zero)
	sll $t1, $t1, 2
printA_loop:
	lw $a0, arr($t0)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	addiu $t0, $t0, 4
	sltu $t3, $t0, $t1
	bne $t3, $zero, printA_loop

	jr $ra

main:
	li $v0, 4
	la $a0, msg_content
	syscall

	jal printA

exit:
	li $v0, 10
	syscall

