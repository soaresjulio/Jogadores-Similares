# pacotes de interesse
pacotes = c("shiny", "shinydashboard", "shinythemes", "plotly", "shinycssloaders","tidyverse",
            "scales", "knitr", "kableExtra", "ggfortify","dplyr","plotly","FNN")

# rode o comando abaixo para verificar se o seu computador possui
# os pacotes necessários instalados. se faltar algum pacote, ele 
# vai ser instalado automaticamente
package.check <- lapply(pacotes, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
  }
})

dados <- read.table("PES2019.txt",header=TRUE,sep="\t")  # Se não abrir pela imagem
#load(file = "dados")  # se abrir pela imagem
