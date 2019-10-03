.data
n: .word 153
yes: .asciiz "yes"
no: .asciiz "no"
.text

main:
	lw $t0,n
	move $t7,$t0
	addi $t1,$zero,10
	add $t4,$zero,$zero			
	add $t6,$zero,$zero

check:
	div $t0,$t1            
	mflo $t0              
	mfhi $t3              
	mul $t5,$t3,$t3
	mul $t5,$t5,$t3
	add $t6,$t5,$t6
	bne $t0,$zero,check   

end:
	li $v0,1
	move $a0,$t7
	syscall

	li $v0,4
	beq $t6,$t7,pass
	la $a0,no
	syscall
	j pass2
pass:
	la $a0,yes
	syscall
pass2:
	li $v0,10
	syscall