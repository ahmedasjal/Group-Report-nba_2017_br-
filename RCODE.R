
# Code of our Group Report

library(tidyverse)

# Loading the dataset

nba <- read_csv("nba_2017_br.csv")

# Cleaning the dataset and selecting variables.

nba_clean <- nba %>%
  select(Player, Pos, MP, `PS/G`) %>%
  filter(!is.na(MP), !is.na(`PS/G`)) %>%
  rename(PSG = `PS/G`)

#  Scatterplot: PS/G on X-axis, MP on Y-axis

scatter_plot <- nba_clean %>%
  ggplot(aes(x = PSG, y = MP, colour = Pos)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, colour = "black") +
  labs(
    title = "Scatter Plot: Points Scored per Game (PS/G) vs Minutes Played (MP)",
    x = "Points Scored per Game (PS/G)",
    y = "Minutes Played (MP)",
    colour = "Position"
  ) +
  theme_minimal()

print(scatter_plot)

#  Histogram of MP with Bell Curve Overlay

mp_mean <- mean(nba_clean$MP)
mp_sd   <- sd(nba_clean$MP)

hist_bell <- nba_clean %>%
  ggplot(aes(x = MP)) +
  geom_histogram(
    aes(y = ..density..),
    binwidth = 2,
    fill = "lightblue",
    colour = "black"
  ) +
  stat_function(
    fun = dnorm,
    args = list(mean = mp_mean, sd = mp_sd),
    colour = "red",
    linewidth = 1
  ) +
  labs(
    title = "Histogram of Minutes Played (MP) (Bell Curve)",
    x = "Minutes per Game (MP)",
    y = "Density"
  ) +
  theme_minimal()

print(hist_bell)

