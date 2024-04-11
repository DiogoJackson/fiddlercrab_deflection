# Script para importar refletancias txt do Gelasimus vomeris e suas tintas
# author: Diogo Silva
# Data: Fri Nov 24 14:30:37 2023 ------------------------------
# last update:
# Fri Nov 24 14:30:46 2023 ------------------------------

#Packages ----
library(tidyverse)
library(pavo)
library(colorspec)

#Import procspec data ----
refletancias <- getspec("data/raw/refletancias/comparation",                 
                                ext=c("procspec","txt"), 
                                decimal=",", 
                                lim=c(300,700))

refletancias2 <- getspec("data/raw/refletancias/naturals",                 
                        ext=c("procspec","txt"), 
                        decimal=",", 
                        lim=c(300,700))

refletancias3 <- getspec("data/raw/refletancias/substrato",                 
                        ext=c("procspec","txt"), 
                        decimal=",", 
                        lim=c(300,700))

#Save reflectances ----
write.csv(refletancias,
          "data/raw/refletancias/00_refletancias.csv", 
          row.names = FALSE)

write.csv(refletancias2,
          "data/raw/refletancias/00_natural_reflectances.csv", 
          row.names = FALSE)

write.csv(refletancias3,
          "data/raw/refletancias/00_bkg_reflectances.csv", 
          row.names = FALSE)

#test saved data ----
reflet_test  <- read.csv("data/raw/refletancias/00_refletancias.csv")
reflet_test2 <- read.csv("data/raw/refletancias/00_natural_reflectances.csv")
reflet_test3 <- read.csv("data/raw/refletancias/00_bkg_reflectances.csv")

# FIM ----
