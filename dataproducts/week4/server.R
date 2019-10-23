# This is a shiny app to determine diamond price based on carat, cut, color, and clarity

library(shiny)
library(ggplot2)
library(curl)

# Define server logic
shinyServer(function(input, output) {
  
  # load data
  data("mtcars")
  
  # create the initial output
  output$distPlot <- renderPlot({
    factors <- c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
    selected <- c(input$cyl, input$disp, input$hp, input$drat, input$wt, input$qsec, input$vs,
                  input$am, input$gear, input$carb)
    formula <- paste("mpg ~ ", paste(factors[selected], collapse = "+"))
    fit <- lm(formula, data = mtcars)
    
    p <- ggplot(data = mtcars, aes(x = mpg, y = fit$fitted.values)) + geom_point()
    p <- p + geom_smooth(method = "lm") + xlab("Actual MPG") + ylab("Predicted MPG")
    p
  }, height = 700)
  
})