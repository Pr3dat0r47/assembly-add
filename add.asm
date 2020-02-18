global _start
	
_start:
	
	;Read first number
	mov eax, 0x3
	mov ebx, 0x1
	mov ecx, INPT
	mov edx, 0x2
	int 80h
	
	;INPT is the buffer holding the value
	mov eax,[INPT]		;when i do this its not the value the user entered its some garbage
	push eax

	;Read the other number
	mov eax, 0x3
	mov ebx, 0x1
	mov ecx, INPT
	mov edx, 0x2
	int 80h

	pop eax			;retrive the 1st number
	add eax,[INPT]		;add the second number to the 1st number
	mov [result],eax	;saves the addition in result
	
	;print character
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, result
	mov edx, 0x2
	int 80h


	
	;Terminate
	mov eax, 0x1
	xor ebx, ebx
	int 0x80


	
section .bss
	INPT: resd 2
	result: resd 4