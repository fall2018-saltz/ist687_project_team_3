
library(ggmap)
df <- raw_data
str(df)
source_fl <- unique(df$Orgin.City)
dest_fl <- unique(df$Destination.City)
