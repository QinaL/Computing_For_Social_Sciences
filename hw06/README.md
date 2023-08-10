# HW06: Generating reproducible social science research

## Purpose

This is a repository that holds the report "Economic Connections At Colleges" along with the Rmd file that has the code and analysis used in the report. The code to produce the figures and results in the report can be found in `report.Rmd`.

### Files

- `report.md`: github document that is the report "Economic Connections At Colleges"
- `report.Rmd`: Rmd file that holds the code used to import, clean, and analyze the data and produce the report
- `report_files/figure-gfm/`: holds all the figures used in the report; code to generate the figures can be found in `report.Rmd`
- `data/`: holds the csv files of the two data sets used; social capital data is stored here, scorecard data will be downloaded and unzipped in `report.Rmd` in this directory

### Libraries Required

```r
library(knitr) 
library(downloader)
library(tidyverse)
```

## Reflection

I spent a lot of time trying to find a data set. The openness of the assignment intimidated me. When I found the Social Capital Atlas, I was quite interested, so I'm glad for that. It was easy and fun to do basic exploratory data analysis, but I had a lot of trouble piecing what I should explore and include in a report. The DOE Scorecard had 3000 variables and the Social Capital data set had a fair bit of variables too, so I spent a quite bit amount (A LOT) of time reading their respective codebooks to understand what the variables were and another quite bit amount (A LOT) of time doing basic scatterplots and histograms of various variables and relationships. In the end, I struggled to find a good main question and a way to answer it for the report, so I cut a lot of the variables that were available, and yet my report ended up very long. I wasn't sure how to piece analysis together in a way that felt like I was coming to interesting conclusions.

A coding problem I had was I wanted to pass a column name to a function and use that as a variable in the function, and I found numerous approaches for this on stackoverflow but they felt messy for what I want to do. When I found the `tidyeval` solution, I was very pleased with how easily done it could be. Just using `{{}}` is so smooth. I definitely enjoyed being able to solidify everything learned in this course and use the concepts in conjunction with each other, while still being aware of how much more R has.
