library(tidyverse)
library(plotly)
library(shiny)
library(dplyr)
library(devtools)
library(tidyverse)
library(micromapST)
library(leaflet)

cancer<- read.csv("C:/fall 18/STAT515/incd.csv", sep =',', header=T, as.is=TRUE)
cancerd<- read.csv("C:/fall 18/STAT515/death.csv", sep =',', header=T, as.is=TRUE)

cancer$Zero <- rep(0,nrow(cancer))
cancerd$Zero <- rep(0,nrow(cancerd))