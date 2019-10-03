.data
n: .word 978
.text
main:
	lw $t0,n
	addi $t1,$zero,10
	add $t4,$zero,$zero			

odddigits:
	div $t0,$t1             
	mflo $t0                
	mfhi $t3                
	andi $t4,$t3,1
	beq $t4,0,pass
	move $a0,$t3
	li $v0,1
	syscall
pass:
	bne $t0,$zero,odddigits   

end:
	li $v0,10
	syscall