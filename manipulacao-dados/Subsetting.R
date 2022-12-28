# 01 - Manipulando dados com subsetting

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/manipulacao-dados')
getwd()

# Desta vez iremos utilizar um dataset retirado do site Kaggle,
# que se trata de uma base de dados com os jogadores presentes no
# jogo eletrônico da Eletronic Arts, FIFA 23.
# O dataset pode ser obtido neste link:
# https://www.kaggle.com/datasets/sanjeetsinghnaik/fifa-23-players-dataset?select=Fifa+23+Players+Data.csv

# Carregando o dataset
players <- read.csv('../datasets/fifa23_players_data.csv')
View(players)
str(players)

# Selecionando colunas para visualizar a partir de um vetor
fields <- c("Known.As", "Value.in.Euro.", "Positions.Played", "Nationality", "Club.Name")
View(players[fields])

# Removendo colunas ao visualizar um data frame
View(players[c(-1, -3)])

# Cuidado com a virgula
View(players[c(-1, -3), ])

# Buscando 7 observações dentro do conjunto de dados
View(players[5:12,])

# Inserindo filtros
View(players[players$Nationality == 'Brazil',])

# Criando "subset" do data frame principal
brazilianPlayers <- players[which(players$Nationality == 'Brazil'),]
View(brazilianPlayers)

# Utilizando a função subset
brazilianPlayers <- subset(players, players$Nationality == 'Brazil', select = fields)
View(brazilianPlayers)
