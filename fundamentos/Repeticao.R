# 04 - Estruturas de repetição

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')
getwd()

# Declarando variáveis
?sample
numeroAleatorio <- sample(1:100, 1)

# Usando o loop while
?paste

while(numeroAleatorio < 99) {
  print(paste("Número sorteado muito baixo:", numeroAleatorio, sep = " "))
  
  # Vamos atribuir um novo número aleatorio a partir do último gerado
  # para não ter repetições demais
  numeroAleatorio <- sample(numeroAleatorio:100, 1)
}

print(paste('Obtivemos um número maior que 99:', numeroAleatorio, sep = " "))

# Usando o loop for
for (i in 1:10) {
  if (i %% 2 == 0) {
    print(paste("Número", i, "é par", sep = " "))
  } else {
    print(paste("Número", i, "é impar", sep = " "))
  }
}