# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)
co2_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

plot_df <- co2_df %>% 
  group_by(country) %>% 
  filter(year >= 1960 & year <= 2010) %>% 
 

  plot <- ggplot(data = co2_df) + 
    geom_bar(mapping = aes(x = year, y = co2), stat = "identity") +
    scale_y_continuous(labels = scales::comma) +
    labs(
      title = "Increase of Jail Population in U.S.(1970-2018)",
      caption = "This graph shows that total jail population changed by years",
      x = "Year",
      y = "Total Jail Population"
    )
  
  return(plot)   



pop_age_ratio <- function() {
  ratio_chart <- ggplot(cases_in_groups, aes(x = age_group, y = ratio)) + 
    geom_bar(stat = "identity") + 
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "ratio",
      title = "cancel population ratio by age group"
    )
  return(ratio_chart)
}