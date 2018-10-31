
#plotting Satisfaction based on airlineStatus
plot1 <- ggplot(df,aes(Airline.Status,fill=Satisfaction))+
                geom_bar()
plot2 <- 
