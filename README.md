# Fire-prediction-analysis

In this project i am predicting the chances of fire by using the virtual sensor data. 

## Getting Started

This project would be useful in scenarios where machine learning,  


### Prerequisites

To runthe application successfully you need a node red application that returns json data(this would be our virtual sensor)
In order to create a node-red application go to  [Node-RED](https://console.ng.bluemix.net/docs/starters/Node-RED/nodered.html#nodered)

In Node-Red i built my low so that on a request i return a sensor data in json format.
Here is the image of my flow of the node-red app:

![Node-red-flow-diagram](https://github.com/rishindrareddy/Fire-prediction-analysis/blob/master/read%20me%20images/NodeRedCapture.PNG)


### Installing

Once you clone this repository, install following packages:

* [Shiny](https://shiny.rstudio.com/) - for Web application framework.
* [RWeka](https://cran.r-project.org/web/packages/RWeka/index.html) - Weka is a collection of machine learning algorithms for data mining tasks.
* [JSONlite](https://cran.r-project.org/web/packages/jsonlite/index.html) - A fast JSON parser and generator optimized for statistical data and the web.
* [ggplot2](http://ggplot2.org/) - ggplot2 is a plotting system for R, based on the grammar of graphics, which tries to take the good parts of base and lattice graphics and none of the bad parts. It takes care of many of the fiddly details that make plotting a hassle (like drawing legends) as well as providing a powerful model of graphics that makes it easy to produce complex multi-layered graphics.
* [ggmaps](https://cran.r-project.org/web/packages/ggmap/index.html) - A collection of functions to visualize spatial data and models on top of static maps from various online sources (e.g Google Maps and Stamen Maps). It includes tools common to those tasks, including functions for geolocation and routing.


### Sample output

plotting the map of the USA roadmap and our sensor latitude and longitude on the map.
displayig the sensor units below.

Here is the picture of our google maps image and the sensor data:

![sample-output-diagram](https://github.com/rishindrareddy/Fire-prediction-analysis/blob/master/read%20me%20images/R%20_%20Capture.PNG)

