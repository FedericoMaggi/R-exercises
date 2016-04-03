## LESSON 3 ##

# mode and str commands
#
#	- mode: returns the R object type
#	- str: briefly shows the R object structure

a <- c("a","b","c")
mode(a)	# "character"

b <- seq(1,5, by=2)
mode(b) # "numeric"

str(a) # -> chr[1:3] "a" "b" "c"
str(b) # -> num[1:25] 1 3 5

# Lists
#
# Lists represent an orderer (and indexable) set of objects
# They can contain heterogeneous datas
#
# Lists are a recursive data structure since a list may contain 
# another list
#
# To build a list there's the list() function

li <- list( c("s1","s2"), 1:6)

# The indexing is done with two operators
#
#	[] -> access to a sublist
#	[[]] -> access the R object contained in the sublist
li[1]
li[[1]]

mode(li)
mode(li[[1]])

# It is possibile to assing names and access them
# with the $ operator or with the [[]] operator.

namedList <- list(firstValue=seq(1:5),thebool=TRUE, vector=c(1:9))
namedListFirstVal <- namedList$firstValue
namedListBoolean <- namedList$thebool

# The names function allows to set names to the list values
# after the list has been created.

unnamedList <- list(TRUE,seq(from=1, to=9, by=2),c(4:1))

names(unnamedList) <- c("aBoolean","aSeq","aVector")

# List can be extended or concatenated

aList <- list(0.6789, paste(c(rep("a",4),rep("t",4)),collapse=""))
aList[3] <- list("NEWVALUE")

concatenatedList <- c(li,namedList,unnamedList,aList) # Concatenation

###################
#### Exercises ####
###################


# Es 1 -> Blood donors.

bloodgroups <- c(0,"A",0,"A","B","A","A",0,0,"B","A",0,"A","A","B","B")
names <- paste("sig", 1:16, sep="")

## Es 1.a -> Represent blood groups in a frequency table
groupsAbsFreq <- table(bloodgroups)

## Es 1.b -> Represent blood groups in a relavite frequency table
groupsRelFreq <- table(bloodgroups) / length(bloodgroups)

## Es 1.c -> create a last name vector and insert names, lastnames and blood groups in a list
lastnames <- paste("surname", 1:16, sep="")

donors <- list(Names=names, Lastnames=lastnames, Groups=bloodgroups)

## Es 1.d -> retrieve name and surname of people with B blood group

Bgroup <- donors$Groups == "B"
Bnames <- donors$Names[Bgroup]
Blastnames <- donors$Lastnames[Bgroup]







