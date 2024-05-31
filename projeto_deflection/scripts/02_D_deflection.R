#'Data deflection ----
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 ------------------------------

#last update
# Mon May 27 11:07:49 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)

#Import data ----
data <- read.csv("data/processed/data_deflection_processed.csv")
head(data)
glimpse(data)

#Fitting models ----
m1 <- glmer(outcome ~ treatment * attack_position + (1 | place), 
                    data = data, family = binomial)
summary(m1)

m2 <- glmer(outcome ~ treatment + attack_position + (1 | place), 
            data = data, family = binomial)
summary(m2)

m3 <- glmer(outcome ~ treatment * attack_position + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m3)

m4 <- glmer(outcome ~ treatment + attack_position + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m4)
