
library(maps)
library(ggmap)
library(ggplot2)

df <- raw_data
str(df)

df["orgin.city_low"] <- tolower(df$Orgin.City)
df["dest.city_low"] <- tolower(df$Destination.City)

source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)
source_co <- geocode(source="dsk", source_fl)
dest_co <- geocode(source="dsk", dest_fl)



library(ggplot2)
library(ggrepel)
statemap <- borders("state", colour="#efede1", fill="#efede1") # create a layer of borders
ggplot() + statemap + 
  geom_curve(data=flights, aes(x = lon.x, y = lat.x, xend = lon.y, yend = lat.y), col = "#b29e7d", size = 1, curvature = .2) + 
  geom_point(data=airports, aes(x = lon, y = lat), col = "#970027") + 
  geom_text_repel(data=airports, aes(x = lon, y = lat, label = airport), col = "black", size = 2, segment.color = NA) + 
  theme(panel.background = element_rect(fill="white"), 
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()
  )
