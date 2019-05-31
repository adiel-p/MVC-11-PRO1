;  CIS11 Project

;  Created by Elizabeth Arias, Jorge Valencia, Adiel Perez

;  Option B: Test Score Calculator
;  Description:
; 		This program collects five 2-digit test scores
;		from the LC3 console (from the user input). 
;		It then stores the each test in an array and 
;		outputs the array in the LC3 console.
;		The program then calculates the maximum, minimum
;		and average of the five test scores and displays
;		the result onto the LC3 console. 

.ORIG x3000

AND R0, R0, #0		; clear R0
AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R3, R3, #0		; clear R3
AND R4, R4, #0		; clear R4
AND R5, R5, #0		; clear R5
AND R6, R6, #0		; clear R6
AND R7, R7, #0		; clear R7

LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; This loop is used for the user to input there scores 
INLOOP	AND R0, R0, #0		; clear R0
	LEA R0, INMSG		; display message 
	PUTS
	
	AND R0, R0, #0		; clears R0
	IN			; input character -> R0
	
	; convert input from ASCii to int
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	BRz DONE		; skips the tenths loop if zero is entered

	; FOR LOOP
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

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R5, R5, #0		; clear R5

LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2
LD R5, ASCII		; load ASCII into R5

; this loop outputs all the numbers in the array
OUTLOOP	LDR R0, R2, #0		; load value from memory in R0
	
	; Division is used to display the first digit of the number
	; by collecting the quotent and displaying it
	; remainder is used to display the second digit
	JSR DIVISION		; go to the subroutine DIVISION
	AND R0, R0, #0		; clear R0
	AND R6, R6, #0		; clear R6
	LD R6, QUOTO		; load Quotent in R6	
	ADD R0, R0, R6		; store R6 in R0
	ADD R0, R0, R5		; convert from int to ASCII
	OUT

	AND R0, R0, #0		; clear R0
	AND R3, R3, #0		; clear R3
	LD R3, REM		; load remainder in R3
	ADD R0, R0, R3		; store R3 into R0
	ADD R0, R0, R5		; convert from int to ASCII
	OUT
	OUT

	AND R0, R0, #0		; clear R0
	LEA R0, SPACE		; space after each test is displayed
	PUTS

	AND R0, R0, #0		; clear R0
	LEA R0, SPACE		; space after each test is displayed
	PUTS
	
	AND R0, R0, #0		; clear R0
	
	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp OUTLOOP

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; this loop finds the maximum value, and stores in MAX (x3107)
MAXLOOP	LDR R3, R2, #0	

	STI R3, X	; store value from array into X
	LDI R3, X	; load value from X into R3
	LDI R4, Y	; load value from Y into R4

	NOT R4, R4	; 2's complement, -Y
	ADD R4, R4, #1
	ADD R3, R4, R3	; X - Y
	BRn NEGMAX	; if it is a negative, keep as MAX
	LDI R4, X	; else switch the numbers
	STI R4, Y

	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MAXLOOP

	; keeps the current number since it is the maximum
NEGMAX	LDI R4, Y	
	STI R4, Y
	
	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MAXLOOP

LDI R4, Y			; loads Y (current maximum value) into R4
STI R4, MAX			; stores R4 int MAX

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; this loop finds the MINIMUM value and stores in Y (x3106)
MINLOOP	LDR R3, R2, #0	

	STI R3, X	; store array value into X
	LDI R3, X	; load X into R3
	LDI R4, Y	; load Y into R4

	NOT R4, R4	; 2's complement, -Y
	ADD R4, R4, #1
	ADD R3, R4, R3	; X - Y
	BRp POSMIN	; if it is positive, switch because its MIN
	LDI R4, X	
	STI R4, Y

	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MINLOOP

POSMIN	LDI R4, Y
	STI R4, Y
	
	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MINLOOP

LDI R4, Y			; loads the Y (current minimum) into R4
STI R4, MIN			; stores R4 into MIN

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; gets the sum of the array and stores it in SUM (x3101)
SUMLOOP	LDR R0, R2, #0

	LDI R3, SUM
	ADD R3, R3, R0		; adds up the numbers and stores in R3

	STI R3, SUM

	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp SUMLOOP

AND R0, R0, #0			; clears R0
LDI R0, SUM			; loads the sum into R0

; this is used to calculate the average
JSR DIVAVG			; go to the subroutine DIVISION
STI R6, AVG			; stores R6 into AVG

