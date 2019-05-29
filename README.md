# MVC-11-PRO1
Test Score Calculator 

A. HOW TO OPERATE THE LC3 EDITOR AND SIMULATOR

In order to assemble the .asm file you will need to download and follow the instructions of the simulator.
Using the following website https://highered.mheducation.com/sites/0072467509/student_view0/lc-3_simulator.html.
After downloading and opening the file there will be two programs you will need to open:
	1. LC3Edit.exe
		The LC3Edit.exe program will be used to assemble the file containing our code. 
		So you will need to go to File > Open > (The TestScores.asm file that we provide you).
		After the code has been loaded into the Editing Tool, you will be able to view our code.
		Now you will have to create the .obj file in order to test our code. So next go to
		Translate > assemble
		Now after doing this - a TestScore.obj file will be saved in the same folder (The same folder
		containing the TestScore.asm file.
		Now you can exit the program and open the next program. 
	2. Simulate.exe
		The Simulate.exe program will be used to run the TestScores.obj file that you just assembled.
		After opening the program, two windows will appear. The LC3 Simulator is used to load and execute
		the .obj file and the LC3 Console is used to display any output or collect input from the user. 
		So in order to run the .obj file you will go to File > Load Program > TestScores.obj (You'll find 
		the file in the same folder you saved the TestScores.asm file)
		You simulator change. meaning the the .obj file has been successful loaded.
		Now you will need to run the program so go to Execute > Run. 
		The program will now start to run and something should display onto the LC3 Console which will 
		move us to the next step.

B. HOW TO RUN THE TEST SCORES PROGRAM
On the LC3 Console an output should display "Input the test score: ". This is asking the user to input the first 
test score. NOTE: The user will only be able to input 2-DIGIT test scores, so no scores greater than 99. 
(WARNING: ANY CHARACTERS OR SYMBOLS INPUTTED WILL CAUSE THE PROGRAM TO RUN INCORRECTLY)
Now another output should display saying "Input a character>", this prompts the user to input the first digit of 
there number. Following that the prompt (after typing in you number) , another identical prompt should display 
allowing you to type the second digit of your number. (WARNING: AFTER TYPING YOUR VALUE, DO NOT PRESS ENTER! THE
CONSOLE WILL AUTOMATICLY COLLECT YOUR VALUE. THIS ALSO MEANS YOU CANNOT CHANGE YOUR NUMBER AFTER TYPING IT!)
This will repeat five times in order to collect five 2-digit test scores. After entering the five test scores the
console will display each test score you entered, along with the Highest Test Score (MAX), the lowest test score (MIN)
and the average of the five test scores (AVG). 
After that has been displayed, the following should display ----- Halting the processor ----- indicating the end of the program. 
