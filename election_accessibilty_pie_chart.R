library(tidyverse)
library(stringr)
library(dplyr)
library(ggplot2)

# ggplot(eis_survey_options, aes( x = information_sources, y = Occurrences)) + 
#   geom_bar(position="stack", stat="identity") +
#   labs(title = "Stacked Bar Graph of News Sources", x = "Sources", y = "Occurrences")

ggplot(eis_survey_options, aes(x="", y= occurrences, fill= eis_survey_options$If.you.wanted.to.find.information.about.elections..issues..and.candidates..which.of.the.following.would.you.most.likely.use.)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title = "Information Sources of Elections")
