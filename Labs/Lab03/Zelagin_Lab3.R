# lab step #3: started by estalishing the amount of snacks on hand and the number of guests coming
bagochips <- 5
guests <- 8

# lab step #5: expected amount of bags of chips eaten by each guest
eaten <- guests * .4

# lab step #7: total amount of bags of chips eaten, this includes my portion in addition to the guests
totaleaten <- eaten + .4

# lab step #8: ratings of episodes 1 thru 9 given by myself and guests
SelfVec <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
PennyVec <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
LennyVec <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
StewieVec <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

# lab step #9: identified penny and lenny's ranking for episode IV by indexing and stored as new variables.
PennyIV <- PennyVec[4]
LennyIV <- LennyVec[4]

#lab step #10: concatenated everyone's rankings into a single data object
combinedrankings <- cbind(SelfVec, PennyVec, LennyVec, StewieVec)

#lab step #11: inspected structure of several vectors. PennyIV is a vector of single position, a numeral.
#PennyVec is a vector 9 mumerical characters long and they are listed. The concatenated vectors (combinedrankings)
#are shown to have 4 columns and 9 rows composed of numerals.
str(PennyIV)
str(PennyVec)
str(combinedrankings)

#lab step #12: data.frame displays the vectors in an array.
#as.data.frame generates an error message when supplied vectors
#but works when given the combined matrix. data.frame is more flexible in this respect.
DataFrameFromVectors <- data.frame(SelfVec, PennyVec, LennyVec, StewieVec)
DataFrameFromMatrix <- as.data.frame(combinedrankings)

#lab step #13: Comparing and contrasting the matrix (created in step #10) with the data frames (created in step #12).
#dim() yields identical results, matrix and data frames are the same dimensions.
#str() yields different results. Matrix has more information regarding structure output.
#typeof() yields different results (different class objects). Matrix is "double" while data frame is "list".
#== reveals that the numerals contained within the matrix and data frames, the array, is identical.
dim(combinedrankings)
dim(DataFrameFromMatrix)
str(combinedrankings)
str(DataFrameFromMatrix)
typeof(combinedrankings)
typeof(DataFrameFromMatrix)
combinedrankings == DataFrameFromMatrix

#lab step #14: Make a vector of all of the Star Wars episodes in roman numerals.
StarWarsEpisodes <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#lab step #15: Name the rows of the objects created in steps #10 and #12 with
#the roman numeral vector created in step #14.
row.names(combinedrankings) <- StarWarsEpisodes
row.names(DataFrameFromMatrix) <- StarWarsEpisodes

#lab step #16: Access the third row of the matrix produced from step #10.
combinedrankings[3,]

#lab step #17: Access the fourth column from a data frame produced from step #12.
DataFrameFromMatrix[,4]

#lab step #18: Access my ranking for Episode V.
DataFrameFromMatrix[5,1]

#lab step #19: Access Penny's ranking for Episode II.
DataFrameFromMatrix[2,2]

#lab step #20: Access everyone's rankings for Episodes IV-VI.
DataFrameFromMatrix[4:6,]

#lab step #21: Access everyone's rankings for Episodes II, V, and VII.
DataFrameFromMatrix[c(2,5,7),]

#lab step #22: Access rankings for just Penny and Stewie for just Episodes IV and VI.
DataFrameFromMatrix[c(4,6), c(2,4)]

#lab step #23: Switch Lenny's rankings for Episodes II and V.
swapvariable <- DataFrameFromMatrix[2,3]
DataFrameFromMatrix[2,3] <- DataFrameFromMatrix[5,3]
DataFrameFromMatrix[5,3] <- swapvariable

#lab step #24: Using row and column names to index instead of their location.
DataFrameFromMatrix[3,2]
DataFrameFromMatrix["III", "PennyVec"]

#lab step #25: Undo the switch made in step 23 with the method used in step #24.
swapvariable2 <- DataFrameFromMatrix["II", "LennyVec"]
DataFrameFromMatrix["II", "LennyVec"] <- DataFrameFromMatrix["V", "LennyVec"]
DataFrameFromMatrix["V", "LennyVec"] <- swapvariable2

#lab step #26: Redo the swap from step #23 using th "$" operator.
swapvariable3 <- DataFrameFromMatrix$LennyVec[2]
DataFrameFromMatrix$LennyVec[2] <- DataFrameFromMatrix$LennyVec[5]
DataFrameFromMatrix$LennyVec[5] <- swapvariable3





