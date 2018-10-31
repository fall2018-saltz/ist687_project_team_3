
library(dplyr)
#plotting Satisfaction based on airlineStatus
plot1 <- ggplot(df,aes(Airline.Status,fill=Satisfaction))+
                geom_bar()

df1<-    df %>% 
        filter(Satisfaction=='1') 
        
                
plot2 <-
