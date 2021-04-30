###############
require(ggplot2)
require(dplyr)

###################
#Independent Project Rita Kamenetskiy
###################

#The first step is to create a vector of the country names of Latin America. 
LatinAmericanCountries <- c("Mexico", "Guatemala", "Honduras", "El Salvador", "Nicaragua", "Costa Rica", "Panama", "Colombia", "Venezuela", "Ecuador", "Peru", "Bolivia", "Brazil", "French Guiana", "Paraguay", "Chile", "Argentina", "Uruguay", "Cuba", "Haiti", "Dominican Republic", "Puerto Rico")
class(LatinAmericanCountries) #The class is of characters, seeing they are all country names
length(LatinAmericanCountries) #The total amount of countries are 22
  

# Now we are going to create a data frame with useful information for further analysis. This includes population of each of the Latin American Countries. This will be from 2000 and up. 
setwd("~/Desktop/EBIO4420/Independent_Project")
AllCountryPopulation <- read.csv("WorldBankPopulation.csv")
#We see that the data frame of all countries' populations throughout the years is a bit off. The fourth row should be the header, something that we fix below. The only information taken out of the removal of the first three rows was that it's most recent update was on 2021-03-19. 
AllCountryPopulation <- AllCountryPopulation[-c(1, 2, 3), ] #This is the deletion of the first three empty rows
names(AllCountryPopulation) <- as.matrix(AllCountryPopulation[1, ]) #We then begin assigning the first row as the header, taken from the advice of stack exchange : https://stackoverflow.com/questions/23209330/how-to-change-the-first-row-to-be-the-header-in-r
#It seems that just doing this was enough! We then delete the first row that is a repeat of the header 
AllCountryPopulation <- AllCountryPopulation[-c(1), ]
#Now the countries must be narrowed down to the Latin American countries defined above. Only the rows with the names matching those of the vector LatinAmericanCountries will be retained. 

PositionLACountry <- rep(0, length(LatinAmericanCountries)) #Empty vector for the row positions of Latin American countries 

#Below is a for loop for delegating the position of all of the Latin American countries in the first column. 
for (i in 1:length(LatinAmericanCountries)){
  if(any(LatinAmericanCountries[i] == AllCountryPopulation[ ,1])){ 
    PositionLACountry[i] <- which(LatinAmericanCountries[i] == AllCountryPopulation[ , 1])
  }
  else{
    PositionLACountry[i] <- NA
  }
  print(PositionLACountry)
  print(i)
}

#From this evaluation we see that the following position did not have a match: 
NaPositionLACountry <- which(is.na(PositionLACountry))
length(NaPositionLACountry) #From this we know that there are two positions that are Na! Below we identify them to understand the cause of contention. 
LatinAmericanCountries[NaPositionLACountry[1]]
LatinAmericanCountries[NaPositionLACountry[2]]
#The country was French Guinea, which ironically does not speak Spanish. This pushed for a further evaluation of all the latin american countries listed to ensure they all speak Spanish or Portugese as their main language.
#Haiti's official language is also French. Therefore Haiti and French Guinea are taken out of the Latin American Countries vector.

SpanLatinAmericanCountries <- c("Mexico", "Guatemala", "Honduras", "El Salvador", "Nicaragua", "Costa Rica", "Panama", "Colombia", "Venezuela, RB", "Ecuador", "Peru", "Bolivia", "Brazil", "Paraguay", "Chile", "Argentina", "Uruguay", "Cuba", "Dominican Republic", "Puerto Rico")
#Additionally, the position 9 of the first column was Venezuela. Looking at the dataframe we see that Venezuela was written as Venezuela RB, which was then changed in the Latin American country vector. 

PositionLACountry <- rep(0, length(SpanLatinAmericanCountries))

for (i in 1:length(LatinAmericanCountries)){
  if(any(SpanLatinAmericanCountries[i] == AllCountryPopulation[ ,1])){ 
    PositionLACountry[i] <- which(SpanLatinAmericanCountries[i] == AllCountryPopulation[ , 1])
  }
  else{
    PositionLACountry[i] <- NA
  }
  print(PositionLACountry)
  print(i)
}

