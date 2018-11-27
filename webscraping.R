########################################################################################
#                                                                                      #
# UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE (UFRN)                                   #
# CENTRO DE CIENCIAS EXATAS E DA TERRA (CCET)                                          #
# DEPARTAMENTO DE ESTATISTICA (DEST)                                                   #
#                                                                                      #
# DISCIPLINA: INTRODUCAO A MODELAGEM DE BIG DATA (EST0133)                             #
# PROFESSOR: MARCUS NUNES                       DATA: 25/11/2018                       #
#                                                                                      #
# ALUNOS: THIAGO VALENTIM MARQUES               MATRICULA: 20170053013                 #       
#         JULIO CESAR SOARES                    MATRICULA: 20170057095                 #
#         FRANCISCO CANINDE ASSIS DE OLIVEIRA   MATRICULA: 20150100724                 #          
#                                                                                      # 
########################################################################################

##############--------- WEB SCRAPING - CONJUNTO DE DADOS PES 2019 ---------#############

###########################
### pacotes necessarios ###
###########################

library(rvest);library(dplyr);library(stringr)

##########################
### obtencao dos dados ###
##########################

data <- c(rep(0,39))
data <- as.data.frame(t(data))
names(data) <- c("nome","numero","time","liga","pais","continente","altura",
                 "peso","idade","pe_preferido","posicao","ofensividade",
                 "controle_bola","drible","passe_rasteiro","passe_alto",
                 "finalizacao","chute_colocado","giro_controlado","cabecada",
                 "defensividade","desarme","forca_chute","velocidade","explosao",
                 "equilibro","contato_fisico","impulsao","hab_goleiro",
                 "firm_goleiro","clearing","reflexo","coverage","resistencia",
                 "pior_pe_freq","pior_pe_prec","cond_fisica","resist_lesao",
                 "overall")

for(j in 1:349){

print(j)                                    # Acompanhar o andamento do web scraping
  
pag_princ <- read_html(x = paste("http://pesdb.net/pes2019/?page=",j,sep=""))
  
url <- "http://pesdb.net/pes2019"  
  
urls <- pag_princ %>%                       
    html_nodes("tr td:nth-child(2) a") %>%  # coluna de interesse (nome dos jogadores)
    html_attr("href")                       # extrair as URLS
  
urls <- str_replace(urls, "\\.", "")        # retirar o . de cada url

endereco <- paste(url,urls,sep="")          # url de cada um dos jogadores do PES 2019
  
for(i in 1:length(endereco)){
    
  pagina <- endereco[i] %>%
    read_html()
    
  pagina <- pagina%>%
    html_table(fill=TRUE)
    
    id <- pagina[[2]] # Identificação do jogador
    
      if(id$X2[2]=="Free Agents"){
      id[3:12,] <- id[2:11,]
      id[2,] <- c("Squad Number:","NA")
      id <- id[-c(11,13),]
      }else{
      id <- id[-c(11,13,14),]
      }
    
    hb_1 <- pagina[[3]]                            # Habilidades 1
    hb_2 <- pagina[[4]]; hb_2 <- hb_2[-c(13,15),]  # Habilidades 2
    dados <- rbind(id,hb_1,hb_2)                   # Conjunto dos atributos do jogador
    data[(j-1)*32 + i,] <- as.vector(dados$X2)     # Conjunto de dados final
    
    #  if(i%%15==0){            # SE ERRO 429 (banimento do site por 3 minutos)   
    #   Sys.sleep(181)
    #  }
    
    write.csv(data, "PES2019.csv", row.names = FALSE)            # salvar .csv
    write.table(data, "PES2019.txt",sep="\t",row.names = FALSE)  # salvar .txt
    
   }
}

