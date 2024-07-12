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
reflet <- read.csv("data/raw/refletancias/00_vomeris_colors.csv")
reflet <- fixspec(reflet)

reflet2 <- read.csv("data/raw/refletancias/00_color_comparation.csv")
reflet2 <- fixspec(reflet2)



#G. vomeris colors ----
p0 <- ggplot(reflet, aes(x = wl)) +
  geom_line(aes(y = orange_manus, color = "Orange Manus"), linewidth = 0.7) +
  geom_line(aes(y = black_carapace, color = "Black Carapace"), linewidth = 0.7) +
  geom_line(aes(y = blue_carapace, color = "Blue Carapace"), linewidth = 0.7) +
  geom_line(aes(y = mudflat, color = "Mudflat"), linewidth = 0.7) +
  geom_line(aes(y = pink_dactylus, color = "Pink Dactylus"), linewidth = 0.7) +
  ylim(0, 100) +
  labs(title = expression(italic("Gelasimus vomeris")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)") +
  scale_color_manual(values = c("Orange Manus" = "#ffcf00",
                                "Black Carapace" = "black",
                                "Blue Carapace" = "lightblue",
                                "Mudflat" = "brown",
                                "Pink Dactylus" = "pink")) +
  theme_test(base_size = 8) +
  theme(legend.key.height = unit(0.3, 'cm'),
        legend.key.width = unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8)) +
  guides(color = guide_legend(title = NULL))
p0


#Comparing G. vomeris colors with paints ----

reflet2 <- reflet2 %>%
  rename("Carapace" = contains("black_carapace")) %>% 
  rename("Blue_spot" = contains("blue_carapace")) %>% 
  rename("Dactylus" = contains("pink_dactylus")) %>% 
  rename("Manus" = contains("orange_manus")) %>% 
  rename("Mudflat" = contains("mudflat")) %>% 
  rename("Robot_manus" = contains("orange_paint")) %>% 
  rename("Robot_dactyl" = contains("pink_paint")) %>% 
  rename("Cloth" = contains("cloth")) %>% 
  rename("Black_carapace" = contains("black_paint")) %>% 
  rename("Blue_carapace" = contains("blue_paint"))
reflet2

#2.1. Colors comparation (Natural vs paint) ----

p1 <- ggplot(reflet2, aes(wl))+
  geom_line(aes(y = Manus, linetype = "Natural"), color = "#ffcf00", linewidth = 0.7)+
  geom_line(aes(y = Robot_manus, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Orange manus")),
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
p2 <- ggplot(reflet2, aes(wl))+
  geom_line(aes(y = Dactylus, linetype = "Natural"), color = "pink", linewidth = 0.7)+
  geom_line(aes(y = Robot_dactyl, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Pink dactylus")),
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
p3 <- ggplot(reflet2, aes(wl))+
  geom_line(aes(y = Carapace, linetype = "Natural"), color = "grey", linewidth = 0.7)+
  geom_line(aes(y = Black_carapace, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Black carapace")),
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

p4 <- ggplot(reflet2, aes(wl))+
  geom_line(aes(y = Blue_spot, linetype = "Natural"), color = "lightblue", linewidth = 0.7)+
  geom_line(aes(y = Blue_carapace, linetype = "Paint"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Blue carapace")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Paint" = "dashed", "Natural" = "solid")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p4

p5 <- ggplot(reflet2, aes(wl))+
  geom_line(aes(y = Mudflat, linetype = "Mudflat"), color = "brown", linewidth = 0.7)+
  geom_line(aes(y = Cloth, linetype = "Cloth"), color = "black", linewidth = 0.7)+
  ylim(0, 100)+
  labs(title = expression(bold("Background")),
       x = "Wavelength (nm)",
       y = "Reflectance (%)")+
  theme_test(base_size = 8)+
  scale_linetype_manual(values = c("Mudflat" = "solid","Cloth" = "dashed")) +
  theme(legend.key.height= unit(0.3, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.position = c(0.70, 0.8),
        plot.title = element_text(size = 8))+
  guides(linetype = guide_legend(title = NULL))
p5

#Unite plots ----
p <- plot_grid(p1,p2,p3,p4,p5,
          ncol = 3,
          align = "h",
          labels = "AUTO")
p

#Save plot ----

ggsave(plot = p0, 
       filename = "outputs/figures/vomeris_colors.png",
       width = 3, 
       height = 2.5, 
       dpi = 300)

ggsave(plot = p, 
       filename = "outputs/figures/color_comparations.png",
       width = 6, 
       height = 4, 
       dpi = 300)

# FIM ----
