; CIS11 Project

.ORIG x3000

AND R0, R0, #0		; clear R0
AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R3, R3, #0		; clear R3
AND R4, R4, #0		; clear R4
AND R5, R5, #0		; clear R5
AND R6, R6, #0		; clear R6
AND R7, R6, #0		; clear R7

;for loop for user input

LD R1, INCOUNTER
LD R2, ARRAY

INLOOP	AND R0, R0, #0		; clear R0
	LEA R0, INMSG
	PUTS
	
	AND R0, R0, #0		; clears R0
	GETC			; input character -> R0
	
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
	GETC			; input SECOND digit character -> R0
	
	; convert input from ASCii to int
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	ADD R0, R0, #-16

	ADD R0, R0, R6		; adds R6's tenth value + second digit to R0
	
	STR R0, R2, #0		; store inputted character in memory address stored in R3
	ADD R2, R2, #1		; increment R3 (memory location)
	ADD R1, R1, #-1		; decrement R2 (counter
	BRp INLOOP		

HALT

INMSG		.STRINGZ "\nEnter the test score: "
ARRAY		.FILL x3040
				; Number will be stored in
				; addresses x3040 - x3044 
INCOUNTER	.FILL #5

.END
