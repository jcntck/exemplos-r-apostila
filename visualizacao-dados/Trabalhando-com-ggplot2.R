# Trabalhando com ggplot2

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/visualizacao-dados')
getwd()

# Instalando os pacotes
install.packages("ggplot2")
library(ggplot2)

# Carregandos os dados
players <- read.csv('../datasets/fifa23_players_data.csv')
View(players)

# Scatterplot
ggplot(players, aes(Overall, Value.in.Euro.)) +
  geom_point(colour = "darkblue") + 
  xlim(65, 95)

# Boxplot
ggplot(players, aes(x = Best.Position, y = Overall, fill = factor(Best.Position))) +
  geom_boxplot(show.legend = F) + 
  xlab("Posição do jogador") +
  ylab("Pontuação geral do jogador") +
  ggtitle("Overall dos jogadores por posição")

# Histograma
ggplot(players, aes(Overall)) +
  geom_histogram(color = "#000000", fill = "darkblue") +
  labs(
    title = "Histograma do Overall dos jogadores",
    x = "Pontuação geral dos jogadores",
    y = "Frequência"
  ) + 
  theme_classic()

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

# Barplot
ggplot(dados, aes(as.factor(Nationality), fill = Nationality)) +
  geom_bar(show.legend = F) +
  labs(
    title = "Quantidade jogadores por país",
    x = "Países",
    y = "Quantidade"
  )

# Preparando os dados
proportionData <- as.data.frame(table(dados$Nationality))
colnames(proportionData) <- c("Paises", "Porcentagem")
proportionData$Porcentagem <-
  paste(round(prop.table(table(dados$Nationality)) * 100, digits = 0), "%", sep =  "")
View(proportionData)

# Pie
ggplot(proportionData, aes(x = "", y = Porcentagem, fill = Paises)) +
  geom_col() +
  geom_label(aes(label = Porcentagem),
             color = "white",
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  coord_polar(theta = "y") +
  labs(title = "Quantidade de jogadores por país") +
  theme_void()
 
