
library(dplyr)
myData <- read.csv("clean_data.csv")

#Histogram for eating and drinking variable
hist(myData$Eating.and.Drinking.at.Airport, breaks = 20, xlab = "Eating/Drinking at Airport", main = "Histogram Eating and Drinking At Airport")
#Histogram for day of month
hist(myData$Day.of.Month, breaks = 20,xlab = "Day of Month", main= "Histogram Day of the Month")
#Histogram for scheduled depature hour variable
hist(myData$Scheduled.Departure.Hour, breaks = 10, xlab = "Departure Hour", main= "Histogram Depature Hour")
#Histogram for depature delay in minutes
hist(myData$Departure.Delay.in.Minutes, breaks = 15,xlab = "Delay in Minutes", main= "Histogram Depature Delay")

library(ggplot2)
attach(myData)

#Scatter plot of eating and drinking at airport against Satisfaction
eatingScatterPlot<- ggplot(myData, aes(x=Eating.and.Drinking.at.Airport , y=Satisfaction )) + geom_point()

#Scatter plot of depature delay in minutes against satisfaction
delayScatterPlot<- ggplot(myData, aes(x=Departure.Delay.in.Minutes , y=Satisfaction )) + geom_point()




library(bindrcpp)

#Group the myData dataframe by days of the month
df.GroupBydays <- group_by(myData, Day.of.Month)
#Summarize the grouped classes by averaging the satisfaction for each of them
groupedDays <- summarize(df.GroupBydays, count = n(), Satisfaction = mean(Satisfaction, na.rm = TRUE))


#Create a ggplot with x being the day of the month number and y being the average satisfaction for each of those days
monthBarChart <- ggplot(groupedDays, aes(x=Day.of.Month, y=Satisfaction)) + geom_col()
#Add a title called Satisfaction Rating by Day of Month
monthBarChart <- monthBarChart + ggtitle("Satisfaction Rating by Day of Month")
#Display the bar chart
monthBarChart


#Group the myData dataframe by Class
df.GroupByClass <- group_by(myData, Class)
#Summarize the grouped classes by averaging the satisfaction for each of them
groupedClass <- summarize(df.GroupByClass, count = n(), Satisfaction = mean(Satisfaction, na.rm = TRUE))

#Create a ggplot with x being the class number and y being the average satisfaction for each of those classes
classBarChart <- ggplot(groupedClass, aes(x=Class, y=Satisfaction)) + geom_col()
#Add a title called Satisfaction Rating by Class
classBarChart <- classBarChart + ggtitle("Satisfaction Rating by Class")
#Display the bar chart
classBarChart


#Group the myData dataframe by scheduled departure hour
df.GroupByHour <- group_by(myData, Scheduled.Departure.Hour)
#Summarize the grouped scheduled departure hours by averaging the satisfaction for each of them
groupedHour <- summarize(df.GroupByHour, count = n(), Satisfaction = mean(Satisfaction, na.rm = TRUE))

#Create a ggplot with x being the scheduled depature hour from 0:00 to 24:00 and yo being the average satisfaction for each of those hours
scheduledBarChart <- ggplot(groupedHour, aes(x=Scheduled.Departure.Hour, y=Satisfaction)) + geom_col()
#Add a title called Satisfaction by Scheduled Depature Hour
scheduledBarChart <- scheduledBarChart + ggtitle("Satisfaction by Scheduled Depature Hour")
#Display the bar chart
scheduledBarChart



