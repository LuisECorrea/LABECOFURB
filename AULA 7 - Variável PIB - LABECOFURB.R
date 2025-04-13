# AULA 7
# GERANDO GRÁFICOS PIB
# CÓDIGO ELABORADO PELO CHATGPT
# PROMPT ESTÁ NO FINAL DESTE ARQUIVO

library(WDI)
library(ggplot2)
library(dplyr)

# Dados
dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# Gráfico
grafpainel <- ggplot(data = dadospib, 
                     mapping = aes(x = year, y = NY.GDP.MKTP.CD)) +
  # Todos os países com pontos em cinza claro
  geom_point(alpha = 0.4, color = "gray70") +
  # Brasil em destaque (vermelho)
  geom_point(data = filter(dadospib, country == "Brazil"),
             color = "red", size = 2) +
  # Título e rótulos dos eixos
  labs(title = "PIB ao Longo do Tempo",
       x = "Ano",
       y = "PIB (US$ corrente)") +
  # Tema mais moderno
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "none"
  )

grafpainel

grafpainel <- ggplot(data = dadospib,
                     mapping = aes(x = year, y = NY.GDP.MKTP.CD)) +
  geom_point(color = "gray70", alpha = 0.5) +
  geom_line(data = filter(dadospib, country == "Brazil"),
            aes(x = year, y = NY.GDP.MKTP.CD),
            color = "red", size = 1) +
  labs(title = "PIB Mundial em Painel",
       subtitle = "Destaque para o Brasil",
       x = "Ano",
       y = "PIB (US$ correntes)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "none"
  )

grafcorte <- ggplot(dadospib2023,
                    mapping = aes(x = reorder(country, NY.GDP.MKTP.CD),
                                  y = NY.GDP.MKTP.CD)) +
  geom_col(fill = "steelblue") +
  labs(title = "PIB por País em 2023",
       x = "País",
       y = "PIB (US$ correntes)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 7),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

grafserie <- ggplot(dadospibbr,
                    mapping = aes(x = year, y = NY.GDP.MKTP.CD)) +
  geom_line(color = "darkgreen", size = 1) +
  geom_point(color = "darkgreen") +
  labs(title = "Evolução do PIB do Brasil",
       x = "Ano",
       y = "PIB (US$ correntes)") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )