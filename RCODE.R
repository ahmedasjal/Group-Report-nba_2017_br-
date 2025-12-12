
# Code of our Group Report

library(tidyverse)

# Loading the dataset

nba <- read_csv("nba_2017_br.csv")

# Cleaning the dataset and selecting variables.

nba_clean <- nba %>%
  select(Player, Pos, MP, `PS/G`) %>%
  filter(!is.na(MP), !is.na(`PS/G`)) %>%
  rename(PSG = `PS/G`)
