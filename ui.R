#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/



# Define UI for application that calculate the straight line distance between two geographical coordinates

## In SideBarPanel the user can input a numeric value to be used as a latitude and longitude of point A and B
## In MainPanel the output is defined as the distance in kilometers between the points, and the points are marked on the map

library(leaflet)
library(shiny)
shinyUI(fluidPage(
  titlePanel("Distance between two geographical coordinates"),
  sidebarLayout(
    sidebarPanel(
      h4("Enter latitude and longitude of points A and B"),
      numericInput("latitudeA", "Latitude of point A",  value=-19.911129423, min=-90, max=90, step=0.000000001),
      numericInput("longitudeA", "Longitude of point A",  value=-43.927313561, min=-90, max=90, step=0.000000001),
      numericInput("latitudeB", "Latitude of point B",  value=-20.470844713, min=-90, max=90, step=0.000000001),
      numericInput("longitudeB", "Longitude of point B",  value=-45.127374407, min=-90, max=90, step=0.000000001),
      h6("To calculate the distance, in kilometers, between two geographical coordinates Type the informations about latitude and longitude of two locations (PointA and PointB)")
       ),
    mainPanel(
      h4("A straight line distance (Km) beetween Point A and B is:"),
      textOutput("distAB"),
      h4("The points are:"),
      leafletOutput("map")
    )
  )
))