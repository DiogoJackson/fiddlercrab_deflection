# Script para criar graficos
# author: Diogo Silva
# Mon Feb  5 16:32:59 2024 ------------------------------
# last update:
# Mon Feb  5 16:33:02 2024 ------------------------------


#Packages ----
library(tidyverse)
library(pavo)
library(colorspec)
library(cowplot)

#Import procspec data tintas ----
nat <- read.csv("data/raw/refletancias/00_natural_reflectances.csv")
nat <- fixspec(nat)

#Comparing claw colors with paints ----

nat <- nat %>% 
  rename("Propodus" = contains("_prop_")) %>% 
  rename("Carapace" = contains("_cara_")) %>% 
  rename("Spot" = contains("_caraspot_")) %>% 
  rename("Dactylus" = contains("_dact_")) %>% 
  rename("Manus" = contains("_ponta_")) %>% 
  rename("Mudflat" = contains("_areia")) %>% 
  rename("Robot_manus" = contains("laranja")) %>% 
  rename("Robot_dactyl" = contains("rosa")) %>% 
  rename("Cloth" = contains("pano")) %>% 
  rename("Robot_carapace" = contains("preto"))
nat

#2.1. Colors comparation (natural vs paint) ----

vis_manus <- vis.peafowl(nat, background = "Manus2", illum = "D65")
vis_manus

p1 <- ggplot(nat, aes(wl))+
  geom_line(aes(y = Manus2, linetype = "Natural"), color = "#ffcf00", linewidth = 0.7)+
  geom_line(aes(y = Robot_manus2, linetype = "Paint"), color = "black", linewidth = 0.7)+
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
  geom_line(aes(y = Dactylus2, linetype = "Natural"), color = "pink", linewidth = 0.7)+
  geom_line(aes(y = Robot_dactyl2, linetype = "Paint"), color = "black", linewidth = 0.7)+
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
  geom_line(aes(y = Robot_carapace1, linetype = "Paint"), color = "black", linewidth = 0.7)+
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

p4 <- ggplot(nat, aes(wl))+
  geom_line(aes(y = Mudflat2, linetype = "Mudflat"), color = "brown", linewidth = 0.7)+
  geom_line(aes(y = Cloth1, linetype = "Cloth"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Carapace")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Cloth" = "dashed", "Mudflat" = "solid")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p4

#Unite plots ----
p <- plot_grid(p1,p2,p3,p4,
          ncol = 2,
          align = "vh",
          labels = "AUTO")
p

#Save plot ----

ggsave(plot = p, 
       filename = "outputs/figures/apparatus_colors.png",
       width = 4, 
       height = 4, 
       dpi = 300)

# FIM ----