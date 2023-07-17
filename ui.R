ui <- dashboardPage(
  skin = "black",
  title = "PlantMetSuite",
  # HEADER ------------------------------------------------------------------
  
  dashboardHeader(
    title = span(img(src = "plantmetsuite.svg", height = 40), "  PlantMetSuite"),
    titleWidth = 300
   
  ),
  
  # SIDEBAR -----------------------------------------------------------------
  
  dashboardSidebar(
    width = 300,
     #  intro tour
             div(class = "inlay", style = "height:15px;width:100%;background-color: #ecf0f5;"),
             sidebarMenu(
               introBox(data.step = 1, data.intro = intro$text[1], # intro tour
			   sidebarSearchForm(textId = "searchText", buttonId = "searchButton", 
                                     label = "Please enter keywords to search for the required tool", icon = shiny::icon("search")),
                            bsButton(inputId = "xinshourumen", 
                                     label = "How to use", 
                                     icon = icon("play-circle"),style = "danger1",onclick ="window.open('', '_blank')"),
									 bsButton(inputId = "gongjuzhongxin",label = "Index",style = "danger2"),
									 bsButton(inputId = "zuxuefenxi",label = "Tools",style = "danger2"),	
									 bsButton(inputId = "shiyanjijin",label = "Manual",style = "danger2"),									 					 
									 bsButton(inputId = "jieguoxiazai",label = "Download",style = "danger2"),
									 br()                         
               )             
               ,
               br()
               
             )
    ),
  
  
  # BODY --------------------------------------------------------------------
  
  dashboardBody(
  	 #tags$script('$(document).on("shiny:sessioninitialized",function(){$.get("https://api.ipify.org", function(response) {Shiny.setInputValue("getIP", response);});})'),
	  #tags$script(src="http://pv.sohu.com/cityjson?ie=utf-8"),
      #tags$script('$(document).on("shiny:sessioninitialized",function(event) {Shiny.setInputValue("getIP",returnCitySN["cip"]);});'),
    tags$head(
      tags$link(
        rel = "stylesheet", 
        type = "text/css", 
        href = "plantmetsuite.css")
    ),tags$head(tags$link(rel="shortcut icon", href="logo.ico")),
	tags$head(
    tags$meta(charset="UTF-8"),
	tags$meta(name="keywords", content="plantmetsuite"),
    tags$meta(name="description", content="plantmetsuite"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1.0")
  ),

    
    useShinyjs(),
    introjsUI(),
    
    # MAIN BODY ---------------------------------------------------------------
    
    fluidRow(
      column(
        width = 12,
        introBox(
				   bsButton("gongnengzhushi", 
                   label = "Metabolome Tools", 
                   icon = icon("database"), 
                   style = "success6"),
		  bsButton("huitugongju", 
                   label = "Plotting Tools", 
                   icon = icon("pencil-ruler"), 
                   style = "success1"),  
          bsButton("biaogegeshi", 
                   label = "Table Tools", 
                   icon = icon("table", class = "spinner-box"), 
                   style = "success3"),
          bsButton("xuliechuli", 
                   label = "Seq Tools", 
                   icon = icon("dna", class = "flask-box"), 
                   style = "success4"),
          bsButton("tongjijianyan", 
                   label = "Statistical Tools", 
                   icon = icon("calculator"), 
                   style = "success5"), 			   
          data.step = 2, data.intro = intro$text[2])
      )
    ),    
    fluidRow(
      div(
        id = "index_panel", 
        column(
          width = 12,
          introBox(data.step = 3, data.intro = intro$text[3],
                   uiOutput("box_adver")
          )
        ),
        column(
          width = 6,
		  introBox(data.step = 4, data.intro = intro$text[4]
            , uiOutput("box_illustrate"))
         
        ),
        column(
          width = 6,
		   introBox(data.step = 5, data.intro = intro$text[5]
          , uiOutput("box_update"))
        )
      )
    ),    
    fluidRow(
     div(
        id = "keyanhuitu_panel", 
        column(
          width = 6,
          uiOutput("box_keyanhuitu1")
        ),
        column(
          width = 5,
          uiOutput("box_keyanhuitu2")
        )
      )
    ),	
 fluidRow(
      div(
        id = "ruanjiandaquan_panel", 
        column(
          width = 7,
          uiOutput("box_ruanjiandaquan1")
        ),
        column(
          width = 4,
          uiOutput("box_ruanjiandaquan2")
        )
      )
    ),
 fluidRow(
      div(
        id = "shiyanjijin_panel", 
        column(
          width = 11,
          uiOutput("box_shiyanjijin1")
        )
        
      )
    ),	
 fluidRow(
      div(
        id = "yingxiangyinzi_panel", 
        column(
          width = 3,
          uiOutput("box_yingxiangyinzi1")
        ),
        column(
          width = 8,
          uiOutput("box_yingxiangyinzi2")
        )
      )
    ),	
	fluidRow(
      div(
        id = "jieguoxiazai_panel", 
        column(
          width = 12,
         uiOutput("box_jieguoxiazai")
        )
      )
    ),
	fluid_design(id="huitugongju_panel","box_huitugongju1","box_huitugongju2","box_huitugongju3","box_huitugongju4","box_huitugongju5","box_huitugongju6","box_huitugongju7","box_huitugongju8","box_huitugongju9","box_huitugongju10","box_huitugongju11","box_huitugongju12","box_huitugongju13","box_huitugongju14","box_huitugongju15","box_huitugongju16","box_huitugongju17","box_huitugongju18","box_huitugongju19","box_huitugongju20","box_huitugongju21","box_huitugongju22","box_huitugongju23","box_huitugongju24","box_huitugongju25","box_huitugongju26","box_huitugongju27","box_huitugongju28","box_huitugongju29","box_huitugongju30","box_huitugongju31","box_huitugongju32","box_huitugongju33","box_huitugongju34","box_huitugongju35","box_huitugongju36","box_huitugongju37","box_huitugongju38","box_huitugongju39","box_huitugongju40","box_huitugongju41","box_huitugongju42","box_huitugongju43","box_huitugongju44","box_huitugongju45","box_huitugongju46","box_huitugongju47","box_huitugongju48","box_huitugongju49","box_huitugongju50","box_huitugongju51","box_huitugongju52","box_huitugongju53","box_huitugongju54","box_huitugongju55","box_huitugongju56","box_huitugongju57","box_huitugongju58","box_huitugongju59","box_huitugongju60"),
	fluid_design(id="dongtaihuitu_panel","box_dongtaihuitu1","box_dongtaihuitu2","box_dongtaihuitu3","box_dongtaihuitu4","box_dongtaihuitu5","box_dongtaihuitu6","box_dongtaihuitu7","box_dongtaihuitu8","box_dongtaihuitu9","box_dongtaihuitu10","box_dongtaihuitu11","box_dongtaihuitu12","box_dongtaihuitu13","box_dongtaihuitu14","box_dongtaihuitu15","box_dongtaihuitu16","box_dongtaihuitu17","box_dongtaihuitu18","box_dongtaihuitu19","box_dongtaihuitu20","box_dongtaihuitu21","box_dongtaihuitu22","box_dongtaihuitu23","box_dongtaihuitu24","box_dongtaihuitu25","box_dongtaihuitu26","box_dongtaihuitu27","box_dongtaihuitu28","box_dongtaihuitu29","box_dongtaihuitu30","box_dongtaihuitu31","box_dongtaihuitu32","box_dongtaihuitu33","box_dongtaihuitu34","box_dongtaihuitu35","box_dongtaihuitu36","box_dongtaihuitu37","box_dongtaihuitu38","box_dongtaihuitu39","box_dongtaihuitu40","box_dongtaihuitu41","box_dongtaihuitu42","box_dongtaihuitu43","box_dongtaihuitu44","box_dongtaihuitu45","box_dongtaihuitu46","box_dongtaihuitu47","box_dongtaihuitu48","box_dongtaihuitu49","box_dongtaihuitu50","box_dongtaihuitu51","box_dongtaihuitu52","box_dongtaihuitu53","box_dongtaihuitu54","box_dongtaihuitu55","box_dongtaihuitu56","box_dongtaihuitu57","box_dongtaihuitu58","box_dongtaihuitu59","box_dongtaihuitu60"),
	fluid_design(id="biaogegeshi_panel","box_biaogegeshi1","box_biaogegeshi2","box_biaogegeshi3","box_biaogegeshi4","box_biaogegeshi5","box_biaogegeshi6","box_biaogegeshi7","box_biaogegeshi8","box_biaogegeshi9","box_biaogegeshi10","box_biaogegeshi11","box_biaogegeshi12","box_biaogegeshi13","box_biaogegeshi14","box_biaogegeshi15","box_biaogegeshi16","box_biaogegeshi17","box_biaogegeshi18","box_biaogegeshi19","box_biaogegeshi20","box_biaogegeshi21","box_biaogegeshi22","box_biaogegeshi23","box_biaogegeshi24","box_biaogegeshi25","box_biaogegeshi26","box_biaogegeshi27","box_biaogegeshi28","box_biaogegeshi29","box_biaogegeshi30","box_biaogegeshi31","box_biaogegeshi32","box_biaogegeshi33","box_biaogegeshi34","box_biaogegeshi35","box_biaogegeshi36","box_biaogegeshi37","box_biaogegeshi38","box_biaogegeshi39","box_biaogegeshi40","box_biaogegeshi41","box_biaogegeshi42","box_biaogegeshi43","box_biaogegeshi44","box_biaogegeshi45","box_biaogegeshi46","box_biaogegeshi47","box_biaogegeshi48","box_biaogegeshi49","box_biaogegeshi50","box_biaogegeshi51","box_biaogegeshi52","box_biaogegeshi53","box_biaogegeshi54","box_biaogegeshi55","box_biaogegeshi56","box_biaogegeshi57","box_biaogegeshi58","box_biaogegeshi59","box_biaogegeshi60"),
	fluid_design(id="xuliechuli_panel","box_xuliechuli1","box_xuliechuli2","box_xuliechuli3","box_xuliechuli4","box_xuliechuli5","box_xuliechuli6","box_xuliechuli7","box_xuliechuli8","box_xuliechuli9","box_xuliechuli10","box_xuliechuli11","box_xuliechuli12","box_xuliechuli13","box_xuliechuli14","box_xuliechuli15","box_xuliechuli16","box_xuliechuli17","box_xuliechuli18","box_xuliechuli19","box_xuliechuli20","box_xuliechuli21","box_xuliechuli22","box_xuliechuli23","box_xuliechuli24","box_xuliechuli25","box_xuliechuli26","box_xuliechuli27","box_xuliechuli28","box_xuliechuli29","box_xuliechuli30","box_xuliechuli31","box_xuliechuli32","box_xuliechuli33","box_xuliechuli34","box_xuliechuli35","box_xuliechuli36","box_xuliechuli37","box_xuliechuli38","box_xuliechuli39","box_xuliechuli40","box_xuliechuli41","box_xuliechuli42","box_xuliechuli43","box_xuliechuli44","box_xuliechuli45","box_xuliechuli46","box_xuliechuli47","box_xuliechuli48","box_xuliechuli49","box_xuliechuli50","box_xuliechuli51","box_xuliechuli52","box_xuliechuli53","box_xuliechuli54","box_xuliechuli55","box_xuliechuli56","box_xuliechuli57","box_xuliechuli58","box_xuliechuli59","box_xuliechuli60"),
	fluid_design(id="tongjijianyan_panel","box_tongjijianyan1","box_tongjijianyan2","box_tongjijianyan3","box_tongjijianyan4","box_tongjijianyan5","box_tongjijianyan6","box_tongjijianyan7","box_tongjijianyan8","box_tongjijianyan9","box_tongjijianyan10","box_tongjijianyan11","box_tongjijianyan12","box_tongjijianyan13","box_tongjijianyan14","box_tongjijianyan15","box_tongjijianyan16","box_tongjijianyan17","box_tongjijianyan18","box_tongjijianyan19","box_tongjijianyan20","box_tongjijianyan21","box_tongjijianyan22","box_tongjijianyan23","box_tongjijianyan24","box_tongjijianyan25","box_tongjijianyan26","box_tongjijianyan27","box_tongjijianyan28","box_tongjijianyan29","box_tongjijianyan30","box_tongjijianyan31","box_tongjijianyan32","box_tongjijianyan33","box_tongjijianyan34","box_tongjijianyan35","box_tongjijianyan36","box_tongjijianyan37","box_tongjijianyan38","box_tongjijianyan39","box_tongjijianyan40","box_tongjijianyan41","box_tongjijianyan42","box_tongjijianyan43","box_tongjijianyan44","box_tongjijianyan45","box_tongjijianyan46","box_tongjijianyan47","box_tongjijianyan48","box_tongjijianyan49","box_tongjijianyan50","box_tongjijianyan51","box_tongjijianyan52","box_tongjijianyan53","box_tongjijianyan54","box_tongjijianyan55","box_tongjijianyan56","box_tongjijianyan57","box_tongjijianyan58","box_tongjijianyan59","box_tongjijianyan60"),
	fluid_design(id="gongnengzhushi_panel","box_gongnengzhushi1","box_gongnengzhushi2","box_gongnengzhushi3","box_gongnengzhushi4","box_gongnengzhushi5","box_gongnengzhushi6","box_gongnengzhushi7","box_gongnengzhushi8","box_gongnengzhushi9","box_gongnengzhushi10","box_gongnengzhushi11","box_gongnengzhushi12","box_gongnengzhushi13","box_gongnengzhushi14","box_gongnengzhushi15","box_gongnengzhushi16","box_gongnengzhushi17","box_gongnengzhushi18","box_gongnengzhushi19","box_gongnengzhushi20","box_gongnengzhushi21","box_gongnengzhushi22","box_gongnengzhushi23","box_gongnengzhushi24","box_gongnengzhushi25","box_gongnengzhushi26","box_gongnengzhushi27","box_gongnengzhushi28","box_gongnengzhushi29","box_gongnengzhushi30","box_gongnengzhushi31","box_gongnengzhushi32","box_gongnengzhushi33","box_gongnengzhushi34","box_gongnengzhushi35","box_gongnengzhushi36","box_gongnengzhushi37","box_gongnengzhushi38","box_gongnengzhushi39","box_gongnengzhushi40","box_gongnengzhushi41","box_gongnengzhushi42","box_gongnengzhushi43","box_gongnengzhushi44","box_gongnengzhushi45","box_gongnengzhushi46","box_gongnengzhushi47","box_gongnengzhushi48","box_gongnengzhushi49","box_gongnengzhushi50","box_gongnengzhushi51","box_gongnengzhushi52","box_gongnengzhushi53","box_gongnengzhushi54","box_gongnengzhushi55","box_gongnengzhushi56","box_gongnengzhushi57","box_gongnengzhushi58","box_gongnengzhushi59","box_gongnengzhushi60"),
	fluid_design(id="zuxuefenxi_panel","box_zuxuefenxi1","box_zuxuefenxi2","box_zuxuefenxi3","box_zuxuefenxi4","box_zuxuefenxi5","box_zuxuefenxi6","box_zuxuefenxi7","box_zuxuefenxi8","box_zuxuefenxi9","box_zuxuefenxi10","box_zuxuefenxi11","box_zuxuefenxi12","box_zuxuefenxi13","box_zuxuefenxi14","box_zuxuefenxi15","box_zuxuefenxi16","box_zuxuefenxi17","box_zuxuefenxi18","box_zuxuefenxi19","box_zuxuefenxi20","box_zuxuefenxi21","box_zuxuefenxi22","box_zuxuefenxi23","box_zuxuefenxi24","box_zuxuefenxi25","box_zuxuefenxi26","box_zuxuefenxi27","box_zuxuefenxi28","box_zuxuefenxi29","box_zuxuefenxi30","box_zuxuefenxi31","box_zuxuefenxi32","box_zuxuefenxi33","box_zuxuefenxi34","box_zuxuefenxi35","box_zuxuefenxi36","box_zuxuefenxi37","box_zuxuefenxi38","box_zuxuefenxi39","box_zuxuefenxi40","box_zuxuefenxi41","box_zuxuefenxi42","box_zuxuefenxi43","box_zuxuefenxi44","box_zuxuefenxi45","box_zuxuefenxi46","box_zuxuefenxi47","box_zuxuefenxi48","box_zuxuefenxi49","box_zuxuefenxi50","box_zuxuefenxi51","box_zuxuefenxi52","box_zuxuefenxi53","box_zuxuefenxi54","box_zuxuefenxi55","box_zuxuefenxi56","box_zuxuefenxi57","box_zuxuefenxi58","box_zuxuefenxi59","box_zuxuefenxi60"),
	fluid_design(id="search_panel","box_search1","box_search2","box_search3","box_search4","box_search5","box_search6","box_search7","box_search8","box_search9","box_search10","box_search11","box_search12","box_search13","box_search14","box_search15","box_search16","box_search17","box_search18","box_search19","box_search20","box_search21","box_search22","box_search23","box_search24","box_search25","box_search26","box_search27","box_search28","box_search29","box_search30","box_search31","box_search32","box_search33","box_search34","box_search35","box_search36","box_search37","box_search38","box_search39","box_search40","box_search41","box_search42","box_search43","box_search44","box_search45","box_search46","box_search47","box_search48","box_search49","box_search50","box_search51","box_search52","box_search53","box_search54","box_search55","box_search56","box_search57","box_search58","box_search59","box_search60"),
	fluidRow(
      div(
        id = "function_panel", 
        column(
          width = 4,
          uiOutput("box_input")
        ),
        column(
          width = 8,
          uiOutput("box_info")
        )
      )
    )
	#,
	#includeHTML("template.html")
))
