# 02 - Manipulando dados com dplyr

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/manipulacao-dados')
getwd()

# Instalando e carregando o dplyr
install.packages("dplyr")
library(dplyr)

# Carregando o dataset
players <- read.csv('../datasets/fifa23_players_data.csv')

# Alternativa para a função str()
glimpse(players)

# Quantidade de observações
count(players)

# Selecionando as mesmas colunas novamente
selectedPlayers <- players %>% 
  select(Known.As, Value.in.Euro., Positions.Played, Nationality, Club.Name)
View(selectedPlayers)

# Removendo as colunas indesejadas
glimpse(players %>% mutate_at(10:89, function(column) { return(NULL)}))

# Filtrando os dados
players %>% filter(Nationality == 'Brazil')

# Filtrando os dados e selecionando apenas os campos desejados
brazilianPlayersFiltered <- players %>%
  select(Known.As, Value.in.Euro., Positions.Played, Nationality, Club.Name) %>%
  filter(Nationality == 'Brazil')
View(brazilianPlayersFiltered)

# Ordenando os dados
View(brazilianPlayersFiltered %>% arrange(desc(Value.in.Euro.)))

# Agrupando os dados
playerValueSummary <- players %>% group_by(Nationality) %>%
  summarize(
    meanValue = mean(Value.in.Euro.), 
    biggestValue = max(Value.in.Euro.),
    lowestValue = min(Value.in.Euro.),
    playersPerNationality = n()
  ) %>%
  arrange(desc(playersPerNationality))
View(playerValueSummary)

