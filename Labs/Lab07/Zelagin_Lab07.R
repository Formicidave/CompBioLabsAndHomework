# David Zelagin
# Lab07


# Problem 1: Write a function that calculates and returns the area of a triangle
# when given two arguments (base and height)
triangleArea <- function(base=NA,height=NA) {
  return(.5 * base * height)
}

# testing triangleArea function
triangleArea(10,9)

# Problem 2:
# 2a: Write a function named myAbs() that calculates and returns absolute values
myAbs <- function(number) {
  if (number > 0) {
    return(number)
  } else {(return(-number))
  }
}

#testing myAbs function

myAbs(5)
myAbs(-2.3)

# 2b: Revise the function to make it work on vectors.

myAbs <- function(number) {
  for (i in 1:length(number)) {
    if (number[i] >= 0) {
      number[i] <- number[i]
    } else {number[i] <- -number[i]
    }
  }
  return(number)
}
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

# 3: Write a function that returns a vector of the first
# n Fibonacci numbers, where n is any integer >= 3

fibonacciFunc <- function(a, n) {
  fibFuncResults <- rep(a, n)
  if (a == 0) {
    fibFuncResults[2] <- 1
  }
  for (i in 3:n) {
    fibFuncResults[i] <- fibFuncResults[i - 2] + fibFuncResults[i - 1]
  }
  return(fibFuncResults)
}

# Testing fibFunc
fibonacciFunc(1, 50)

# 4a: Write a function that takes two numbers as its arguments and 
# returns the square of the difference between them

returnSquare <- function(x, y) {
  returnSquareReults <- (x - y) ^ 2
  return(returnSquareReults)
}

# Demonstrate function works by calling it with numbers 3 and 5
returnSquare(3, 5)
returnSquare(3, 6)

# Call function where the first argument is the vector c(2, 4, 6), and 
#the second argument is 4
returnSquare(c(2, 4, 6), 4)
}

# 4b: Write a function that calculates the average of a vector of numbers
# without using Mean() function
getMean <- function(vector) {
  mySum <- sum(vector)
  getMeanResults <- mySum/length(vector)
  return(getMeanResults)
}

# Testing getMean
getMean(c(5, 15, 10))

# Demonstarate function working by calling in
# "DataForLab07.csv" file found in Sam's Lab07 directory

lab07Data <- read.csv("DataForLab07.csv")
getMean(lab07Data$x)

# 4c: Write a function that calculates and returns the sum of squares.
#  function should take a vector of numeric data as its argument. 

sumSquare <- function(anyVec) {
  getMeanResults <- getMean(anyVec)
  SquareDiffResults <- squareDiff(anyVec, getMeanResults)
  sumSquareResults <- sum(SquareDiffResults)
  return(sumSquareResults)
}

# Testing sumSquare with imported data
sumSquare(lab07Data$x)










