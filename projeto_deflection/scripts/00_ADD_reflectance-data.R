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
color_comparation <- getspec("data/raw/refletancias/color_comparation",                 
                        ext=c("procspec","txt"), 
                        decimal=",", 
                        lim=c(300,700))

vomeris_colors <- getspec("data/raw/refletancias/vomeris_colors",                 
                             ext=c("procspec","txt"), 
                             decimal=",", 
                             lim=c(300,700))

#Save reflectances ----
write.csv(color_comparation,
          "data/raw/refletancias/00_color_comparation.csv", 
          row.names = FALSE)

write.csv(vomeris_colors,
          "data/raw/refletancias/00_vomeris_colors.csv", 
          row.names = FALSE)

#test saved data ----
reflet_test   <- read.csv("data/raw/refletancias/00_color_comparation.csv")
reflet_test2  <- read.csv("data/raw/refletancias/00_vomeris_colors.csv")

# FIM ----
