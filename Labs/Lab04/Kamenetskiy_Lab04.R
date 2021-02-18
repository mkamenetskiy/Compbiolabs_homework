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

#Lab step 3. Population loop
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

for (i in 1:years){
  population <- population + ( r * population * (K - population)/K )
  print(population)
}

zero_vector[i +1] <- zero_vector[i]

#Part 2. Practicing for loops and storing data produced by loops in arrays
zero_vector <- rep(0, 18) #Step 5a, creating a vector with 18 zeros in order to create a vector increasing by threes
#Ste[ 5b. Created a for lopp where it added 3 to every new variable from the last one. Tried zero_vector[i + 1] <- zero_vector[i] but that added an extra 54 to the end. 
for (i in seq(1,18)){
  zero_vector[i] <- zero_vector[i] + 3 * i
  print(zero_vector)
}

newzero_vector <- rep(0, 18) #Step 5c making a vector of zeros with the first value of one
newzero_vector[1] <- 1
for (i in seq(1,17)){
  newzero_vector[i+1] <- 1 + 2 * newzero_vector[i]
  print(newzero_vector)
}

#Step 6. Writing the fibonacci sequence in a for loop. 
fib_zero_vector <- rep(0, 20)
fib_zero_vector[2] <- 1
for (i in seq(1,18)){
  fib_zero_vector[i+2] <- fib_zero_vector[i+1] + fib_zero_vector[i]
  print(fib_zero_vector)
}

#Step 7. From step 4, taking the population output and putting it against time. 
population <- 2500 #This is the starting population of 2500 individuals 
K <- 10000  #This is the carrying capacity 
r <- 0.8  #The intrinsic growth rate of the population
years <- 12  #This is the relevant time frame
population_vector <- rep(0,years)
population_vector[1] <- population


for (i in 1:(years-1)){
  population_vector[i+1] <- population_vector[i] + ( r * population_vector[i] * (K - population_vector[i])/K )
  print(population_vector)
}
time <- seq(1,12)
abundance <- population_vector
plot(time, abundance)
