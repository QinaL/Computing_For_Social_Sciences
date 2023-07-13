Data from Springer Nature API
================
Quinn Liu

- [Libraries](#libraries)
- [API Token](#api-token)
- [Retrieving data of top 20 countries with most published articles from
  1970 to
  2022](#retrieving-data-of-top-20-countries-with-most-published-articles-from-1970-to-2022)
  - [Querying function to request API and process into data
    frame](#querying-function-to-request-api-and-process-into-data-frame)
  - [Request data and Export to CSV
    file](#request-data-and-export-to-csv-file)

## Libraries

## API Token

``` r
# in .Rprofile save your key and/or password
# usethis::edit_r_profile(scope = "project")
# options(springer_key = "your_key") 
key <- getOption("springer_key")
```

## Retrieving data of top 20 countries with most published articles from 1970 to 2022

#### Querying function to request API and process into data frame

``` r
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
    content(type = "text") %>% 
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
```

#### Request data and Export to CSV file

``` r
years = c(1970:2022)
top_countries <- map_dfr(years, get_countries_slow)
```

    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.
    ## No encoding supplied: defaulting to UTF-8.

``` r
# clean out a few (20) empty countries given by API
top_countries <- top_countries %>%
  filter(country != "")

write_csv(top_countries, "springer_top_countries.csv")
```
