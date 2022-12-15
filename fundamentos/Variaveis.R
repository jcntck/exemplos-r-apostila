# Configurando o diretório de trabalho
setwd('C:/Users/Joao/Development/Apostila/fundamentos')

# Confirmando que o diretório foi configurado corretamente
getwd()

# Formas de declarar variáveis no R
nome <- 'Fulano de Tal'
idade = 25
assign("ehAdulto", TRUE)

# Regras de nomeação de variáveis

# Nomes inválidos
1variavel <- 1
.2variavel <- 2
variavel com espaco <- FALSE
variavel-com-hifen <- FALSE
while <- "Palavra reservada da linguagem"

# Nome válido, porém não indicados
variavel_com_acentuação <- FALSE

# Nomes adequados
nome <- 'Ciclano'
anoNascimento <- 1999
mes_atual <- 12
media1 <- 4.75
media_2 <- 5
.informacaoValida = TRUE

# Tipos possiveis de variáveis

# Inteiro
var_tipo_inteiro <- 25L
# Double
var_tipo_double <- 3.141593
# complex
var_tipo_complex <- 666i
# Caractere
var_tipo_caractere <- 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
# Booleano
var_tipo_booleano <- TRUE


# Verificando o tipo da variável

# Inteiro
typeof(var_tipo_inteiro)

# Double
typeof(var_tipo_double)

# Complex
typeof(var_tipo_complex)

# Caractere
typeof(var_tipo_caractere)

# Booleano
typeof(var_tipo_booleano)

