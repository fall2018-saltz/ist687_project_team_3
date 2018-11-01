
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
