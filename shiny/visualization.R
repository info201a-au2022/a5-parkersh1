# tab_panel_chart3

library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(shinythemes)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

cum_co2_range <- range(co2_data$cumulative_co2, na.rm = TRUE)

filtered <- co2_data %>% 
  select(population, gdp)

# slider
ww_gross_input <- sliderInput(
  inputId = "cum_co2_choice",
  label = "Cumulative CO2", 
  min = cum_co2_range[1],
  max = cum_co2_range[2],
  value = cum_co2_range
)

# dropdown menu
feature_input <- selectInput(
  inputId = "feature", 
  label = "Feature of Interest", 
  choices = colnames(filtered), 
  selected = "title"
)

visualization <- tabPanel(
    "Visualization",
    
    h1(strong("Visualization")),
    
    fluidPage(
      ww_gross_input, 
      feature_input, 
      checkboxInput("smooth", label = strong("Show Trendline"), value = TRUE),
      plotlyOutput("plot"),
    
      p("This scatter plot includes cumulative CO2 emissions on the y-axis and 
        give the user a choice between population or GDP for the x-axis. These 
        two variables were chosen because they allow users to best view how 
        a countries cumulative CO2 emissions change over time compared to a countries 
        growth. Users can learn what countries emit more CO2 than other countries 
        of similar population or GDP. For example, China emitted more CO2 than India 
        when their populations were about that same exact size. This tells us 
        which countries are less conscious about how they are impacting the 
        environment.")
    )
)
