library(dplyr)
library(tidyverse)
library(stringr)



respondent_info_df1 <- read.csv("Seattle_Votes_Survey_Data_from_5_224_immigrant_and_refugee_residents_of_Seattle_King_County.csv", stringsAsFactors = FALSE)

respondent_info_df1 <- read.csv("Seattle_Votes_Survey_Data_from_5_224_immigrant_and_refugee_residents_of_Seattle_King_County.csv", header=T, na.strings=c("", " ", "NA"))

# pulling all columns answering the question about where people might find information on elections
election_information_sources <- respondent_info_df1 %>% 
    select(16:29)

# pulling all columns related to how people have participated in the past

participation_history <- respondent_info_df1 %>% 
  select(31:39)

# simplifying column names
colnames(election_information_sources) <- c("If you wanted to find information about elections, issues, and candidates, which of the following would you most likely use?", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13")

colnames(participation_history) <- c("Please tell us if you have done any of the following activities in the past 2 years.", "2", "3", "4", "5", "6", "7", "8", "9")

# pulling unique answers from each column 

compiled_eis <- data.frame(a = unlist(election_information_sources, use.names = FALSE))

compiled_eis$a <- tolower(compiled_eis$a)

colnames(compiled_eis) <- c("information_sources")

# creating unique_eis

unique_eis <- unique(compiled_eis)

# adding column with number of each unique answer

unique_eis <- compiled_eis %>% 
  group_by(information_sources) %>% 
  summarize(count=n())

colnames(unique_eis) <- c("activities", "occurrences")

unique_eis <- na.omit(unique_eis)

# EIS SURVEY OPTIONS
# making a variable of answers that seem to have been provided as options in the survey

eis_survey_options <- unique_eis %>% 
  filter(occurrences >= 20)

eis_survey_options <- data.frame(eis_survey_options)

colnames(eis_survey_options) <- c("information_sources", "occurrences")

colnames(compiled_eis) <- c("information_sources")

eis_survey_options <- compiled_eis %>% 
  group_by(information_sources) %>%
  summarize(count = n())


eis_survey_options <- eis_survey_options[-1,]

colnames(eis_survey_options) <- c("information_sources", "occurrences")

# making a compilation of participation 

compiled_ph <- data.frame(activities = unlist(participation_history, use.names = FALSE))

# finding unique answers to how easy people have found access to information

unique_ph <- unique(compiled_ph)

unique_ph <- compiled_ph %>% 
  group_by(compiled_ph$activities) %>% 
  summarize(count=n())

colnames(unique_ph) <- c("activities", "occurrences")

unique_ph_na.rm <- na.omit(unique_ph)
    

# pulling data from this question: Overall, how much of a difference do you think you can have in making your neighborhood a better place to live?

making_a_difference <- data.frame(unique(respondent_info_df1$Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live.))

making_a_difference <- respondent_info_df1 %>% 
  group_by(Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live.) %>% 
  summarize(count=n())

colnames(making_a_difference) <- c("Overall, how much of a difference do you think you can have in making your neighborhood a better place to live?", "Occurrences")



# how accessible do people find election info?

accessibility <- data.frame(unique(respondent_info_df1$Q11..How.easy.is.it.to.find.information.about.elections.and.candidates.in.your.preferred.language.))

accessibility <- respondent_info_df1 %>% 
  group_by(Q11..How.easy.is.it.to.find.information.about.elections.and.candidates.in.your.preferred.language.) %>% 
  summarize(count=n())

colnames(accessibility) <- c("How easy is it to find information about elections and candidates in your preferred language?", "Occurrences")

# Looking into the answers from the survey, we found that out of the options given in the survey of ways that a person might participate in their communities or local politics, the people selected `r top_participation` the most, at `r `top_ptn_number` occurrences. Respondents selected `r lowest_participation` the least, at `r `lowest_ptn_number` occurrences. 

top_participation <- unique_ph_na.rm %>% 
  filter(occurrences == max(occurrences)) %>% 
  pull(activities)

top_ptn_number <- unique_ph_na.rm %>% 
  filter(occurrences == max(occurrences)) %>% 
  pull(occurrences)

lowest_participation <- unique_ph_na.rm %>% 
  filter(occurrences == min(occurrences)) %>% 
  pull(activities)

lowest_ptn_number <- unique_ph_na.rm %>% 
  filter(occurrences == min(occurrences)) %>% 
  pull(occurrences)

# add percentages 

top_ptn_percent 

# add more summary statistics 


  
  
