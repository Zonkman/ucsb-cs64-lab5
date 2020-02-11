# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	addi $s0, $a0, -5
	sll $v0, $s0, 2

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

routineA:
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)

	sll $s0, $a0, 1   #2*x
	
	sll $s1, $a1, 1   #2*y
	add $s1, $s1, $a1   #3*y

	move $a0, $s1
	jal routineB
	add $s1, $s0, $v0

	addi $a0, $s1, -1
	jal routineB

	#answer already in v0... nothing to do but leave

	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra

main:
	addi $s0, $zero, 5
	addi $s1, $zero, 7

	move $a0, $s0
	move $a1, $s1

	jal routineA

	#this is want you wanted...
	move $s0, $v0

	move $a0, $s0
	li $v0, 1
	syscall

exit:
	li $v0, 10
	syscall

