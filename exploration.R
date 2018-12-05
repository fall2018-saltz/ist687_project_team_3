
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
barplot(data_percentage, col=coul , border="white", xlab="group")
mtext(text = "Percentage", side = 2, line = 3, cex = 1.2, adj = 0.5)
legend.text=c("1","2","3", "4", "5")
legend(x = "right", legend.text
       , fill = coul,box.col="transparent", bg="transparent"
       ,bty="n", inset=c(-0.08,0), xpd = TRUE)

# 2. Shopping.Amount.at.Airport, COLORED SCATTERPLOT
# Charge the plotly library
library(plotly)
scatterplot1 <- plot_ly(df, x = ~Shopping.Amount.at.Airport, y = ~Satisfaction, type="scatter", text = paste("Shopping.Amount: ", df$Shopping.Amount.at.Airport),
          mode = "markers", color = ~Shopping.Amount.at.Airport, size = ~Shopping.Amount.at.Airport)
scatterplot1

# 3.No.of.Flights.p.a.&Satisfaction
# plot(df$No.of.Flights.p.a., df$Satisfaction
#      , main = "Passenger's number of flights and satisfaction"
#      , col = "tomato1")

ggplot(df, aes(x = No.of.Flights.p.a., y =Satisfaction, col =No.of.Flights.p.a.)) + geom_point()

# 4. X..of.Flight.with.other.Airlines
df$Number.of.other.Airlines <- df$X..of.Flight.with.other.Airlines 
ggplot(df, aes(x = Number.of.other.Airlines, y =Satisfaction, col =Number.of.other.Airlines)) + geom_point()

# 5. No..of.other.Loyalty.Cards
ggplot(df, aes(x = No..of.other.Loyalty.Cards, y =Satisfaction, col =No..of.other.Loyalty.Cards)) + geom_point()





# No.of.Flights.p.a.，BARPLOT FOR LIKERT TYPE ITEMS，Likert
# library
library(likert) 
library(ggplot2) 
library(kernlab) 

# Use a provided dataset
data(pisaitems) 
View(pisaitems)
items28 <- pisaitems[, substr(names(pisaitems), 1, 5) == "ST24Q"] 

# Realize the plot
l28 <- likert(items28) 
summary(l28) 
plot(l28)

# Charge the plotly library
library(plotly)

# Let's use the diamonds data set :
d <- diamonds[sample(nrow(diamonds), 1000), ]
d
# Make a basic scatter plot :
p=plot_ly(d, x = ~carat, y = ~price, type="scatter", text = paste("Clarity: ", d$clarity),
          mode = "markers", color = ~carat, size = ~carat)
p






#############################################
# 6. SVM
library(kernlab)
library(jsonlite)
fname <- file.choose()
df <- read.csv(fname, header = TRUE
               , stringsAsFactors = FALSE
               , quote = "\"")
# Create a happy customer variable 
# 2.To focus on predicting happy customers, we need to generate a new column 
# (where overallCustSat is 4 or higher).
df$Satisfaction_happy <- ifelse(df$Satisfaction >3, "happy", "unhappy")
dim(df) 
str(df)
View(df)
# Part C: Create training and test data sets
table(df$Satisfaction_happy)

randIndex <- sample(1:dim(df)[1])
cutPoint2_3 <- floor(2 * dim(df)[1]/3)
cutPoint2_3

trainData <- df[randIndex[1:cutPoint2_3],]
testData <- df[randIndex[(cutPoint2_3+1):dim(df)[1]],]

# 4.Use the dim( ) function to demonstrate that the resulting training data set and 
# test data set contain the appropriate number of cases.
dim(trainData)
dim(testData)

# Step C: Build a Model using ksvm( ) 
# 5.Build a support vector model using the ksvm( ) function using two or three of the variables 
# to predict a happy customer. Once you have specified the model statement and the name of the training data set,
# you can use the same parameters as shown on page 237: kernel= "rbfdot", kpar = "automatic", C = 5, cross = 3, prob.model = TRUE
svmOutput <- ksvm(Satisfaction_happy ~ Type.of.Travel+Shopping.Amount.at.Airport+No..of.other.Loyalty.Cards, data=trainData
                  , kernel ="rbfdot",kpar="automatic",C=5,cross=3
                  ,prob.model=TRUE)

# 7.Store the output of kvsm( ) in a variable and then echo that variable to the console.  
svmOutput
# Support Vector Machine object of class "ksvm" 
# 
# SV type: C-svc  (classification) 
# parameter : cost C = 5 
# 
# Gaussian Radial Basis kernel function. 
# Hyperparameter : sigma =  0.691042999100655 
# 
# Number of Support Vectors : 42843 
# 
# Objective Function Value : -209634.9 
# Training error : 0.241933 
# Cross validation error : 0.242764 
# Probability model included. 


# Part D: Predict Values in the Test Data and Create a Confusion Matrix
# 8.Use the predict( ) function to validate the model against test data. Assuming that you put the output from the 
# ksvm( ) call into svmOutput and that your test data set is in a data frame called testData, the call would be:
# svmPred <- predict(svmOutput, testData, type = "votes")
svmPred <- predict(svmOutput, testData, type = "votes")
View(svmPred)
table(svmPred)
# svmPred
# 0     1 
# 43294 43294 
# 9.Now the svmPred object contains a list of votes in each of its rows. The votes are either for “happy” or “notHappy”. 
# Review the contents of svmPred using str( ) and head( ).
str(svmPred) 
head(svmPred)

# 10.	Create a confusion matrix (a 2 x 2 table) that compares the second row of svmPred to the contents of testData$happy variable.
compTable <- data.frame(testData[,29],svmPred[2,])
table(compTable)
# svmPred.2...
# testData...29.     0     1
# happy           20716  1308
# unhappy          9011 12259
# 11.	Calculate an error rate based on what you see in the confusion matrix. See pages 243-244 for more information.
# "error rate = 0.1961608"
ErrorRate <- (1308 + 9011)/43294
ErrorRate

# 
# > ErrorRate
# [1] 0.2383471






# Part F: Find a good prediction
# 12.Repeat Parts C and D to try and improve your prediction
randIndex2 <- sample(1:dim(hotelSurvey)[1])

cutPoint2_3_2 <- floor(2 * dim(hotelSurvey)[1]/3)
trainData2 <- hotelSurvey[randIndex2[1:cutPoint2_3_2],]
testData2<- hotelSurvey[randIndex2[(cutPoint2_3_2+1):dim(hotelSurvey)[1]],]

svmOutput2 <- ksvm(CustSat_happy ~ checkInSat+hotelClean+hotelFriendly, data=trainData2
                   , kernel ="rbfdot",kpar="automatic",C=15,cross=3
                   ,prob.model=TRUE)
svmPred2 <- predict(svmOutput2, testData2, type = "votes")
compTable2 <- data.frame(testData[,12],svmPred2[2,])
table(compTable2)
# "error rate = 0.504799"
ErrorRate2 <- (807 + 876)/3334
ErrorRate2
# 13.Explain, in a block comment, why it is valuable to have a “test” dataset that is separate from a “training” dataset?
# Have a substantial number of training cases that the algorithm can use to discover and mimic the
# underlying pattern and then use the results of that process on a test data set in
# order to find out how well the algorithm and parameters perform in a "cross validation."

# In other words, a test dataset is used for testing the validity or accuracy of the model which is using for train dataset .
# It means that separating those two dataset can help to improve the model and eliminate errors.

# It is important to randomize your selection of cases for the training and test sets in order to ensure that there 
# is no systematic bias in the selection of cases.

