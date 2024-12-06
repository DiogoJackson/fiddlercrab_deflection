# Script to Import Reflectance Data from Gelasimus vomeris and Its Paints
# Author: Diogo Silva
# Date: Fri Nov 24 14:30:37 2023 
# last update:
# Thu Dec  5 22:34:42 2024 ------------------------------

#Packages ----
library(tidyverse)
library(pavo)

#1. Import procspec reflectance data ----
color_comparation <- getspec("data/raw/refletancias/color_comparation",                 
                        ext=c("procspec","txt"), 
                        decimal=",", 
                        lim=c(300,700))

vomeris_colors <- getspec("data/raw/refletancias/vomeris_colors",                 
                             ext=c("procspec","txt"), 
                             decimal=",", 
                             lim=c(300,700))

#2. Save reflectances ----
write.csv(color_comparation,
          "data/raw/refletancias/00_color_comparation.csv", 
          row.names = FALSE)

write.csv(vomeris_colors,
          "data/raw/refletancias/00_vomeris_colors.csv", 
          row.names = FALSE)

#3. Test saved data ----
reflet_test   <- read.csv("data/raw/refletancias/00_color_comparation.csv")
reflet_test2  <- read.csv("data/raw/refletancias/00_vomeris_colors.csv")
head(reflet_test)
head(reflet_test2)

# The end ----