length(PositionLACountry) == length(SpanLatinAmericanCountries) #We see the positions filled is the same length as the countries 
any(is.na(PositionLACountry)) #We can also see that none of them are NA, therefore each country was found. 


#Here we are making a new dataframe in which it is only Latin American countries
LACountryPopulation <- AllCountryPopulation[PositionLACountry, ]


#Below we are delegating which columns we would like to keep. Based on the expanse of the data, the time frame will be between 2000 and 2018. 
#We had to revise it to be from 2011 since that was the farthest back the English Proficiency went back to. This will be explored later on. 
CountryNameColumn <- which(colnames(LACountryPopulation) == "Country Name") #This is to make it reproducable based on the column only being country name
MinYear <- which(colnames(LACountryPopulation) == "2011")
MaxYear <- which(colnames(LACountryPopulation) == "2018") #This narrows down the column years to the timeframe of 2011 to 2018. 
LatinAmericanPopulation <- LACountryPopulation[c(CountryNameColumn, MinYear:MaxYear)] 
#Above is a dataframe with just the Latin American Countries and the population of the years we are interested in. 

#PART 2
#The same process will be applied toward the journal output data. Both are from the worldbank and therefore similar techniques will be applied to both. 

#An attempt to donwload the original csv from the worldbank was unsuccessful. The empty columns seemed to interfere with the download. 
# TotalJournalOutput <- read.csv("TotalJournalOutput.csv")  


#This is a download with the empty columns deleted from the original data
AllJournalOutput <- read.csv("TotalJournalOutput2.csv")
#Since this is also from the worldbank, it follows a similar pattern. 
AllJournalOutput <- AllJournalOutput[-c(1, 2, 3), ] #This is the deletion of the first three empty rows
names(AllJournalOutput) <- as.matrix(AllJournalOutput[1, ])
AllJournalOutput <- AllJournalOutput[-c(1), ]

PositionLACountry2 <- rep(0, length(SpanLatinAmericanCountries))
for (i in 1:length(SpanLatinAmericanCountries)){
  if(any(SpanLatinAmericanCountries[i] == AllJournalOutput[ ,1])){ 
    PositionLACountry2[i] <- which(SpanLatinAmericanCountries[i] == AllCountryPopulation[ , 1])
  }
  else{
    PositionLACountry2[i]<- "Na"
  }
  print(PositionLACountry2)
  print(i)
}


#We see here that the values are the same as the poulation statistics! This is a good indicator that it worked the same as the population code. 
PositionLACountry == PositionLACountry2

#Here we are narrowing the dataframe to just Latin American countries and their journal outputs over the years of 2011 and 2018. 
LAJournalOutput <- AllJournalOutput[PositionLACountry2, ]
MinYear2 <- which(colnames(LAJournalOutput) == "2011")
MaxYear2 <- which(colnames(LAJournalOutput) == "2018")
LatinAmericanJournalOutput <- LAJournalOutput[c(CountryNameColumn, MinYear2:MaxYear2)]

LatinAmericanJournalOutput
LatinAmericanPopulation

#Now we want to divide each corresponding data box with the other to get journaloutput/population. So that we get a proportional value of journal output to the population of each country. 
#The two data frames will be: LatinAmericanPopulation and LatinAmericanJournalOutput
JournalOutputPerPopulation <- LatinAmericanJournalOutput[-c(1)]/LatinAmericanPopulation[-c(1)]
JournalOutputPerPopulation <- cbind(JournalOutputPerPopulation, LatinAmericanJournalOutput[c(1)])
JournalOutputPerPopulation
#We want to reorder so that the country list is in the beginning of the data frame
CountryNameColumn2 <- which(colnames(JournalOutputPerPopulation) == "Country Name")
CountryNameColumn2
JournalOutputPerPopulation <- JournalOutputPerPopulation[,c(CountryNameColumn2, 1:8)]
JournalOutputPerPopulation

