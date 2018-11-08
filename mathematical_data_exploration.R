
##################################################################
# Use this block comment at the top of each R code file you submit
# Project – Submitted by Yao Wang on October 31, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.
# IST 687. Due is ??, 2018


library(maps)
library(ggmap)
library(ggplot2)
library(ggrepel)


file.choose()
flightsLocation <- "/Users/nan062518/Desktop/2018 Fall/IST 687 R/project/"
flights <- read.csv(paste0(flightsLocation, "clean_data.csv")    
                    , stringsAsFactors = FALSE)
df <- flights
View(df)
str(flights)

df["orgin.city_low"] <- tolower(df$Orgin.City)
df["dest.city_low"] <- tolower(df$Destination.City)

source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)
source_co <- geocode(source="dsk", source_fl)
dest_co <- geocode(source="dsk", dest_fl)
View(source_co)
View(dest_co)

usa <- map_data("state")
df2 <- data.frame(source_fl,source_co)
df2 <- sort(df2$source_fl)
View(df2)


library(ggplot2)
library(ggrepel)
statemap <- borders("state", colour="#efede1", fill="#efede1") # create a layer of borders
ggplot() + statemap + 
  geom_curve(data=flights, aes(x = lon.x, y = lat.x, xend = lon.y, yend = lat.y), col = "#b29e7d", size = 1, curvature = .2) + 
  geom_point(data=df2, aes(x = lon, y = lat), col = "#970027") + 
  geom_text_repel(data=airports, aes(x = lon, y = lat, label = airport), col = "black", size = 2, segment.color = NA) + 
  theme(panel.background = element_rect(fill="white"), 
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()
  )
