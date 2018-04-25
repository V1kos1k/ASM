EXTRN	menu:NEAR
EXTRN	input:NEAR
EXTRN	as2:NEAR
EXTRN	as2S:NEAR
EXTRN	as10:NEAR
EXTRN	as10S:NEAR
EXTRN	as16:NEAR
EXTRN	as16S:NEAR

PUBLIC	NewLine, vidRaboti, vvodChisla

Data	SEGMENT	PUBLIC
	Funcs		DW	menu, input, as2, as2S, as10, as10S, as16, as16s
	X			DW	-7
	vidRaboti	DB	'VIBERITE VID RABOTI 0..7: ', '$'
	vvodChisla  DB  'VVEDITE CHISLO:', '$'
	
Data	ENDS

Stack	SEGMENT STACK
	DW	128h DUP (?)
Stack	ENDS

Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data, SS:Stack
	
NewLine	PROC	NEAR
	PUSH	AX
	PUSH	DX
	
	MOV		AH,2
	MOV		DL,10
	INT		21h
	MOV		DL,13
	INT		21h
	
	POP		DX
	POP		AX
	RET
NewLine	ENDP

START:
	MOV		AX,Data
	MOV		DS,AX
	
	CALL	Funcs
	
LOOP_MENU:
	CALL	NewLine	=
	MOV		AH,9
	LEA		DX,vidRaboti
	INT		21h
	
	MOV		AH,1
	INT		21h
	CMP		AL,'7'
	JA		EXIT
	CMP		AL,'0'
	JB		EXIT
	CALL	NewLine
	
	MOV		BL,AL
	SUB		BL,'0'
		
	CMP		BL,1
	JBE		Skip_Push
	PUSH	X
	
Skip_Push:
	ADD BX,BX
	CALL	Funcs[BX]
	LSkip_Pop:
	
	CMP		BL,2
	JNE		LOOP_MENU
	MOV		X,AX		
	
	JMP		LOOP_MENU
	
EXIT:
	MOV		AH,4Ch
	MOV		AL,0
	INT		21h

Code	ENDS
END START