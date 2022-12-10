# tab_panel_intro

library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(shinythemes)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

filter1 <- co2_data %>% 
  filter(country == "United States") %>% 
  filter(gas_co2_per_capita == max(gas_co2_per_capita)) %>% 
  pull(gas_co2_per_capita)
filter1

filter2 <- co2_data %>% 
  filter(country == "Russia") %>% 
  filter(year > 2000) %>% 
  filter(cement_co2 == min(cement_co2, na.rm = TRUE)) %>% 
  pull(year)

filter3 <- co2_data %>% 
  filter(year == "2020") %>% 
  filter(cumulative_co2 == min(cumulative_co2, na.rm = TRUE)) %>% 
  pull(country)

introduction <-tabPanel(
    "Introduction",
    
    h1(strong("Introduction")),
    p(em("INFO-201")),
    p(em("Autumn 2022")),
    
    p("Maximum Gas CO2 Emissions Per Capita in the United States: ", filter1, ". ", 
       "Minimum Cement CO2 Emissions in Russia in 2000: ", filter2, ". ",
       "Country with the Lowest Cumulative CO2 Emissions in 2020: ", filter3, "."),
    
    p("As CO2 emissions rise more and more each year in every country, we need 
    more people to focus on this issue in order to create a healthier planet 
    and a more sustainable future. In this report, the cumulative CO2 production-based 
      emissions excluding land-use change will be explored. Additionally, the 
      gas CO2 emissions per capita and cement CO2 emissions will be explored. 
      It was found that the highest production of CO2 from gas in tons per person 
      in the United States was 5.667 tons. It was also found that the 
      year with the lowest cement CO2 emissions in Russia after 2000 was 2001. 
      Finally, in the year 2020, the country with the lowest cumulative CO2 
      emissions was Tuvalu. The cumulative CO2 emissions (in million tons) 
      will be compared to each countries 
      population and Gross Domestic Product (GDP) in the visualization."),
    
)
