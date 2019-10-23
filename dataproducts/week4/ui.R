
library(shiny)
library(ggplot2)

# load data
data("mtcars")

# Define UI for the application
shinyUI(fluidPage(titlePanel("Cars MPG Prediction"),
                  
                  # Sidebar with a slider input for number of variables
                  sidebarLayout(sidebarPanel(h4("Choose Prediction Factors"),
                                             checkboxInput("cyl", "cyl", TRUE),
                                             checkboxInput("hp", "hp", FALSE),
                                             checkboxInput("disp", "disp", FALSE),
                                             checkboxInput("drat", "drat", FALSE),
                                             checkboxInput("wt", "wt", FALSE),
                                             checkboxInput("qsec", "qsec", FALSE),
                                             checkboxInput("vs", "vs", FALSE),
                                             checkboxInput("am", "am", FALSE),
                                             checkboxInput("gear", "gear", FALSE),
                                             checkboxInput("carb", "carb", FALSE)
                                             ),
                                
                                mainPanel("Predicted MPG/Actual MPG Relationship", plotOutput("distPlot"))
                  )))