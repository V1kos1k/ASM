PUBLIC	as2S
EXTRN	as2:NEAR

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
	
as2S	PROC	NEAR
	PUSH	BP			
	MOV		BP,SP
	PUSH	AX

	MOV		AX,[BP+4]			
	CMP		AX,0
	JGE		SkipMinus	
	
	PUSH	AX						
	MOV		AH,2h				
	MOV		DL,'-'
	INT		21h
	POP		AX							
	NEG		AX							

SkipMinus:
	PUSH	AX
	CALL	as2

	POP		AX
	POP		BP
	RET		2
as2S	ENDP
Code	ENDS

END
