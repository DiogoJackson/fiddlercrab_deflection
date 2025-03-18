#'Script to Perform Binomial Regression
#'Author: Diogo J. A. Silva
# Wed May 22 22:01:39 2024 

#last update
# Tue Mar 18 11:37:56 2025 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)

#1. Import clean data ----
data <- read.csv("data/processed/data_deflection_processed.csv")
head(data)
glimpse(data)

#2. Fitting models ----
m1 <- glmer(outcome ~ treatment + attack_position + illuminant + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m1) #There is no significance in atk position and illuminant ----


#3. Fitting model without attack position and illuminant variables ----
#Final result ---
m2 <- glmer(outcome ~ treatment + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m2)

#4. Comparing models (likelihood ratio test)
anova(m1, m2, test = "Chisq") #There is no diference between models

# The end ---------------------------------------------------------------------
