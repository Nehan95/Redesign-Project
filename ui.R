
library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  tags$head(HTML("<title>Cancer Statistics using linked Micromap</title>")),
  # Application title
  titlePanel("Cancer Statistics using linked Micromap"),

  # Sidebar to select gender
  sidebarPanel(
  selectInput("Gender",
                 label = "Choose a Gender",
                 choices = c("Male","Female","All")),
              submitButton("Update View"),
  h4("Understanding the linked micromap"),
  p("The values of age adjusted incidence rates are shown on a scale in the third column of the linked micromap. The states are sorted according to the trend in incident rates from 2011-2015. "),
  p("The id column highlights the states in the map and the corresponding information is shown in the other columns."), 
  p("The third column also conveys the range in which the maximum data of a state lies, which is nothing but the 95 % confidence intervals of age-adjusted incidence rates. The dot in the age adjusted incident rates column is the actual rate and the line expands from lower 95% confidence interval to upper 95% confidence interval. Similarly, the next column, that is the recent 5-year trend column shows the drift in the annual rate of incidents per state with confidence intervals."), 
  p("The last column in the map indicates if the rate is falling, stable or rising in a state. Here, 1 indicates the rate is rising, 0 indicate the rate is stable and -1 indicates the rate is falling.")
  ),
  

    # Show a plot of the generated distribution
    mainPanel(
      
    
       tabsetPanel(

         tabPanel("Incident Rate",  plotOutput("selected_graph",height = 800 )),
         tabPanel("Death Rate",  plotOutput("selected_graphd",height = 800 )),
         tabPanel("Links",
           tags$a("Go to the data and code repository", href="https://github.com/Nehan95/Redesign-Project")
         )
    ))
  ))