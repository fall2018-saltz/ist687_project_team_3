
library(dplyr)
library(ggplot2)
###############################################
#Exploring based on flight Status
###############################################
df$Satisfaction <- as.factor(as.character(df$Satisfaction))
df1<- df %>% 
        #filter(Flight.cancelled=='0') %>%
        group_by(Airline.Status) %>%
        summarise(n=n(),mean= mean(as.numeric(Satisfaction)),sd= sd(as.numeric(Satisfaction))
                  ,max= max(as.numeric(Satisfaction)),min= min(as.numeric(Satisfaction)))
#plotting Satisfaction based on airlineStatus
plot1 <- ggplot(df,aes(as.character(Airline.Status),fill=Satisfaction))+geom_bar(position='fill')
#NOTE - in R studio the graph is coloured properly based on Satisfaction

#looking at Satisfaction = 5
df2<-df %>%
      #filter(Satisfaction==5)%>%
      group_by(Airline.Status) %>%
      summarise(ratio=sum(Satisfaction==5)/n())
#this shows that for higher airline status people are more likely to give 5 rating.

###############################################
#Exploring based on Age column
###############################################

#summary(df$Age)
plot2<-ggplot(df,aes(x=Age,fill=Satisfaction))+
        geom_bar(position='fill')
df3 <- df[df$Age<21,]
mean1<- mean(df3$Age)
df4 <- df[between(df$Age,21,40),]
mean4<- mean(df4$Age)
df5 <- df[df$Age>=40,]
mean5<- mean(df5$Age)
#the middle age group is more likely to give higher rating compared to others

###############################################
#Exploring based on Gender
###############################################

df6<-df %>%
    group_by(Gender)%>%
    summarise(probability= sum(Satisfaction==5)/n())
#males are more likely to give higher ratings 

#plotting Satisfaction based on Gender
plot3 <- ggplot(df,aes(x=Gender,fill = Satisfaction))+
            geom_bar(position='fill')
# men easily give higher Satisfaction comapred to female
###############################################
#Exploring based on Price Senisitivity
###############################################   

plot4<- ggplot(df,aes(as.numeric(as.character(Price.Sensitivity)),fill=Satisfaction))+
  geom_bar(position= 'fill')+
  xlab('Price Sensitivity')+
  ylab('values')         
# From the plot it can be seen that higher price Sensitivity worsen the Satisfaction of the customer        
###############################################
#Exploring based on year of first flight
############################################### 

plot5<- ggplot(df,aes(Year.of.First.Flight,fill=Satisfaction))+
  geom_bar(position= 'fill')+
  ylab('values')
  # From the plot it can be seen that there is not much difference based on 
#when was the first flight was taken

str(df)

df%>%
