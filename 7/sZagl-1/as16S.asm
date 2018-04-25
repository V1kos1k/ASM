PUBLIC	as16S
EXTRN	NewLine:NEAR
EXTRN	as16:NEAR

Code	SEGMENT	PUBLIC
	ASSUME CS:Code
as16S	PROC	NEAR
	PUSH	BP
	MOV		BP,SP
	PUSH	AX

	MOV		AX,[BP+4]						
	CMP		AX,0
	JGE		LO16S_SkipMinus			

	PUSH	AX

	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO16S_SkipMinus:
	PUSH	AX
	CALL	as16

	POP		AX
	POP		BP
	RET		2
as16S	ENDP
Code	ENDS

END
