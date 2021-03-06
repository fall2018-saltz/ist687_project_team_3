
df<-raw_data
# Encoding categorical variables
df$Gender = factor(df$Gender,
                         levels = c('Female','Male'),
                         labels = c(0, 1))
df$Airline.Status =  factor(df$Airline.Status,
                           levels = c('Blue', 'Silver','Gold','Platinum'),
                           labels = c(0, 1, 2, 3))
df$Type.of.Travel =  factor(df$Type.of.Travel,
                           levels = c('Business travel', 'Personal Travel','Mileage tickets'),
                           labels = c(0, 1, 2))
df$Class =  factor(df$Class,
                  levels = c('Business','Eco', 'Eco Plus'),
                   labels = c(0, 1,2))
df$Flight.cancelled = factor(df$Flight.cancelled,
                             levels = c('No','Yes'),
                             labels = c(0, 1))
df$Arrival.Delay.greater.5.Mins = factor(df$Arrival.Delay.greater.5.Mins,
                             levels = c('no','yes'),
                             labels = c(0, 1))

#removing erroneuous rows/ outliers(df$Satisfaction)
keep <- c("1","2","3","4","5")
df <- df[df$Satisfaction %in% keep,]
df$Satisfaction<- as.factor(df$Satisfaction)

#seprating date into months and inserting new coloumn as month
temp<-as.Date(df$Flight.date,"%m/%d/%y")
df$Flight.month <- as.factor(format(temp,"%m"))
#now removing df$flight.date
df$Flight.date <- NULL

head(df,2)
