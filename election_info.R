
library(tidyverse)
library(stringr)


# pulling all columns answering the question about where people might find information on elections
election_information_sources <- respondent_info_df %>% 
    select(16:29)

# simplifying column names
colnames(election_information_sources) <- c("If you wanted to find information about elections, issues, and candidates, which of the following would you most likely use?", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13")
  
colnames(participation_history) <- c("Please tell us if you have done any of the following activities in the past 2 years.", "2", "3", "4", "5", "6", "7", "8", "9")

# pulling unique answers from each column 

compiled_eis <- data.frame(a = unlist(election_information_sources, use.names = FALSE))

compiled_eis$a <- tolower(compiled_eis$a)

unique_eis <- unique(compiled_eis)

# adding column with number of each unique answer

unique_eis <- compiled_eis %>% 
  group_by(a) %>% 
  summarize(count=n())

# pulling all columns related to how people have participated in the past

participation_history <- respondent_info_df %>% 
  select(31:39)
  
# finding unique answers to how easy people have found access to information

compiled_ph <- data.frame(a = unlist(participation_history, use.names = FALSE))

unique_ph <- unique(compiled_ph)

unique_ph <- compiled_ph %>% 
  group_by(a) %>% 
  summarize(count=n())

rm(unique_participation)

# clarifying column names

colnames(unique_ph) <- c("Please tell us if you have done any of the following activities in the past 2 years.", "occurances")
colnames(unique_eis) <- c("If you wanted to find information about elections, issues, and candidates, which of the following would you most likely use?", "occurances")
colnames(compiled_eis) <- c("If you wanted to find information about elections, issues, and candidates, which of the following would you most likely use?")
colnames(compiled_ph) <- c("Please tell us if you have done any of the following activities in the past 2 years.")

# making a variable of answers that seem to have been provided as options in the survey

eis_survey_options <- unique_eis %>% 
  filter(occurances >= 20, answers != "") %>% 
  pull(answers)

eis_survey_options <- data.frame(eis_survey_options)

# pulling data from this question: Overall, how much of a difference do you think you can have in making your neighborhood a better place to live?

making_a_difference <- data.frame(unique(respondent_info_df$Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live.))

colnames(making_a_difference) <- c("Overall, how much of a difference do you think you can have in making your neighborhood a better place to live?", "Occurances")

rm(making_a_difference_survey_options)

making_a_difference <- respondent_info_df %>% 
  group_by(Q08..Overall..how.much.of.a.difference.do.you.think.you.can.have.in.making.your.neighborhood.a.better.place.to.live.) %>% 
  summarize(count=n())

# how accessible do people find election info?

accessibility <- data.frame(unique(respondent_info_df$Q11..How.easy.is.it.to.find.information.about.elections.and.candidates.in.your.preferred.language.))

accessibility <- respondent_info_df %>% 
  group_by(Q11..How.easy.is.it.to.find.information.about.elections.and.candidates.in.your.preferred.language.) %>% 
  summarize(count=n())

colnames(accessibility) <- c("How easy is it to find information about elections and candidates in your preferred language?", "Occurrances")





  
  
  
  