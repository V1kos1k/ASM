PUBLIC	input
EXTRN	vvodChisla:BYTE

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
input	PROC	NEAR
		PUSH	BX						
		PUSH	DX						
		PUSH	SI						
		MOV		AX,0
		MOV		BX,0

		MOV		AH,9
		MOV		DX,OFFSET vvodChisla		
		INT		21h
		MOV		DX,0   				

INPUT_LOOP:
		MOV		AH,1
		INT		21h

		CMP		AL,13
		JE		WHILE_NOT_ENTER

		CMP		AL,2Dh 
		JNE		NOT_MINUS
		MOV		SI,1
		JMP		INPUT_LOOP

NOT_MINUS:
		PUSH	AX
		MOV		AX,BX
		MOV		BX,10
		MUL		BX
		POP		BX
		SUB		BL,'0'
		MOV		BH,0
		ADD		BX,AX	
		JMP		INPUT_LOOP

WHILE_NOT_ENTER:
		MOV	AX,BX
		CMP	SI,1
		JNE	EXIT
		NEG	AX

EXIT:
		POP		SI
		POP		DX
		POP		BX
		RET

input	ENDP
Code	ENDS
END
