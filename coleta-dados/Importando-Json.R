# 03 - Importando Json no R

# Configurando o diretório de trabalho
setwd("C:/Users/Joao/Development/Apostila/coleta-dados")
getwd()

# Dataset de exemplo pode serobtido do seguinte site: 
# https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json

# Instalando pacote
install.packages("rjson")
library(rjson)

# Lendo arquivos json
pokedex <- fromJSON(file = 'datasets/pokedex.json')
class(pokedex)

# Vizualizando a lista de dados
View(pokedex)

pokedex$pokemon[[1]]

# Escrevendo arquivos JSON

# Preparando os dados
numberId <- c(3, 1, 2, 5, 4)
name <- c('Carlos', 'Ana', 'Augusto', 'Sérgio', 'Letícia')
mathGrade <- c(5, 8, 6, 4, 9)
portugueseGrade <- c(8, 7, 4, 5, 10)

# Criando uma lista vazia
students <- vector(mode="list", length = length(numberId))
students

# Populando a lista
for(i in 1:length(students)) {
  students[[i]]$numberId <- numberId[i]
  students[[i]]$name <- name[i]
  students[[i]]$mathGrade <- mathGrade[i]
  students[[i]]$portugueseGrade <- portugueseGrade[i]
}
View(students)

# Criando arquivo
json <- toJSON(students, indent = 2)
write(json, 'datasets/students.json')
