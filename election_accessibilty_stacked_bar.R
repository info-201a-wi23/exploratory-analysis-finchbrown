library(tidyverse)
library(stringr)
library(dplyr)

ggplot(data, aes(fill = eis_survey_options, y = count(), x = unique_eis)) + 
  geom_bar(position="stacked", stat="identity")