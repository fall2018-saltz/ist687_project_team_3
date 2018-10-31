
library(dplyr)
#summarizing dataframe
df1<- df %>% 
        filter(Flight.cancelled=='0') %>%
        group_by(Airline.Status) %>%
        summarise(n=n(),mean= mean(as.numeric(Satisfaction)),sd= sd(as.numeric(Satisfaction))
                  ,max= max(as.numeric(Satisfaction)),min= min(as.numeric(Satisfaction)))
df1
#plotting Satisfaction based on airlineStatus
#plot1 <- ggplot(df,aes(Airline.Status,fill=Satisfaction))+
#                geom_bar()


#looking at Satisfaction = 5
#df2 <- df %>%
#        filter(Satisfaction=='5')%>%
#        group_by(Airline.Status) %>%
#        summarise(n=n())
#df2       
