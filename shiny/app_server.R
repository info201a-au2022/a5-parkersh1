# app_server.R

library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(shinythemes)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

server <- function(input, output) {
  # Chart 3
  output$plot <- renderPlotly({
    plot_data <- co2_data %>% 
      filter(cumulative_co2 > input$cum_co2_choice[1], cumulative_co2 < input$cum_co2_choice[2])
    
    p <- ggplot(
      data = plot_data,
      mapping = aes_string(x = input$feature, y = "cumulative_co2", color = "country")
    ) +
      geom_point(alpha = .5) +
      labs(
        title = "Cumulative CO2 vs. Population/GDP",
        y = "Cumulative CO2 (in Million Tons)"
      )
    
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
    
    p
  })
    
  }



