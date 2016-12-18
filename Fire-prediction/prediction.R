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

myData <- fromJSON("http://fire-detector-app.mybluemix.net/api/sensor/getdata")
myData$Lat
myData$Long
myData$Temperature
myData$Rh
myData$Rain


PredictFire <- function(data1){
  
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

myData$fire <- PredictFire(myData)
if(myData$fire=="low"){
  plotColor<-'green'
}else {
    if(myData$fire=="medium"){plotColor<-'orange'}
      else{plotColor<-'red'}
  }


# plotting the map with some points on it
p <- ggmap(mapgilbert) +geom_point( aes(myData$Long,myData$Lat),color = plotColor, size = 4)
p
myData