# rm(list = ls())

# preamble ----------------------------------------------------------------

library(tidyverse)
library(stats)
library(ompr)
library(ompr.roi)
library(ROI)
library(ROI.plugin.glpk)
theme_set(theme_bw())




# description and input ---------------------------------------------------

# This example is illustrated with 5 teams. It is important for a bipartite match to have identical sizes of the two groups, so that every case and every team has a match. 
nteams <- 5
ncases <- nteams

# input: preference matrix ------------------------------------------------

# Preference matrix: rows represent teams; columns represent cases
# teams are indexed with i = 1:nteams; cases are indexed with j = 1:ncases
team_preferences <- matrix(rep(0, nteams*ncases), nrow = nteams)
# t_{ij} represents team i's preference for case j. 
team_preferences[1, ] <- c(4, 1, 2, 5, 3) 
team_preferences[2, ] <- c(3, 5, 2, 1, 3)
team_preferences[3, ] <- c(1, 2, 3, 4, 5)
team_preferences[4, ] <- c(1, 2, 3, 4, 5)
team_preferences[5, ] <- c(1, 4, 3, 5, 2) 