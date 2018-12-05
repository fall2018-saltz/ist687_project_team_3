
setwd("D:/ADS/IST 687/project")
df <-read.csv("Satisfaction Survey.csv")
df$Satisfaction <- as.integer(as.character(df$Satisfaction))

library(corrplot)
df<-na.omit(df)
M <- cor(df[c(1,3,5,6,7,8,10,11,12,14,22,23,24,26,27)])
corrplot.mixed(M, method = "color",type='upper')
