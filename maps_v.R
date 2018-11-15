
library(ggplot2)
library(maps)
library(ggmap)
library(gdata)
library(dplyr)

df <- read.csv("clean_data.csv",stringsAsFactors=FALSE)
df <- df[!((df$Origin.State=="U.S. Pacific Trust Territories and Possessions")|(df$Destination.State=="U.S. Pacific Trust Territories and Possessions")),]

origin_states_low <- tolower(unique(df$Origin.State))
dest_states_low <- tolower(unique(df$Destination.State))
print(unique(df$Origin.State))

source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)

source_co <- geocode(source= "dsk", source_fl)
dest_co <- geocode(source="dsk", dest_fl)

usa <- map_data("state") 

df1 <- data.frame(origin_states_low,dest_states_low,stringsAsFactors = FALSE)

arr <- df %>% select(Origin.State,Departure.Delay.in.Minutes) %>% group_by(Origin.State) %>% summarise(total_delay=mean(Departure.Delay.in.Minutes,na.rm=TRUE))

arr1 <- df %>% select(Destination.State,Arrival.Delay.in.Minutes) %>% group_by(Destination.State) %>% summarise(total_delay_arri=mean(Arrival.Delay.in.Minutes,na.rm=TRUE))

arr$Origin.State <- tolower(arr$Origin.State)
arr1$Destination.State <- tolower(arr1$Destination.State)

mer <- merge(df1,arr,by.x="origin_states_low",by.y="Origin.State",all=TRUE)
mer <- merge(mer,arr1,by.x="dest_states_low",by.y="Destination.State",all=TRUE)

link <- ggplot(mer,aes(map_id=origin_states_low)) + geom_map(map=usa,aes(fill=mer$total_delay)) + expand_limits(x=usa$long, y=usa$lat) + coord_map()
link

df3 <- as.data.frame(dest_states_low,stringsAsFactors = FALSE)
newdf <- merge(df3,arr1,by.x="dest_states_low",by.y="Destination.State",all=TRUE)

map1 <- ggplot(newdf,aes(map_id=dest_states_low)) + geom_map(map=usa,aes(fill=newdf$total_delay_arri)) + expand_limits(x=usa$long, y=usa$lat) + coord_map()
map1

arr2 <- df %>% select(Satisfaction,Origin.State) %>% group_by(Origin.State) %>% summarise(avg_satisfaction=mean(Satisfaction,na.rm=TRUE))
arr2$Origin.State <- tolower(arr2$Origin.State)
mer <- merge(mer,arr2,by.x="origin_states_low",by.y="Origin.State",all=TRUE)

map3 <- ggplot(mer,aes(map_id=origin_states_low)) + geom_map(map=usa,aes(fill=mer$avg_satisfaction)) + expand_limits(x=usa$long, y=usa$lat) + coord_map()
map3

airport <- data.frame(source_co,dest_co)
airport$origin_states_low <- "?"
airport <- airport[airport$lon>(-130),]
airport <- airport[airport$lat>20,]

map33 <- ggplot(mer, aes(map_id=origin_states_low)) + geom_map(map=usa) + expand_limits(x=usa$long, y=usa$lat) + coord_map()
map33

map44 <- map33 + geom_point(data=airport, aes(x=lon,y=lat),color="red")
map44

airport1 <- data.frame(source_co,dest_co)
airport1$origin_states_low <- "?"
str(airport1)
airport1 <- airport1[airport1$lon.1>(-130),]
airport1 <- airport1[airport1$lat.1>20,]

map55 <- map33 + geom_point(data=airport1, aes(x=lon.1,y=lat.1),color="blue")
map55
