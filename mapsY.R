
library(ggplot2)
library(ggmap)
df <- raw_data

source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)