#Below is the download for the English proficiency. The data parsing for this is expected to be quite difficult. 
#Before this CSV format, all the data was copy and pasted from their yearly data reports. These data reports were not consistent in the way they presented their data. 
#A lot of "human" editing had to be done since applying a code for instance of regular expressions would not have done much in increasing efficiency. 
#Many excel functions were used to parse the original data such as separating the according English Fluency score of country into separate columns. 
EnglishProficiencyRawishDataAsCSV <- read.csv("EnglishProficiencyRawishDataAsCSV.csv")
View(EnglishProficiencyRawishDataAsCSV)
#From first glance the dataframe looks tough. The year corresponds to each country column, which is every other column from 2011 to 2018. 
#The year is not by itself and has an X in front of it. The column names are not ideal either. The "EF"s which stands for english fluency gained a number after each addition.
#From R, we see that there is a total of 16 columns. 

#Let's begin:

#I would like to use the full_join command from dplyr. I'm not sure if it works on columns within the dataframe. 
#FullJoinTest <-  EnglishProficiencyRawishDataAsCSV[c(1-2), ] %>%
#  full_join( EnglishProficiencyRawishDataAsCSV[c(3-4), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(5-6), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(7-8), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(9-10), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(11-12), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(13-14), ]) %>%
#  full_join(EnglishProficiencyRawishDataAsCSV[c(15-16), ]) 
# FullJoinTest This seemed to have accomplished only getting rid of Argentina...



#To have this for loop work, I wanted to make it more clean. I found some functions made by: Yemi Oyeyemi from https://stat.ethz.ch/pipermail/r-help/2010-July/244299.html to creat an even or odd checker. 
is.odd <- function(x) 
  x %% 2 != 0 #This is checking to see if it is odd by seeing if the remainder of dividng x by two will generate a remainder that is not zero. 
is.odd(3)
is.odd(2) #It works! 

. 
#ColumnsRawEF <- 8
#for (i in ColumnsRawEF){
#  if(is.odd(i)){
#  DFYear <- 2010 + i 
#  DFYear <- EnglishProficiencyRawishDataAsCSV[i]
#  DFYear <- EnglishProficiencyRawishDataAsCSV[i + 1]
#  print(DFYear)
#  }
#}
#This did not work... moving on..  

#ColumnsRawEF <- 8
#DFYear<- c(rep(0, (ColumnsRawEF)))
#DFYear

#This is to create a vector of the years 
#for (i in 1:ColumnsRawEF){
 # DFYear[i] <- 2010 + i 
  #print(DFYear)}

#for (i in 1:(ColumnsRawEF*2)){
#  if(is.odd(i)){
#    DFYear[i] <- data.frame(EnglishProficiencyRawishDataAsCSV[,i], EnglishProficiencyRawishDataAsCSV[,(i+1)])
#  }
#  else{
#    print(DFYear }}
#This definitely didn't work for a multitude of reasons. 


#Start again, this for loop did not work. Since the column names could not be allocated individually through the function colnames
#for (i in 1:ColumnsRawEF){
 # if (is.odd(i)){
   # colnames(EnglishProficiencyRawishDataAsCSV) <- c("Country")
 # }
 # else{
 #   colnames(EnglishProficiencyRawishDataAsCSV) <- (2010 + i/2) 
 # }
#}


##########
#Now to get onto things that will work...
#We had to rename the dataframe columns by hand with the colnames function. 

colnames(EnglishProficiencyRawishDataAsCSV) <- c("Country", 2011,"Country", 2012,"Country", 2013, "Country", 2014, "Country", 2015, "Country", 2016, "Country", 2017, "Country", 2018 )


#I think we will have to go about it the long way. This works for this data set, but if the data was a lot bigger, this would not work. 
"2011DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,1], EnglishProficiencyRawishDataAsCSV[,2])
"2012DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,3], EnglishProficiencyRawishDataAsCSV[,4])
"2013DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,5], EnglishProficiencyRawishDataAsCSV[,6])
"2014DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,7], EnglishProficiencyRawishDataAsCSV[,8])
"2015DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,9], EnglishProficiencyRawishDataAsCSV[,10])
"2016DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,11], EnglishProficiencyRawishDataAsCSV[,12])
"2017DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,13], EnglishProficiencyRawishDataAsCSV[,14])
"2018DF" <- data.frame(EnglishProficiencyRawishDataAsCSV[,15], EnglishProficiencyRawishDataAsCSV[,16])

