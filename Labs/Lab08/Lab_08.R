#Step 3. Copy for loop from Lab 4. 
population <- 2500 #This is the starting population of 2500 individuals 
K <- 10000  #This is the carrying capacity 
r <- 0.8  #The intrinsic growth rate of the population
years <- 12  #This is the relevant time frame
population_vector <- rep(0,years) #This is a vector of zeros to store the population each year from the output of the for loop. 
population_vector[1] <- population  #The first value of the empty population_vector will be stored as the starting population. 

#Step 3b and 3c. Here we are creating a function that uses the values of r (intrinsic growth rate) and k(the carrying capacity)
#The output is the population vector throughout the years and a plot of the data. 
LogGrowthFunc <- function(r, K){
  for (i in 1:(years-1)){
    population_vector[i+1] <- population_vector[i] + ( r * population_vector[i] * (K - population_vector[i])/K )
  }
  Time <- seq(1, years)  
  Abundance <- population_vector  #The population vector is stored as a new vector of andundance to give it a nice name on the plot. 
  return(Abundance)
  return(plot(Time, Abundance))
}

#Step 3d. This is calling the function with chosen parameters. We could have used numbers directly or preassigned r and k.
LogGrowthFunc(r, K)

#Step 3e.  Write the data set to a file. Here we are saving the output of the function into a vector of "Abundance"
#There is also a vector which represents the generations passed in years passed. 
#These two columns are put into a data frame and subsequently converted into a csv
Abundance <- LogGrowthFunc(r, K)
Generations <- seq(1, years)  
DataFrameLogGrowth <- data.frame(Generations, Abundance)
write.csv (DataFrameLogGrowth, "~/Desktop/EBIO4420/Compbiolabs_homework/Labs/Lab08/DataFrameLogGrowth.csv")

