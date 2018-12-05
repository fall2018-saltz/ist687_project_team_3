
#taking satisfaction as an integer
#str(df)

df$Satisfaction <- as.integer(df$Satisfaction)

df<-na.omit(df)
library(ggcorrplot)
M <- df[c(1,3,5,6,7,8,10,11,12,14,22,23,24,26,27)]
# corrplot(M, type ="upper", method=’color’)
ggcorrplot(M)
