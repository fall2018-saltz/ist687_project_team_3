
#taking satisfaction as an integer
#str(df)

df$Satisfaction <- as.integer(df$Satisfaction)

#df<-na.omit(df)
library(ggcorrplot)
# corrplot(M, type ="upper", method=’color’)
ggcorrplot(M)
