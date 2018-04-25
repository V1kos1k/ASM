PUBLIC	as2

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
as2	PROC	NEAR
	PUSH	BP					
	MOV		BP,SP
	PUSH	AX
	PUSH	DX
	PUSH	SI

	MOV		AX,[BP+4]		
	MOV		SI,16				

DEL_0:
	MOV		DH,0
	SHL		AX,1				
	JNC		DEC_SI		
	INC		DH
	JMP		PRINT	

DEC_SI:
	DEC		SI				
	JNZ		DEL_0		

GET_1OR0:
	MOV		DH,0
	SHL		AX,1					
	JNC		PRINT   
	INC		DH				

PRINT:
	MOV		DL,'0'
	ADD		DL,DH	
	PUSH	AX				
	MOV		AH,2					
	INT		21h
	POP		AX					
	DEC		SI					
	JNZ		GET_1OR0			

	POP		SI				
	POP		DX
	POP		AX
	POP		BP
	RET		2
as2	ENDP
Code	ENDS

END
