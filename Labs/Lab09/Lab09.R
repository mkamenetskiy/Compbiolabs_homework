#Goal of this lab: To seek patterns, and to problem solve date and time obstacle 

#Preliminary Step: Importing the camera trap data file 
CameraData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
#The data was imported with stringasfactors = F
#A problem that arises is that the last column is date and time in which we must convert this string into an actual object

#Here we are playing around with some of the date files
?strptime
smallDateTime <- CameraData$DateTime[1:5]
singleDate <- CameraData$DateTime[1]
anotherDate <- CameraData$DateTime[3]
#The following functions do not work without a format
strptime(singleDate)
as.Date(singleDate)

#Here I wanted to make a single function for using as.date with a format so as not to rewrite it
ConvertDateFile <- function(x){
  as.Date(x, format= '%d/ %m/ %Y' )
}
ConvertDateFile(singleDate) #It worked but did not include the time
#It works by itself as well!
as.Date(anotherDate, format= '%d/ %m/ %Y')
#Using this function we would probably have to make a whole separate column for just date in R

#Here we see using strptime does a better job of including date and time 
strptime(anotherDate, format= '%d/ %m/ %Y %H:%M' )
#I would like to put into a function because that makes me feel cooler

ConvertDateTime <- function(x){
  strptime(anotherDate, format= '%d/ %m/ %Y %H:%M' )
}

#Let's see how it works with more than one data file
ChangedSmallDateTime <- ConvertDateTime(smallDateTime)
ChangedSmallDateTime
#This definitely did not work. It is not worth it to feel cooler. 

#Looks like not putting it into a function did it better. Below, the date and time has been reformatted and the time is in mountain time
smallDateTime <- strptime(smallDateTime, format= '%d/ %m/ %Y %H:%M' )
smallDateTime


#Let's try lubridate? 
install.packages("lubridate")
dmy_hm(anotherDate) #This did not seem to work for some reason, the function was not found
#I tried to reinstall the package but it did no do much. 



#Now we will try it on the whole data set
strptime(CameraData[,6], format= '%d/ %m/ %Y %H:%M') #Sticking to strptime seemed to work just fine in working out the data set!
#Once we try to save this data into the column it doesn't seem to work. 

CameraData[,7] <- strptime(CameraData[,6], format= '%d/ %m/ %Y %H:%M')
#Here we try to save it to a seventh column, with no luck. However the strptime function prints out in the console just fine. 

CameraDataColumn6 <- strptime(CameraData[,6], format= '%d/ %m/ %Y %H:%M')
#Upon further inspection, things came out really weird. 

#Alas, I'm a bit stuck and I expect it is an easy fix with doing a function on a column in the data frame. The function works just fine before the step of actually saving the changed data into the existing column. 
#The warning message is as follows: In `[<-.data.frame`(`*tmp*`, , 7, value = list(sec = c(0, 0, 0,  : provided 11 variables to replace 1 variables
#I attempted to look up examples of functions on dataframes and got a bit lost




