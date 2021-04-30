setwd("~/Desktop/EBIO4480/CompBio_on_git/Datasets/COVID-19/CDPHE_Data/CDPHE_Data_Portal/")

stateStatsData <- read.csv("DailyStateStats2/CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F)
names(stateStatsData) 
str(stateStatsData)
summary(stateStatsData)
unique(stateStatsData$Name)
unique(stateStatsData$Desc_)
table(stateStatsData$Name)

# 1. subset the data so that we only keep the rows where the text in the column (variable) named "Name" is "Colorado"
ColoradoData <- filter(stateStatsData, Name == "Colorado") #This filtered out all of the notes! 

# 2. subset to keep (select) only the columns "Date", "Cases", and "Deaths"
substateStats <-stateStatsData %>%
  select("Date", "Cases", "Deaths")   #This gives us just the date, cases and deaths



# 3. change the data in the "Date" column to be actual dates rather than a character
stateStatsData$Date <- strptime(stateStatsData$Date, format = "%m/%d/%Y", tz = "")

# 4. sort the data so that the rows are in order by date from earliest to latest
new <- substateStats %>% 
  arrange(Date)

# 5. subset the data so that we only have dates prior to May 15th, 2020
stateStatsData$Date <- as.POSIXlt(stateStatsData$Date, format = "%m/%d/%Y", tz = "")
dt <- as.Date("2020-05-15")
index <- which(as.Date(stateStatsData$Date) < dt)
priorDates <- stateStatsData[index , ]


mdy(stateStatsData[3])
strptime(stateStatsData[3], format= '%m/ %d/ %Y' )

which(is.na(stateStatsData[3]))

datesTimesParsed <- parse_date_time (x= stateStatsData$Date,
                               orders = c("mdY"))

library(dplyr)
library(ggplot2)

#MAKE A HUGE PIPE OUT OF IT
#Here we had a hiccup with using the pipleline instead of using > we used just a simple / 

ColoradoDataBeforeMay <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%    #The next step is just working on a single column, that can be tough
  mutate( Date = strptime(Date, format = "%m/%d/%Y", tz = "")) %>% #We are using the mutate function, to add change, transform columns of a data frame. if we used stateStat$Date, it wouldnt work since its working with the original dataframe
  arrange(Date) %>%
  filter(Date < dt)

#Pipe copy and pasted from Sam's email, since the above wasnt working. Looks like I had altered the state stat data and that is why the pipeline would not work
ColoradoDataSam <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = strptime( Date, format = "%m/%d/%Y", tz = "") ) %>%
  arrange( Date ) %>%
  filter( Date < as.POSIXlt("2020-05-15") ) # dt defined above

#Can also change it so it looks a little more friendly than before. 
ColoradoDataSamDate <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = mdy(Date))  %>%
  arrange( Date ) %>%
  filter( Date < as.Date("2020-05-15") )

str(stateStatsData)
names(stateStatsData)    



#LAB12 
#Notes from Sam during lecture: p <- ggplot() + ... p <- p + geom_ ... This could help make successive plots
#Part 2 after making the pipeline, includes making a ggplot out of the data. 
ggplot(data = ColoradoDataBeforeMay) #Before I even do this, I see that ColoradoDataBeforeMay has no objects in it...
#We fixed it by changing the original data 
 
#Now we begin with ggplot, and I already forgot how to do everything...
#The first plot is a cases vs date plot 
TestPlot <- ggplot(data = ColoradoDataSamDate, 
       mapping = aes(x= Date, y = Cases)) +
         geom_point()
#It claims that Cases was not found?? Hmm. This is tough. 


TestPlot


  
