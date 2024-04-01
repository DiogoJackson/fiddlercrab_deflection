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

#Comparing paints ----

#Orange UV paint ----
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

plotspec(nat, 
         legend = TRUE, 
         ylim = c(0, 100),
         main = expression(italic("Gelasimus vomeris")))

plotspec(bkg, 
         legend = TRUE,
         main = expression(italic("Backgrounds")))

#Comparing claw colors with paints ----

nat <- nat %>% 
  rename("Propodus" = contains("_prop_")) %>% 
  rename("Carapace" = contains("_cara_")) %>% 
  rename("Spot" = contains("_caraspot_")) %>% 
  rename("Dactylus" = contains("_dact_")) %>% 
  rename("Manus" = contains("_ponta_"))

#2.1. Colors comparation (natural vs paint) ----

#To Do list:
# 1 = adicionar procspec na pasta "nat"
# 2 = importar spectros
# 3 = ajustar nome do rename: Manus_paint
# 4 = ajustar geom_line: ex: Manus2 para Manus_paint.

#Manus ----

vis_manus <- vis.peafowl(nat, background = "Manus1", illum = "D65")
vis_manus

p1 <- ggplot(nat, aes(wl))+
  geom_line(aes(y = Manus1, linetype = "Natural"), color = "#ffcf00", linewidth = 0.7)+
  geom_line(aes(y = Manus2, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Manus")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Paint" = "dashed", "Natural" = "solid")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p1

#Dactylus ----
p2 <- ggplot(nat, aes(wl))+
  geom_line(aes(y = Dactylus1, linetype = "Natural"), color = "pink", linewidth = 0.7)+
  geom_line(aes(y = Dactylus2, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Dactylus")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Paint" = "dashed", "Natural" = "solid")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p2

#Carapace ----
p3 <- ggplot(nat, aes(wl))+
  geom_line(aes(y = Carapace2, linetype = "Natural"), color = "grey", linewidth = 0.7)+
  geom_line(aes(y = Carapace1, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Carapace")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Paint" = "dashed", "Natural" = "solid")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p3

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