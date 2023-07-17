library(shiny)
library(msaR)
# Define UI for slider demo app ----
ui <- fluidPage(

  # App title ----
  titlePanel(""),

  # Sidebar layout with input and output definitions ----
 mainPanel(


      msaROutput("values", width="100%")

    )
)


server <- function(input, output) {

 


output$values <- renderMsaR(
  msaR('/srv/myapps/keyandaydayup/apps/app37/data.aln')
)
}

shinyApp(ui, server)