This is the readme.txt file in example code for HW01 of Scientific Computing addAndMax

Your submission (you only need to submit one of the following):
	Python: addAndMax.py
	Matlab: addAndMax.m

Example input/output files:
	input.txt: input file
	output.standard.txt: output file (the correct answer)

Input/output file format:
	Input:
		Each two-row is a matrix, and each four-row is matrices A and B. For each four-row, you need to output one answer.
		For instance, "input.txt" has 80 rows, indicating there are 20 pairs of matrices A and B, and you need to output 20 answers.
		The format of each four rows is explained as follows.
		3 2: [row column] for matrix A
		2 3 1 5 4 6: Elements in A ==> A = [[2, 3], [1, 5], [4, 6]]
		2 4: [row column] for matrix B
		1 2 3 7 5 4 2 3: Elements in B ==> B = [[1, 2, 3, 7], [5, 4, 2, 3]]
	Output:
		A column of numbers, with each number being an answer to given matrices A and B

Example main program to run the test:
	Python: mainTest.py, with the following command to run it.
		python mainTest.py < input.txt > output.python.txt
	Matlab: mainTest.m, with the following command (within matlab) to run it.
		mainTest input.txt output.m.txt

Others
	addAndMaxSP.p is a standard program that can be invoked just like an M file in MATLAB to check against your submission of "addAndMax.m".
	
Hints:
	Python: You may use numpy's functions, including zeros, shape, max, etc.
	Matlab: Some related functions are size, zeros, max, etc.
