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
	#save $a0...
	move $t4, $a0
	#iterator
	add $t0, $zero, $zero
	#limit
	move $t1, $a1
	sll $t1, $t1, 2

printA_loop:
	add $t2, $t0, $t4
	lw $a0, 0($t2)
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

	la $a0, arr
	lw $a1, alength($zero)

	jal printA

exit:
	li $v0, 10
	syscall

