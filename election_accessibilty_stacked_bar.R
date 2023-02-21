library(tidyverse)
library(stringr)
library(dplyr)

ggplot(eis_survey_options, aes( x = information_sources, y = occurences)) + 
  geom_bar(position="stack", stat="identity") +
  labs(title = "Stacked Bar Graph of News Sources" )
