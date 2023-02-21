library(ggplot2)
library(dplyr)
library(stringr)

respondent_info_df <- read.csv("Seattle_Votes_Survey_Data_from_5_224_immigrant_and_refugee_residents_of_Seattle_King_County.csv", stringsAsFactors = FALSE)

respondent_info_df1 <- read.csv("Seattle_Votes_Survey_Data_from_5_224_immigrant_and_refugee_residents_of_Seattle_King_County.csv", header=T, na.strings=c(""," ","NA"))


# Count the number of unique values in the Q24 column
unique_income_brackets <- respondent_info_df1 %>% count(Q24..What.was.your.total.combined.household.income.in.2015.before.taxes., name = "count")

# Create the histogram
ggplot(unique_income_brackets, aes(x = Q24..What.was.your.total.combined.household.income.in.2015.before.taxes., y = count)) +
  geom_histogram(stat = "identity", alpha = 0.8) +
  labs(title = "Histogram of Household Income in 2015",
       x = "Household Income in 2015",
       y = "Occurences") + scale_fill_brewer(palette = "Blues")

