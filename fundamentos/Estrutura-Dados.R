# 05 - Estruturas de dados no R

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')
getwd()

# Vetores
nomes <- c('Carlinhos', 'Aninha', 'Astolfinho')
idades <- c(48, 37, 67)
booleanos <- c(TRUE, FALSE, TRUE)

# Criando sequencias de números
numeros <- 1:10
sequencia <- seq(1, 5)

# Criar vetor de valores repetidos
rep('N/A', 8)
is.vector(rep('N/A', 8))

# Acessando um valor em algum vetor
nomes[2]

# Listas
listaPessoas <- list(nomes, idades, booleanos)
listaPessoas

# Acessando os valores da lista
listaPessoas
listaPessoas[1]
listaPessoas[[1]]
listaPessoas[[1]][3]

# Nomeando nossa lista
colunas <- c('nomes', 'idades', 'presenca')
names(listaPessoas) <- colunas

# Acessando a lista após nomeação
listaPessoas$nomes[3]

# Matrizes
matriz <- matrix(1:12, nrow = 3, ncol = 4)
matriz

# Acessando valores na matriz
matriz[8]
matriz[2,3]
matriz[,3]
matriz[2,]

# Dataframes
pessoas <- data.frame(nomes = nomes, idades = idades, presenca = booleanos)
pessoas

# Visualizando um dataframe
View(pessoas)

# Acessando valores no dataframe
pessoas[1,]
pessoas[,3]
pessoas$nomes[3]

# Fatores
tipoVacina <- c("P", "C", "P")
pessoas$tipoVacina <- as.factor(tipoVacina)
str(pessoas)
pessoas

# Trocando os valores no vetor
levels(pessoas$tipoVacina) <- c('Coronavac', 'Pfizer')
str(pessoas)
pessoas