#Lab 5. Loops and conditionals
setwd("Desktop/EBIO4420/Compbiolabs_homework/Labs/Lab05/") #Set the working directory to be in Lab05 
#Step 1. Creating a basic conditional to test if 11 is bigger than five
x <- 11  #The number randomly chosen
threshold <- 5  #This is the number to see if the number I chose is bigger than the threshold 
if (x > threshold ){
  print(paste("x is larger than", threshold))
}

#Importing ExampleData.csv from Lab 5. 
str(ExampleData) #This checks to see what this data is, specifically we see it is a list, not a vector. 
typeof(ExampleData)  #This gives details of the data frame, and showing it is in fact a data frame. 
ExampleDataVector <-ExampleData$x  #This will make the list into a vector! 
str(ExampleDataVector) #Here we are checking to see that this is in fact a vector.

#Step 2a 
threshold2a <- 0  #Establishing the threshold for checking if values are not negative
#Below is a for loop for ensuring that every data point less than zero is assigned a value of NA 
for (i in 1:length(ExampleDataVector)){
  if (ExampleDataVector[i] < threshold2a){
    ExampleDataVector[i] <- NA
  }
}
list(ExampleDataVector) #This is quick check for me to see if NA replaced those negative elements, omitted 1024 entries since it was so big

#Step 2b. Replace all the NA values in ExampleDataVector for NaN (not a number)
logicalvec2b <- is.na(ExampleDataVector)
NatoNanChangers <- which(logicalvec2b)
ExampleDataVector[NatoNanChangers] <- NaN
  
#Step 2C. Here we are changing all the NaNs to zeros. 
NaNPlaceVector <- which(is.nan(ExampleDataVector)) #Here we are idnetifiying which places in the ExampleDataVector house a NA, from that we are storing that into another vector with all these positions in the vector
ExampleDataVector[NaNPlaceVector] <- 0

#Step 2d. Determine how many values in the ExampleDataVector fall between 50 and 100
Upperlimit <- 100 #Upperlimit of 100 in example data objects
LowerLimit <- 50 #Lowerlimit of 50 in example data objects
Number50to100 <- length(which (between (ExampleDataVector, LowerLimit, Upperlimit)))
Number50to100 <- length(which(ExampleDataVector >= 50 & ExampleDataVector <= 100))

#Step 2e. Create a new vector that is made up of all the numbers from 50 to 100. 
FiftyToOneHundred <- ExampleDataVector[which(ExampleDataVector >= 50 & ExampleDataVector <= 100)]

#Step 2f. Write it as a CSV. However, using default settings as below.  
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")


#Step 3
#Import the CO2 emissions data, done from the files tab in RStudio
#The data represents CO2 emissions, I'm guessing in millions of tons from different sources in a timespan from 1751 to 2013. There is an increase in every category, especially gas.

#Step3a. Find the first year in which gas emissions were non zero 
CO2_data <- CO2_data_cut_paste
nonzerogas <- which(CO2_data[,3] > 0)  #Here we are finidng the position in column 3 in which it was above zero and putting that into a vector
firstyear_nonzero_gas_position <-nonzerogas[1]  #We take the first value of that vector to find the first year it was non zero 
year_firstyear_nonzero_gas <- CO2_data[firstyear_nonzero_gas_position, 1]


#Step 3b. Calculating which years were total emissions between 200 and 300 million metric tons of carbon
UpperCO2Limit <- 300  #Million metric tons
LowerCO2Limit <- 200  #Million metric tons
Positions200to300 <- which(CO2_data[ ,2] > LowerCO2Limit & CO2_data[ ,2] < UpperCO2Limit)
years_200to300total_output <- CO2_data[Positions200to300, 1]



#Part 2. Loops and conditional in biology#
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators 
  
#Overview of population dynamics: (r * n[t-1]) is the growth of prey. r is the intrinsic growth rate. n[t] is abundance of the prey population at time t. 
#They decrease due to predators by (a * n[t-1] * p[t-1]). a is the attack rate. 
#Predators increase by the consumption of prey (k * a * n[t-1] * p[t-1]). k is a coversion constant of prety into predator through biomass
#Predators die at a constant mortality rate, (m * p[t-1])

#Step 2, create vectors to later populate
time_vector <- c(1 : totalGenerations)  
prey_population <- rep(0, totalGenerations)  #Emptry prey vector to populate later
predator_population <- rep(0, totalGenerations)  #Empty predator vector to populate later
prey_population[1] <- initPrey  #Set the first value as the starting popultion
predator_population[1] <- initPred  #Set the first value as the starting popultion

#3rd and 4th step. Below is the for loop for calculating the predator and prey populations as time passes and they affect one another. Negative numbers are made to be zero. 
for(i in 1:(totalGenerations-1)){
  prey_population[i + 1] <- prey_population[i] + (r * prey_population[i]) - (a * prey_population[i] * predator_population[i])
  predator_population[i + 1] <- predator_population[i] + (k * a * prey_population[i]) - (m * predator_population[i])
  if(prey_population[i] < 0){
    prey_population[i] <- 0
  }
  if(predator_population < 0){
    predator_population <- 0
  }
}
print(prey_population)
print(predator_population)

#Step 5. A plot is made of prey and predator abundance over time. It is a bit difficult to see the predator progression with prey in the same graph. 
plot(time_vector, prey_population)
points(time_vector, predator_population)
lines(time_vector, predator_population)

#A final matrix is created of the final results and subsequently turned into a csv. 
myresults <- matrix(0L, nrow=totalGenerations, ncol=3)
colnames(myresults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
myresults[,1] <- time_vector
myresults[,2] <-prey_population
myresults[,3] <- predator_population

write.csv(x = myresults, file = "PredPreyResults.csv")
