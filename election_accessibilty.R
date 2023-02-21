library(tidyverse)
library(stringr)
library(dplyr)

current_year <- -2015

avg_age <- respondent_info_df %>% group_by(respondent_info_df$Q02..In.what.year.were.you.born.) 
  %>% summarize(avg_age = mean(respondent_info_df$Q02..In.what.year.were.you.born.) + current_year)
  
  