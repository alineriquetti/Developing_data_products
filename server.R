  #
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define server logic required to calculate he distance and print the map

## Here the distance is calculated according to Haversine formula
## The points are marked on the map using the geographical coordinates and leaflet library

shinyServer(function(input, output) {
  output$distAB=renderText({
    dist<-round(6371*acos(cos(pi*(90-input$latitudeB)/180)*cos((90-input$latitudeA)*pi/180)+sin((90-input$latitudeB)*pi/180)
                          *sin((90-input$latitudeA)*pi/180)*cos((input$longitudeA-input$longitudeB)*pi/180)))
  })
  output$map=renderLeaflet({
    latitude<-c(input$latitudeA, input$latitudeB)
    longitude<-c(input$longitudeA, input$longitudeB)
    coments<-c("PointA", "PointB")
    my_map <-leaflet() %>%
      addTiles() %>%
      addMarkers(lat=latitude, lng=longitude, popup=coments)
    my_map
  })
})