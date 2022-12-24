# 05 - Trabalhando com API's no R

# Configurando o diretório de trabalho
setwd("C:/Users/Joao/Development/Apostila/coleta-dados")
getwd()

# Instalando e carregando os pacotes necessários
install.packages('httr')

library(httr)
library(rjson)

# Iremos consumir uma api chamada JSONPlaceholder, que se trata de uma API
# pública para testes, veja mais detalhes neste site: 
# https://jsonplaceholder.typicode.com/

# Vamos começar buscando os usuários desta API
response <- GET('https://jsonplaceholder.typicode.com/users')
response

# Convertendo a resposta para texto puro no formato JSON
rawData <- rawToChar(response$content)
rawData

# Convertendo o JSON para lista
data <- fromJSON(rawData)
data[[1]]

# Temos nossa lista, porém não é interessante trabalharmos com lista, 
# vamos converter para data frame
View(data)

# Cria um data frame vazio
users <- data.frame()

# Fazemos um for aninhado para popular o data frame
for(i in 1:length(data)) {
  for(column in names(data[[i]])) {
    users[i,column] <- data[[i]][column]
  }
}

# Vejamos o resultado
View(users)

# Transformando esse processo de busca e conversão dos dados em funções

# Criando função para converter lista em data frame
listToDataframe <- function(data) {
  entity = data.frame()
  for(i in 1:length(data)) {
    for(column in names(data[[i]])) {
      entity[i,column] <- data[[i]][column]
    }
  }
  return(entity)
}

# Criando função para ler um endpoint da API
api.get <- function(url) {
  response <- GET(url)
  rawData <- rawToChar(response$content)
  data <- fromJSON(rawData)
  return(listToDataframe(data))
}

# Vamos agora buscar os posts e os comments usando as funções que acabamos de criar

# Posts
posts <- api.get('https://jsonplaceholder.typicode.com/posts')
View(posts)

# Comments
comments <- api.get('https://jsonplaceholder.typicode.com/comments')
View(comments)