# 03 - Transformando dados com tidyr

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/manipulacao-dados')
getwd()

# Instalando os pacotes
install.packages('tidyr')
library(tidyr)
library(dplyr)

# Reshape dos dados
numberId <- c(3, 1, 2, 5, 4)
name <- c('Carlos', 'Ana', 'Augusto', 'Sérgio', 'Letícia')
timeAttempt1 <- c(1.38, 1.45, 1.39, 1.41, 1.37)
timeAttempt2 <- c(1.39, 1.41, 1.41, 1.39, 1.40)

swimmingTimes <- data.frame(numberId, name, timeAttempt1, timeAttempt2)
swimmingTimes

# Juntando as colunas de tempo em uma só
swimmingTimes %>%
  pivot_longer(timeAttempt1:timeAttempt2,
               names_to = "Description",
               values_to = "TimeAttempt") %>%
  arrange(TimeAttempt)

# Desfazendo o passo anterior
swimmingTimes %>%
  pivot_longer(timeAttempt1:timeAttempt2,
               names_to = "Description",
               values_to = "TimeAttempt") %>%
  pivot_wider(names_from = "Description",
              values_from = "TimeAttempt")

# Carregando o dataset
players <- read.csv('../datasets/fifa23_players_data.csv')
View(players)

# Separando as linhas em colunas
players %>%
  separate(
    col = Positions.Played,
    into = c("Position1", "Position2"),
    sep = ","
  ) %>%
  select(Known.As, Position1, Position2)

# Juntando os dados novamente
players %>%
  separate(
    col = Positions.Played,
    into = c("Position1", "Position2"),
    sep = ","
  ) %>%
  unite(Position1,
        Position2,
        col = "Positions.Played",
        sep = "|",
        na.rm = TRUE) %>%
  select(Known.As, Positions.Played)

# Resolvendo o problema dos valores 0 no exemplo passado
# Verificando quantos jogadores tem valor 0
count(players[players$Value.in.Euro. == 0,])

# Removendo os dados desnecessários para o propósito
data <- players %>% 
  select(Known.As, Value.in.Euro., Positions.Played, Nationality, Club.Name)
data[1,]

# 1° Passo - Transformar os 0 em valores NA
data$Value.in.Euro. <- na_if(data$Value.in.Euro., 0)
View(data)

# 2° Passo - Removendo os valores NA do data frame
data <- data %>% drop_na()
count(data[data$Value.in.Euro. == 0,])

# 3° Passo - Realizando o agrupamento novamente
playersValueSummary <- data %>% group_by(Nationality) %>%
  summarize(
    meanValue = mean(Value.in.Euro.),
    biggestValue = max(Value.in.Euro.),
    lowestValue = min(Value.in.Euro.),
    playersPerNationality = n()
  ) %>%
  arrange(desc(playersPerNationality))

View(playersValueSummary)