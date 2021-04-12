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

#MAKE A HUGE PIPE OUT OF IT

ColoradoDataBeforeMay <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%    #The next step is just working on a single column, that can be tough
  mutate( Date = strptime(Date, format = "%m/%d/%Y", tz = "")) %>% #We are using the mutate function, to add change, transform columns of a data frame. if we used stateStat$Date, it wouldnt work since its working with the original dataframe
  arrange(Date) %>%
  filter(Date < dt)

str(stateStatsData)
names(stateStatsData)    
  
