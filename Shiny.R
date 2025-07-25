library(shiny)

#Original
ui = fluidPage(
  selectInput(inputId = "mySelection", 
              label = h3("Select box"),
              choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
              selected = 1), 
  
  verbatimTextOutput(
    outputId = "myOutput"
  )
  
)

server = function(input, output) {
  output$myOutput = renderText({
    paste(paste("This is my choice"), input$mySelection)
  })
}

shinyApp(ui, server)  


#New stuff
ui = fluidPage(
  checkboxInput("checkbox", label = "Choice A", value = TRUE),
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
)

server = function(input, output) {
  output$value <- renderPrint({ input$checkbox })
}

shinyApp(ui, server)  

