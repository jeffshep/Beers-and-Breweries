library(rworldmap)
library(ggmap)
library(plyr)

brewerylocs = read.csv("brewery_locations.csv")
brewerylocs$id <- NULL

beers = read.csv("beers.csv")
num_beers = count(beers, "brewery_id")
total <- merge(num_beers, brewerylocs, by = "brewery_id")

map <- get_map(location = "Europe", zoom = 4)

mapPoints <- ggmap(map) +
geom_point(aes(x = longitude, y = latitude, size = (freq)), data = total, alpha = .5)

mapPoints