ldi R16,20
ldi R17,$20

loop1:
	clr R19
	mov R19,R17
	add R16,R19
	inc R19
	rjmp loop1
