library(shiny)
library(shinythemes)


shinyUI(fluidPage(theme = shinytheme("flatly"),
  # Application title
  titlePanel("Lease 4 Green MPG/CO2 Calculator"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
 
    sidebarPanel(
      numericInput('hp', 'Car horsepower (in bhp)', 150, min = 0, max = 1000, step = 10),
      radioButtons("am", "Transmission", c("Automatic" = 0, "Manual" = 1), selected = 0),
      numericInput("wt", "Car weight (in pounds)", 1500, min = 0, max = 1000, step = 10),
      radioButtons("fuel", "Fuel Type",  c("Diesel" = "diesel", "Gasoline" = "gasoline", "Autogas" = "autogas"), selected = "diesel")
    ),
    
    mainPanel(
      p("Taxation incentives make the CO2 performance of a lease car all the more important. This app can help you explore the trade-off
        between different aspects of a car on how they impact MPG and CO2 efficiency."),
      p("Usage is self-explanatory. Fill in the desired horsepower, transmission type, car weight (in pounds) and fuel type on the left."),
      p("We will estimate MPG and associated CO2 emissions in g/km, without being responsible for any errors in the calculation."),
      p("Notably, our car database on which we build our model (mtcars) is hopelessly outdated. We also use constant factors for the change in mpg based on fuel type (-14% for diesel, +20% for autogas)."),
      h3('MPG'),
      textOutput("ompg"),
      h3('CO2 g/km'),
      textOutput("oco2")
    )
  )
)
)