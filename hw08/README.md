# HW08: Analyzing textual data

## Purpose

This is a repository with a report of text analysis and topic modeling on U.S. Political Platforms from 2000 to 2016, along with the Rmd file to create the report and the graphs. The Rmd file has code to scrape [The American Presidency Project](https://www.presidency.ucsb.edu/documents/app-categories/elections-and-transitions/party-platforms) to retrieve the corpus and all the code used to create the analysis and graphs. 

#### What's the Textual Data and Why

America's main political parties, the Democratic Party and the Republican Party, both release platform statements in the cycle with the presidential elections. Both parties outline the issues the party will stand for and the political goals they aim for. These platforms represent both the parties' interests and their voters interests. The current political topics appear in the corresponding year's platforms, from al-qaeda in the 2000s to COVID in 2020. Using textual analysis on the party platform statements from the Democratic Party and the Republican Party from 2000 to 2016, we can see the main issues that the parties focus and which topics loom the largest in America's political conversation.

See the [report](platforms.md) for more.

#### Files

- [platforms.md](platforms.md): Analysis report 
- [platforms.Rmd](platforms.Rmd): contains the code to create the analysis; code to create all the graphs is found here
- [springer_analysis_files/figure-gfm](springer_analysis_files/figure-gfm): directory that holds all the graphs used in the report

#### How to Use

Simply just run [platforms.Rmd](platforms.Rmd).

###### Libraries Required

```r
library(rvest)
library(tidytext)
library(topicmodels)
library(tidyverse)
```


## Reflection

The hardest part of this assignment was the exhaustion and fatigue from doing the past 2 assignments this week. I don't think this was the most difficult one out of the three but it was the least fun because I was just so tired. But outside of that, it took a little while to get familiar with the text analysis. I had to go back to class code and textbook code quite a bit, but it wasn't that much of a struggle. I think most of the struggle was figuring what was the best approach to analyzing the corpus.

I still have to occasionally google how to do specific things with graphing, like changing facet label names. I had to regoogle that and go back to my hw02 code, so I'm not retaining everything I've learned, but I am retaining how to search for it, so that process is easier, along with having my own code to go back to. I had to figure out how to order things within facets. That was something new and cool about graphing learned.

#### Resources Used

- https://juliasilge.com/blog/reorder-within/
- https://www.geeksforgeeks.org/filtering-row-which-contains-a-certain-string-using-dplyr-in-r/
- https://www.tidytextmining.com/topicmodeling.html (mainly Chapter 3 and 6)
- http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
- https://www.datanovia.com/en/blog/how-to-change-ggplot-facet-labels/
