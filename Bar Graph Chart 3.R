library(ggplot2)
library(dplyr)
library(stringr)

respondent_info_df <- read.csv("Seattle_Votes_Survey_Data_from_5_224_immigrant_and_refugee_residents_of_Seattle_King_County.csv", stringsAsFactors = FALSE)

# Values from the Q8 column
differences_values <- respondent_info_df %>% count(Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live., name = "Age")

# Make a bar graph
ggplot(differences_values, aes(x = Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live., y = Age)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "How much of a difference do you think you can make in your neighborhood", x = "Age", y = "Number of Responses")
