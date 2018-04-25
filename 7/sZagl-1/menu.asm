PUBLIC	menu
EXTRN	NewLine:NEAR

Data	SEGMENT	PUBLIC
	line_enu	DB	10,13,'VIBOR VIDA RABOTI', '$'
	line_0		DB	'0. Oobrazit menu', '$'
	line_1		DB	'1. Vvod celogo v slovo X', '$'
	line_2		DB	'2. Vivod iz X kak dvoichnogo celogo bez znaka', '$'
	line_3		DB	'3. Vivod iz X kak dvoichnogo celogo so znaka', '$'
	line_4		DB	'4. Vivod iz X kak desyatichnogo celogo bez znaka', '$'
	line_5		DB	'5. Vivod iz X kak desyatichnogo celogo so znakom', '$'
	line_6		DB	'6. Vivod iz X kak shestnadcatirichnogo celogo bez znaka', '$'
	line_7		DB	'7. Vivod iz X kak shestnadcatirichnogo celogo so znakom','$'
	line_8		DB	'8. Vyhod', '$'
Data	ENDS

Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data
menu	PROC	NEAR
	PUSH	AX
	PUSH	DX
	
	MOV		AH,9	
	
	MOV		DX,offset line_enu
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_0
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_1
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_2
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_3
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_4
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_5
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_6
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_7
	INT		21h
	CALL	NewLine
	MOV		DX,offset line_8
	INT		21h
	
	POP		DX
	POP		AX	
	RET
menu	ENDP
Code	ENDS
END