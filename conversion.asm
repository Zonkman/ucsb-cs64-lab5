# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
	#args
	move $s0, $a0
	move $s1, $a1
	#accumulator
	add $v0, $zero, $zero
	#iterator
	add $t1, $zero, $zero
	#limit
	addi $t2, $zero, 5
conv_loop:
	sll $t3, $s0, 1
	sub $t3, $t3, $s1
	add $v0, $v0, $t3

	slti $t4, $s0, 3
	bne $t4, $zero, conv_loop_later
	addi $s1, $s1, -1
conv_loop_later:
	addi $s0, $s0, 1
	addi $t1, $t1, 1
	bne $t1, $t2, conv_loop

	jr $ra

main:
	addi $a0, $zero, 5
	addi $a1, $zero, 7

	jal conv

	move $a0, $v0
	li $v0, 1
	syscall

exit:
	li $v0, 10
	syscall