; displays the maximum value of the test
AND R0, R0, #0			; clear R0
LEA R0, MAXMSG			; loads the maximum message to R0
PUTS
AND R0, R0, #0			; clear R0
LDI R0, MAX			; loads the maximum into R0
JSR DISPLAY			; go to the subroutine DISPLAY

; displays the minimum value of the tests 
AND R0, R0, #0			; clear R0
LEA R0, MINMSG			; loads the minimum message to R0
PUTS
AND R0, R0, #0			; clear R0
LDI R0, MIN			; loads the minimum into R0
JSR DISPLAY			; go to the subroutine DISPLAY

; displays the average value of the tests 
AND R0, R0, #0			; clear R0
LEA R0, AVGMSG			; loads the average message to R0
PUTS
AND R0, R0, #0			; clear R0
LDI R0, AVG			; loads the average into R0
JSR DISPLAY			; go to the subroutine DISPLAY

HALT

ARRAY		.FILL x3040	; Number will be stored in
				; addresses x3040 - x3044 
SIZE		.FILL #5	; size of the array
ASCII		.FILL x30	; ascii offset

X		.FILL x3105
Y		.FILL x3106
MAX		.FILL x3107	; address for maximum value
MIN		.FILL x3108	; address for minimum value
SUM		.FILL x3110	; address for sum value
AVG		.FILL x3111	; address for average

INMSG		.STRINGZ "\nInput the test score:"
SPACE		.STRINGZ " "
MAXMSG		.STRINGZ "\nMAX: "
MINMSG		.STRINGZ "\nMIN: "
AVGMSG		.STRINGZ "\nAVG: "

; display subroutine used to display the min, max, and average
DISPLAY		ST R7, SaveR7		; save R7
		; Division is used to display the first digit of the number
		; by collecting the quotent and displaying it
		; remainder is used to display the second digit
		JSR DIVISION		; go to the subroutine DIVISION
		AND R0, R0, #0		; clear R0
		AND R6, R6, #0		; clear R6
		LD R6, QUOTO		; load Quotent in R6	
		AND R5, R5, #0		; clear R5
		LD R5, ASCII		; load ASCII into R5
		ADD R0, R0, R6		; store R6 in R0
		ADD R0, R0, R5		; convert from int to ASCII
		OUT 	

		AND R0, R0, #0		; clear R0
		AND R3, R3, #0		; clear R3
		LD R3, REM		; load remainder in R3
		ADD R0, R0, R3		; store R3 into R0
		ADD R0, R0, R5		; convert from int to ASCII
		OUT
		LD R7, SaveR7		; restore R7
		
		RET	

; division subroutine used for displaying two digit numbers 
DIVISION	AND R3, R3, #0	; clear R3
		ADD R3, R0, #0	; add x to R3
		AND R4, R4, #0	; clear R4
		ADD R4, R4, #10	; add 10 to R4, denomenator
		AND R6, R6, #0	; clear R6, quotent
		NOT R4, R4
		ADD R4, R4, #1	; 2's complement
		
		; loops until negative.
		; this continues to increment R6 by 1
		; simulating the division
		DIV	ADD R3, R3, R4	; x = x - y
			BRn ENDDIV
			ADD R6, R6, #1	; R6++
			ST R3, REM	; stores R3 into REM
			BR DIV
				
		ENDDIV	ST R6, QUOTO	; stores R6 into QUOTO
			RET

; division subroutine used to find the average. SUM/5 = AVG
DIVAVG		AND R3, R3, #0	; clear R3
		ADD R3, R0, #0	; add x to R3
		AND R4, R4, #0	; clear R4
		ADD R4, R4, #5	; add 5 to R4, denomenator
		AND R6, R6, #0	; clear R6, quotent
		NOT R4, R4
		ADD R4, R4, #1	; 2's complement
		
		; loops until negative.
		; this continues to increment R6 by 1
		; simulating the division
		DIVA	ADD R3, R3, R4	; x = x - y
			BRn ENDDIVA
			ADD R6, R6, #1	; R6 ++
			ST R3, REM	; stores R3 into REM
			BR DIVA

		ENDDIVA	ST R6, QUOTO	; stores R6 into QUOTO
			RET

REM		.FILL x3100		; address for the remainder
QUOTO		.FILL x3101		; address for the quotent
SaveR7		.FILL #0

.END
 
