library(tidyverse)
library(stringr)
library(dplyr)

ggplot(eis_survey_options, aes( x = information_sources, y = occurences)) + 
  geom_bar(position="stack", stat="identity") +
<<<<<<< HEAD
  labs(title = "Stacked Bar Graph of News Sources" )


=======
  labs(title = "Stacked Bar Graph of News Sources", x = "Sources"
       , y = "Occurences")
>>>>>>> 3e77ded602e838bbe507cd2da120d20e8c44192a
