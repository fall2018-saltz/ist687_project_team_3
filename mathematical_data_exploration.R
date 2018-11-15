
##################################################################
# Use this block comment at the top of each R code file you submit
# Project – Submitted by Yao Wang on October 31, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.
# IST 687. Due is ??, 2018
library(ggplot2)
library(stats)
library(graphics)
df <- mathematical_exploration
# Percentage of satisfaction values for different travel types
BusinessTravel <- tapply(df$Type.of.Travel=="0", df$Satisfaction, sum)
PersonalTravel <- tapply(df$Type.of.Travel=="1", df$Satisfaction, sum)
MileageTickets<- tapply(df$Type.of.Travel=="2", df$Satisfaction, sum)
newdf <- data.frame(BusinessTravel,PersonalTravel,MileageTickets)
newdf
# newdf <- do.call(rbind,newdf)
# newdf

library(RColorBrewer)
coul = brewer.pal(5, "Pastel2") 

data_percentage <- apply(newdf, 2, function(x){x*100/sum(x,na.rm=T)})
barplot1 <- barplot(data_percentage, col=coul , border="white", xlab="group")
mtext(text = "Percentage", side = 2, line = 3, cex = 1.2, adj = 0.5)
legend.text=c("1","2","3", "4", "5")
legend(x = "right", legend.text
       , fill = coul,box.col="transparent", bg="transparent"
       ,bty="n", inset=c(-0.08,0), xpd = TRUE)

# 2. Shopping.Amount.at.Airport, colored scatterplot
library(plotly)
#scatterplot1 <- plot_ly(df, x = ~Shopping.Amount.at.Airport, y = ~Satisfaction, type="scatter", text = paste("Shopping.Amount: ", df$Shopping.Amount.at.Airport),
          mode = "markers", color = ~Shopping.Amount.at.Airport, size = ~Shopping.Amount.at.Airport)
#scatterplot1
