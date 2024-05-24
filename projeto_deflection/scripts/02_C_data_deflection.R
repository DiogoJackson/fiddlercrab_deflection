#'Data deflection ----
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 ------------------------------

#last update
# Wed May 22 22:01:44 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)

#Import data ----
data <- read_excel("data/raw/data_deflection.xlsx")

#creating first_attack 0 or 1
data <- data %>% 
  mutate(outcome = ifelse(first_attack == "Claw", 1, 0)) %>% 
  relocate(ID, trial, first_attack, outcome)
head(data)

#correcting variable types
glimpse(data)
data$treatment <- as.factor(data$treatment)
data$attack_position <- as.factor(data$attack_position)
data$ID <- as.factor(data$ID)
data$trial <- as.factor(data$trial)
data$place <- as.factor(data$place)
data$illuminant <- as.factor(data$illuminant)
data$species <- as.factor(data$species)
data$background <- as.factor(data$background)
glimpse(data)

#Save clean data ----
write.csv(data,
          "data/processed/data_deflection_processed.csv",
          row.names = F)

#Test data
teste_data <- read.csv("data/processed/data_deflection_processed.csv")
head(teste_data)

# END ---------------------------------------------------------------------
