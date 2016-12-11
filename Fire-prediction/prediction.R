# loading the required packages
library(ggplot2)
library(ggmap)

# creating a sample data.frame with your lat/lon points
lon <- c(-135,-62)
lat <- c(49, 25)
df <- as.data.frame(cbind(lon,lat))

# getting the map
mapgilbert <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 4,
                      maptype = "roadmap", scale = 1)

library("jsonlite")

myData1 <- fromJSON("http://fire-detector-app.mybluemix.net/api/sensor/getdata")
myData1$Temperature
myData1$Rh
myData1$Rain


my <- function(data1){
  data1$fire<-'low'
  if((data1$Temperature > 25)&&(data1$Rh<20)&&(data1$Rain<2)){
    data1$fire <-'high'
  }  
  else{
    if((data1$Temperature > 19)&&(data1$Rh<35)&&(data1$Rain<5)){
      data1$fire <-'medium'
    }
    else{
      data1$fire <- 'low'
    }
  } 
}

myData1$fire <- my(myData1)
fireChances <- myData1$fire



# plotting the map with some points on it
ggmap(mapgilbert) +geom_point(data = df, aes(x = myData1$Long, y = myData1$Lat, colour = factor(myData1$fire), alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)

myData1