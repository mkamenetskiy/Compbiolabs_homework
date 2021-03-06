#Lab 07, FUNction

#Problem 1. Area of a triangle is provided by 0.5 * base * height 
#Function is below for area of a triangle. A=base and B=height
triangleArea <- function(base=NA, height=NA){
  multiplication_forArea <- 0.5 * base * height
  return(multiplication_forArea)
}
triangleArea(10,9)

#Problem 2. Creating a function that acts like an absolute value function. 
#I hope to do this through a logical index. And it worked! Through vetting it with 5 and -2.3. 

myAbs <- function(Number){
  if (Number < 0){
    AbsNumber <- Number * (-1)
  } else {
    AbsNumber <- Number
  }
  return(AbsNumber)
}
myAbs(5)
myAbs(-2.3)

#Part 2b. We want this function to now work for vector instead of single numbers. 
#Mistakes made along the way, defining the for loop in 1:length, outputting the return after the for loop, pre allocating the vector so that it can have values input in it 
#Here we create a function that works with a vector. We see a for loop in which if it is below zero, it is multiplied by -1. If not, the output is just the original number. 
#The function was tested with a vector 

myAbs <- function(bVector){
  AbsNumber <- rep(0, length(bVector))
  for(i in 1:length(bVector)){
    if (bVector[i] < 0){
      AbsNumber[i] <- bVector[i] * (-1)
    } else {
      AbsNumber[i] <- bVector[i]
    }
  }
  return(AbsNumber)
}
testVector2b <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(testVector2b)

#Problem 3. Fibonacci Sequence. Write a function that returns a vector of the first n Fib numbers, where n is any integer >= 3
#Goal: Give vector of fib sequence of length n, take one argument of length vector, and desired starting number 0 or 1
#Below we see a function in which the starting configurations are defined based on if the sequence starts with 1 or 0
#And afterwards ensues into a for loop that adds the previous two numbers to make the next number. Since it starts with two values off the bat, the for loop runs n amount with two less iterations. 

FibFunction <- function(n, s) {
  fib_zero_vector <- rep(0, n)
  
  if (s==0){
    fib_zero_vector[2] <- 1
  }else {
    fib_zero_vector[1] <- 1  #How can we avoid something like this? 
    fib_zero_vector[2] <- 1
    }
  
  for (i in 1 :(n-2)){
    fib_zero_vector[i+2] <- fib_zero_vector[i+1] + fib_zero_vector[i]
  }
  return(fib_zero_vector)
}

FibFunction(7, 0)
FibFunction(7,1)

#Problem 4. 4a, a function of two numbers that returns (x-y)^2
#
DifferenceSquaredFunc <- function(x,y){
  Problem4Output <- (x-y)^2
  return(Problem4Output)
}

Problem4Function(3,5)

PracticeVector4 <- c(2, 4, 6)
Problem4Function(PracticeVector4, 4) #You can DO THIS NO WAY

#Problem 4b. A function to calculate the average of a vector of numbers. 
#This is done by summing the objects' values in the vector and dividing by the length of the vector. 
AverageFunction <- function(AverageThis){
  AverageThat <- (sum(AverageThis) / length(AverageThis))
  return(AverageThat)
}
TestFunction4b <- c(5, 15, 10)
AverageFunction(TestFunction4b)

#Here we are testing the average function with data pulled from the github of lab 7. First the data is converted into a vector and then functioned. 

DataLab07 <- DataForLab07$x
AverageFunction(DataLab07)

#Part 4C. Sum of squares
#Calculate the mean. Each data point the mean is subtracted. Difference is squared. Then summed.
SumofSquare <- function(SumOSquares){
  VectorforSum <- rep(0, length(SumOSquares))
  MeanforSum <- AverageFunction(SumOSquares)
  DifferenceforSum <- sum(DifferenceSquaredFunc(SumOSquares, MeanforSum))
  return(DifferenceforSum)
}

#This is now tested with the data from lab 07 on github. 
SumofSquare(DataLab07)

