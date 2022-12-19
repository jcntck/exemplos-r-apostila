# 01 - Importando CSV no R

# Configurando o diretório de trabalho
setwd("C:/Users/Joao/Development/Apostila/coleta-dados")
getwd()

# Dataset de exemplo é um conjunto "dummy" de dados e pode ser
# obtido do seguinte site: https://www.sample-videos.com/download-sample-csv.php

# Lendo um CSV
test <- read.csv('datasets/exemplo-csv.csv')
str(test)
head(test)
class(test)

# Escrevendo um arquivo CSV

# Criando os dados
numberId <- c(3, 1, 2, 5, 4)
name <- c('Carlos', 'Ana', 'Augusto', 'Sérgio', 'Letícia')
mathGrade <- c(5, 8, 6, 4, 9)
portugueseGrade <- c(8, 7, 4, 5, 10)

students <- data.frame(numberId, name, mathGrade, portugueseGrade)
students

# Criando o arquivo
write.csv(students, 'datasets/students.csv')
