PUBLIC	as10

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
as10	PROC	NEAR
	PUSH	BP								
	MOV		BP,SP
	PUSH	AX								
	PUSH	DX
	PUSH	BX

	MOV		AX,[BP+4]
	MOV		BX,10							

	PUSH	AX	

COUNT:
	MOV		DX,0
	DIV		BX						
	PUSH	AX			
	MOV		AH,2					
	MOV		DL,'a'
	INT		21h
	POP		AX					
	CMP		AX,0				
	JNE		COUNT				

	MOV	AH,2
	MOV DL,8								
	INT 21h

	POP		AX							

PRINT:
	MOV		DX,0
	DIV		BX							
	PUSH	AX								
	MOV		AH,2
	ADD		DL,'0'					
	INT		21h
	MOV		DL,8							
	INT		21h
	INT		21h
	POP		AX							
	CMP		AX,0							
	JNE		PRINT					


	POP		BX
	POP		DX
	POP		AX
	POP		BP
	RET		2
as10	ENDP
Code	ENDS

END
