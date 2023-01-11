# Classificando os dados com algoritmos de classificação

# Definindo o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/machine-learning')
getwd()

# Carregando os dados
players <- read.csv('../datasets/fifa23_players_data.csv')

# Objetivo: Prever a melhor posição do jogador baseado nos stats utilizando um
# algoritmo de classificação 

# Instalando os pacotes necessários
install.packages("e1071")

# Carregando os pacotes
library(dplyr)
library(e1071)

# Verificando a estrutura dos dados
glimpse(players)

# Removendo as colunas desnecessárias do nosso dataset
columnsToRemove <- c(
  "Known.As",
  "Full.Name",
  "Overall",
  "Potential",
  "Value.in.Euro.",
  "Positions.Played",
  "Nationality",
  "Image.Link",
  "Age",
  "Height.in.cm.",
  "Weight.in.kg.",
  "Club.Name",
  "Wage.in.Euro.",
  "Release.Clause",
  "Club.Position",
  "Contract.Until",
  "Club.Jersey.Number",
  "Joined.On",
  "On.Loan",
  "Preferred.Foot",
  "Weak.Foot.Rating",
  "Attacking.Work.Rate",
  "Defensive.Work.Rate",
  "National.Team.Name",
  "National.Team.Image.Link",
  "National.Team.Position",
  "National.Team.Jersey.Number"
)

# Variáveis que vale a pena pensar se devemos incluir ou não:
# Height.in.cm.
# Weight.in.kg.
# Preferred.Foot
# Weak.Foot.Rating

# Iremos deixar apenas a coluna Best.Position que será a nossa variável
# target, todas as outras colunas relacionadas a posições iremos tirar pois
# pode atrapalhar no objetivo de achar a melhor posição do jogador em questão

data <- players %>% mutate_at(columnsToRemove, function (column) {return(NULL)})
glimpse(data)

data$Best.Position <- as.factor(data$Best.Position)

# Resultado
str(data)
View(data)

# Análise dos dados

# Análise da proporção
table(data$Best.Position)

# Separação dos dados de treino e teste

# Criando função para preparar os dados para o treinamento
svm.prepareData <- function (data) {
  # Definindo uma seed para obtermos os mesmos dados
  set.seed(2023)
  
  # Separando os dados entre treino e teste
  sample <- sample(c(TRUE, FALSE), nrow(data), replace = TRUE, prob = c(0.7,0.3))
  train <- data[sample, ]
  test <- data[!sample, ]
  
  # Isolando a variável target por um momento
  train.labels <- train[, 1]
  test.labels <- test[, 1]
  
  # Aplicando normalização nos dados para que fiquem na mesma escala
  train <- as.data.frame(scale(train[2:ncol(train)]))
  test <- as.data.frame(scale(test[2:ncol(test)]))
  
  # Retornando a variável target para os datasets
  train$Best.Position <- train.labels
  test$Best.Position <- test.labels
  
  return(list(train = train, test = test))
}

# Após executar as funções que prepara os dados, separamos em dados de teste e treino
prepared.data <- svm.prepareData(data)

train <- prepared.data$train
test <- prepared.data$test

# Treinando o modelo
svm.model <-
  svm(Best.Position ~ .,
      data = train,
      type = "c-classification",
      kernel = 'linear')

# Realizando as previsões
predictions <- predict(svm.model, test)

# Criando função para calcular a precisão do modelo
calculateAccuracy <- function(x) {sum(diag(x)/(sum(rowSums(x)))) * 100}

# Obtendo os resultados
table(test$Best.Position, predictions)
calculateAccuracy(table(test$Best.Position, predictions))
