# HW07: Collecting and analyzing data from the web

## Purpose

This is a repository with a R script to request data from the [Springer Nature API](https://dev.springernature.com/) and an analysis of the data set obtained. The API requires an account to obtain an API key. Please sign up for an account if you would like to run the script. Springer Nature is an academic publishing company, and the API provides metadata for all its online documents. The data set contains the top 20 countries with the most published works from the years 1970 to 2022, along with the count and rank for each country. 

### Files

- `springer_API.R`: Rscript file to run to query data from API, clean the data set, and export into csv file
- `springer_analysis.md`: Analysis report of the data set
- `springer_analysis.Rmd`: contains the code to create the analysis; code to create all the graphs is found here
- `springer_analysis_files/figure-gfm`: directory that holds all the graphs used in the report
- `data`: directory holds the data set csv

### How to Use

Obtain API Key. Run `springer_API.R` and then run `springer_analysis.Rmd`. The produced outputs are `data/springer_top_countries.csv` and `springer_analysis.md`. 


## Reflection

I at first was using the pubmed API, which was returning xml files. It took a long time to realize what I was dealing with, how to deal with it, and ultimately, while I found some success is querying and processing, I decided this path was not worth it. The API required resumption tokens, gave me 502 errors, and did not provide much metadata, and I found that you could just bulk download their records anyway, so I did not have a good plan for API querying and later analysis. So I then switch to Springer Nature, and their API is better documented and have more options. Outside of the intial wrong path, the hardest thing was figuring out what the API was, but luckily reading the documentation usually answered my questions. I also struggled with picking what of the data I got back to focus on and how to analysis it. Essentially, my biggest struggle was approach, on multiple levels.

There was a little bit of trouble with parsing JSOn, but I found a [stackoveflow post](https://stackoverflow.com/questions/41436723/how-to-select-a-particular-section-of-json-data-in-r) with a top answer that informed me of `fromJSON()`, which resolved my questions. I also went back to some old data visualization resources like [R Gallery](https://r-graph-gallery.com/index.html), along with a [statology post](https://www.statology.org/ggplot-reverse-axis/) on axis specifications. I have a better intuition for API querying now (and a semi-understanding of xml files), and I'll like to think I'm getting better at data analysis. 
