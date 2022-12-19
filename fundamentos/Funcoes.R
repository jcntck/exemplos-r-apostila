# 06 - Funções

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')
getwd()

# Criando a função que diz se é um dia de ir à praia
verificaSeEhDiaDePraia <- function(diaEnsolarado, finalDeSemana) {
  if (diaEnsolarado & finalDeSemana) {
    return("Dia de ir à praia!")
  } else if (diaEnsolarado & !finalDeSemana) {
    return("Não é um dia adequado para ir à praia, porque ainda não é final de semana!")
  } else if (!diaEnsolarado & finalDeSemana) {
    return("Não é um dia adequado para ir à praia, porque hoje não é um dia ensolarado!!")
  } else {
    return("Esquece essa ideia de ir pra praia, é melhor.")
  }
}

# Definindo variáveis para execução do script
diaDoMes <- c('01/12', '02/12', '03/12', '04/12', '05/12', '06/12', '25/12', '08/12')
diaEnsolarado <- sample(c(TRUE, FALSE), 8, replace = TRUE)
finalDeSemana <- c(FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE)

# Criando o dataframe
calendario <- data.frame(diaDoMes, diaEnsolarado, finalDeSemana)
calendario

# Executando a função para cada dia do nosso calendário
for (numeroLinha in 1:nrow(calendario)) {
  dia <- calendario[numeroLinha,]
  ehDiaDePraia <- verificaSeEhDiaDePraia(dia$diaEnsolarado, dia$finalDeSemana)
  print(paste(dia$diaDoMes, ehDiaDePraia, sep = " - "))
}
