# 02 - Importando Excel no R

# Configurando o diretório de trabalho
setwd("C:/Users/Joao/Development/Apostila/coleta-dados")
getwd()

# Dataset de exemplo é um conjunto "dummy" de dados e pode ser
# obtido do seguinte site: https://www.sample-videos.com/download-sample-xls.php

# Instalando o pacote para leitura
install.packages('readxl')
library(readxl)

# Lendo um Excel
test <- read_excel('datasets/exemplo-xlsx.xls')
str(test)
View(test)
class(test)

# Escrevendo um arquivo excel

# Instalando o pacote para escrita
install.packages("writexl")
library(writexl)

# Criando os dados
numberId <- c(3, 1, 2, 5, 4)
name <- c('Carlos', 'Ana', 'Augusto', 'Sérgio', 'Letícia')
mathGrade <- c(5, 8, 6, 4, 9)
portugueseGrade <- c(8, 7, 4, 5, 10)

students <- data.frame(numberId, name, mathGrade, portugueseGrade)
students

# Criando o arquivo
write_xlsx(students, 'datasets/students.xlsx')
