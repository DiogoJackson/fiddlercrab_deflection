# Script para modelagem visual tinta vs real
# author: Diogo Silva
# Mon Feb  5 16:06:05 2024 ------------------------------
# last update:
# Mon Feb  5 16:06:09 2024 ------------------------------

#Packages ----
library(tidyverse)
library(pavo)
library(colorspec)

#Import data ----
reflet <- read.csv("data/raw/refletancias/00_natural_reflectances.csv")
reflet <- fixspec(reflet)
colnames(reflet)

#Vismodel ----
#Comparando as tintas com a refletancia natural ----
vis <- vis.peafowl(reflet, background = "cloth", illum = "bluesky")
vis

