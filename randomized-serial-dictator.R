# setwd("./assigning-cases-teams/")
source("team-preferences.R")

random_sequence <- sample(1:nteams, nteams, replace = F)
assignment_outcome <- matrix(rep(0, nteams*ncases), nrow = nteams)
preference <- team_preferences

for (i in 1:nteams) {
  team <- random_sequence[i]
  case <- which.min(preference[team,])
  assignment_outcome[team, case] <- 1
  preference[, case] <- Inf
}

xSTAR <- assignment_outcome

df <- data.frame(x = 1:nteams, 
                 outcome_rsd = rowSums(team_preferences * xSTAR) 
                 %>% as.factor()) 

ggplot(df) + 
  geom_bar(mapping = aes(x = outcome_rsd, fill = outcome_rsd)) + 
  theme(legend.position = "none") +
  labs(x = "Preferred Outcome", y = "Count", title = "Preferred Outcomes of Allocation for the RSD mechanism")
