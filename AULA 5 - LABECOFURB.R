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
