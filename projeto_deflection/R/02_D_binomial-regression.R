#'Script to Perform Binomial Regression
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 

#last update
# Thu Dec  5 23:11:26 2024 

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
summary(m1)
#There is no significance in atk position and illuminant ----

#3. Fitting model without attack position and illuminant variables ----
#Final result ---
m2 <- glmer(outcome ~ treatment + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m2)

# The end ---------------------------------------------------------------------
