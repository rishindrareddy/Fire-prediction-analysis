

ui <- fluidPage (
  # Application title
  titlePanel("Predicting forest fire chances."),
  mainPanel(  plotOutput("mapOut"),
              textOutput("TEMP"),
              textOutput("RH"),
              textOutput("R"),
              textOutput("F")
  )
  
)

library(ggplot2)
library(ggmap)
library(shiny)
library(jsonlite)

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

myData$fire <- my(myData)

# creating a sample data.frame with your lat/lon points
lon <- c(-135,-62)
lat <- c(49, 25)
df <- as.data.frame(cbind(lon,lat))


# getting the map
USmap <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 4,
                 maptype = "roadmap", scale = 1)



server <- function(input,output,session) {
  
  
  #we output the plot of our map in the UI
  output$mapOut <- renderPlot({
    print(ggmap(USmap)+geom_point(aes(myData$Long,myData$Lat),color="red", size=3))
  })
  
  #here we paste the sensor units, so that we can paste on UI
  output$RH <- renderText({paste("Relative humidity: ",myData$Rh)})
  output$TEMP <- renderText({ paste("Temperature in C: ",myData$Temperature)})
  output$R <- renderText({paste("Rain in mm: ",myData$Rain)})
  output$F <-renderText({paste("fire chances: ",myData$fire)})
}


shinyApp( ui = ui,server = server)