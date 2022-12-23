# 04 - Importando XML no R

# Configurando o diretório de trabalho
setwd("C:/Users/Joao/Development/Apostila/coleta-dados")
getwd()

# # Dataset de exemplo pode serobtido do seguinte site: 
# https://www.w3schools.com/xml/xml_examples.asp

# Instalando pacotes
install.packages(c('XML', 'xmlconvert'))
library(XML)

# Lendo um arquivo XML
food_menu <- xmlToDataFrame('datasets/food_menu.xml')
View(food_menu)

# Escrevendo um arquivo XML

# Preparando os dados
numberId <- c(3, 1, 2, 5, 4)
name <- c('Carlos', 'Ana', 'Augusto', 'Sérgio', 'Letícia')
mathGrade <- c(5, 8, 6, 4, 9)
portugueseGrade <- c(8, 7, 4, 5, 10)

students <- data.frame(numberId, name, mathGrade, portugueseGrade)
students

# Convertendo o data frame para XML
library(xmlconvert)
df_to_xml(students, record.tag = "student", xml.file = 'datasets/students.xml')
