library(tidyverse)
library(stringr)
library(dplyr)

# ggplot(eis_survey_options, aes( x = information_sources, y = Occurrences)) + 
#   geom_bar(position="stack", stat="identity") +
#   labs(title = "Stacked Bar Graph of News Sources", x = "Sources", y = "Occurrences")

ggplot(eis_survey_options, aes(x="", y= occurrences, fill= information_sources)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title = "Information Sources of Elections")
