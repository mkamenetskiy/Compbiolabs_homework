#Lab Step #3, setting values to variables: chips and guests
chips <- 5
guests <- 8
#Lab Step #5, establishing average number of chip bags per guest
average <- 0.4
#Lab Step 7, calculating leftoever chip bags
chips - average * (guests + 1)

#Part 2
#Lab Step 8, setting vectors for episode rankings
Self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

#Lab step 9, indexing Penny and Lenny's ranking
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Lab Step 10, combining all vectors into a data set 
all_rankings <- cbind(Self, Penny, Lenny, Stewie)
str(PennyIV)
str(Penny)
str(all_rankings)

#Lab step 11, PennyIV resulted in the numerical value of the third value of the vecotr
#Penny resulted in a vector of her rankings in order of the movies
#All_rankings gave an overview from a computer's perspective of all of the rankings

#Lab step 12, creating data frames of all rankings. No observable difference between data.frame and as.data.fram
as_data_frame <- as.data.frame(all_rankings)
data_frame <- data.frame(all_rankings)

#Lab step 13. When you open the result of cbind and that of data frame from the enviornment, there is no difference.
#However, data frame shows you the data set in a comprehensible manner in the console after the direction of str while cbind does not. 
#All dimensions remained the same (from the dim comparison which yielded 9 4), including all values in the order they were in. When we directly compare them through == it shows true for each value, showing they are the same. 
dim(data_frame)
(data_frame)==(all_rankings)
typeof(data_frame)
typeof(all_rankings)
#Additionally, typeof output for data fram is list while for all rankings it is "double".

#Lab Step 14. Making a vector of episode names
Episode_names <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#Lab Step 15. Assigning row names with Episode_names
help("row.names")
row.names(all_rankings) <- Episode_names
row.names(as_data_frame) <- Episode_names
row.names(data_frame) <- Episode_names

#Lab Step 16. Accessing the third row of the matrix in all_ranking
all_rankings[3,]

#Lab Step 17. Accessing fourth column from data_frame
data_frame[,4]

#Lab Step 18 and 19. Accessing my ranking for episode V and Penny's for episode II
data_frame[5,1]
data_frame[2,2]
#Lab step 20 and 21. Accessing everyone's rankings for episode IV-VI, and rankings for episodes II,V, VII
data_frame[4:6,]
data_frame[c(2,4,6),]
#Lab Step 22. Accessing Penny and Stewie rankings for episodes 4 and 6. 
data_frame[c(4,6),c(2,4)]

#Lab Step 23. Switching Lenny's rankings for episodes 2 and 5.  
LennyRanking2 <- 5
LennyRanking5 <- 8
data_frame["V", "Lenny"] <- LennyRanking2
data_frame["II", "Lenny"] <- LennyRanking5

#Lab Step 24. Using column names and rows directly while compaing data frames and cbinds. 
all_rankings["III", "Penny"]
data_frame["III", "Penny"]
#This gives us the same value of 8!

#Lab Step 25. Undoing the switch made in step 23. 
data_frame["V", "Lenny"] <- LennyRanking5
data_frame["II", "Lenny"] <- LennyRanking2
