#'Script to Create the Figure 3 - first attack result ----
#'Author: Diogo Silva
# Tue Apr 16 17:13:11 2024 

#last update
# Tue Mar 18 11:37:47 2025 ------------------------------

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
p <- ggplot(dat, aes(x = attack_label, fill = color)) +
  geom_bar(width = 0.5) +
  stat_count(aes(label = after_stat(count)), geom = "text", vjust = -0.5) +
  scale_fill_identity() +
  labs(x = "", y = "Number of first attacks") +
  ylim(0, 30) +
  theme_classic(base_size = 17) +
  facet_grid(~treatment, scales = "free", space = "free")
p

#3. Saving graphs ----
ggsave(plot = p, 
       filename = "outputs/figures/Figure_3_first-atk-result.png",
       width = 10, 
       height = 5, 
       dpi = 300)

#The end ----