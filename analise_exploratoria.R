##########################################################################
#                                                                        #
# UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE (UFRN)                     #
# CENTRO DE CIENCIAS EXATAS E DA TERRA (CCET)                            #
# DEPARTAMENTO DE ESTATISTICA (DEST)                                     #
#                                                                        #
# DISCIPLINA: INTRODUCAO A MODELAGEM DE BIG DATA (EST0133)               #
# PROFESSOR: MARCUS NUNES                       DATA: 28/11/2018         #
#                                                                        #
# ALUNOS: THIAGO VALENTIM MARQUES               MATRICULA: 20170053013   #       
#         JULIO CESAR SOARES                    MATRICULA: 20170057095   #
#         FRANCISCO CANINDE ASSIS DE OLIVEIRA   MATRICULA: 20150100724   #          
#                                                                        # 
##########################################################################

#################################################
#  CARREGANDO OS PACOTES E O CONJUNTO DE DADOS  #
#################################################

library(dplyr)
library(GGally)
library(ggfortify)

data <- read.table("PES2019.txt",header=TRUE,sep="\t")


####################################
#  ANALISE EXPLORATORIA DOS DADOS  #
####################################

exp <- data %>%     # SELECIONANDO ALTURA, PESO E IDADE
  select(7,8,9)

ggpairs(exp)        # EXPLORANDO ESSAS VARIAVEIS

head(sort(table(data$pais),decreasing = TRUE),10)   # PAISES COM MAIS JOGADORES

head(sort(table(data$liga),decreasing = TRUE),10)   # LIGAS COM MAIS JOGADORES

head(sort(table(data$pe_preferido),decreasing = TRUE))     # DESTROS E CANHOTOS
barplot(sort(table(data$pe_preferido),decreasing = TRUE))  # GRAFICO DE BARRAS

selectedData <- data %>%                                     # VARIAVEIS DE INTERESSE
    select(26,34,24,25,12,13,14,15,16,23,17,
           18,19,20,28,27,22,21,29,30,31,32,33)

boxplot(selectedData,las=2)                                  # BOX PLOT

exp_1 <- data %>%           # SELECIONANDO RESISTENCIA, OFENSIVIDADE, CONTROLE DE BOLA,
  select(34,12,13,24,25)    # VELOCIDADE E EXPLOSAO
      
ggpairs(exp_1)              # EXPLORANDO ESSAS VARIAVEIS

dados_novo <- data[1:100,]                                               # PCA
dados.pca <- prcomp(selectedData[1:100,], center=TRUE, scale.=TRUE)
autoplot(dados.pca, data=dados_novo, colour="liga",label=TRUE,
         loadings=TRUE, loadings.label=TRUE) + 
  labs(x="Componente Principal 1 (51.38%)", y="Componente Principal 2 (19.16%)") + geom_text(aes(label=dados_novo$nome), alpha=0.70)





