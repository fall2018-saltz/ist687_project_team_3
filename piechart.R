
library(ggplot2)
##creating Proj_Data

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
