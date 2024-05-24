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
data <- read.csv("data/processed/data_deflection_processed.csv")
head(data)
glimpse(data)

#Fitting models ----
m1 <- glmer(outcome ~ treatment + trial + (1 | place) + (1 | ID), 
                    data = data, family = binomial)
summary(m1)
