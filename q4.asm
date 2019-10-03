.data
n: .word 299

.text
main:
	lw $t0,n
	addi $t1,$zero,10
	add $t4,$zero,$zero     

sumsquareeven:
	div $t0,$t1             
	mflo $t0                
	mfhi $t3                
	andi $t6,$t3,1
	beq $t6,1,pass
	move $t2,$t3
	mul $t5,$t3,$t2
	add $t4,$t4,$t5		
pass:    
	bne $t0,$zero,sumsquareeven   

exit:
	sw $t4,s
	move $a0,$t4
	li $v0,1
	syscall
	li $v0,10
syscall
