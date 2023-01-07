# Trabalhando com gráficos

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/visualizacao-dados')
getwd()

# Carregandos os dados
players <- read.csv('../datasets/fifa23_players_data.csv')
View(players)

# Valor do Jogador x Overall - scatterplot
plot(
  players$Overall, 
  players$Value.in.Euro.,
  col = 'blue',
  pch = 19,
  xlim = c(65,95),
  xlab = 'Overall dos Jogadores',
  ylab = 'Valor em euro dos jogadores'
)

# Overall x melhor posição do jogador - boxplot
colors()
boxplot(
  data = players,
  Overall ~ Best.Position,
  col = 'lightskyblue1',
  main = 'Overall dos jogadores por posição',
  col.main = 'darkblue'
)

# Frequencia de jogador por overall - histograma
hist(players$Overall, labels = T, main = "Histograma do Overall dos jogadores")

# Filtrando os dados e preparando os dados
paises <-
  c(
    "Brazil",
    "Argentina",
    "Uruguay",
    "Spain",
    "Portugal",
    "Italy",
    "France",
    "Germany",
    "England",
    "Belgium",
    "Netherlands"
  )
dados <- players[players$Nationality %in% paises,]

# Criando uma tabela contigencia 
nationalityProp <- table(dados$Nationality)

# Quantidade de jogadores de cada pais - barra
barplot(
  nationalityProp,
  col = c(100:150),
  xlab = 'Paises',
  ylab = 'Quantidade de jogadores'
)

# Preparando as legendas do gráfico de pizza
percents <- paste(round(prop.table(nationalityProp) * 100, digits = 0), "%", sep="")
labels <- paste(names(nationalityProp), percents, sep = " - ")
labels

# Grafico em pizza da porcentagem de jogadores da posição ideal - pizza
pie(
  nationalityProp,
  col = c(100:150),
  labels = labels,
  main = "Distribuição de jogadores entres os paises"
)
