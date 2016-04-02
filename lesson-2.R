## LESSON 2 ##

# Matrix
#
# 	create a matrix: matric(dataVector,nrow=N, ncol=M)
#
#	other paramethers:
#		- byrow=TRUE|FALSE -> insert by rows
#

x <- 1:24
m <- matrix(x, nrow=4) 	# Creates a matrix with 24 elements
						#  composed by 4 rows (and thus 6 columns)
						
# Useful commands:
# 
#	as.matrix -> transforms an object in a matrix
#	rownames(m) -> sets row names
#	colnames(m) -> sets column names
#	cbind(v1,v2) -> creates a matrix concatenating vectors (or matrixes) 
#						horizontally
#	rbind(v1,v2) -> creates a matrix concatenating vectors (or matrixes) 
#						vertically
#

v1 <- 1:3
v2 <- 4:6
cbind(v1,v2)
# creates:
#	1 4
#	2 5
#	3 6

rbind(v1,v2)
# creates:
#	1 2 3
#	4 5 6

# Operation between matrixes:
#
#	Mat + N -> Sums to each Mat element the value N
#	Mat * N -> Multiplies each Mat element by the value N
#	Mat + Mat -> Sums matrixes element by element
# 	Mat * Mat -> Mutiplies matrixes element by element
#

# Other functions:
#
#	diag(x) -> if x is a scalar returns the identity matrix 
#				with dimension floor(x).
#			   if x is a vector returns the diagonal matrix with
#				x on the main diagonal
#			   if x is a matrix returns its main diagonal
#
#	solve(A,b) -> inverts the matrix. Can be used to solve linear systems.
#					for instance if A is a not singular square matrix 
#					and b is a compatible vector then 
#						x <- solve(A,b) returns Ax = b				
#

# Matrix indexing
#

mat <- matrix(1:12, nrow=2)
#
#	1	3	5	7	9	11 
#	2	4	6	8	10	12

mat[1,2]		# -> 3
mat[1,3:4]		# -> (5,7)
mat[1:2,4:6]	# -> 7	9	11	
				#	 8	10	12
mat[1,]			# -> (1, 3, 5, 7, 9, 11)  	aka: the first row
mat[,3]			# -> (5, 6)					aka: the third column

mat[,-4] 		# All rows and all columns EXCEPT the fourth column.
mat[m > 4]		# -> (5,6,7,8,9,10,11,12) 	aka: all values > 4

rownames(mat) <- c("r1","r2")
colnames(mat) <- paste("c", 1:6, sep="")
mat["r1","c2"]	# -> 3
mat["r1",]		# -> (1, 3, 5, 7, 9, 11)  	aka: the first row

# The array constructor.
#
#	We can create array of arbitrary dimension using the array command.
#	Matrixes are bidimensional arrays (while vectors are unidimensional)
#

# The table command.
#	
#	The table command generates distribution of 
#	simple or double absolute frequencies
#

# Simple absolute frequencies
dayOff <- c(2,2,0,0,5,8,3,4,1,0,	
			0,7,1,7,1,5,4,0,4,0,
			1,8,9,7,0,1,7,2,5,5,
			4,3,3,0,0,2,5,1,3,0,
			1,0,2,4,5,0,5,7,5,1)

dayOffAbs <- table(dayOff)

# To obtain the relative frequencies distribution we use prop.table
options(digits=1)	# Global option
dayOffRel <- prop.table(dayOff)
# To obtain the table of relative frequencies we just do:
dayOffRelTable <- table(dayOff) / length(dayOff)

# Example:
# We need to divide workers using their gender (M or F)
# we have 20 males and 30 females.

gender <- c(rep(c("M"), 20), rep(c("F"),30))

workersDayOff = table(dayOff, gender)

# load xtable library:
library(xtable)


###################
#### Exercises ####
###################

# Es 1 -> Students: Luigi, Francesca, Carlo, Alberto, Nicola, Giovanna
#		  Grades: 28, 18, 25, 21, 30, 22
#		  Number of times they gave the exam: 3, 2, 1, 1, 2, 2

## Es 1.a -> insert data in a matrix having 
#			 names on rows and grades on columns and attempts
students <- c("Luigi", "Francesca", "Carlo", "Alberto", "Nicola", "Giovanna")
grades <- c(28, 18, 25, 21, 30, 22)
attempts <- c(3, 2, 1, 1, 2, 2)

exam <- cbind(grades,attempts)

## Es 1.b -> add rows and columns names to the matrix
rownames(exam) <- students
colnames(exam) <- c("Grades","Attempts")

## Es 1.c -> pick number of students in those ranges:

# Grades: 18 - 22
g18_22 <- sum(exam[,"Grades"] <= 22)

# Grades: 23 - 26
g23_26 <- sum(exam[,"Grades"] >= 23 & exam[,"Grades"] <= 26)

# Grades: 27 - 30
g27_30 <- sum(exam[,"Grades"] >= 27 & exam[,"Grades"] <= 30)

## Es 1.d -> Add a column "RatingsRange" set to:
#				3: for students with grades in 18-22
#				2: for students with grades in 23-26
#				1: for students with grades in 27-30
rrange <- rep(0, nrow(exam))	# init to 0
rrange[exam[,"Grades"] <= 22] <- 3
rrange[exam[,"Grades"] >= 23 & exam[,"Grades"] <= 26] <- 2
rrange[exam[,"Grades"] >= 27 & exam[,"Grades"] <= 30] <- 1

exam <- cbind(exam,rrange)
colnames(exam) <- c("Grades","Attempts","RatingRange")

## Es 1.e -> print the student relative frequencies
studRelFreq <- table(exam[,"RatingRange"])/nrow(exam)


## Es 1.f -> calculate the the sample mean








