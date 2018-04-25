PUBLIC	as16

Data	SEGMENT	PUBLIC
	simbols	DB	'0123456789ABCDEF'
Data	ENDS

Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data

as16	PROC	NEAR
	PUSH	BP								
	MOV		BP,SP
	PUSH	AX							
	PUSH	DX
	PUSH	BX

	MOV		AX,[BP+4]					
	MOV		BX,16						


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

	MOV		AH,2
	MOV 	DL,8							
	INT 	21h

	POP		AX							

PRINT:
	MOV		DX,0
	DIV		BX						
	PUSH	AX							

	PUSH	BX
	MOV   	BX, OFFSET simbols
	MOV		AL, DL
	XLAT
	MOV		DL, AL
	POP 	BX
	MOV		AH,2
	JMP		ADD_0

ADD_A:
	ADD		DL,'A'
	SUB		DL,10

ADD_0:
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

as16	ENDP
Code	ENDS

END
