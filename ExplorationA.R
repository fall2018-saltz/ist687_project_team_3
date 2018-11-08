
library(dplyr)
library(ggplot2)
###############################################
#Exploring based on flight Status
###############################################
df1<- df %>% 
        #filter(Flight.cancelled=='0') %>%
        group_by(Airline.Status) %>%
        summarise(n=n(),mean= mean(as.numeric(Satisfaction)),sd= sd(as.numeric(Satisfaction))
                  ,max= max(as.numeric(Satisfaction)),min= min(as.numeric(Satisfaction)))
#plotting Satisfaction based on airlineStatus
plot1 <- ggplot(df,aes(Airline.Status,fill=Satisfaction))+
                    geom_bar(position='fill')
#NOTE - in R studio the graph is coloured properly based on Satisfaction
