# Prevendo valores númericos com Algoritmos de Regressão

# Definindo o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/machine-learning')
getwd()

# Carregando os dados
players <- read.csv('../datasets/fifa23_players_data.csv')

# Objetivo: Prever o overall do jogador com base no atributos

# Carregandos os pacotes
library(dplyr)

## Limpeza dos dados
glimpse(players)

# Removendo as colunas desnecessárias do nosso dataset
columnsToRemove <-
  c(
    "Known.As",
    "Full.Name",
    "Nationality",
    "Image.Link",
    "Club.Position",
    "Contract.Until",
    "Club.Jersey.Number",
    "Positions.Played",
    "Joined.On",
    "On.Loan",
    "National.Team.Name",
    "National.Team.Image.Link",
    "National.Team.Position",
    "National.Team.Jersey.Number"
  )

data <- players %>% mutate_at(columnsToRemove, function (column) {return(NULL)})
glimpse(data)

# Variável target: Overall
# Variável preditoras: todo o resto

# Analisando os dados
summary(data$Overall)

# Verificando se a variavel target está distribuida normalmente
hist(data$Overall, main = "Distribuição de Overall nos dados")

# Verifcando se existe correlação entre algumas variáveis
cor(data[c("Overall", "International.Reputation", "Height.in.cm.", "Weight.in.kg.")])

# Preparando os dados para o modelo de regressão linear

# Separando os dados em treino e teste

# Definindo uma seed para obtermos os mesmos dados
set.seed(2023)

# Criando um vetor para filtrar os dados
sample <- sample(c(TRUE, FALSE), nrow(data), replace = TRUE, prob = c(0.7,0.3))
train <- data[sample, ]
test <- data[!sample, ]

# Treinando o modelo
linear.model <- lm(Overall ~ ., data = train)

# Visualizando o modelo
summary(linear.model)

# Testando o modelo
test$predict <- predict(linear.model, test)
View(test[c("Overall", "predict")])


# Visualizando os resultados
library(tidyr)
library(ggplot2)

visualizationPredicts <- test %>% 
  sample_n(50) %>%
  arrange(Overall)

visualizationPredicts$id <- 1:nrow(visualizationPredicts)

visualizationPredicts %>%
  gather(label, overall, Overall, predict) %>% 
  ggplot(aes(x = id, y = overall, colour = label)) + 
  geom_line()