#Here we are assigning each dataframe its according column names. The first column is country and the second is the year with values of EF. 
colnames(`2011DF`) <- c("Country","2011")
colnames(`2012DF`) <- c("Country","2012")
colnames(`2013DF`) <- c("Country","2013")
colnames(`2014DF`) <- c("Country","2014")
colnames(`2015DF`) <- c("Country","2015")
colnames(`2016DF`) <- c("Country","2016")
colnames(`2017DF`) <- c("Country","2017")
colnames(`2018DF`) <- c("Country","2018")


#First we will try to do a pivotlonger!
#LongAttempt <- pivot_longer(EnglishProficiencyRawishDataAsCSV,c('Country', )) #It kinda worked..... but it is definitely not right. Lots of repeats. Not the data in its right form. 
#WidePivotTest <- pivot_wider(LongAttempt, names_from = value, values_from = "2011,2012,2013,2014,2015,2016,2017,2018") #


#Sam's other idea was to do rbind. Rbind for instance can combine data frames
#rbindtest<- rbind(`2011DF`, `2012DF`, `2013DF`, `2014DF`, `2015DF`, `2016DF`, `2017DF`, `2018DF`) This does not work since the rows are not the same


LACountryEF <- bind_rows(`2011DF`, `2012DF`, `2013DF`, `2014DF`, `2015DF`, `2016DF`, `2017DF`, `2018DF`)
LACountryEF
#This is a better dataframe!! Now we have everything where we want it column wise, but now we need to compress the rows 

LACountryEF <- pivot_longer(data = LACountryEF, cols = c("2011","2012","2013","2014","2015","2016","2017","2018"), names_to = "Year", values_drop_na = TRUE) %>%
  arrange(Country, Year) %>%
  mutate(Year = as.integer(Year))
LACountryEF

LACountryEFWide <- pivot_wider(LACountryEF, names_from = Year, values_from = value)

###########################################################
#Now we can begin representing the data through plotting once the actual tidying is done with!
#The two dataframes we will be comparing is LACountryEF and JournalOutputPerPopulation

#First we want to convert the journal output data in long form. 
LAJournalPopPivotLong <- JournalOutputPerPopulation %>%
  pivot_longer(
    cols = starts_with("20"),
    names_to = "Year",
    values_to = "Journal.Proportion") %>%
    mutate(Year = as.integer(Year))
LAJournalPopPivotLong


#What we want to plot: 
#We want to plot how the journal plot increased over time for various countries in Latin America. A general increase would be nice. 
#Also to see a distribution of journal output by country, possilby by taking the mean of the data and making a bar graph from it 
# Finally we would want to see journal output per population against Ef proficiency. English proficiency would be on bottom. 

ggplot(data = LAJournalPopPivotLong, aes( x=Year, y = Journal.Proportion, col = `Country Name`)) +
  geom_point()
ggplot(data = LAJournalPopPivotLong, aes( x=Year, y = Journal.Proportion, col = `Country Name`)) +
  geom_line() +
  ggtitle("Proportional Journal Output Progression in Latin American Countries")

###The above graphs show the evolution of the proportional journal output from 2011 to 2018. 

colnames(LACountryEF) <- c("Country Name", "Year", "English.Proficiency") #This is to make the column names easier for future use in the ggplot function. 
  
ggplot(data = LACountryEF, aes( x=Year, y = English.Proficiency, col = `Country Name`)) +
  geom_line() +
  ggtitle("English Proficiency Progression in Latin American Countries")
#This is the progression of English Proficiency from 2011-2018.


LAJournalPopPivotLong <- LAJournalPopPivotLong  %>%
  arrange(`Country Name`, Year) #This organized it by Country and Year! This will make it possibly easier to compare the two. 

