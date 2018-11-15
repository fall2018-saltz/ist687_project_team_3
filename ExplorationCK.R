
clean_data
#Histogram for eating and drinking variable
hist(myData$Eating.and.Drinking.at.Airport, breaks = 20, xlab = "Eating/Drinking at Airport" main = "Histogram Eating and Drinking At Airport")
#Histogram for day of month
hist(myData$Day.of.Month, breaks = 20,xlab = "Day of Month", main= "Histogram Day of the Month")
#Histogram for scheduled depature hour variable
hist(myData$Scheduled.Departure.Hour, breaks = 10, xlab = "Departure Hour", main= "Histogram Depature Hour")
#Histogram for depature delay in minutes
hist(myData$Departure.Delay.in.Minutes, breaks = 15,xlab = "Delay in Minutes", main= "Histogram Depature Delay")

attach(myData)

#Scatter plot of eating and drinking at airport against Satisfaction
plot(Satisfaction, Eating.and.Drinking.at.Airport)
plot(Satisfaction, Scheduled.Departure.Hour)
plot(Satisfaction, Day.of.Month)
plot(Satisfaction, Departure.Delay.in.Minutes)
plot(Satisfaction, Class)


