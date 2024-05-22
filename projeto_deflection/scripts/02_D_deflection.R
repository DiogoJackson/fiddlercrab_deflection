#'Data deflection ----
#'Author: Diogo Silva
# Wed May 22 22:01:39 2024 ------------------------------


#last update
# Wed May 22 22:01:44 2024 ------------------------------

#package ----
library(readxl)
library(tidyverse)
library(lme4)
library(lmerTest)

#Import data ----
dat <- read_excel("data/raw/data_deflection.xlsx")

colnames(dat)

dat2 <- dat %>% 
  mutate(first_attack2 = if_else(first_attack == "Claw",1,0))

m1<- lmer(first_attack2 ~ treatment + attack_position + (1|place)+(1|trial), data = dat2)
summary(m1)

# Nosso estudo investigou o impacto da cor da quela (tratamentos A e B) 
# e da posição do ataque (quebra ou carapaça) na probabilidade de um ataque ser 
# direcionado à quela de caranguejos. Utilizamos um modelo linear misto com efeitos
# fixos para treatment e attack_position, e efeitos aleatórios para trial e place. 
# Os resultados indicaram que caranguejos com quelas laranjas (tratamento A) eram 
# significativamente mais propensos a serem atacados na quela em comparação com aqueles
# com quelas pretas (tratamento B) (Estimativa = -0.57859, Erro Padrão = 0.09875, 
#                                   t = -5.859, p < 0.001). Além disso, ataques na
# frente e na lateral do caranguejo eram mais prováveis de ocorrer na quela em comparação
# com ataques na carapaça (frontal: Estimativa = 0.33847, Erro Padrão = 0.12168, 
#                          t = 2.782, p = 0.007; lateral: Estimativa = 0.29086, 
#                          Erro Padrão = 0.11765, t = 2.472, p = 0.015). No entanto, 
# as variâncias dos efeitos aleatórios para trial e place foram estimadas como zero, 
# indicando que a variabilidade entre ensaios e locais não contribuiu significativamente 
# para o modelo. Esses achados destacam que a cor da quela e a posição do ataque são 
# determinantes importantes na probabilidade de um ataque ser direcionado à quela dos 
# caranguejos, enquanto a variabilidade entre ensaios e locais não teve influência 
# significativa.