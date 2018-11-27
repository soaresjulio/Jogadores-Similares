navbarPage("Os dez jogadores mais similares - PES 2019",
           tabPanel("Grafico",fluidPage(theme = shinytheme("flatly")),
pageWithSidebar(
  headerPanel('Selecione os filtros desejados'),
  sidebarPanel(width = 4,
    selectInput('jogador', 'Escolha um Jogador', dados$nome),
    sliderInput("altura", "Altura (cm):",
                min = 155, max = 203,
                value = c(155,203)),
    sliderInput("overall", "Overall:",
                min = 50, max = 100,
                value = c(50,100)),
    checkboxGroupInput(inputId = "posicao",
                       label = 'Posicao:', choices = c("GO" = "GK", "ZG" = "CB",
                                                        "LD"="RB","LE"="LB","VOL"="DMF",
                                                        "MLG"="CMF","MAT"="AMF",
                                                        "MLD"="RMF","MLE"="LMF",
                                                        "PTD"="RWF","PTE"="LWF",
                                                        "SA"="SS","CA"="CF"), 
                       selected = c("CA"="CF"),inline=TRUE),
    checkboxGroupInput(inputId = "pe_preferido",
                       label = 'Pe preferido:', choices = c("Destro" = "Right foot",
                                                        "Canhoto" = "Left foot"), 
                       selected = c("Destro" = "Right foot",
                                    "Canhoto" = "Left foot"),inline=TRUE),
   submitButton("Atualizar filtros")
  ),
  mainPanel(
    column(1, plotlyOutput("plot1", width = 800, height=700))
  )
)),
      tabPanel("Sobre",p("O conjuntos de dados e formado por 39 atributos referentes aos
11.158 jogadores registrados no jogo  Pro Evolution Soccer 2019 (PES 2019), que e um dos e-sports mais conhecidos
                         pelos brasileiros, e foi obtido no site", a("PES Data Base", href="http://pesdb.net/", target="_blank"), "via webscraping."),
               p("Esta ferramenta interativa permite que dado qualquer jogador do PES 2019, se consiga os
                 dez jogadores mais similares a ele (utilizando distancia euclidiana). Para isso, os filtros altura, overall, posicao,
                 e pe preferido podem ser utilizados.)"),
               p("As posicoes selecionadas podem ser as seguintes:"),
               p("GK = goleiro"),
               p("ZG = zagueiro"),
               p("LD = lateral direito"),
               p("LE = lateral esquerdo"),
               p("VOL = volante"),
               p("MLG = meia de ligacao"),
               p("MAT = meia atacante"),
               p("MLD = meia direita"),
               p("MLE = meia esquerda"),
               p("PTD = ponta direita"),
               p("SA = segundo atacante"),
               p("CA = centroavante"),
               hr(), #pula uma linha
               p("As abreviacoes utilizadas no grafico (radar chart) foram as seguintes:"),
               p("EQUI = equilibrio"),
               p("RES = resistenca"),
               p("VEL = velocidade"),
               p("EXP = explosao"),
               p("OFE = ofensividade"),
               p("C.BOL = controle de bola"),
               p("DRI = drible"),
               p("P.RAST = passe rasteiro"),
               p("P.ALT = passe alto"),
               p("F.CHU = forca do chute"),
               p("FIN = finalizacao"),
               p("C.COL = chute colocado"),
               p("CURV = curva no chute"),
               p("CAB = cabeceio"),
               p("IMP = impulsao"),
               p("C.FIS = contato fisico"),
               p("DESAR = desarme"),
               p("DEF = defensividade"),
               p("H.GOL = habilidade como goleiro"),
               p("F.GOL = firmelza como goleiro"),
               p("CLEA = clearing"),
               p("RELF = refelxo"),
               p("COV = coverage (fechar o angulo)"),
               hr(),
               p("O grafico do jogador selecionado pelo usuario aparece automaticamente. Para visualizar os graficos dos
                 dez jogadores mais similares, basta clicar no icone ao lado de cada um dos nomes na legenda do grafico."),
               p("Vale a pena ressaltar que os graficos podem ficar sobrespostos ")),


tabPanel("Desenvolvedores",
         p(a("Thiago Valentim Marques", href="http://buscatextual.cnpq.br/buscatextual/visualizacv.do?id=K4201666A2", target="_blank")),
           p("e-mail: thiagomadridd@gmail.com"),
           p(a("Julio Cesar Soares", href="http://buscatextual.cnpq.br/buscatextual/visualizacv.do?id=K4417495Y5", target="_blank")),
             p("email: soares.julio@gmail.com"),
             p(a("Francisco Caninde Assis de Oliveira", href="http://buscatextual.cnpq.br/buscatextual/visualizacv.do?id=K8219531A6", target="_blank")),
               p("e-mail: frecs123@gmail.com"))

)




