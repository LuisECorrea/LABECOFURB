# MATERIAL RETIRADO DA AULA 5

# WDI - WORLD DEVELOPMENT INDICATORS
# OS DADOS DO BANCO MUNDIAL SÃO ACESSADOS

# install.packages("WDI")
library(WDI) # SEMPRE CHAMAR O PACOTE; SEMPRE TEM QUE APARECER A SETINHA ">" LA NO CONSOLE, SE NÃO APARECER CLICA NO ESC ATE APARECER

# PROCURAM AS VIGNETTES
# PÁGINAS COM INSTRUÇÕES DOS PACOTES

# GDP (current US$)(NY.GDP.MKTP.CD)
# PIB, PREÇOS CORRENTES EM US$
# CÓDIGO: NY.GDP.MKTP.CD

# VAMOS PESQUISAR O TERMO 'GDP' NO WDI

varpib <- WDIsearch('gdp') # CRIAR OBJETO COM O RESULTADO; O OBJETO APARECE EM 'DATA'

# BUSCAR OS DADOS COM O CÓDIGO DO SITE

options(scipen = 999) # AJUSTA A NOT. CIENT.

# DADOS EM PAINEL
dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD', start = 2023, end = 2023)

paises <- c('BR', 'US')

# SERIE TEMPORAL
dadospibbr <- WDI(country = 'BR', indicator = 'NY.GDP.MKTP.CD')

# DADOS EM PAINEL
dadoselectricity <- WDI(country = 'all', indicator = 'EG.ELC.ACCS.ZS')

# CORTE TRANSVERSAL
dadoselectricity2023 <- WDI(country = 'all', indicator = 'EG.ELC.ACCS.ZS', start = 2023, end = 2023)

# SERIE TEMPORAL
dadoselectricitybr <- WDI(country = 'BR', indicator = 'EG.ELC.ACCS.ZS')

# GRÁFICOS RETIRADOS DA AULA 6
# GRÁFICOS
# BIBLIOTECA ggplot2 (tidyverse)
install.packages("tidyverse")
library(tidyverse)

## DADOS EM PAINEL

grafpainel <- ggplot(dadoselectricity, mapping = aes (y = EG.ELC.ACCS.ZS, x = year)) + 
  geom_point()

print(grafpainel)

# CORTE TRANSVERSAL

grafcorte <- ggplot(dadoselectricity2023,
                    mapping = aes(y = EG.ELC.ACCS.ZS,
                                  x = year)) +
  geom_point()

print(grafcorte)

# SERIE TEMPORAL

grafserie <- ggplot(dadoselectricitybr,
                    mapping = aes(y = EG.ELC.ACCS.ZS,
                                  x = year)) +
  geom_line()

print(grafserie)

# MATERIAL RETIRADO DO CHAT GPT

library(ggplot2)
library(WDI)
library(dplyr)

grafpainel <- ggplot(dadoselectricity, 
                     mapping = aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_point(color = "gray70", alpha = 0.5) +
  geom_line(data = filter(dadoselectricity, country == "Brazil"),
            aes(x = year, y = EG.ELC.ACCS.ZS),
            color = "red", size = 1) +
  labs(title = "Acesso à Eletricidade (Painel)",
       subtitle = "Destaque para o Brasil",
       x = "Ano",
       y = "Eletricidade (%)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "none"
  )

print(grafpainel)

grafcorte <- ggplot(dadoselectricity2023,
                    mapping = aes(x = reorder(country, EG.ELC.ACCS.ZS),
                                  y = EG.ELC.ACCS.ZS)) +
  geom_col(fill = "steelblue") +
  labs(title = "Acesso à Eletricidade por País - 2023",
       x = "País",
       y = "Eletricidade (%)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 7),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

print(grafcorte)

grafserie <- ggplot(dadoselectricitybr,
                    mapping = aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_line(color = "darkblue", size = 1) +
  geom_point(color = "darkblue") +
  labs(title = "Evolução do Acesso à Eletricidade no Brasil",
       x = "Ano",
       y = "Eletricidade (%)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

print(grafserie)
