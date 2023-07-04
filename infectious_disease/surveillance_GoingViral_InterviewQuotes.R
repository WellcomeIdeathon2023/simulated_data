## Generate interview quotes in simple sentences
# sentiment_vec is a vector of sentiment words taken from the tidytext package and Bing lexicon
# topic_vec gives some COVID related subjects 
# institution_vec gives some community or groups that a person may be discussing

# the generation is a random draw from each vector and pasted together in a sentence- not all sentences will make sense


sentiment_vec <- tidytext::get_sentiments("bing")
topic_vec <- c("COVID", "COVI19", "COVID-19", "vaccination", "vaccines", "infection", "isolation", "quarantine", "long COVID", "protecting my family")
institution_vec <- c("the government", "my doctor", "my family", "my community", "my church", "my partner", "politicians")

generate_interview_statement <- function(sentiment_vec, topic_vec, institution_vec){
  sent <- sample(sentiment_vec$word[!grepl("ly|ing", sentiment_vec$word)], 1)
  top <- sample(topic_vec, 1)
  inst <- sample(institution_vec, 1)
  dodont <- sample(c("do", "do not"), 1)
  
  paste0("I am ", sent, " about ", top, " and I ", dodont, " think my views are heard by ", inst, ".")
}

int <- NULL
for(i in 1:100){
  int[i] <- generate_interview_statement(sentiment_vec, topic_vec, institution_vec)
}
int
