library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)


co2 <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", header = TRUE, stringsAsFactors = FALSE)
co2_df <- na.omit(co2)
#View(co2_df)


# Which country has the highest average value of co2 produce across all the world? (value 1)
highest_co2_produce_country <- co2_df %>% 
  group_by(country) %>% 
  summarize(avg = mean(co2, na.rm = T)) %>% 
  filter(avg == max(avg, na.rm = t)) %>% 
  pull(country)
#View(highest_co2_produce_country)

# Which country has the highest average value of co2 produce across all the world? (value 2)
lowest_co2_produce_country <- co2_df %>% 
  group_by(country) %>% 
  summarize(avg = mean(co2, na.rm = T)) %>% 
  filter(avg == min(avg, na.rm = t)) %>% 
  pull(country)
#View(lowest_co2_produce_country)

# What year has the highest co2 across all the countries? (value 2)
highest_co2_year <- co2_df %>% 
  filter(co2 == max(co2, na.rm =T)) %>% 
  pull(year)
#View(highest_co2_year)

# plotting
plot_co2 <- co2_df %>% 
  group_by(country) %>% 
  select(country, co2, year)

plot <- plot_co2  %>%
  ggplot(aes(x=year, y=co2, color=country)) +
  geom_line() +
  scale_y_continuous(labels = scales::comma) +
  ggtitle("CO2 Emissions Across the World from 1800-2020") +
  ylab("CO2 Emissions ") 
plot


server <- function(input, output) {
  output$plot <- renderPlot({
    plot_co2 <- co2_df %>% 
      filter(country == input$select_country) %>%
      filter(year >= input$slider1[1] & year <= input$slider1[2])
    
    plot <- plot_co2  %>%
      ggplot(aes(x=year, y=co2, color=country)) +
      geom_line() +
      scale_y_continuous(labels = scales::comma) +
      ggtitle("CO2 Emissions Across the World from 1800-2020") +
      ylab("CO2 Emissions ") 
    return(plot)
  })
}