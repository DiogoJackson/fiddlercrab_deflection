#'Data deflection ----
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 ------------------------------

#last update
# Wed Aug  7 20:22:04 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)

#Import data ----
data <- read_excel("data/raw/data_deflection.xlsx")

#Cleaning data ----
data <- data %>% 
  mutate(outcome = ifelse(first_attack == "Claw", 1, 0)) %>%           #creating first_attack 0 or 1
  mutate(treatment = fct_recode(treatment, "B" = "C", "C" = "B")) %>%  #rename treatments
  filter(treatment != "D") %>%                                         #we are not using the treatment D (orange claw and black carapace without movement)
  filter(species == "bush_turkey") %>%                                 #using only bush-turkeys
  filter(experiment == "definitive") %>%                               #not including the pilot data
  relocate(ID, trial, first_attack, outcome)                           #relocate variables in dataset
head(data)

# Modificar o dataframe para incluir uma coluna de cor baseada no tratamento e first_attack
data$color <- with(data, ifelse(treatment == "A" & first_attack == "Carapace", "#2f4858",
                              ifelse(treatment == "A" & first_attack == "Claw", "#f6ae2d",
                                     ifelse(treatment == "C" & first_attack == "Carapace", "#2f4858",
                                            ifelse(treatment == "C" & first_attack == "Claw", "#2f4858",
                                                   ifelse(treatment == "B" & first_attack == "Carapace", "#56dde0",
                                                          ifelse(treatment == "B" & first_attack == "Claw", "#f6ae2d",
                                                                 ifelse(treatment == "D" & first_attack == "Carapace", "#2f4858", NA))))))))

data$attack_label <- with(data,
                         ifelse(treatment == "A" & first_attack == "Claw", "Orange claw",
                                ifelse(treatment == "A" & first_attack == "Carapace", "Black carapace",
                                       ifelse(treatment == "C" & first_attack == "Claw", "Black claw",
                                              ifelse(treatment == "C" & first_attack == "Carapace", "Black carapace",
                                                     ifelse(treatment == "B" & first_attack == "Claw", "Orange claw",
                                                            ifelse(treatment == "B" & first_attack == "Carapace", "Blue carapace", NA)))))))
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
