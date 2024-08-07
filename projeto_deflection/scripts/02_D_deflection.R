#'Data deflection ----
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 ------------------------------

#last update
# Wed Aug  7 20:21:40 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)

#Import data ----
data <- read.csv("data/processed/data_deflection_processed.csv")
head(data)
glimpse(data)

#Fitting models ----

#There is no significance in atk position and illuminant ----
m1 <- glmer(outcome ~ treatment + attack_position + illuminant + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m1)

#Fitting model without attack position and illuminant variables ----
#Final result ----
m2 <- glmer(outcome ~ treatment + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m2)

# The end ---------------------------------------------------------------------
