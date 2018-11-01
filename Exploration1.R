
library(dplyr)
library(ggplot2)
#summarizing dataframe
df1<- df %>% 
        #filter(Flight.cancelled=='0') %>%
        group_by(Airline.Status) %>%
        summarise(n=n(),mean= mean(as.numeric(Satisfaction)),sd= sd(as.numeric(Satisfaction))
                  ,max= max(as.numeric(Satisfaction)),min= min(as.numeric(Satisfaction)))
#plotting Satisfaction based on airlineStatus
plot1 <- ggplot(df,aes(Airline.Status,fill=Satisfaction))+
                    geom_bar()
#in R studio the graph is coloured properly based on Satisfaction

#looking at Satisfaction = 5
df2<-df %>%
      #filter(Satisfaction==5)%>%
      group_by(Airline.Status) %>%
      summarise(ratio=sum(Satisfaction==5)/n())
#this shows that for higher airline status people are more likely to give 5 rating.

#Exploring Age column
#summary(df$Age)

plot2<-ggplot(df,aes(x=Age[which(Satisfaction==1)],y=Satisfaction[which(Satisfaction==1)]))+
        geom_jitter()
df3 <- df[df$Age<21,]
mean1<- mean(df3$Age)
df4 <- df[between(df$Age,21,40),]
mean4<- mean(df4$Age)
df5 <- df[df$Age>=40,]
mean5<- mean(df5$Age)
#the middle age group is likely to give higher rating compared to others

# Exploring Gender 
df %>%
    group_by(Gender)%>%
    summarise(mean= mean(Satisfaction))
    
#males are more likely to give higher ratings 
plot3 <- ggplot(df,aes(Gender,fill = Satisfaction)+
            geom_bar()
