"Lab 11"
#We downloaded the data from DataDyrad and opened it from the directory of R
#We had to save and convert one of the pages

GlobalWoodData <- Data_Table_1
#Below we are renaming column 4 to wood density
colnames(GlobalWoodData)[4] <- "Wood Density"
#Below we are indentifying if any of the values in column four (wood density) has any values of na
BadRow <- (is.na(GlobalWoodData[,4]))
which(BadRow)
#Data item 12150 has an NA value in its dataset, so we are subtracting or deleting that row from the dataframe
GlobalWoodData <- GlobalWoodData[ -(which(BadRow)), ]

#Now we are checking to see if there are NA values. In return we get integer(0) which means no True values were found
CheckBadRow <- (is.na(GlobalWoodData[,4]))
which(CheckBadRow)  

#STEP 5
#Now we have the complicated stuff. We want to condense all of the species from column three.  
#In the column Binomial, species' sceintific names are given. One way to do this is finding the average of each speacies' density measures

#The first step is to have each species listed only once. This is conensing the list. 
#The hint suggests the summarise() function from dplyr: summarize(.data, ..., groups= NULL)
#But first I think we should do a group_by function. group_by(.data, ..., add=FALSE) (false if you want thr group to replace )

GlobalWoodData <- group_by(GlobalWoodData[3]) #This did not group nor did it do anything it was supposed to 
   summarize(avg_WoodDensity = mean(GlobalWoodData[4])) # I tried to pipe this afterward and was left with an odd message
                                                                  
GlobalWoodData %>% group_by(GlobalWoodData[3]) %>% summarise(avg_woodDensity = mean(GlobalWoodData[4]))
#The above is the syntax used in the following youtube:https://www.youtube.com/watch?v=R0Ec6NiSgGM, it printed out a result but all the avg wood density is now NA.

#Alright, it's been a sad hour of reading through lots of jargon and watching youtube videos. I'm throwing in the towel! 

