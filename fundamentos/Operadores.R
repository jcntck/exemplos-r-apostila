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

# Potência
5 ^ 2   
# Outra forma de realizar cálculo de potência
5 ** 2  

# Modulo (resto da divisão)
11 %% 2 

# Operador extra

# Divisão inteira
11 %/% 2

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

# No caso de caractere, o tipo da letra faz diferença
# Pelo motivo do R ser uma linguagem Case sensitive 
'FUTEBOL' == 'Futebol'

# diferente de
9 != 10

# Operadores lógicos

diaEnsolarado <- TRUE
finalDeSemana <- TRUE

# AND
diaDePraia <- diaEnsolarado & finalDeSemana
diaDePraia

# Se alguma das duas variáveis for falsa,
# então a expressão toda se torna falsa.
finalDeSemana <- FALSE
diaDePraia <- diaDePraia & finalDeSemana
diaDePraia

# OR
diaDePraia <- diaEnsolarado | finalDeSemana
diaDePraia

# NOT
diaDePraia <- !diaDePraia # Dia de praia era TRUE
diaDePraia

# Se negarmos novamente, o valor voltará para TRUE
!diaDePraia
