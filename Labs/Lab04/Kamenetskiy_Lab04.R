#Lab 4 step 1: Print word "hi" to console 10 times
for (i in 1:10){
  print("hi")
}

#Lab step 2, Evaluating Tim's allowance after 8 weeks of allowance and expenditures
piggybank <- 10  #in dollars, starting balance of ten
allowance <- 5  #in dollars, awarded weekly 
gumcost <- 2 * 1.34  #cost of two packs, spent weekly 
weeks <- 8  #Relevant timeframe of 8 weeks 

for ( i in 1:weeks){
  piggybank <- piggybank + allowance -gumcost
  print(piggybank)
}

#Lab step 3. Population loop where we find out the population after 7 years with a 5% annual shrink. 
population <- 2000  #Initial population of 2000 individuals
shrink <- 0.05  #The population will shrink by 5% each year 
years <- 7  #Relevant time frame of 7 years 
for( i in 1:years){
  population <- population - population * shrink
  print(population)
}

#Lab step 4. Growth equation and population
population <- 2500 #This is the starting population of 2500 individuals 
K <- 10000  #This is the carrying capacity 
r <- 0.8  #The intrinsic growth rate of the population
years <- 12  #This is the relevant time frame
#This is a loop in which we can calculate the decay of the population after 17 years with it printing the steps to get there
for (i in 1:years){
  population <- population + ( r * population * (K - population)/K )
  print(population)
}

#Part 2 of Lab 4. Practicing for loops and storing data produced by loops in arrays
#Lab Step 5. Practicing array indexing with for loops
zero_vector <- rep(0, 18) #Step 5a, creating a vector with 18 zeros in order to create a vector increasing by threes
#Step 5b. Created a for loop where it added 3 to every new variable from the last one. Tried zero_vector[i + 1] <- zero_vector[i] but that added an extra 54 to the end. 
for (i in seq(1,18)){
  zero_vector[i] <- zero_vector[i] + 3 * i
  print(zero_vector)
}

#Step 5c making a vector of zeros with the first value of one. Then making a for loop to make a vector where the vector is equal to one plus twice the value of the previous entry
newzero_vector <- rep(0, 18) #This is the array of 18 zeros 
newzero_vector[1] <- 1  #This is establishing the first variable as one in the vector
#This is the for loop where the vector equals one plus twice the previous value in the vector starting at 1
for (i in seq(1,17)){
  newzero_vector[i+1] <- 1 + 2 * newzero_vector[i]
  print(newzero_vector)
}

#Step 6. Writing the fibonacci sequence in a for loop! 
fib_zero_vector <- rep(0, 20)  #Here is a vector of 20 zeros 
fib_zero_vector[2] <- 1  #The second value in the sero vector is one. 
#This is the for loop. It is repeated 18 times, since it starts at i+2. The goal of the loop is to add the last value to the current one to get the next one. 
for (i in seq(1,18)){
  fib_zero_vector[i+2] <- fib_zero_vector[i+1] + fib_zero_vector[i]
  print(fib_zero_vector)
}

#Step 7. From step 4, we are taking the population output and putting it against time. Each step of the population decay must be put into a vector. By doing this, it can be plotted against the time vector. 
population <- 2500 #This is the starting population of 2500 individuals 
K <- 10000  #This is the carrying capacity 
r <- 0.8  #The intrinsic growth rate of the population
years <- 12  #This is the relevant time frame
population_vector <- rep(0,years) #This is a vector of zeros to store the population each year from the output of the for loop. 
population_vector[1] <- population  #The first value of the empty population_vector will be stored as the starting population. 

#This is the for loop but instead of the output being the final population value, instead we see the population of each year stored as a value in the vector. 
for (i in 1:(years-1)){
  population_vector[i+1] <- population_vector[i] + ( r * population_vector[i] * (K - population_vector[i])/K )
  print(population_vector)
}
Time <- seq(1,12)  #This is the vector of time. The time is in years, with each step of the vector a new year from 1 to 12. 
Abundance <- population_vector  #The population vector is stored as a new vector of andundance to give it a nice name on the plot. 
plot(time, abundance)  #This is the function needed to put time against abundance on a plot. Time is on the x axis while abundance is on the y. 
