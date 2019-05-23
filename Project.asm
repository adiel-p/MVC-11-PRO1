; CIS11 Project

.ORIG x3000

AND R0, R0, #0		; clear R0
AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R3, R3, #0		; clear R3
AND R4, R4, #0		; clear R4
AND R5, R5, #0		; clear R5
AND R6, R6, #0		; clear R6
AND R7, R7, #0		; clear R7

;for loop for user input

LD R1, INCOUNTER
LD R2, ARRAY


; This loop is used for the user to input there scores 
INLOOP	AND R0, R0, #0		; clear R0
	LEA R0, INMSG
	PUTS
	
	AND R0, R0, #0		; clears R0
	IN			; input character -> R0
	
	; convert input from ASCii to int
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	ADD R0, R0, #-16

	; for loop for the tenths first digits 
	; EX: if first digit entered is 6, the for loop
	; will add 10 six times to make the number a 60
	
	AND R3, R3, #0		; clear R3
	AND R6, R6, #0		; clear R6
			
	ADD R3, R3, R0		; store first digit to from input to R3
	NOT R3, R3		; 2's complement for R3 to make it negative
	ADD R3, R3, #1
	

	; intit
	AND R4, R4, #0
	STR R4, R5, #0		; i=0

	; test
	TLOOP	LDR R4, R5, #0	; load i
		ADD R4, R4, R3	; adds negative tenths value for the increment
		
		BRzp DONE
		LDR R4, R5, #0	; load i
	
		ADD R6, R6, #10	; increment by the tenths
		
		; re-init
		ADD R4, R4, #1	; increment i
		STR R4, R5, #0
		BR TLOOP
	
DONE	AND R0, R0, #0		; clears R0
	IN			; input SECOND digit character -> R0
	
	; convert input from ASCii to int
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	ADD R0, R0, #-16

	ADD R0, R0, R6		; adds R6's tenth value + second digit to R0
	
	STR R0, R2, #0		; store inputted character in memory address stored in R3
	ADD R2, R2, #1		; increment R3 (memory location)
	ADD R1, R1, #-1		; decrement R2 (counter
	BRp INLOOP

AND R0, R0, #0		; clear R0
AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R3, R3, #0		; clear R3
AND R4, R4, #0		; clear R4
AND R5, R5, #0		; clear R5
AND R6, R6, #0		; clear R6
AND R7, R7, #0		; clear R7

LD R1, OUTCOUNTER
LD R2, ARRAY
LD R5, ASCII

OUTLOOP	LDR R0, R2, #0		; load value from memory in R0
	
	JSR DIVISION		; go to the subroutine DIVISION
	AND R0, R0, #0		; clear R0
	AND R6, R6, #0
	LD R6, QUOTO
	ADD R0, R0, R6
	ADD R0, R0, R5
	OUT

	AND R0, R0, #0
	AND R3, R3, #0
	LD R3, REM
	ADD R0, R0, R3
	ADD R0, R0, R5
	OUT

	; The same lines are repeated to display the second digit, except
	; That only the REM is loaded and displayed. 
	
	LDR R0, R2, #0		; load value from memory in R0
	JSR DIVISION		; go to the subroutine DIVISION
	AND R0, R0, #0		; clear R0
	AND R6, R6, #0
	LD R6, REM
	ADD R0, R0, R6
	ADD R0, R0, R5
	OUT

	AND R0, R0, #0
	LEA R0, ENDL
	PUTS

	AND R0, R0, #0
	
	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp OUTLOOP		

HALT

INMSG		.STRINGZ "\nInput the test score: "
ENDL		.STRINGZ "\n"
ARRAY		.FILL x3040
				; Number will be stored in
				; addresses x3040 - x3044 
INCOUNTER	.FILL #5
OUTCOUNTER	.FILL #5
ASCII		.FILL x30	; ascii offset


DIVISION	AND R3, R3, #0	; clear R3
		ADD R3, R0, #0	; add x to R3
		AND R4, R4, #0	; clear R4
		ADD R4, R4, #10	; add 10 to R4, denomenator
		AND R6, R6, #0	; clear R6, quotent
		NOT R4, R4
		ADD R4, R4, #1	; 2's complement
		
		DIV	ADD R3, R3, R4	; x = x - y
			BRn ENDDIV
			ADD R6, R6, #1
			ST R3, REM
			BR DIV

		ENDDIV	ST R6, QUOTO
			RET

REM		.FILL x3100
QUOTO		.FILL x3101

.END
