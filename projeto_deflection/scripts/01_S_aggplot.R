# Script para criar graficos
# author: Diogo Silva
# Mon Feb  5 16:32:59 2024 ------------------------------
# last update:
# Mon Feb  5 16:33:02 2024 ------------------------------


#Packages ----
library(tidyverse)
library(pavo)
library(colorspec)

#Import procspec data tintas ----
reflet <- read.csv("data/raw/refletancias/00_refletancias.csv")
reflet <- fixspec(reflet)

nat <- read.csv("data/raw/refletancias/00_natural_reflectances.csv")
nat <- fixspec(nat)

bkg <- read.csv("data/raw/refletancias/00_bkg_reflectances.csv")
bkg <- fixspec(bkg)

#Preparing data ----

#Paints ----
colnames(reflet)

refletancias <- reflet %>% 
  rename(`Natural claw` = gv_q_Reflection_00002,
         `Orange paint` = orange_paint_kaisercraft_pure_Reflection_001,
         `UV orange paint` = `orange_paint.4g_ba.5g_Reflection_001`)

plotspec(refletancias,
         ylim = c(0,100),
         legend = T)

#Naturals ----
plot(nat, ylim = c(0,100))
colnames(nat)

nat <- nat %>% 
  rename("Propodus" = contains("_prop_")) %>% 
  rename("Carapace" = contains("_cara_")) %>% 
  rename("Spot" = contains("_caraspot_")) %>% 
  rename("Dactylus" = contains("_dact_")) %>% 
  rename("Manus" = contains("_ponta_"))

#Plot ----
plotspec(refletancias,
         legend = T,
         ylim = c(0,100))

plotspec(nat, 
         legend = TRUE, 
         ylim = c(0, 100),
         main = expression(italic("Gelasimus vomeris")))

plotspec(bkg, 
         legend = TRUE,
         main = expression(italic("Backgrounds")))

#Save plot ----

png(file = "outputs/figures/Gelasimus-vomeris_paints.png",
    res = 300,
    units = "in",
    width = 4.5,
    height = 4)

plotspec(refletancias,
         legend = T,
         ylim = c(0,100))

dev.off()

#Naturals
png(file = "outputs/figures/Gelasimus-vomeris_reflectances.png",
    res = 300,
    units = "in",
    width = 4.5,
    height = 4)

plotspec(nat, 
         legend = TRUE, 
         ylim = c(0, 100),
         main = expression(italic("Gelasimus vomeris")))

dev.off()

# FIM ----