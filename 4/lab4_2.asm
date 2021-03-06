SSEG	SEGMENT PARA STACK 'STACK'
	DB	200h dup (?)
SSEG	ENDS

DSEG	SEGMENT PARA PUBLIC 'DATA'
X	DB	9, 3, 7, 6, 5, 8, 1
DSEG	ENDS

CSEG	SEGMENT PARA 'CODE'
ASSUME	CS:CSEG, DS:DSEG, SS:SSEG
START:
	MOV	AX, DSEG
	MOV	DS, AX

	MOV	BX, OFFSET X  ; Massiv
	MOV	CX, 7  ; max I
	DEC CX
	JZ PRINT
	
M1:
	MOV DX, CX
	MOV CX, 0
	ADD CX, DX
	
	MOV SI, 0
M2:
	MOV	AL, [BX][SI]
	CMP [BX][SI+1], AL
	JNB M3
	XCHG AL, [BX][SI]
 	XCHG AL, [BX][SI+1]
	XCHG [BX][SI], AL

M3:
	INC SI
	LOOP M2
	MOV CX, DX
	LOOP M1

PRINT:
	MOV CX, 7
	MOV SI, 0
PRINT1:
	MOV AH, 02h
	MOV DX, [BX][SI]
	ADD DX, '0'
	INT 21h
	INC SI
	LOOP PRINT1

STOP:
	MOV	AH, 4Ch
	INT	21h
CSEG	ENDS
	END	START