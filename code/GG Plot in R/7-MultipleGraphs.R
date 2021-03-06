# INSTALL AND LOAD PACKAGES ################################

if (!require("pacman")) install.packages("pacman")

pacman::p_load(datasets, pacman, rio, tidyverse)

# HISTOGRAMS ###############################################

# Groups marked by color in one plot
iris %>%
  ggplot(aes(x = Petal.Length, 
    fill = Species)) + 
  geom_histogram() +
  theme(legend.position = "bottom")

# Separate plots by group
iris %>%
  ggplot(aes(x = Petal.Length, 
    fill = Species)) + 
  geom_histogram() +
  facet_grid(Species ~ .) +  # facet_grid
  theme(legend.position = "none")  # Turn off legend

# DENSITY PLOTS ############################################

# Groups marked by color in one plot
iris %>%
  ggplot(aes(x = Petal.Length, 
    fill = Species)) + 
  geom_density(alpha = 0.5) +
  theme(legend.position = "bottom")

# Separate plots by group
iris %>%
  ggplot(aes(x = Petal.Length, 
    fill = Species)) + 
  geom_density(alpha = 0.5) +
  facet_grid(Species ~ .) +  # facet_grid
  theme(legend.position = "none")  # Turn off legend

# SCATTERPLOTS #############################################

# Scatterplots with groups
ggplot(iris, 
  aes(Petal.Width, Petal.Length,
    color = Species)) +
  geom_point(size = 3) +
  geom_smooth(method = lm) +
  geom_density2d(alpha = .5) +
  theme(legend.position = "bottom")

# Separate scatterplots for groups
ggplot(iris, 
  aes(Petal.Width, Petal.Length,
    color = Species)) +
  geom_point(size = 3) +
  geom_smooth(method = lm) +
  geom_density2d(alpha = .5) +  
  facet_grid(Species ~ .) +  # facet_grid
  theme(legend.position = "none")  # Turn off legend

# CLEAN UP #################################################

# Clear data
rm(list = ls())  # Removes all objects from environment

# Clear packages
detach("package:datasets", unload = T)  # For base packages
p_unload(all)  # Remove all contributed packages

# Clear plots
graphics.off()  # Clears plots, closes all graphics devices

# Clear console
cat("\014")  # Mimics ctrl+L

# Clear mind :)
