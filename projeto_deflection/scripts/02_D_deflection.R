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

#There is no differenc in atk position so take it off ----
m4 <- glmer(outcome ~ treatment + attack_position + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m4)

#Fitting model without attack position variable ----
#This is my result.
#No paper dizer que a posicao do atk nao influencia entao foi tirado do modelo.
m5 <- glmer(outcome ~ treatment + (1 | trial) + (1 | place), 
            data = data, family = binomial)
summary(m5)
