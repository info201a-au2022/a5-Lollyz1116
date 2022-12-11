# ui.R
library(shiny)
library(plotly)
co2 <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", header = TRUE, stringsAsFactors = FALSE)
co2_df <- na.omit(co2)
# Work from here 

introduction <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  mainPanel(
  h1("How Co2 spread out Globly"),),
  p("In this project we will see the CO2 emissions of each country from 1800 to 2020. 
  It is well known that the biggest danger of excessive CO2 emissions is the greenhouse 
  effect, which is based on the fact that CO2 gas has a heat-absorbing and insulating effect. 
  The result of its increased presence in the atmosphere prevents the heat radiated from the 
  sun to the earth from diffusing into outer space, increasing the temperature of the earth's 
  surface. It absorbs infrared radiation from the Earth, causing an increase in the temperature 
  of the near-surface atmosphere. The warming of the near-surface atmosphere causes enhanced 
  evaporation from the surface, resulting in more water vapor in the atmosphere. 
  The increase of water vapor in the atmosphere will in turn further enhance the 
  absorption of the Earth's infrared radiation by the near-surface atmosphere. 
  The vicious cycle will continue, and in the long run, the increase of carbon 
  dioxide in the atmosphere will change the original atmospheric heat balance and 
  cause global warming. Global warming will lead to melting of ice and snow at the 
  Earth's poles, rising sea levels, increased rainfall, extreme weather, storms, rain,
  droughts and floods, and other natural disasters. We hope that from this project, 
  we can pay more attention to environmental protection and reduce CO2 emissions from
  our personal perspective."),
  h2("Three value"),
  p("Whlie looking at the dataset, I was curious about how co2 emission effect the 
  climate changes all over the world. So I calculated the three data that I interested in. In order to draw 
    people's attention, we want to see what a gaint number co2 produce globally.
    And we want to figure out among 1750~2020 which is the highest co2 produced year",highest_co2_year,
    "the reason that it is important for us to figure out why",highest_co2_year," 
    is the year co2 has the highest emission and What we need to do to reduce the 
    emission of co2. Also I have cacluate",highest_co2_produce_country," and",
    lowest_co2_produce_country," those are avergae highest and average lowest co2 emission country.
    Through those two country we can think that does co2 emission has
    the something to do with developing country or  developed country. What can we learn from those countries."),
)

interactive_page <- tabPanel(
  "CO2 emissions all over the world",
  titlePanel("CO2 emissions all over the world"),
plot_main_content <- mainPanel(
  plotlyOutput(outputId = "plot"),
  sliderInput(
    "slider1",
    min = 1800,
    max = 2020,
    value = c(1800, 2020),
    label = "Choose a year",))
)  
plot_sidebar_content <- sidebarPanel(
  # An input to select variable to map
selectInput(
  inputId = "select_country",
  label = "Choose a country",
  choices = unique(co2_df$country))
)  

# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- navbarPage(
  "Climate Change VS Co2",
  introduction,
  interactive_page 
)
