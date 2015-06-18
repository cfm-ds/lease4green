library(shiny)
data(mtcars)

co2_factors <<- data.frame("diesel" = 6233.18645745, "gasoline" = 5456.97833256, "autogas" = 4469.0770827)
fuel_factors <<- data.frame("diesel" = 1.14, "gasoline" = 1, "autogas" = 0.8)
mtcars$am <<- as.factor(mtcars$am)
model <<- lm(mtcars$mpg ~ hp + wt + am + wt:am, data = mtcars)

predictMPG <- function(hp, wt, am) {
  predict(model,  data.frame(hp, wt, am))
} 

shinyServer(
  function(input, output) {
    mpg <- reactive({predictMPG(input$hp, input$wt/1000.0, input$am) * fuel_factors[ ,input$fuel]}) 
    output$ompg <- renderText({mpg()})
    output$oco2 <- renderText({co2_factors[ ,input$fuel]/(mpg())})
  }
)