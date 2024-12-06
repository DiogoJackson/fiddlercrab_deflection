#'Script to Create the Result Graph - Figure 3 ----
#'Author: Diogo Silva
# Tue Apr 16 17:13:11 2024 

#last update
# Thu Dec  5 23:19:29 2024

#package ----
library(readxl)
library(tidyverse)
library(forcats)

#1. Import clean data ----
dat <- read.csv("data/processed/data_deflection_processed.csv")

#2. Visualizing data  ----

#2.1 Reorganizing Factors ----
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

#2.2 Final graph ----
p3 <- ggplot(dat, aes(x = attack_label, fill = color)) +
  geom_bar(width = 0.5) +
  stat_count(aes(label = ..count..), geom = "text", vjust = -0.5) +
  scale_fill_identity() +
  labs(x = "", y = "Number of first attacks") +
  ylim(0, 30) +
  theme_classic(base_size = 17) +
  facet_grid(~treatment, scales = "free", space = "free")
p3

#3. Saving graphs ----
ggsave(plot = p3, 
       filename = "outputs/figures/Figure_3.png",
       width = 10, 
       height = 5, 
       dpi = 300)

#The end ----