

library(shiny)
library(plotly)
library(maps)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

#Selecting linked micromap on the basis of inputs
  graphInput <- reactive({
    switch(input$Gender,
           "Male" = plotm(),
           "Female" = plotf(),
           "All" = plotall()
           )
  })

  output$selected_graph <- renderPlot({
    graphInput()
  })

  graphInputd <- reactive({
    switch(input$Gender,
           "Male" = plotmd(),
           "Female" = plotfd(),
           "All" = plotalld()
    )
  })

  output$selected_graphd <- renderPlot({
    graphInputd()
  })

  #Plotting linked micromaps for Incident rates
  plotm <- reactive({

    panelDescM <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Recent 5-Year Trend'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rising(1),falling(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedIncidenceRate.CasesPer100.000','Recent5.YearTrendIncidenceRates','Zero'),
      col2 = c(NA,NA,'AgeLconfM','RLconfM','RecentTrendM'),
      col3 = c(NA,NA,'AgeUconfM','RUconfM','RecentTrendM'))


    pt<-micromapST(cancer, panelDescM,
               rowNamesCol='State',
               rowNames='full',
               sortVar='AgeAdjustedIncidenceRate.CasesPer100.000',ascend=FALSE,
               title=c("Leukemia Incident Rates in United states,2011-2015",
                       "Incidence Rates(IR) for all Males"),
               ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p

  })
  plotf <- reactive({

    panelDescF <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Recent 5-Year Trend'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rising(1),falling(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedIncidenceRatesF.per100.1000','Recent5.YearTrendF','Zero'),
      col2 = c(NA,NA,'AgeLconfF','RLconfF','TrendF'),
      col3 = c(NA,NA,'AgeUconfF','RUconfF','TrendF'))
    t(panelDescF)

    pt<-micromapST(cancer, panelDescF,
               rowNamesCol='State',
               rowNames='full',
               sortVar='AgeAdjustedIncidenceRatesF.per100.1000',ascend=FALSE,
               title=c("Leukemia Incident Rates in United states,2011-2015",
                       "Incidence Rates(IR) for all Females"),
               ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p

  })

  plotall <- reactive({
    panelDescA <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Trend as'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rise(1),fall(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedIncidenceRateA','Recent5YrTrend','Zero'),
      col2 = c(NA,NA,'LconfA','RLconfA','TrendA'),
      col3 = c(NA,NA,'UconfA','RUconfA','TrendA'))


    pt <- micromapST(cancer, panelDescA,
               rowNamesCol='State',
               rowNames='full',
               sortVar='AgeAdjustedIncidenceRateA',ascend=FALSE,
               title=c("Leukemia Incidence Rates in United states,2011-2015",
                       "For all Races,Ages and Genders"),
               ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p


  })

  #Plotting linked micromaps for Mortality rates

  plotmd <- reactive({

    panelDescM <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Recent 5-Year Trend'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rising(1),falling(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedDeathRate.CasesPer100.000','Recent5.YearTrendIncidenceRates','Zero'),
      col2 = c(NA,NA,'AgeLconfM','RLconfM','RecentTrendM'),
      col3 = c(NA,NA,'AgeUconfM','RUconfM','RecentTrendM'))


    pt<-micromapST(cancerd, panelDescM,
                   rowNamesCol='State',
                   rowNames='full',
                   sortVar='AgeAdjustedDeathRate.CasesPer100.000',ascend=FALSE,
                   title=c("Leukemia Mortality Rates in United states,2011-2015",
                           "Mortality Rates(MR) for all Males"),
                   ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p

  })

  plotfd <- reactive({

    panelDescF <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Recent 5-Year Trend'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rising(1),falling(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedDeathRatesF.per100.1000','Recent5.YearTrendF','Zero'),
      col2 = c(NA,NA,'AgeLconfF','RLconfF','TrendF'),
      col3 = c(NA,NA,'AgeUconfF','RUconfF','TrendF'))


    pt<-micromapST(cancerd, panelDescF,
                   rowNamesCol='State',
                   rowNames='full',
                   sortVar='AgeAdjustedDeathRatesF.per100.1000',ascend=FALSE,
                   title=c("Leukemia Mortality Rates in United states,2011-2015",
                           "Mortality Rates(IR) for all Females"),
                   ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p

  })

  plotalld <- reactive({
    panelDescA <- data.frame(
      type=c('maptail','id','dotconf','dotconf','arrow'),
      lab1=c('','','Age Adjusted IR cases per','Recent 5yr Trend in IR','Trend as'),
      lab2=c('','',' 100,000 and 95% CIs','and 95% CIs','rise(1),fall(-1),stable(0)'),
      col1 = c(NA,NA,'AgeAdjustedDeathRateA','Recent5YrTrend','Zero'),
      col2 = c(NA,NA,'LconfA','RLconfA','TrendA'),
      col3 = c(NA,NA,'UconfA','RUconfA','TrendA'))


    pt <- micromapST(cancerd, panelDescA,
                     rowNamesCol='State',
                     rowNames='full',
                     sortVar='AgeAdjustedDeathRateA',ascend=FALSE,
                     title=c("Leukemia Mortality Rates in United states,2011-2015",
                             "For all Races,Ages and Genders"),
                     ignoreNoMatches=TRUE)
    p<-ggplotly(pt)
    p


  })



})
