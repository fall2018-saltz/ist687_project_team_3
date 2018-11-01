
library(ggplot2)
library(maps)
library(ggmap)
df <- raw_data

source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)
source_co <- geocode(source= "dsk", source_fl)
