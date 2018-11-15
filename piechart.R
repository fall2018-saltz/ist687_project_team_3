
library(ggplot2)
##creating Proj_Data
Proj_Data <- "clean_data.csv"

Proj_Data <- data.frame(read.csv(Proj_Data))

##creating a df for gender
female_count <- cat(nrow(Proj_Data[Proj_Data$Gender == "Female", ]))
male_count <- cat(nrow(Proj_Data[Proj_Data$Gender == "Male", ]))
gender_data <- c(73374,56515)
gender_labels <- c('Female', 'Male')
gender_df <- data.frame(gender_labels,gender_data)

##ggplot2 pie chart
bar<-ggplot(gender_df,aes(x="",y=gender_df$gender_data,fill=gender_labels))+geom_bar(width=1,stat="identity")
bar

pie<-bar+coord_polar("y",start=0)+scale_fill_brewer(palette = "Dark2")+theme_minimal()
pie

##final ggplot2 code for gender
gender_PC <- ggplot(transform(transform(gender_df, gender_data=gender_data/sum(gender_data)), labPos=cumsum(gender_data)-gender_data/2), 
       aes(x="", y = gender_data, fill = gender_labels)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow","blue", "green", "cyan")) +
  coord_polar(theta = "y") +
  labs(title = "Gender of Customers Percentage") + 
  geom_text(aes(y=labPos, label=scales::percent(gender_data)))
  
  
  
##NEW TASK
##creating ggplot2 piechart for airline status data (blue, gold, platinum, and silver)
blue_count <- cat(nrow(Proj_Data[Proj_Data$Airline.Status == "Blue", ]))
silver_count <- cat(nrow(Proj_Data[Proj_Data$Airline.Status == "Silver", ]))
platinum_count <- cat(nrow(Proj_Data[Proj_Data$Airline.Status == "Platinum", ]))
gold_count <- cat(nrow(Proj_Data[Proj_Data$Airline.Status == "Gold", ]))

AS_labels <- c("Blue", "Silver", "Platinum", "Gold")
AS_data <- c(88910, 25970, 4172, 10837)
AS_df <- data.frame(AS_labels, AS_data)
View(AS_df)  

  
##creation of simple pie chart
pie(AS_data, labels = AS_labels, main =  "Airline Status")

##adjust simple pie chart to contain percentages
pct<-round(AS_data/sum(AS_data)*100)
label<-paste(AS_labels,pct)
label<-paste(label,"%",sep="")
pie(AS_data,labels = label,col= rainbow(length(label)),main="Airline Status w/ Percentages")


##ggplot2 pie chart
bar<-ggplot(AS_df,aes(x="",y=AS_df$AS_data,fill=AS_labels))+geom_bar(width=1,stat="identity")
bar

pie<-bar+coord_polar("y",start=0)+scale_fill_brewer(palette = "Dark2")+theme_minimal()
pie

##final ggplot2 code for gender
AS_PC <- ggplot(transform(transform(AS_df, AS_data=AS_data/sum(AS_data)), labPos=cumsum(AS_data)-AS_data/4), 
                    aes(x="", y = AS_data, fill = AS_labels)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow","blue", "green", "cyan")) +
  coord_polar(theta = "y") +
  labs(title = "Airline Status w/ Percentages") + 
  geom_text(aes(y=labPos, label=scales::percent(AS_data)))
AS_PC


##NEW TASK
##new pie chart for type of travel (Business Travel, Mileage tickets, Personal Travel)
BT_count <- cat(nrow(Proj_Data[Proj_Data$Type.of.Travel == "Business travel", ]))
MT_count <- cat(nrow(Proj_Data[Proj_Data$Type.of.Travel == "Mileage tickets", ]))
PT_count <- cat(nrow(Proj_Data[Proj_Data$Type.of.Travel == "Personal Travel", ]))

travel_labels <- c("Business travel", "Mileage tickets", "Personal Travel")
travel_data <- c(79630, 10070, 40189)
TT_df <- data.frame(travel_labels, travel_data)
View(TT_df)

##creation of simple pie chart
pie(travel_data, labels = travel_labels, main =  "Travle Type")

##adjust simple pie chart to contain percentages
pct<-round(travel_data/sum(travel_data)*100)
label<-paste(travel_labels,pct)
label<-paste(label,"%",sep="")
pie(travel_data,labels = label,col= rainbow(length(label)),main="Travel Type with Percentages")


##ggplot2 pie chart
bar<-ggplot(TT_df,aes(x="",y=TT_df$travel_data,fill=travel_labels))+geom_bar(width=1,stat="identity")
bar

pie<-bar+coord_polar("y",start=0)+scale_fill_brewer(palette = "Dark2")+theme_minimal()
pie

##final ggplot2 code for gender
TT_PC <- ggplot(transform(transform(TT_df, travel_data=travel_data/sum(travel_data)), labPos=cumsum(travel_data)-travel_data/3), 
                aes(x="", y = travel_data, fill = travel_labels)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow","blue", "green", "cyan")) +
  coord_polar(theta = "y") +
  labs(title = "Travel Type w/ Percentages") + 
  geom_text(aes(y=labPos, label=scales::percent(travel_data)))
TT_PC

##NEW TASK
##creating pie chart for class of flier
eco_count <- cat(nrow(Proj_Data[Proj_Data$Class == "Eco", ]))
ep_count <- cat(nrow(Proj_Data[Proj_Data$Class == "Eco Plus", ]))
b_count <- cat(nrow(Proj_Data[Proj_Data$Class == "Business", ]))

class_labels <- c("Eco", "Eco Plus", "Business")
class_data <- c(105735, 13606, 10548)
class_df <- data.frame(class_labels, class_data)
View(class_df)

##creation of simple pie chart
pie(class_data, labels = class_labels, main =  "Travel Class")

##adjust simple pie chart to contain percentages
pct<-round(class_data/sum(class_data)*100)
label<-paste(class_labels,pct)
label<-paste(label,"%",sep="")
pie(class_data,labels = label,col= rainbow(length(label)),main="Class Type with Percentages")


##ggplot2 pie chart
bar<-ggplot(class_df,aes(x="",y=class_df$class_data,fill=class_labels))+geom_bar(width=1,stat="identity")
bar

pie<-bar+coord_polar("y",start=0)+scale_fill_brewer(palette = "Dark2")+theme_minimal()
pie

##final ggplot2 code for gender
CT_PC <- ggplot(transform(transform(class_df, class_data=class_data/sum(class_data)), labPos=cumsum(class_data)-class_data/3), 
                aes(x="", y = class_data, fill = class_labels)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow","blue", "green", "cyan")) +
  coord_polar(theta = "y") +
  labs(title = "Class Type w/ Percentages") + 
  geom_text(aes(y=labPos, label=scales::percent(class_data)))
CT_PC


##NEW TASK
##creating pie chart for arrival delay 
D_count <- cat(nrow(Proj_Data[Proj_Data$Arrival.Delay.greater.5.Mins == "yes", ]))
ND_count <- cat(nrow(Proj_Data[Proj_Data$Arrival.Delay.greater.5.Mins == "no", ]))

delay_labels <- c("yes", "no")
delay_data <- c(44504, 85385)
delay_df <- data.frame(delay_labels, delay_data)
View(delay_df)

##creation of simple pie chart
pie(delay_data, labels = delay_labels, main =  "Arrival Delay Greater Than 5 Minutes")

##adjust simple pie chart to contain percentages
pct<-round(delay_data/sum(delay_data)*100)
label<-paste(delay_labels,pct)
label<-paste(label,"%",sep="")
pie(delay_data,labels = label,col= rainbow(length(label)),main="Arrival Delay w/ Percentages")


##ggplot2 pie chart
bar<-ggplot(delay_df,aes(x="",y=delay_df$delay_data,fill=delay_labels))+geom_bar(width=1,stat="identity")
bar

pie<-bar+coord_polar("y",start=0)+scale_fill_brewer(palette = "Dark2")+theme_minimal()
pie

##final ggplot2 code for gender
AD_PC <- ggplot(transform(transform(delay_df, delay_data=delay_data/sum(delay_data)), labPos=cumsum(delay_data)-delay_data/3), 
                aes(x="", y = delay_data, fill = delay_labels)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow","blue", "green", "cyan")) +
  coord_polar(theta = "y") +
  labs(title = "Arrival Delay w/ Percentages") + 
  geom_text(aes(y=labPos, label=scales::percent(delay_data)))
AD_PC




