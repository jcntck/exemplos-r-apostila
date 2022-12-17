# 03 - Condicionais

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')
getwd()

# Estrutura básica do if
diaEnsolarado <- TRUE
finalDeSemana <- TRUE

if (diaEnsolarado & finalDeSemana) {
  print("Dia de ir à praia!")
}

# Aplicando o else
diaEnsolarado <- TRUE
finalDeSemana <- FALSE

if (diaEnsolarado & finalDeSemana) {
  print("Dia de ir à praia!")
} else {
  print("Não é um dia adequado para ir à praia ...")
}

# Um if dentro de um else...
if (diaEnsolarado & finalDeSemana) {
  
} else {
  print("Não é um dia adequado para ir à praia ...")
  
  if (!diaEnsolarado) {
    print("Porque hoje não é um dia ensolarado!")
  }
  if (!finalDeSemana) {
    print("Porque ainda não é final de semana!")
  }
}

# Utilizando o else if
if (diaEnsolarado & finalDeSemana) {
  print("Dia de ir à praia!")
} else if (diaEnsolarado & !finalDeSemana) {
  print("Não é um dia adequado para ir à praia, porque ainda não é final de semana!")
} else if (!diaEnsolarado & finalDeSemana) {
  print("Não é um dia adequado para ir à praia, porque hoje não é um dia ensolarado!!")
} else {
  print("Esquece essa ideia de ir pra praia, é melhor.")
}

# ifelse
sexo <- 'M'
ifelse(sexo == 'M', 'Masculino', 'Feminino')
