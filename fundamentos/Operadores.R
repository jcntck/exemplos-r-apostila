# 02 - Operadores

# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')
getwd()

# Operadores aritméticos

# Soma
5 + 5

# Subtração
10 - 5  

# Multiplicação
2.5 * 2 

# Divisão
10 / 2  

# Exponencial
5 ^ 2   
# Outra forma de exponencial
5 ** 2  

# Modulo (resto da divisão)
11 %% 2 


# Operadores Relacionais

# maior que
5 > 5

# maior ou igual a
5 >= 5

# menor que
4 < 4

# menor ou igual a
4 <= 4

# igual a
'Futebol' == 'Hockey'

# diferente de
9 != 10

# Operadores lógicos

diaEnsolarado <- TRUE
finalDeSemana <- TRUE

# AND
diaDePraia <- diaEnsolarado & finalDeSemana
diaDePraia

# OR
finalDeSemana <- FALSE

diaDePraia <- diaEnsolarado | finalDeSemana
diaDePraia

# NOT
diaDePraia <- !diaDePraia
diaDePraia
