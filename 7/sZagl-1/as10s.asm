PUBLIC	as10S
EXTRN	as10:NEAR

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
as10S	PROC	NEAR

	PUSH	BP							
	MOV		BP,SP
	PUSH	AX

	MOV		AX,[BP+4]					
	CMP		AX,0
	JGE		LO10S_SkipMinus	
	PUSH	AX
	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO10S_SkipMinus:
	PUSH	AX
	CALL	as10

	POP		AX
	POP		BP
	RET		2
as10S	ENDP
Code	ENDS

END
