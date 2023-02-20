
library(tidyverse)
library(stringr)


# pulling all columns answering the question about where people might find information on elections
election_information_sources <- respondent_info_df %>% 
    select(16:29)

# simplifying column names
colnames(election_information_sources) <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13")
  

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

compiled_eis <- data.frame(a = unlist(election_information_sources, use.names = FALSE))

unique_participation <- 

# what is the distribution of ease of access as described above
  
  
