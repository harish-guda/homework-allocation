# setwd("./assigning-cases-teams/")
source("team-preferences.R")

# regret-minimization-formulation -----------------------------------------

# the model is as follows: 
# min sum_{i  = 1}^N \sum_{j = 1}^N t_{ij} x_{ij} s.t.
# sum_{i = 1}^N x_{ij} = 1 for all j; sum_{j = 1}^N x_{ij} = 1 for all i; 
# x_{ij} in {0, 1}

# model formulation -------------------------------------------------------


model <- MIPModel() %>% 
  add_variable(x[i, j], type = "binary", i = 1:nteams, j = 1:ncases) %>% 
  set_objective(-(sum_expr(x[i, j] * team_preferences[i, j], 
                           i = 1:nteams, 
                           j = 1:ncases))) %>% 
  add_constraint(sum_expr(x[i, j], i = 1:nteams) == 1, 
                 j = 1:ncases) %>% 
  add_constraint(sum_expr(x[i, j], j = 1:ncases) == 1, 
                 i = 1:nteams)

result <- model %>% 
  solve_model(with_ROI("glpk", verbose = T))

solution <- result %>% 
  get_solution(x[i, j])


# solution display --------------------------------------------------------

solution %>% 
  filter(!(value == 0))

xSTAR <- matrix(data = solution$value, nrow = 5)


# frequency plot: preference ----------------------------------------------

df <- data.frame(x = 1:nteams, 
                 outcome_regretmin = rowSums(team_preferences * xSTAR) %>% as.factor()) 
ggplot(df) + 
  geom_bar(mapping = aes(x = outcome_regretmin, fill = outcome_regretmin)) + 
  theme(legend.position = "none") +
  labs(x = "Preferred Outcome", y = "Count", title = "Preferred Outcomes of Allocation")
