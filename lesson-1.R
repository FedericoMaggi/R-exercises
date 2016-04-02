# Vectors:
#	
#	create a vector: c(arg1, arg2, arg3) with arg1,arg2,arg3 of the same type.
#

c(2,3,4)

# Assign a vector to a variable in the workspace
#

x <- c(3,4,5)
y <- c(5,4,3)

# Operations with vectors:
#

a <- x + y
m <- x * y
s <- x - y
d <- x / y

# Useful functions: max, min, range, sum, prod, sort, order
#

max(x)
min(y)
range(d)
sum(x)
prod(m)
sort(y)
order(y)

# Sequences generation
#

c(1:10)		# (1,2,3,4,5,6,7,8,9,10)
c(5:1)		# (5,4,3,2,1)

seq(1,10)					# (1,2,3,4,5,6,7,8,9,10)
seq(from=1, to=5, by=0.5) 	# (1,1.5,2,2.5,3,3.5,4,4.5,5) 


rep(c(1,2), times=4)	# (1,2,1,2,1,2,1,2)

# Logical operators on vectors
#	<, <=, =, != , >=, >

testv <- c(3:8)
boolv <- testv < 5
boolv	# Prints the vector

testv2 <- c(1:6)
diseqv <- testv != c(3,4)	# c(3,4) is automatically repeated to match testv length.

# Not Available values: NA
#

naEg <- c(1:4, NA)
naEg + 2

# 	is.na() is used to test an object for NA values. 
#	 Returns a boolean type (vector, in this instance)

natest <- is.na(naEg)
natest

# Access to vector indexes. Vector indexing starts from 1 length(vector)
#

vv <- c(1:5)
ll <- length(vv)
ll
vv[1]
# vv[6] : Out of range -> NA

# It is possibile to pass more than one index in the [] operator
vv[c(1:3)]	# returns vv[1], vv[2] and vv[3]
# or (easier)
vv[1:3]


# Logical index vector
# A logical index vector is a support vector used to index another one.
# It's important that the two vectors must be the same length

vect <- c(1:5,rep(NA, times=2))		# (1,2,3,4,5,NA,NA)
indv <- c(rep(TRUE,times=4),rep(FALSE,times=3))

vect[indv] # (1,2,3,4)
vect[!is.na(vect)] 				# Returns elements in vect that are not NA: (1,2,3,4,5)
vect[!is.na(vect) & vect > 2]	# (3,4,5)

# Selection via string indexes
#

champ <- c(25,180,70,2010,3)
names(champ) <- c("Age","Height","Weight","FromYear","Hospitalisations")

Age.Year <- champ[c("Age","FromYear")]

# Other commands:
#
#	sample(x, n, replace=TRUE|FALSE) -> Randomly extracts N elements from vector x.
#			if replace is FALSE extracts without reinsertion, 
#				otherwise it will use reinserction.
#
#	floor(x), ceiling(x), trunc(x), round(x, digits=N)
#
#	paste("string1","string2",sep="-") -> "stringa1-stringa2"
#
#	setdiff(vect1, vect2) -> returns the set difference between the two vectors	
#

###################
#### Exercises ####
###################


# Es 1
## Insert the following values in 3 distinct vectors

## 2.5, 2, 5, 1, 11, -0.1, 10, 9
a <- c(2.5, 2, 5, 1, 11, -0.1, 10, 9)

## 10, 9.5, 9, 8.5, 8, 7.5, 7, 6.5
b <- seq(from=10, to=6.5, by=-0.5)

## 1, 2, 3, 4, 5, 6, 7, 8
c <- c(1:8)

# Es 1.a -> Calculate Max and Min of each vector
max(a)
min(a)
range(a) # Returns min and max

max(b)
min(b)
range(b)

max(c)
min(c)
range(c)

## Es 1.b -> Calculate the sum of each vector
sum(a)
sum(b)
sum(c)

## Es 1.c -> Calculate a + b
a + b

## Es 1.d -> Calculate a - b - c
a - b - c

## Es 1.e -> Calculate product of b
prod(b)

## Es 1.f -> Concatenate each vector and extract a random sample 
concatv <- c(a,b,c)
sample(concatv,size=floor(length(concatv)*30/100),replace=FALSE)

# Es 2 -> 20 workers out of illnes in the last 6 weeks
## Es 2.a -> Create a vector containing illness days and the workers codes

workers <- c(2,2,0,0,5,8,3,4,1,0,0,7,1,7,1,5,4,0,4,0)
#names(workers) <- c("w0","w1","w2","w3","w4","w5","w6","w7","w8","w9","w10","w11","w12","w13","w14","w15","w16","w17","w18","w19")
# A better way to do this is using paste
codes <- paste("w",0:19, sep="")
names(workers) <- codes

## Es 2.b -> Get how many illness days has got w6
workers["w6"]

## Es 2.c -> Get how many workers had got 0 illness days and print their codes
zeroIllnessesCodes <- names(workers)[workers[c(1:20)] == 0]

## or, using the codes vector
codes[workers == 0]

## Es 3.d -> Extract the illness days of all workers except w2 and w11
workers[setdiff(codes, c("w2","w11"))
