; Created by Elizabeth Arias, Jorge Valencia, Adiel Perez
; Option B: Test Score Calculator
; Description:
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

LD R1, SIZE
LD R2, ARRAY
LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; This loop is used for the user to input there scores 
INLOOP	AND R0, R0, #0		; clear R0
@@ -38,20 +38,19 @@ INLOOP	AND R0, R0, #0		; clear R0
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
			
	AND R6, R6, #0		; clear R6			
	ADD R3, R3, R0		; store first digit to from input to R3
	NOT R3, R3		; 2's complement for R3 to make it negative
	ADD R3, R3, #1
	

	; intit
	AND R4, R4, #0
	STR R4, R5, #0		; i=0
@@ -70,28 +69,28 @@ INLOOP	AND R0, R0, #0		; clear R0
		STR R4, R5, #0
		BR TLOOP
	
DONE	AND R0, R0, #0		; clears R0
	IN			; input SECOND digit character -> R0
	DONE	AND R0, R0, #0		; clears R0
		IN			; input SECOND digit character -> R0
	
	; convert input from ASCii to int
	ADD R0, R0, #-16
	ADD R0, R0, #-16
	ADD R0, R0, #-16
		; convert input from ASCii to int
		ADD R0, R0, #-16
		ADD R0, R0, #-16
		ADD R0, R0, #-16

	ADD R0, R0, R6		; adds R6's tenth value + second digit to R0
		ADD R0, R0, R6		; adds R6's tenth value + second digit to R0
	
	STR R0, R2, #0		; store inputted character in memory address stored in R3
	ADD R2, R2, #1		; increment R3 (memory location)
	ADD R1, R1, #-1		; decrement R2 (counter
	BRp INLOOP
		STR R0, R2, #0		; store inputted character in memory address stored in R3
		ADD R2, R2, #1		; increment R3 (memory location)
		ADD R1, R1, #-1		; decrement R2 (counter
		BRp INLOOP

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2
AND R5, R5, #0		; clear R5

LD R1, SIZE
LD R2, ARRAY
LD R5, ASCII
LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2
LD R5, ASCII		; load ASCII into R5

; this loop outputs all the numbers in the array
OUTLOOP	LDR R0, R2, #0		; load value from memory in R0
@@ -132,8 +131,8 @@ OUTLOOP	LDR R0, R2, #0		; load value from memory in R0
AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE
LD R2, ARRAY
LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; this loop finds the maximum value, and stores in MAX (x3107)
MAXLOOP	LDR R3, R2, #0	
@@ -153,21 +152,22 @@ MAXLOOP	LDR R3, R2, #0
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MAXLOOP

	; keeps the current number since it is the maximum
NEGMAX	LDI R4, Y	
	STI R4, Y
	
	ADD R2, R2, #1		; increment array base address
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MAXLOOP

LDI R4, Y
STI R4, MAX
LDI R4, Y			; loads Y (current maximum value) into R4
STI R4, MAX			; stores R4 int MAX

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE
LD R2, ARRAY
LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; this loop finds the MINIMUM value and stores in Y (x3106)
MINLOOP	LDR R3, R2, #0	
@@ -194,14 +194,14 @@ POSMIN	LDI R4, Y
	ADD R1, R1, #-1		; decrement counter register R2	
	BRp MINLOOP

LDI R4, Y
STI R4, MIN
LDI R4, Y			; loads the Y (current minimum) into R4
STI R4, MIN			; stores R4 into MIN

AND R1, R1, #0		; clear R1
AND R2, R2, #0		; clear R2

LD R1, SIZE
LD R2, ARRAY
LD R1, SIZE		; load SIZE (size of the array) into R1
LD R2, ARRAY		; load ARRAY into R2

; gets the sum of the array and stores it in SUM (x3101)
SUMLOOP	LDR R0, R2, #0
@@ -275,8 +275,8 @@ DISPLAY		ST R7, SaveR7		; save R7
		AND R0, R0, #0		; clear R0
		AND R6, R6, #0		; clear R6
		LD R6, QUOTO		; load Quotent in R6	
		AND R5, R5, #0
		LD R5, ASCII
		AND R5, R5, #0		; clear R5
		LD R5, ASCII		; load ASCII into R5
		ADD R0, R0, R6		; store R6 in R0
		ADD R0, R0, R5		; convert from int to ASCII
		OUT 	
@@ -300,13 +300,16 @@ DIVISION	AND R3, R3, #0	; clear R3
		NOT R4, R4
		ADD R4, R4, #1	; 2's complement
		
		; loops until negative.
		; this continues to increment R6 by 1
		; simulating the division
		DIV	ADD R3, R3, R4	; x = x - y
			BRn ENDDIV
			ADD R6, R6, #1
			ST R3, REM
			ADD R6, R6, #1	; R6++
			ST R3, REM	; stores R3 into REM
			BR DIV

		ENDDIV	ST R6, QUOTO
				
		ENDDIV	ST R6, QUOTO	; stores R6 into QUOTO
			RET

; division subroutine used to find the average. SUM/5 = AVG
@@ -318,17 +321,20 @@ DIVAVG		AND R3, R3, #0	; clear R3
		NOT R4, R4
		ADD R4, R4, #1	; 2's complement
		
		; loops until negative.
		; this continues to increment R6 by 1
		; simulating the division
		DIVA	ADD R3, R3, R4	; x = x - y
			BRn ENDDIVA
			ADD R6, R6, #1
			ST R3, REM
			ADD R6, R6, #1	; R6 ++
			ST R3, REM	; stores R3 into REM
			BR DIVA

		ENDDIVA	ST R6, QUOTO
		ENDDIVA	ST R6, QUOTO	; stores R6 into QUOTO
			RET

REM		.FILL x3100
QUOTO		.FILL x3101
REM		.FILL x3100		; address for the remainder
QUOTO		.FILL x3101		; address for the quotent
SaveR7		.FILL #0

.END




 
