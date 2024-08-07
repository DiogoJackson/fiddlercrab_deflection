#'Data deflection ----
#'Author: Diogo Silva
# Tue Apr 16 17:13:11 2024 ------------------------------

#last update
# Wed May 22 22:01:54 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(forcats)

#Import data ----
dat <- read.csv("data/processed/data_deflection_processed.csv")

#Visualizing data  ----

#By attack position ----
p1 <- ggplot(dat, aes(x = first_attack, fill = attack_position)) +
  geom_bar(width = 0.6, position = position_dodge(preserve = "single" )) +  # Defina a cor de preenchimento aqui
  geom_text(stat = "count", aes(label = ..count..), position = position_dodge(width = 0.6), vjust = -0.5, size = 3) +  
  scale_fill_manual(values = c("grey", "grey33", "grey10"))+
  labs(x = "First attack", y = "Total of attacks") +
  theme_classic()+
  facet_grid(~treatment)
p1

#By illuminant ----
p2 <- ggplot(dat, aes(x = first_attack, fill = illuminant)) +
  geom_bar(width = 0.6, position = position_dodge(preserve = "single" )) +  # Defina a cor de preenchimento aqui
  geom_text(stat = "count", aes(label = ..count..), position = position_dodge(width = 0.6), vjust = -0.5, size = 3) +  
  scale_fill_manual(values = c("grey", "grey33", "grey10"))+
  labs(x = "First attack", y = "Total of attacks") +
  theme_classic()+
  facet_grid(~treatment)
p2

#Reorganizando os fatores ----
dat$attack_label <- factor(dat$attack_label, 
                           levels = c("Orange claw", 
                                      "Black claw", 
                                      "Black carapace",
                                      "Blue carapace")
)

dat$treatment <- factor(dat$treatment, 
                        levels = c("A", 
                                   "B", 
                                   "C")
)

#Final graphic ----
p3 <- ggplot(dat, aes(x = attack_label, fill = color)) +
  geom_bar(width = 0.5) +
  stat_count(aes(label = ..count..), geom = "text", vjust = -0.5) +
  scale_fill_identity() +
  labs(x = "", y = "Total of attacks") +
  ylim(0, 30) +
  theme_classic(base_size = 17) +
  facet_grid(~treatment, scales = "free", space = "free")
p3

#Saving graphs ----
ggsave(plot = p1, 
       filename = "outputs/figures/Figure_atk_position.png",
       width = 8, 
       height = 5, 
       dpi = 300)

ggsave(plot = p2, 
       filename = "outputs/figures/Figure_illuminant.png",
       width = 10, 
       height = 5, 
       dpi = 300)

ggsave(plot = p3, 
       filename = "outputs/figures/Figure_3.png",
       width = 10, 
       height = 5, 
       dpi = 300)
  