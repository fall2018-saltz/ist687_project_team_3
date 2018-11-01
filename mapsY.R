
library(maps)
library(ggmap)
library(ggplot2)

df <- raw_data
str(df)
source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)
source_co <- geocode(source="dsk", source_fl)
