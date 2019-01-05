#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Cancer Redesign"),

  # Sidebar to select gender
  sidebarPanel(
  selectInput("Gender",
                 label = "Choose a Gender",
                 choices = c("Male","Female","All")),
              submitButton("Update View")),

    # Show a plot of the generated distribution
    mainPanel(

       tabsetPanel(

         tabPanel("Incident Rate Linked micromap",  plotOutput("selected_graph",height = 800 )),
         tabPanel("Death Rate Linked micromap",  plotOutput("selected_graphd",height = 800 )))
    )
  )
)
