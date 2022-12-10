# app_ui.R

library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(shinythemes)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

source("introduction.R")
source("visualization.R")


ui <- navbarPage(
  theme = shinytheme("cosmo"),
  title = "A5",
  position = "fixed-top",

  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("INFO-201A Autumn 2022 Huang"),
    hr()
  ),

  introduction,
  visualization,

)
