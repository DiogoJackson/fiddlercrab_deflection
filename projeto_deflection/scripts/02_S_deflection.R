#'Data deflection ----
#'Author: Diogo Silva
# Tue Apr 16 17:13:11 2024 ------------------------------

#last update
# Wed May 22 22:01:54 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)

#Import data ----
dat <- read_excel("data/raw/data_deflection.xlsx")

#add cor
# Modificar o dataframe para incluir uma coluna de cor baseada no tratamento e first_attack
dat$color <- with(dat, ifelse(treatment == "A" & first_attack == "Carapace", "#2f4858",
                              ifelse(treatment == "A" & first_attack == "Claw", "#f6ae2d",
                                     ifelse(treatment == "B" & first_attack == "Carapace", "#2f4858",
                                            ifelse(treatment == "B" & first_attack == "Claw", "#2f4858",
                                                   ifelse(treatment == "C" & first_attack == "Carapace", "#56dde0",
                                                          ifelse(treatment == "C" & first_attack == "Claw", "#f6ae2d", NA)))))))

#Visualizing data  ----
p1 <- ggplot(dat, aes(x = first_attack, fill = attack_position)) +
  geom_bar(width = 0.6, position = position_dodge(preserve = "single" )) +  # Defina a cor de preenchimento aqui
  geom_text(stat = "count", aes(label = ..count..), position = position_dodge(width = 0.6), vjust = -0.5, size = 3) +  
  scale_fill_manual(values = c("grey", "grey33", "grey10"))+
  labs(x = "First attack", y = "Total of attacks") +
  theme_classic()+
  facet_grid(~treatment)
p1

dat_definitive <- dat %>% 
  filter(experiment == "definitive")

# Criar o gráfico com as cores especificadas
p2 <- ggplot(dat, aes(x = first_attack, fill = color)) +
  geom_bar(width = 0.5) +
  stat_count(aes(label = ..count..), geom = "text", vjust = -0.5) +
  scale_fill_identity() + # Usa a coluna de cores diretamente
  scale_x_discrete(limits = c("Claw", "Carapace")) + # Define a ordem das barras
  labs(x = "First attack", y = "Total of attacks") +
  ylim(0, 30) +
  theme_classic(base_size = 16) +
  facet_grid(~treatment)
p2



ggsave(plot = p1, 
       filename = "outputs/figures/Figure_atk_position.png",
       width = 8, 
       height = 5, 
       dpi = 300)

ggsave(plot = p2, 
       filename = "outputs/figures/Figure2.png",
       width = 8, 
       height = 5, 
       dpi = 300)

  