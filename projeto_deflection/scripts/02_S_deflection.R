#'Data deflection ----
#'Author: Diogo Silva
# Tue Apr 16 17:13:11 2024 ------------------------------

#last update
# Tue Apr 16 17:13:24 2024 ------------------------------

#package ----
library(tidyverse)

#Import data ----
head(dat)

#Visualizing data  ----

p <- ggplot(dat, aes(x = first_attack)) +
  geom_bar(width = 0.6, fill = "#40e0d0") +  # Defina a cor de preenchimento aqui
  stat_count(aes(label = ..count..), geom = "text", vjust = -0.5) +  # Adicione rótulos às barras
  labs(x = "First attack", y = "Total of attacks") +
  theme_classic()
p

p2 <- ggplot(filter(dat, experiment == "definitive"), aes(x = first_attack)) +
  geom_bar(width = 0.6, fill = "#40e0d0") +  # Defina a cor de preenchimento aqui
  stat_count(aes(label = ..count..), geom = "text", vjust = -0.5) +  # Adicione rótulos às barras
  labs(x = "First attack", y = "Total of attacks") +
  theme_classic()
p2