#I wanted to do a specific investigation into Argentina since I travelled there. 
ArgentinaEF <- LACountryEF[1:8,] #We knew it was the first eight rows since it was eight years of the timespan and both are arranged by country. 
ArgentinaPop <- LAJournalPopPivotLong[1:8,]
ArgentinaDF <-cbind(ArgentinaEF, ArgentinaPop[,3]) #This combines it into one dataframe.

plot(ArgentinaDF[,3], ArgentinaDF[,4], main = "Argentina English Proficiency and Journal Ouput")

ggplot(data=ArgentinaDF, aes(x = English.Proficiency, y = Journal.Proportion)) +
  geom_point() +
  ggtitle("Argentina English Proficiency and Journal Output Correlation")



###############
#Below is the evaluation of English Proficiency with Journal Output per Person 
JoinTest <- full_join(LACountryEF, LAJournalPopPivotLong)
NaDeleteColumn3 <- which(is.na(JoinTest[,3]))
JoinTestnoNA <- JoinTest[-c(NaDeleteColumn3),]
NaDeleteColumn4 <- which(is.na(JoinTestnoNA[,4]))
LACountryEFJO <- JoinTestnoNA[-c(NaDeleteColumn4),] 
ggplot(data=LACountryEFJO, aes(x = English.Proficiency, y = Journal.Proportion)) +
  geom_point() +
  ggtitle("All Country English Proficiency and Journal Output Correlation")

TotalCorrelationEFandJournal <- cor(LACountryEFJO[,3], LACountryEFJO[,4])
TotalCorrelationEFandJournal #The correlation between the two is 0.3479. This is a very low correlation, therefore making it futile to run a linear regression analysis. 

#############
#Finishing it up with some mean analysis.  
MeanAnalysisJO <- LAJournalPopPivotLong %>% 
  group_by( `Country Name` ) %>%
  summarise( Journal.Proportion = mean(Journal.Proportion))
MeanAnalysisJO
MeanAnalysisJO[20,1] <- "Venezuela"  #This is to fix the fact that Venezuela was listed as Venezuela RB. 

#This is the mean journal output for each country. 

MeanAnalysisEF <- LACountryEF %>% 
  group_by( `Country Name` ) %>%
  summarise( English.Proficiency = mean(English.Proficiency))
MeanAnalysisEF
#This is the mean english proficiency for each country. 

MeanAnalysisEFJO <- full_join(MeanAnalysisEF, MeanAnalysisJO)
MeanAnalysisEFJO
#Above we combine the two to one dataframe. 

#Below we delete all of the columns with NA. This includes Puerto Rico, Dominican Republic, Paraguay. They were either missing data of journal output or enlgish proficiency. 
MeanNaDeleteColumn2 <- which(is.na(MeanAnalysisEFJO[,2]))
MeanAnalysisEFJO <- MeanAnalysisEFJO[-c(MeanNaDeleteColumn2),]
MeanNaDeleteColumn3 <- which(is.na(MeanAnalysisEFJO[,3]))
MeanAnalysisEFJO <- MeanAnalysisEFJO[-c(MeanNaDeleteColumn3),]


ggplot(data=MeanAnalysisEFJO, aes(x = `Country Name`, y = Journal.Proportion)) +
  geom_bar(stat = "identity")  +
  theme(text = element_text(size=20),
        axis.text.x = element_text(angle=90, hjust=1)) +
  ggtitle("Mean Proportional Journal Output by Country")

ggplot(data=MeanAnalysisEFJO, aes(x= `Country Name`, y = English.Proficiency)) +
  geom_bar(stat = "identity") + 
    theme(text = element_text(size=20),
          axis.text.x = element_text(angle=90, hjust=1)) +
  ggtitle("Mean English Proficiency Score by Country")

#Above are bar graphs with the mean values of journal output and english proficiency. To reformat the country name title on the x axis, I used code from this fellow on stackexchange: https://stackoverflow.com/questions/13297995/changing-font-size-and-direction-of-axes-text-in-ggplot2

#Fin! This was quite hard and gratifying. 
