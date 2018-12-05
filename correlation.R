
#taking satisfaction as an integer
#str(df)

df$Satisfaction <- as.integer(df$Satisfaction)

#df<-na.omit(df)
library(ggcorrplot)
and replace : corrplot(M, type ="upper", method=’color’)
with: ggcorrplot(M)
