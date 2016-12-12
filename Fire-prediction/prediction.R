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
myData$Temperature
myData$Rh
myData$Rain


my <- function(data1){
  
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

my1 <- function(data2){
  
  
  
  if(data2$fire == 'high'){
    data2$color<-'red'
  }  
  else{
    if(data2$fire == 'medium'){
      data2$color<-'orange'
    }
    else{
      data2$color<-'green'
    }
  } 
}

myData$fire <- my(myData)
myData$color <- my1(myData)
fireChances <- myData$fire



# plotting the map with some points on it
ggmap(mapgilbert) +geom_point( aes(myData$Long,myData$Lat),color = "red", size = 5, shape = 21)

myData