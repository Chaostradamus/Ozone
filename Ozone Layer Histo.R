library(shiny)
data(airquality)

ui <- fluidPage(
  
  titlePanel("Ozone Level!"),
  
  sidebarLayout( 
    
  sidebarPanel(
    sliderInput(inputId = "bins",
                label = "# of bins",
                min = 0,
                max = 60,
                value = 24,
                step = 2)
    
  ),
  
  mainPanel(
    plotOutput(outputId = "distPlot")
  )
  )
)



server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x   <- airquality$Ozone
    x   <- na.omit(x)
    bins   <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
  })
}

shinyApp(ui = ui, server = server)
