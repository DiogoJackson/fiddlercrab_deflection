#'Script to Clean Raw Data and Save as CSV ----
#'Author: Diogo J. A. Silva
# Wed May 22 22:01:39 2024 

#last update
# Thu Dec  5 23:12:15 2024


#package ----
library(readxl)
library(tidyverse)
library(lme4)

#1. Import data ----
data <- read_excel("data/raw/data_deflection.xlsx")

#2. Cleaning data ----

data <- data %>% 
  mutate(outcome = ifelse(first_attack == "Claw", 1, 0)) %>%           #creating first_attack 0 or 1
  mutate(treatment = fct_recode(treatment, "B" = "C", "C" = "B")) %>%  #rename treatments
  filter(treatment != "D") %>%                                         #we are not using the treatment D (orange claw and black carapace without movement)
  filter(species == "bush_turkey") %>%                                 #using only bush-turkeys
  filter(experiment == "definitive") %>%                               #not including the pilot data
  relocate(ID, trial, first_attack, outcome)                           #relocate variables in dataset
head(data)

#2.1 Modify the dataframe to include a color column based on treatment and first_attack ----
#This is so that, in the graph, the bars representing body parts are colored according to the treatment color.
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
#3. Correcting variable types ----
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

#4. Save clean data ----
write.csv(data,
          "data/processed/data_deflection_processed.csv",
          row.names = F)

#Test clean data ----
teste_data <- read.csv("data/processed/data_deflection_processed.csv")
head(teste_data)

# END ---------------------------------------------------------------------
