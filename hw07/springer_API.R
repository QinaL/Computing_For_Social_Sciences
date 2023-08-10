# ------------------------------------------
# libraries
# ------------------------------------------
library(httr)
library(jsonlite)
library(tidyverse)


# ------------------------------------------
# API Token
# ------------------------------------------
# in .Rprofile save your key and/or password
# usethis::edit_r_profile(scope = "project")
# options(springer_key = "your_key") 
key <- getOption("springer_key")


# ------------------------------------------
# Retrieving data 
# -------------------------------------------
# top 20 countries with most published articles from 1970 to 2022

# querying function to request API and process into data frame
get_countries_by_year <- function(year){
  
  response <- GET(
    url = "https://api.springernature.com/metadata/json?",
    query = list(
      api_key = key, 
      q = paste0("year:", year),
      p = 1
      ))
  
  # retrieve content and parse into a data frame
  df <- response %>% 
    content(type = "text", encoding = "UTF-8") %>% 
    fromJSON()
  
  # select the countries data and clean
  countries = df$facets$values[[5]] %>%
    mutate(
      year = year, 
      rank = c(1:20)
      ) %>%
    rename(country = value, published_count = count)
  
  return(countries)
}

get_countries_slow = slowly(get_countries_by_year, rate = rate_delay(0.5))


# ------------------------------------------
# Request data and Export to CSV file
# ------------------------------------------

years = c(1970:2022)
top_countries <- map_dfr(years, get_countries_slow)

# clean out a few (20) empty countries given by API
top_countries <- top_countries %>%
  filter(country != "")

write_csv(top_countries, "data/springer_top_countries.csv")
