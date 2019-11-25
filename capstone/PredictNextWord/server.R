#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(mtcars)

model <- readRDS("freqmodel.RDS")

predict <- function(sentence, model) {
    library(tm)
    sentence <- stripWhitespace(removeNumbers(removePunctuation(tolower(sentence))))
    words <- unlist(strsplit(sentence, split = " "))
    if (length(words) > 4) {
        words <- words[(length(words)-3): length(words)]
    }
    prefixes <- c()
    if (length(words) >= 4) {
        prefixes <- append(prefixes, paste(words[(length(words)-3):length(words)], collapse = " "))
    }
    if (length(words) >= 3) {
        prefixes <- append(prefixes, paste(words[(length(words)-2):length(words)], collapse = " "))
    }
    if (length(words) >= 2) {
        prefixes <- append(prefixes, paste(words[(length(words)-1):length(words)], collapse = " "))
    }
    if (length(words) >= 1) {
        prefixes <- append(prefixes, words[length(words)])
    }
    candidate <- subset(model, prefix %in% prefixes)
    r <- tail(candidate, 3)
    
    r <- r[order(r$freq, decreasing = T), ]
    if ((dim(r)[1]) == 0) {
      c <- tail(model, sample(1:10, 1))
      return (data.frame(nextWord=c$nextWord, freq=c$freq))
    }
    data.frame(nextWord=as.character(r$nextWord), freq=r$freq)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    vals <- reactiveValues(data = NULL)
    dataModal <- function(failed = FALSE) {
        candidates <- predict(input$sentence, model)
        modalDialog(
            radioButtons("nextWord", "Next Word",
                         candidates$nextWord),
            textInput("userInput", "Enter next word here",value = ""),
            renderPlot(ggplot(candidates, aes(x=nextWord, y=freq, fill=nextWord)) + 
                         geom_bar(width = 0.75,  stat = "identity", colour = "black", size = 1) + 
                         ggtitle("Next Word Frequency")),
            footer = tagList(
                modalButton("Cancel"),
                actionButton("ok", "OK")
            )
        )
    }
    
    # Show modal when button is clicked.
    observeEvent(input$predict, {
        showModal(dataModal())
    })
    
    # When OK button is pressed, attempt to load the data set. If successful,
    # remove the modal. If not show another modal, but this time with a failure
    # message.
    observeEvent(input$ok, {
        # Check that data object exists and is data frame.
        if (!is.null(input$nextWord) && nzchar(input$nextWord)) {
            vals$data <- input$nextWord
            if (!is.null(input$userInput) && nzchar(input$userInput)) {
              vals$data <- input$userInput
              model <<- rbind(model, data.frame(term="NA", n=NA, freq=1.0, prefix=input$sentence, nextWord=input$userInput))
            }
            removeModal()
        } else {
            showModal(dataModal(failed = TRUE))
        }
    })
    
    # Display information about selected data
    output$dataInfo <- renderPrint({
        if (is.null(vals$data))
            "No data selected"
        else
            vals$data
    })
  
    output$distPlot <- renderPlot(ggplot(tail(model, 30), aes(reorder(term, -freq), freq)) +
                                    labs(x = "ngram", y = "Frequency") + ggtitle("N-gram model used") +
                                    theme(axis.text.x = element_text(angle = 60, size = 12, hjust = 1)) +
                                    geom_bar(stat = "identity", fill = I("blue")))
})
