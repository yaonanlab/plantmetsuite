options(shiny.maxRequestSize=200*1024^2,shiny.sanitize.errors = FALSE)
#options(shiny.usecairo = FALSE)
server <- function(input, output, session) { 
#session$allowReconnect(TRUE)
  #show intro modal
  observeEvent("", {
    showModal(modalDialog(
      includeHTML("intro.html"),
      easyClose = TRUE,
      footer = tagList(
        actionButton(inputId = "intro", label = "Click here for first time use", icon = icon("info-circle"))
      ,actionButton("close", "Dismiss"))
    ))
  })

 observeEvent(input$close, {
            removeModal()
            toggleDropdownButton(inputId = "MYDDMbut")
        })
		
  
  observeEvent(input$intro,{
    removeModal()
  })
  
  # show intro tour
  observeEvent(input$intro,
               introjs(session, options = list("nextLabel" = "Continue",
                                               "prevLabel" = "Previous",
                                               "doneLabel" = "Alright. Let's go"))
  )
  
  
    observeEvent("", {
    load("userdata/jobid")
	system("sh /srv/myapps/keyandaydayup/rm.sh")
	output$usernum<-renderText({paste("Welcome, User No. ",jobid,"！If you have any questions, please contact us！Email:liuy233@mail2.sysu.edu.cn")})
    show("index_panel")
	hide("huitugongju_panel")
    hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
    hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
	hide("search_panel")
  }, once = TRUE)
  
  observeEvent(input$gongjuzhongxin, {
    show("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")	
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
    hide("search_panel")
  })
  
  observeEvent(input$huitugongju, {
    hide("index_panel")
	show("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")	
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")
	
  })

  observeEvent(input$dongtaihuitu, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("biaogegeshi_panel")
    show("dongtaihuitu_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")

  })
  
  observeEvent(input$biaogegeshi, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    show("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")

  })
  
  observeEvent(input$xuliechuli, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    show("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
	hide("search_panel")

  })
  
  observeEvent(input$tongjijianyan, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    show("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")
	
  })

  observeEvent(input$gongnengzhushi, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	show("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")

  })

  observeEvent(input$zuxuefenxi, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")	
	show("zuxuefenxi_panel")	
    hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")

  })
  
  observeEvent(input$keyanhuitu, {
    hide("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
    hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	hide("function_panel")
	show("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
	hide("search_panel")
	
  })
  
  observeEvent(input$ruanjiandaquan, {
    hide("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	hide("function_panel")
	hide("keyanhuitu_panel")
	show("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
	hide("search_panel")
  })  

  observeEvent(input$yingxiangyinzi, {
    hide("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	show("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")
	hide("search_panel")
	
  })  
  
    
  
  observeEvent(input$jieguoxiazai, {
    hide("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	show("jieguoxiazai_panel")	
	hide("search_panel")

  })  
  
  
# UI - adver -------------------------------------------------------
  output$box_adver <- renderUI({
    div(
      style = "position: relative",
      tabBox(
        id = "box_adver",
        width = NULL,
        height = 290,
        tabPanel(
          title = "Screenshots",
		  includeHTML("screenshots.html")
        )
      )
    )
  })
# UI - illustrate -------------------------------------------------------  
  output$box_illustrate <- renderUI({
    div(
      style = "position: relative",
      tabBox(
        id = "box_illustrate",
        width = NULL,
        height = 400,
		        tabPanel(
          title = "Database",
		  div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),includeHTML("database.html")
        ),
        tabPanel(
          title = "Tools",
		  div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),includeHTML("tools.html")
        ),
        tabPanel(
          title = "About",
		  div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),includeHTML("about.html")
        )
        
      )
    )
  })
# UI - update ------------------------------------------------------- 
  output$box_update <- renderUI({
    div(
      style = "position: relative",
      tabBox(
        id = "box_update",
        width = NULL,
        height = 400,
        tabPanel(
          title = "Update Log",
          div(
            style = "position: absolute; left:0.5em; bottom: 0.5em;"
          ),
		  img(style="display: block; margin-left: 250px;display:inline-block ",src="plantmetsuite.png"),
		  div(style="text-align:center;
        position:relative;
		text-align: left;
		color:red;",
		h4(strong(textOutput("usernum"), align='left'))
		),
		  includeHTML("log.html")
        )
      )
    )
  })

  
  # UI - ruanjiandaquan1------------------------------------------
  output$box_ruanjiandaquan1 <- renderUI({
	div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_ruanjiandaquan11",
        width = NULL,
        height = 100,
        tabPanel(
          title = "",
		  div(style="text-align:center;
        position:relative;
		text-align: left;
		color:black;
		backgroundColor: #ecf0f5;",
		h4(icon("caret-right"), strong("软件分类")),
			   fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button1",
                 label = "DNA分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button2",
                 label = "RNA分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button3",
                 label = "蛋白分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button4",
                 label = "代谢分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button5",
                 label = "进化分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button6",
                 label = "基因功能分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #f00; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
	),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button7",
                 label = "PCR相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button8",
                 label = "CRISPR相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button9",
                 label = "分子克隆相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button10",
                 label = "序列比对",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button11",
                 label = "序列格式转换",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button12",
                 label = "序列综合分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ff6200; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
	),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button13",
                 label = "基因组分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button14",
                 label = "转录组分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button15",
                 label = "非编码分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button16",
                 label = "蛋白组分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button17",
                 label = "代谢组分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button18",
                 label = "三维结构分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #ffc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
	),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button19",
                 label = "药物相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button20",
                 label = "肿瘤相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button21",
                 label = "疾病相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button22",
                 label = "免疫相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button23",
                 label = "单细胞相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button24",
                 label = "转录调控相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #8cc800; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
	),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button25",
                 label = "基因数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button26",
                 label = "蛋白数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button27",
                 label = "代谢数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button28",
                 label = "通路数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button29",
                 label = "物种数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button30",
                 label = "其它数据库",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #00a0c4; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
			   ),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button31",
                 label = "图像处理",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button32",
                 label = "数据分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button33",
                 label = "互作分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button34",
                 label = "文献相关",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button35",
                 label = "化学分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button36",
                 label = "芯片分析",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #0011a8; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) )
			   ),fluidRow(column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button37",
                 label = "在线工具",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c6007d; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button38",
                 label = "生物资源",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c6007d; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button39",
                 label = "生物工程",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c6007d; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button40",
                 label = "其它分类",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c6007d; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button41",
                 label = "软件精选",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: black; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-color: #3cff00;					   
                       border-width: 5px"
               )) ),
			   column(2,
			   div(style="text-align:center;",actionButton(
                 inputId = "software_button42",
                 label = "数据库精选",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: black; 
                       position: relative; 
                       height: 40px;
                       width: 95px;font-size:80%;
                       text-align:center;
                       border-radius: 6px;
                       border-color: red;					   
                       border-width: 5px"
               )) )
			   ),br(),
		h4(icon("caret-right"), strong("软件名称")),
                        div(style =" 
                       background-color: white;",
                          sidebarSearchForm(textId = "softwaresearchText1", buttonId = "softwaresearchButton1", 
                                     label = "请输入软件名称搜索需要的软件", icon = shiny::icon("search"))
                        ),
									  br(),
		h4(icon("caret-right"), strong("软件功能")),
                        div(
                          sidebarSearchForm(textId = "softwaresearchText2", buttonId = "softwaresearchButton2", 
                                     label = "请输入软件功能搜索需要的软件（中英文均可）", icon = shiny::icon("search"))
                        ),br()
			   
			   
			   
			   
)
		)
        )
      )	  
    }
    )

# UI - ruanjiandaquan2------------------------------------------
  output$box_ruanjiandaquan2 <- renderUI({
	tabBox(
        id = "box_ruanjiandaquan22",
        width = NULL,
        height = 100,tabsetPanel(
		
						tabPanel(
                            title =strong(icon("database"), "选择软件"),
							value=7,
							DT::dataTableOutput("softwaresearchresult"),
                            br()

                        )
						,tabPanel(
                            strong(icon("map-marked"), "查看详情"),
							value=8,
                            br(),
							fluidRow(
                                column(
                                    11,
                                    div(class = "thumbnail", htmlOutput("softwareinfo"))
                                )
								
                            ),
							br()

                        ),
						tabPanel(
                            strong(icon("book"), "Video Tutorials"),
							value=6,
                            br(),includeHTML("software.html"),
                            #includeMarkdown("www/PlantMetEfp.md"),
                            br()
                        )
						)	
                )  
    }
    )

	
software.search.result <- reactiveValues(data = NULL)
observeEvent(input$softwaresearchButton1,{
softwaresearchText1<-input$softwaresearchText1
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appsoftware",searchfor=softwaresearchText1,myemail="no")
write.table(ipresult, "userdata/searchdata.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- tolower(as.character(softwaresearchText1))
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
resultid<-grep(softwaresearchText1,tolower(mysoftware$Name))
mysoftwareoutput<-mysoftware[resultid,]
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$softwaresearchButton2,{
softwaresearchText2<-input$softwaresearchText2
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appsoftware",searchfor=softwaresearchText2,myemail="no")
write.table(ipresult, "userdata/searchdata.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
if((!is.na(softwaresearchText2))&(!is.null(softwaresearchText2))&softwaresearchText2!=""){
softwaresearchText2 <- tolower(as.character(softwaresearchText2))
}else{
softwaresearchText2 <-"no input"
}

if(softwaresearchText2!="no input"){
resultid<-grep(softwaresearchText2,mysoftware$Des)
mysoftwareoutput<-mysoftware[resultid,]
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)


observeEvent(input$softwaresearchButton1, {
updateTabsetPanel(session, "box_ruanjiandaquan22",selected = "选择软件")
})
		
software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button1,{
softwaresearchText1<-"DNA分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button2,{
softwaresearchText1<-"RNA分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button3,{
softwaresearchText1<-"蛋白分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button4,{
softwaresearchText1<-"代谢分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button5,{
softwaresearchText1<-"进化分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button6,{
softwaresearchText1<-"基因功能分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button7,{
softwaresearchText1<-"PCR相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button8,{
softwaresearchText1<-"CRISPR相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button9,{
softwaresearchText1<-"分子克隆相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button10,{
softwaresearchText1<-"序列比对"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button11,{
softwaresearchText1<-"序列格式转换"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button12,{
softwaresearchText1<-"序列综合分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button13,{
softwaresearchText1<-"基因组分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button14,{
softwaresearchText1<-"转录组分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button15,{
softwaresearchText1<-"非编码分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button16,{
softwaresearchText1<-"蛋白组分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button17,{
softwaresearchText1<-"代谢组分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button18,{
softwaresearchText1<-"三维结构分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button19,{
softwaresearchText1<-"药物相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button20,{
softwaresearchText1<-"肿瘤相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button21,{
softwaresearchText1<-"疾病相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button22,{
softwaresearchText1<-"免疫相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button23,{
softwaresearchText1<-"单细胞相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button24,{
softwaresearchText1<-"转录调控相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button25,{
softwaresearchText1<-"基因数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button26,{
softwaresearchText1<-"蛋白数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button27,{
softwaresearchText1<-"代谢数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button28,{
softwaresearchText1<-"通路数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button29,{
softwaresearchText1<-"物种数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button30,{
softwaresearchText1<-"其它数据库"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button31,{
softwaresearchText1<-"图像处理"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button32,{
softwaresearchText1<-"数据分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button33,{
softwaresearchText1<-"互作分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button34,{
softwaresearchText1<-"文献相关"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button35,{
softwaresearchText1<-"化学分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button36,{
softwaresearchText1<-"芯片分析"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button37,{
softwaresearchText1<-"在线工具"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button38,{
softwaresearchText1<-"生物资源"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button39,{
softwaresearchText1<-"生物工程"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button40,{
softwaresearchText1<-"其它分类"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Class==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button41,{
softwaresearchText1<-"软件精选"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Nice==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)

software.search.result <- reactiveValues(data = NULL)
observeEvent(input$software_button42,{
softwaresearchText1<-"数据库精选"

if((!is.na(softwaresearchText1))&(!is.null(softwaresearchText1))&softwaresearchText1!=""){
softwaresearchText1 <- as.character(softwaresearchText1)
}else{
softwaresearchText1 <-"no input"
}

if(softwaresearchText1!="no input"){
mysoftwareoutput<-subset(mysoftware,mysoftware$Nice==softwaresearchText1)
mysoftwareoutput2<-mysoftwareoutput[,c(1,2,3)]
}else{
mysoftwareoutput2<-""
}
software.search.result.raw<-software.search.result$data<-mysoftwareoutput2
}
)



output$softwaresearchresult <- DT::renderDataTable(
if(!is.null(software.search.result$data)){
  DT::datatable(software.search.result$data,
                class = 'row-border stripe order-column',
                editable = FALSE,
                selection = "single",
                escape = FALSE,
                filter = "none",
                rownames = FALSE,
                extensions = list("ColReorder" = NULL,
                                  "Buttons" = NULL,
                                  "FixedColumns" = list(leftColumns=2)),
                options = list(
                  dom = 'BRrltpi',
                  lengthMenu = list(c(10, 5), c('10', '5')),
                  ColReorder = TRUE,
                  buttons =
                    list(
                      
                      I('colvis')
                    ),
                  scrollX = TRUE
                )
  )
  
}
)

observeEvent(eventExpr = c(input$softwaresearchresult_rows_selected),{
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appsoftware",mytaskid="no",myemail="no")
write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
          i <- as.numeric(input$softwaresearchresult_rows_selected)
		  search.id<-software.search.result$data
		  id <- as.character(search.id$ID[i])
		  mysoftware<-mysoftware
		  mysoftware2<-subset(mysoftware,mysoftware$ID==id)
		  
	  
		  mysoftwareout3<-paste(
							"<b>软件名：</b>",mysoftware2$Name,
		                    "<br>",
		                    "<br>",		
							"<b>软件分类</b>：",mysoftware2$Class,
		                    "<br>",
		                    "<br>",								
							"<b>软件介绍：</b>",mysoftware2$Des,
							"<br>",
		                    "<br>",		
							"<b>网盘链接：</b>","<a href='",mysoftware2$Downloadlink,"' target = '_blank'>",mysoftware2$Downloadlink,"</a>",		
		                    "<br>",
		                    "<br>",		
							"<b>提取密码：</b>",mysoftware2$DownloadCode,	
		                    "<br>",
		                    "<br>",		
							"<b>官网链接：</b>","<a href='",mysoftware2$Website,"' target = '_blank'>",mysoftware2$Website,"</a>",		
		                    "<br>",
		                    "<br>",		
							"<b>参考文献：</b>",mysoftware2$Article,							
		                    "<br>",
		                    "<br>",	
							"<b>发表期刊：</b>",mysoftware2$ArticleJournal,						
		                    "<br>",
		                    "<br>",	
							"<b>DOI号：</b>",mysoftware2$ArticleLink									
							)
		  output$softwareinfo <- renderText({mysoftwareout3})
		  })

observeEvent(eventExpr = c(input$ruanjiandaquan),{
		  mysoftwareout3<-paste(
		                    "<br>",	
		                    "<br>",							
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",						
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",				
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",			
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>"	
							)
		  output$softwareinfo <- renderText({mysoftwareout3})
		  })

 output$box_shiyanjijin1 <- renderUI({
	div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_shiyanjijin11",
        width = NULL,
        height = 100,
        tabPanel(
          title = "",
		  includeHTML("manual.html")
		)
        )
      )	  
    }
    )

		  
 # UI - shiyanjijin1------------------------------------------
  # output$box_shiyanjijin1 <- renderUI({
	# div(
      # style = "position: relative; backgroundColor: #ecf0f5",
      # tabBox(
        # id = "box_shiyanjijin11",
        # width = NULL,
        # height = 100,
        # tabPanel(
          # title = "",
		  # div(style="text-align:center;
        # position:relative;
		# text-align: left;
		# color:black;
		# backgroundColor: #ecf0f5;",
		# h4(icon("caret-right"), strong("实验分类")),
			   # fluidRow(column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button1",
                 # label = "DNA实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #f00; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button2",
                 # label = "RNA实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #f00; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button3",
                 # label = "PCR实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #f00; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button4",
                 # label = "蛋白实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #f00; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) )
	# ),fluidRow(column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button5",
                 # label = "代谢实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #ff8300; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button6",
                 # label = "表观实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #ff8300; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button7",
                 # label = "仪器使用",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #ff8300; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button8",
                 # label = "组学实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #ff8300; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) )
	# ),fluidRow(column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button9",
                 # label = "细胞实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #00c0c1; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button10",
                 # label = "免疫实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #00c0c1; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button11",
                 # label = "生理实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #00c0c1; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button12",
                 # label = "其他实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #00c0c1; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) )
	# ),fluidRow(column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button13",
                 # label = "动物实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #8d00ac; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button14",
                 # label = "植物实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #8d00ac; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button15",
                 # label = "微生物实验",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: #8d00ac; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-width: 2px"
               # )) ),
			   # column(3,
			   # div(style="text-align:center;",actionButton(
                 # inputId = "protocol_button16",
                 # label = "实验精选",
                 # styleclass = "info",
				 # style = "color: white; 
				       # display: inline-block;
                       # background-color: black; 
                       # position: relative; 
                       # height: 40px;
                       # width: 95px;font-size:80%;
                       # text-align:center;
                       # border-radius: 6px;
                       # border-color: red;					   
                       # border-width: 5px"
               # )) )
	# ),br(),
		# h4(icon("caret-right"), strong("实验名称")),
                        # div(style =" 
                       # background-color: white;",
                          # sidebarSearchForm(textId = "protocolsearchText1", buttonId = "protocolsearchButton1", 
                                     # label = "请输入实验名称搜索需要的软件", icon = shiny::icon("search"))
                        # ),
									  # br(),
		# h4(icon("caret-right"), strong("实验描述")),
                        # div(
                          # sidebarSearchForm(textId = "protocolsearchText2", buttonId = "protocolsearchButton2", 
                                     # label = "请输入实验描述搜索需要的实验步骤（中英文均可）", icon = shiny::icon("search"))
                        # ),br()
			   
			   
			   
			   
# )
		# )
        # )
      # )	  
    # }
    # )

	
	
	
# UI - shiyanjijin2------------------------------------------
  output$box_shiyanjijin2 <- renderUI({
	tabBox(
        id = "box_shiyanjijin22",
        width = NULL,
        height = 100,tabsetPanel(
		
						tabPanel(
                            strong(icon("database"), "选择实验"),
							value=7,
							DT::dataTableOutput("protocolsearchresult"),
                            br()

                        )
						,tabPanel(
                            strong(icon("map-marked"), "查看详情"),
							value=8,
                            br(),
							fluidRow(
                                column(
                                    11,
                                    div(class = "thumbnail", htmlOutput("protocolinfo"))
                                )
								
                            ),
							br()

                        ),
						tabPanel(
                            strong(icon("book"), "Video Tutorials"),
							value=6,
                            br(),includeHTML("protocol.html"),
                            #includeMarkdown("www/PlantMetEfp.md"),
                            br()
                        )
						)	
                )  
    }
    )
	

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocolsearchButton1,{
protocolsearchText1<-input$protocolsearchText1
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appprotocol",searchfor=protocolsearchText1,myemail="no")
write.table(ipresult, "userdata/searchdata.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- tolower(as.character(protocolsearchText1))
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
resultid<-grep(protocolsearchText1,tolower(myprotocol$Name))
myprotocoloutput<-myprotocol[resultid,]
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocolsearchButton2,{
protocolsearchText2<-input$protocolsearchText2
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appprotocol",searchfor=protocolsearchText2,myemail="no")
write.table(ipresult, "userdata/searchdata.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
if((!is.na(protocolsearchText2))&(!is.null(protocolsearchText2))&protocolsearchText2!=""){
protocolsearchText2 <- tolower(as.character(protocolsearchText2))
}else{
protocolsearchText2 <-"no input"
}

if(protocolsearchText2!="no input"){
resultid<-grep(protocolsearchText2,myprotocol$Des)
myprotocoloutput<-myprotocol[resultid,]
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)


protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button1,{
protocolsearchText1<-"DNA实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button2,{
protocolsearchText1<-"RNA实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button3,{
protocolsearchText1<-"PCR实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button4,{
protocolsearchText1<-"蛋白实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button5,{
protocolsearchText1<-"代谢实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button6,{
protocolsearchText1<-"表观实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button7,{
protocolsearchText1<-"仪器使用"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button8,{
protocolsearchText1<-"组学实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button9,{
protocolsearchText1<-"细胞实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button10,{
protocolsearchText1<-"免疫实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button11,{
protocolsearchText1<-"生理实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button12,{
protocolsearchText1<-"其他实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button13,{
protocolsearchText1<-"动物实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button14,{
protocolsearchText1<-"植物实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button15,{
protocolsearchText1<-"微生物实验"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)

protocol.search.result <- reactiveValues(data = NULL)
observeEvent(input$protocol_button16,{
protocolsearchText1<-"实验精选"

if((!is.na(protocolsearchText1))&(!is.null(protocolsearchText1))&protocolsearchText1!=""){
protocolsearchText1 <- as.character(protocolsearchText1)
}else{
protocolsearchText1 <-"no input"
}

if(protocolsearchText1!="no input"){
myprotocoloutput<-subset(myprotocol,myprotocol$Class==protocolsearchText1)
myprotocoloutput2<-myprotocoloutput[,c(1,2,3)]
}else{
myprotocoloutput2<-""
}
protocol.search.result.raw<-protocol.search.result$data<-myprotocoloutput2
}
)





output$protocolsearchresult <- DT::renderDataTable(
if(!is.null(protocol.search.result$data)){
  DT::datatable(protocol.search.result$data,
                class = 'row-border stripe order-column',
                editable = FALSE,
                selection = "single",
                escape = FALSE,
                filter = "none",
                rownames = FALSE,
                extensions = list("ColReorder" = NULL,
                                  "Buttons" = NULL,
                                  "FixedColumns" = list(leftColumns=2)),
                options = list(
                  dom = 'BRrltpi',
                  lengthMenu = list(c(10, 5), c('10', '5')),
                  ColReorder = TRUE,
                  buttons =
                    list(
                      
                      I('colvis')
                    ),
                  scrollX = TRUE
                )
  )
  
}
)

observeEvent(eventExpr = c(input$protocolsearchresult_rows_selected),{
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appprotocol",mytaskid="no",myemail="no")
write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
          i <- as.numeric(input$protocolsearchresult_rows_selected)
		  search.id<-protocol.search.result$data
		  id <- as.character(search.id$ID[i])
		  myprotocol<-myprotocol
		  myprotocol2<-subset(myprotocol,myprotocol$ID==id)
		  
	  
		  myprotocolout3<-paste(
							"<b>实验名：</b>",myprotocol2$Name,
		                    "<br>",
		                    "<br>",		
							"<b>实验分类</b>：",myprotocol2$Class,
		                    "<br>",
		                    "<br>",								
							"<b>实验介绍：</b>",myprotocol2$Des,
							"<br>",
		                    "<br>",		
							"<b>网盘链接：</b>","<a href='",myprotocol2$Downloadlink,"' target = '_blank'>",myprotocol2$Downloadlink,"</a>",		
		                    "<br>",
		                    "<br>",		
							"<b>提取密码：</b>",myprotocol2$DownloadCode,	
		                    "<br>",
		                    "<br>",		
							"<b>视频链接：</b>","<a href='",myprotocol2$Website,"' target = '_blank'>",myprotocol2$Website,"</a>",		
		                    "<br>",
		                    "<br>",		
							"<b>参考文献：</b>",myprotocol2$Article,							
		                    "<br>",
		                    "<br>",	
							"<b>发表期刊：</b>",myprotocol2$ArticleJournal,						
		                    "<br>",
		                    "<br>",	
							"<b>DOI号：</b>",myprotocol2$ArticleLink									
							)
		  output$protocolinfo <- renderText({myprotocolout3})
		  })

observeEvent(eventExpr = c(input$ruanjiandaquan),{
		  myprotocolout3<-paste(
		                    "<br>",	
		                    "<br>",							
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",						
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",				
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",			
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>"	
							)
		  output$protocolinfo <- renderText({myprotocolout3})
		  })
		  
# UI - yingxiangyinzi1------------------------------------------
  output$box_yingxiangyinzi1 <- renderUI({
	div(
      style = "position: relative",
      tabBox(
        id = "box_yingxiangyinzi11",
        width = NULL,
        height = 100,
        tabPanel(
          title = "",
		  br(),
		  div(style="text-align:center;
        position:relative;
		text-align: left;
		color:black;",
		h4(icon("caret-right"), strong("影响因子 ")),
						 selectizeInput(
                                "ifvalue",
                                "",
                                choices = list(
                               '影响因子' = c(
							   `所有` = "0",
							   `大于10` = "10",
                               `大于5` = "5",
							   `大于3` = "3")),
                                multiple = F,
                                options = list(placeholder = '请选择影响因子范围'),
                                selected = ""
                            ),
									  br(),
									  br(),
							h4(icon("caret-right"), strong("期刊名称")),
                        div(
                          textAreaInput("journalname", "","", width = "100%",height="40px") 
                        ),
									  br(),
									  br(),
							h4(icon("caret-right"), strong("期刊方向")),
                        div(
                          textAreaInput("journalclass", "","", width = "100%",height="40px") 
                        ),div(style="text-align:center;",actionButton(
                 inputId = "if_button",
                 label = "查询",
                 styleclass = "info",
				 style = "color: white; 
                       background-color: #7472d0; 
                       position: relative; 
                       height: 40px;
                       width: 80px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )),br(),	h4(strong( "热门搜索Hot! "),style="text-align:center;color: red;"),
			   fluidRow(
                                column(
                                    2,
			   div(style="text-align:center;",actionButton(
                 inputId = "if_button1",
                 label = "医学",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c90d0d; 
                       position: relative; 
                       height: 40px;
                       width: 60px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ))                                ),
								column(
                                    2,
div(style="text-align:center;",actionButton(
                 inputId = "if_button2",
                 label = "肿瘤",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #c9660d; 
                       position: relative; 
                       height: 40px;
                       width: 60px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ))),
								column(
                                    2,
div(style="text-align:center;",actionButton(
                 inputId = "if_button3",
                 label = "植物",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #36d61a; 
                       position: relative; 
                       height: 40px;
                       width: 60px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ))),
								column(
                                    2,
div(style="text-align:center;",actionButton(
                 inputId = "if_button4",
                 label = "进化",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #1ad6ba; 
                       position: relative; 
                       height: 40px;
                       width: 60px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ))),
								column(
                                    2,
div(style="text-align:center;",actionButton(
                 inputId = "if_button5",
                 label = "生态",
                 styleclass = "info",
				 style = "color: white; 
				       display: inline-block;
                       background-color: #b116f9; 
                       position: relative; 
                       height: 40px;
                       width: 60px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ))))
			   
			   
			   
)
		)
        )
      )	  
    }
    )

# UI - yingxiangyinzi1------------------------------------------
  output$box_yingxiangyinzi2 <- renderUI({
	tabBox(
        id = "box_yingxiangyinzi22",
        width = NULL,
        height = 100,tabsetPanel(
		
						tabPanel(
                            strong(icon("database"), "选择期刊"),
							value=7,
							DT::dataTableOutput("searchresult"),
                            br()

                        )
						,tabPanel(
                            strong(icon("map-marked"), "查看详情"),
							value=8,
                            br(),
							fluidRow(
                                column(
                                    6,
                                    h5(strong("期刊详情")),
                                    div(class = "thumbnail", htmlOutput("journalinfo"))
                                ),
								column(
                                    6,
                                    h5(strong("影响因子变化")),
                                    div(class = "thumbnail", plotOutput("ifplotout1", height = "200px"))
                                ),column(
                                    6,
                                    h5(strong("文章数量变化")),
                                    div(class = "thumbnail", plotOutput("ifplotout2", height = "200px"))
                                )
								
                            ),
							br()

                        ),
						tabPanel(
                            strong(icon("book"), "Video Tutorials"),
							value=6,
                            br(),includeHTML("if.html"),
                            #includeMarkdown("www/PlantMetEfp.md"),
                            br()
                        )
						)	
                )  
    }
    )

search.result <- reactiveValues(data = NULL)
observeEvent(input$if_button,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-input$journalclass

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)

observeEvent(input$if_button1,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-"医学"

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)

observeEvent(input$if_button2,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-"肿瘤"

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)



observeEvent(input$if_button3,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-"植物"

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)

observeEvent(input$if_button4,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-"进化"

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)

observeEvent(input$if_button5,{
ifvalue<-input$ifvalue
journalname<-input$journalname
journalclass<-"生态"

if(!is.na(ifvalue)){
ifvalue <- as.numeric(ifvalue)
}else{
ifvalue <-0
}

if(!is.na(journalname)){
journalname <- tolower(as.character(journalname))
}else{
journalname <-"no"
}
if(!is.na(journalclass)){
journalclass <- as.character(journalclass)
}else{
journalclass <-"no"
}

scifind<-sci$info
scifind2<-sci$out
mysci1<-subset(scifind,scifind$IF>=ifvalue)
if(journalclass!="no"){
resultid1<-grep(journalname,tolower(mysci1$Name))
mysci2<-mysci1[resultid1,]
}else{
mysci2<-mysci1
}
if(journalclass!="no"){
resultid2<-grep(journalclass,mysci2$Direction)
mysciresult<-mysci2[resultid2,]
}else{
mysciresult<-mysci2
}
mysciresultid<-mysciresult$ID
myscioutput2<-scifind2[mysciresultid,]
myscioutput3<-myscioutput2[order(myscioutput2$IF,decreasing = T),]
search.result.raw<-search.result$data<-myscioutput3
}
)

output$searchresult <- DT::renderDataTable(
if(!is.null(search.result$data)){
  DT::datatable(search.result$data,
                class = 'row-border stripe order-column',
                editable = FALSE,
                selection = "single",
                escape = FALSE,
                filter = "none",
                rownames = FALSE,
                extensions = list("ColReorder" = NULL,
                                  "Buttons" = NULL,
                                  "FixedColumns" = list(leftColumns=2)),
                options = list(
                  dom = 'BRrltpi',
                  lengthMenu = list(c(8, 10), c('8', '10')),
                  ColReorder = TRUE,
                  buttons =
                    list(
                      list(
                        extend = 'collection',
                        buttons = list(list(extend="csv",filename = "Result"),
                                       list(extend='excel',filename = "Result")),
                        text = 'Download'
                      ),
                      I('colvis')
                    ),
                  scrollX = TRUE
                )
  )
  
}
)

ifrecent <- reactiveValues(data = NULL)
observeEvent(eventExpr = c(input$searchresult_rows_selected),{
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appif",mytaskid="no",myemail="no")
write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
          i <- as.numeric(input$searchresult_rows_selected)
		  search.id<-search.result$data
		  id <- as.character(search.id$Name[i])
		  scifind<-sci$info
		  scifind3<-subset(scifind,scifind$Name==id)
		  scifindout<-paste(
		  		            "<br>",	
							"<b>期刊名：</b>",scifind3$Name,
		                    "<br>",
		                    "<br>",			
							"<b>官网链接：</b>","<a href='",scifind3$Website,"' target = '_blank'>",scifind3$Website,"</a>",		
		                    "<br>",
		                    "<br>",								
							"<b>影响因子</b>：",scifind3$IF,
		                    "<br>",
		                    "<br>",							
							"<b>自引率：</b>",scifind3$Self_citation_rate,						
		                    "<br>",
		                    "<br>",	
							"<b>出版周期：</b>",scifind3$Cycle,							
		                    "<br>",
		                    "<br>",	
							"<b>中国学者发表比例：</b>",scifind3$China,						
		                    "<br>",
		                    "<br>",	
							"<b>JCR分区：</b>",scifind3$JCR,					
		                    "<br>",
		                    "<br>",	
							"<b>中科院分区：</b>",scifind3$CAS,				
		                    "<br>",
		                    "<br>",	
							"<b>文章类型：</b>",scifind3$Type				
							)
		  output$journalinfo <- renderText({scifindout})
		  j<-scifind3$ID
		  ifdataresult<-t(do.call(cbind,sci$detail[[j]]$data$book$list_Ifs))
          ifplot<-data.frame(Year=as.character(unlist(ifdataresult[,4])),IF=round(as.numeric(unlist(ifdataresult[,3])),2))
          ifplotresult<-head(ifplot[order(ifplot$Year,decreasing = T),],5)
          ifdataresult2<-t(do.call(cbind,sci$detail[[j]]$data$book$list_publish))
          ifplot2<-data.frame(Year=as.character(unlist(ifdataresult2[,4])),Articles=round(as.numeric(unlist(ifdataresult2[,3])),2))
          ifplotresult2<-head(ifplot2[order(ifplot2$Year,decreasing = T),],5)
          output$ifplotout1=renderPlot(
		  ggplot(ifplotresult, aes(x=Year, y=log2(IF))) +geom_bar(stat="identity", fill="#6b6db1", colour="#6b6db1")+geom_text(aes(label=paste0(Year)), position=position_dodge(width = 1), vjust=-0.5)+ theme_bw() + theme(panel.grid=element_blank(),axis.ticks=element_blank())+theme(axis.ticks = element_blank(), axis.text.y = element_blank(),axis.text.x = element_blank())+
          geom_text(aes(label=paste0("IF=",IF)), position=position_dodge(width = 1), vjust=-2)+
          theme(legend.position = "bottom",
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          legend.title = element_blank(),
          panel.border = element_blank())+xlab(NULL)+ylab(NULL)+
          ylim(0, (max(log2(ifplotresult$IF))+5))
		  )
		  output$ifplotout2=renderPlot(
		  ggplot(ifplotresult2, aes(x=Year, y=log2(Articles))) +geom_bar(stat="identity", fill="#6baf9f", colour="#6baf9f")+geom_text(aes(label=paste0(Year)), position=position_dodge(width = 1), vjust=-0.5)+ theme_bw() + theme(panel.grid=element_blank(),axis.ticks=element_blank())+theme(axis.ticks = element_blank(), axis.text.y = element_blank(),axis.text.x = element_blank())+
          geom_text(aes(label=paste0(Articles," Articles")), position=position_dodge(width = 1), vjust=-2)+
          theme(legend.position = "bottom",
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          legend.title = element_blank(),
          panel.border = element_blank())+xlab(NULL)+ylab(NULL)+
          ylim(0, (max(log2(ifplotresult2$Articles))+5))
		  )
		  })

ifrecent <- reactiveValues(data = NULL)
observeEvent(eventExpr = c(input$yingxiangyinzi),{
		  scifindout<-paste(
		                    "<br>",	
		                    "<br>",							
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",						
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",				
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",					
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>",			
		                    "<br>",
		                    "<br>",	
		                    "<br>",	
							"<br>"	
							)
		  output$journalinfo <- renderText({scifindout})
		  })
		  
# UI - jieguoxiazai------------------------------------------
  output$box_jieguoxiazai <- renderUI({
    div(
      style = "position: relative",
      tabBox(
        id = "box_jieguoxiazai",
        width = NULL,
        height = 300,
        tabPanel(
          title = "结果下载",
		  br(),
		  div(style="text-align:center;
        position:relative;
		text-align: left;
		color:green;",
		h4(strong("Please enter the task number and click the button to download the analysis results", align='left'))
		),
		  textInput("jobidinput", "", ""),
		  downloadButton("downloadjob", label = "Download",style= "color: white;background-color: #7472d0;"),
		  div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:red;",
		h4(strong(textOutput("taskjobidcheck"), align='left'))
		)
        )
      )
    )
  })
  
observeEvent(input$jobidinput,{
jobidinput <- as.character(input$jobidinput)
alljob<-list.files("userdata")
if((jobidinput%in%alljob)&("TRUE"%in%grepl("Finish.txt",list.files((file.path("userdata",jobidinput,"result")))))){
output$downloadjob<-downloadHandler(
filename = function(){
  paste0("result.zip")
},
content = function(file){
  files <- file.path("userdata",jobidinput,"result");
  tar(file,files)
},
contentType = "application/zip"
)
output$taskjobidcheck<-renderText({paste("Analysis has been completed, please download the analysis results in time！")})
}else{
if((jobidinput%in%alljob)){
output$taskjobidcheck<-renderText({paste("Analysis is still in progress, please be patient！")})
}else{
if(jobidinput!=""){
output$taskjobidcheck<-renderText({paste("The task number is wrong or the data has been deleted！")})}
}
}}
)

observeEvent(input$jobidinput2,{
jobidinput <- as.character(input$jobidinput2)
alljob<-list.files("userdata")
if((jobidinput%in%alljob)&("TRUE"%in%grepl("Finish.txt",list.files((file.path("userdata",jobidinput,"result")))))){
output$downloadjob2<-downloadHandler(
filename = function(){
  paste0("result.zip")
},
content = function(file){
  files <- file.path("userdata",jobidinput,"result");
  tar(file,files)
},
contentType = "application/zip"
)
output$taskjobidcheck2<-renderText({paste("Analysis has been completed, please download the analysis results in time！")})
}else{
if((jobidinput%in%alljob)){
output$taskjobidcheck2<-renderText({paste("Analysis is still in progress, please be patient！")})
}else{
if(jobidinput!=""){
output$taskjobidcheck2<-renderText({paste("The task number is wrong or the data has been deleted！")})}
}
}})



observeEvent(input$searchButton,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- toupper(as.character(input$searchText))
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",,encoding = "UTF-8")
allapp[,10]<-paste(allapp[,2],allapp[,5],sep="")
allapp[,10]<-as.character(toupper(allapp[,10]))
appsearchresult<-allapp[grepl(searchtextinput,allapp[,10]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")	
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)


observeEvent(input$box_zuxuefenxi1_button,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- "metabolome"
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",encoding = "UTF-8")
appsearchresult<-allapp[grepl(searchtextinput,allapp[,9]),]
appsearchresult[,9]<-gsub(".*,metabolome","metabolome",appsearchresult[,9])
appsearchresult[,9]<-gsub(",.*","",appsearchresult[,9])
appsearchresult<-appsearchresult[order(appsearchresult[,9]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
appsearchresult[,9]<-as.character(appsearchresult[,9])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")	
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=20){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
output$box_search20 <- fluid_renderUI(appsearchresult[20,4],appsearchresult[20,2],appsearchresult[20,6],appsearchresult[20,2],"",appsearchresult[20,7],appsearchresult[20,8])

}		
if(nrow(appsearchresult)>=19){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
}		
if(nrow(appsearchresult)>=18){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
}		
if(nrow(appsearchresult)>=17){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
}		
if(nrow(appsearchresult)>=16){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
}		
if(nrow(appsearchresult)>=15){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
}		
if(nrow(appsearchresult)>=14){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
}		
if(nrow(appsearchresult)>=13){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
}	
if(nrow(appsearchresult)>=12){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
}		
if(nrow(appsearchresult)>=11){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
}	
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)



observeEvent(input$box_zuxuefenxi2_button,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- "transcriptome"
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",encoding = "UTF-8")
appsearchresult<-allapp[grepl(searchtextinput,allapp[,9]),]
appsearchresult[,9]<-gsub(".*,transcriptome","transcriptome",appsearchresult[,9])
appsearchresult[,9]<-gsub(",.*","",appsearchresult[,9])
appsearchresult<-appsearchresult[order(appsearchresult[,9]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
appsearchresult[,9]<-as.character(appsearchresult[,9])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")	
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=20){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
output$box_search20 <- fluid_renderUI(appsearchresult[20,4],appsearchresult[20,2],appsearchresult[20,6],appsearchresult[20,2],"",appsearchresult[20,7],appsearchresult[20,8])

}		
if(nrow(appsearchresult)>=19){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
}		
if(nrow(appsearchresult)>=18){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
}		
if(nrow(appsearchresult)>=17){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
}		
if(nrow(appsearchresult)>=16){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
}		
if(nrow(appsearchresult)>=15){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
}		
if(nrow(appsearchresult)>=14){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
}		
if(nrow(appsearchresult)>=13){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
}	
if(nrow(appsearchresult)>=12){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
}		
if(nrow(appsearchresult)>=11){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
}	
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)


observeEvent(input$box_zuxuefenxi3_button,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- "genome"
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",encoding = "UTF-8")
appsearchresult<-allapp[grepl(searchtextinput,allapp[,9]),]
appsearchresult[,9]<-gsub(".*,genome","genome",appsearchresult[,9])
appsearchresult[,9]<-gsub(",.*","",appsearchresult[,9])
appsearchresult<-appsearchresult[order(appsearchresult[,9]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
appsearchresult[,9]<-as.character(appsearchresult[,9])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=20){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
output$box_search20 <- fluid_renderUI(appsearchresult[20,4],appsearchresult[20,2],appsearchresult[20,6],appsearchresult[20,2],"",appsearchresult[20,7],appsearchresult[20,8])

}		
if(nrow(appsearchresult)>=19){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
}		
if(nrow(appsearchresult)>=18){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
}		
if(nrow(appsearchresult)>=17){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
}		
if(nrow(appsearchresult)>=16){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
}		
if(nrow(appsearchresult)>=15){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
}		
if(nrow(appsearchresult)>=14){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
}		
if(nrow(appsearchresult)>=13){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
}	
if(nrow(appsearchresult)>=12){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
}		
if(nrow(appsearchresult)>=11){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
}	
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)


observeEvent(input$box_zuxuefenxi4_button,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- "proteome"
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",encoding = "UTF-8")
appsearchresult<-allapp[grepl(searchtextinput,allapp[,9]),]
appsearchresult[,9]<-gsub(".*,proteome","proteome",appsearchresult[,9])
appsearchresult[,9]<-gsub(",.*","",appsearchresult[,9])
appsearchresult<-appsearchresult[order(appsearchresult[,9]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
appsearchresult[,9]<-as.character(appsearchresult[,9])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=20){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
output$box_search20 <- fluid_renderUI(appsearchresult[20,4],appsearchresult[20,2],appsearchresult[20,6],appsearchresult[20,2],"",appsearchresult[20,7],appsearchresult[20,8])

}		
if(nrow(appsearchresult)>=19){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
}		
if(nrow(appsearchresult)>=18){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
}		
if(nrow(appsearchresult)>=17){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
}		
if(nrow(appsearchresult)>=16){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
}		
if(nrow(appsearchresult)>=15){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
}		
if(nrow(appsearchresult)>=14){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
}		
if(nrow(appsearchresult)>=13){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
}	
if(nrow(appsearchresult)>=12){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
}		
if(nrow(appsearchresult)>=11){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
}	
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)


observeEvent(input$box_zuxuefenxi5_button,{
searchtextinput<-""
output$search_panel<-renderUI("")
output$box_search1 <- renderUI("")
output$box_search2 <- renderUI("")
output$box_search3 <- renderUI("")
output$box_search4 <- renderUI("")
output$box_search5 <- renderUI("")
output$box_search6 <- renderUI("")
output$box_search7 <- renderUI("")
output$box_search8 <- renderUI("")
output$box_search9 <- renderUI("")
output$box_search10 <- renderUI("")
output$box_search11 <- renderUI("")
output$box_search12 <- renderUI("")
output$box_search13 <- renderUI("")
output$box_search14 <- renderUI("")
output$box_search15 <- renderUI("")
output$box_search16 <- renderUI("")
output$box_search17 <- renderUI("")
output$box_search18 <- renderUI("")
output$box_search19 <- renderUI("")
output$box_search20 <- renderUI("")
output$box_search21 <- renderUI("")
output$box_search22 <- renderUI("")
output$box_search23 <- renderUI("")
output$box_search24 <- renderUI("")
output$box_search25 <- renderUI("")
output$box_search26 <- renderUI("")
output$box_search27 <- renderUI("")
output$box_search28 <- renderUI("")
output$box_search29 <- renderUI("")
output$box_search30 <- renderUI("")
output$box_search31 <- renderUI("")
output$box_search32 <- renderUI("")
output$box_search33 <- renderUI("")
output$box_search34 <- renderUI("")
output$box_search35 <- renderUI("")
output$box_search36 <- renderUI("")
output$box_search37 <- renderUI("")
output$box_search38 <- renderUI("")
output$box_search39 <- renderUI("")
output$box_search40 <- renderUI("")
output$box_search41 <- renderUI("")
output$box_search42 <- renderUI("")
output$box_search43 <- renderUI("")
output$box_search44 <- renderUI("")
output$box_search45 <- renderUI("")
output$box_search46 <- renderUI("")
output$box_search47 <- renderUI("")
output$box_search48 <- renderUI("")
output$box_search49 <- renderUI("")
output$box_search50 <- renderUI("")
output$box_search51 <- renderUI("")
output$box_search52 <- renderUI("")
output$box_search53 <- renderUI("")
output$box_search54 <- renderUI("")
output$box_search55 <- renderUI("")
output$box_search56 <- renderUI("")
output$box_search57 <- renderUI("")
output$box_search58 <- renderUI("")
output$box_search59 <- renderUI("")
output$box_search60 <- renderUI("")
searchtextinput <- "epigenome"
allapp<-read.csv(file="/srv/myapps/keyandaydayup/allapp.txt",head=T,sep="\t",encoding = "UTF-8")
appsearchresult<-allapp[grepl(searchtextinput,allapp[,9]),]
appsearchresult[,9]<-gsub(".*,epigenome","epigenome",appsearchresult[,9])
appsearchresult[,9]<-gsub(",.*","",appsearchresult[,9])
appsearchresult<-appsearchresult[order(appsearchresult[,9]),]
appsearchresult[,1]<-as.character(appsearchresult[,1])
appsearchresult[,2]<-as.character(appsearchresult[,2])
appsearchresult[,3]<-as.character(appsearchresult[,3])
appsearchresult[,4]<-as.character(appsearchresult[,4])
appsearchresult[,5]<-as.character(appsearchresult[,5])
appsearchresult[,6]<-as.character(appsearchresult[,6])
appsearchresult[,7]<-as.character(appsearchresult[,7])
appsearchresult[,8]<-as.character(appsearchresult[,8])
appsearchresult[,9]<-as.character(appsearchresult[,9])
if(nrow(appsearchresult)>0){
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")	
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
if(nrow(appsearchresult)>=20){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
output$box_search20 <- fluid_renderUI(appsearchresult[20,4],appsearchresult[20,2],appsearchresult[20,6],appsearchresult[20,2],"",appsearchresult[20,7],appsearchresult[20,8])

}		
if(nrow(appsearchresult)>=19){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
output$box_search19 <- fluid_renderUI(appsearchresult[19,4],appsearchresult[19,2],appsearchresult[19,6],appsearchresult[19,2],"",appsearchresult[19,7],appsearchresult[19,8])
}		
if(nrow(appsearchresult)>=18){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
output$box_search18 <- fluid_renderUI(appsearchresult[18,4],appsearchresult[18,2],appsearchresult[18,6],appsearchresult[18,2],"",appsearchresult[18,7],appsearchresult[18,8])
}		
if(nrow(appsearchresult)>=17){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
output$box_search17 <- fluid_renderUI(appsearchresult[17,4],appsearchresult[17,2],appsearchresult[17,6],appsearchresult[17,2],"",appsearchresult[17,7],appsearchresult[17,8])
}		
if(nrow(appsearchresult)>=16){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
output$box_search16 <- fluid_renderUI(appsearchresult[16,4],appsearchresult[16,2],appsearchresult[16,6],appsearchresult[16,2],"",appsearchresult[16,7],appsearchresult[16,8])
}		
if(nrow(appsearchresult)>=15){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
output$box_search15 <- fluid_renderUI(appsearchresult[15,4],appsearchresult[15,2],appsearchresult[15,6],appsearchresult[15,2],"",appsearchresult[15,7],appsearchresult[15,8])
}		
if(nrow(appsearchresult)>=14){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
output$box_search14 <- fluid_renderUI(appsearchresult[14,4],appsearchresult[14,2],appsearchresult[14,6],appsearchresult[14,2],"",appsearchresult[14,7],appsearchresult[14,8])
}		
if(nrow(appsearchresult)>=13){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
output$box_search13 <- fluid_renderUI(appsearchresult[13,4],appsearchresult[13,2],appsearchresult[13,6],appsearchresult[13,2],"",appsearchresult[13,7],appsearchresult[13,8])
}	
if(nrow(appsearchresult)>=12){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
output$box_search12 <- fluid_renderUI(appsearchresult[12,4],appsearchresult[12,2],appsearchresult[12,6],appsearchresult[12,2],"",appsearchresult[12,7],appsearchresult[12,8])
}		
if(nrow(appsearchresult)>=11){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
output$box_search11 <- fluid_renderUI(appsearchresult[11,4],appsearchresult[11,2],appsearchresult[11,6],appsearchresult[11,2],"",appsearchresult[11,7],appsearchresult[11,8])
}	
if(nrow(appsearchresult)>=10){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
output$box_search10 <- fluid_renderUI(appsearchresult[10,4],appsearchresult[10,2],appsearchresult[10,6],appsearchresult[10,2],"",appsearchresult[10,7],appsearchresult[10,8])
}

if(nrow(appsearchresult)==9){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
output$box_search9 <- fluid_renderUI(appsearchresult[9,4],appsearchresult[9,2],appsearchresult[9,6],appsearchresult[9,2],"",appsearchresult[9,7],appsearchresult[9,8])
}

if(nrow(appsearchresult)==8){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
output$box_search8 <- fluid_renderUI(appsearchresult[8,4],appsearchresult[8,2],appsearchresult[8,6],appsearchresult[8,2],"",appsearchresult[8,7],appsearchresult[8,8])
}

if(nrow(appsearchresult)==7){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
output$box_search7 <- fluid_renderUI(appsearchresult[7,4],appsearchresult[7,2],appsearchresult[7,6],appsearchresult[7,2],"",appsearchresult[7,7],appsearchresult[7,8])
}

if(nrow(appsearchresult)==6){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
output$box_search6 <- fluid_renderUI(appsearchresult[6,4],appsearchresult[6,2],appsearchresult[6,6],appsearchresult[6,2],"",appsearchresult[6,7],appsearchresult[6,8])
}

if(nrow(appsearchresult)==5){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
output$box_search5 <- fluid_renderUI(appsearchresult[5,4],appsearchresult[5,2],appsearchresult[5,6],appsearchresult[5,2],"",appsearchresult[5,7],appsearchresult[5,8])
}

if(nrow(appsearchresult)==4){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
output$box_search4 <- fluid_renderUI(appsearchresult[4,4],appsearchresult[4,2],appsearchresult[4,6],appsearchresult[4,2],"",appsearchresult[4,7],appsearchresult[4,8])
}

if(nrow(appsearchresult)==3){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
output$box_search3 <- fluid_renderUI(appsearchresult[3,4],appsearchresult[3,2],appsearchresult[3,6],appsearchresult[3,2],"",appsearchresult[3,7],appsearchresult[3,8])
}

if(nrow(appsearchresult)==2){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
output$box_search2 <- fluid_renderUI(appsearchresult[2,4],appsearchresult[2,2],appsearchresult[2,6],appsearchresult[2,2],"",appsearchresult[2,7],appsearchresult[2,8])
}

if(nrow(appsearchresult)==1){
output$box_search1 <- fluid_renderUI(appsearchresult[1,4],appsearchresult[1,2],appsearchresult[1,6],appsearchresult[1,2],"",appsearchresult[1,7],appsearchresult[1,8])
}
show("search_panel")
}else{

}}
)
  


# UI - 实验集锦---------------------------------------
   observeEvent(input$shiyanjijin, {
    hide("index_panel")
    hide("huitugongju_panel")
	hide("dongtaihuitu_panel")		
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	hide("function_panel")
	hide("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	show("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
	hide("search_panel")
  })  
  
# UI - 科研绘图---------------------------------------
  observeEvent(input$keyanhuitu, {
    hide("index_panel")
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")		
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")	
	show("keyanhuitu_panel")
	hide("ruanjiandaquan_panel")
	hide("shiyanjijin_panel")		
	hide("yingxiangyinzi_panel")
	hide("jieguoxiazai_panel")	
    hide("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/appdraw/ui.R')
    source('apps/appdraw/server.R')
    source('apps/appdraw/result.R')
	output$box_keyanhuitu1 <- appUI()
	output$box_keyanhuitu2 <-appResult()
	
  })

observeEvent(input$keyanhuitu_button, {  
ip <- "no"
if(!is.null(ip)&ip!=""&!is.na(ip)){
ipresult<-data.frame(myip=ip,myapp="appdraw",mytaskid="no",myemail="no")
write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mylinkbase<-"https://draw.keyandaydayup.com/?splash=0&lang=zh&clibs=Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2Fflow_chart.xml;"
if(1==1){
mylink<-paste(mylinkbase,sep="")
}else{
mylink<-paste(mylinkbase,sep="")
}

if((input$keyanhuitu2)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FScientific_graphs.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu3)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FLab_apparatus.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu4)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FComputer_hardware.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu5)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FSafety_symbols.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu6)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FOncology.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu7)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FBlood_Immunology.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu8)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FGenetics.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu9)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FChemistry.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu10)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FChemo-_and_Bioinformatics.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu11)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FMachine_Learning.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu12)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FMolecular_Modelling.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu13)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FHuman_physiology.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu14)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FAnimals.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu15)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FPlants_Algae.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu16)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FParasites.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu17)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FMicrobiology.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu18)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FViruses.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu19)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FNucleic_acids.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu20)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FReceptors_channels.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu21)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FIntracellular_components.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu22)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FCell_membrane.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu23)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FCell_lines.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu24)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FCell_types.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu25)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FCell_culture.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

if((input$keyanhuitu26)==TRUE){
mylink<-paste(mylink,"Uhttps%3A%2F%2Fwww.keyandaydayup.com%2Fdrawio-lib%2FTissues.xml;",sep="")
}else{
mylink<-paste(mylink,sep="")
}

mylinkout<-paste("window.open('",mylink,"', '_blank')",sep="")
runjs(mylinkout)

})  

  observeEvent(input$huitugongju, {
output$box_huitugongju1 <- fluid_renderUI("box_huitugongju1","Heatmap","app1.png","Heatmap","","box_huitugongju1_button","danger4")
  })
  observeEvent(input$huitugongju, {
output$box_huitugongju2 <- fluid_renderUI("box_huitugongju2","Venn diagram","app4.png","Venn diagram","","box_huitugongju2_button","danger4")
  })  
  observeEvent(input$huitugongju, {
output$box_huitugongju3 <- fluid_renderUI("box_huitugongju3","Volcano Diagram","app5.png","Volcano Diagram","","box_huitugongju3_button","danger4")
  }) 
  observeEvent(input$huitugongju, {
output$box_huitugongju4 <- fluid_renderUI("box_huitugongju4","PCA plot","app6.png","PCA plot","","box_huitugongju4_button","danger4")
  })     
  
  observeEvent(input$huitugongju, {
output$box_huitugongju5 <- fluid_renderUI("box_huitugongju5","Cluster Maps","app15.png","Cluster Maps","","box_huitugongju5_button","danger4")
  })     

  observeEvent(input$huitugongju, {
output$box_huitugongju6 <- fluid_renderUI("box_huitugongju6","Base Distribution Map","app19.png","Base Distribution Map","","box_huitugongju6_button","danger4")
  })   

  observeEvent(input$huitugongju, {
output$box_huitugongju7 <- fluid_renderUI("box_huitugongju7","Bar graphs","app34.png","Bar graphs","","box_huitugongju7_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju8 <- fluid_renderUI("box_huitugongju8","Folding line chart","app35.png","Folding line chart","","box_huitugongju8_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju10 <- fluid_renderUI("box_huitugongju10","Scatter diagram","app38.png","Scatter diagram","","box_huitugongju10_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju11 <- fluid_renderUI("box_huitugongju11","Pie chart","app39.png","Pie chart","","box_huitugongju11_button","danger4")
  })

    observeEvent(input$huitugongju, {
output$box_huitugongju12 <- fluid_renderUI("box_huitugongju12","Histogram","app40.png","Histogram","","box_huitugongju12_button","danger4")
  })
  
  observeEvent(input$huitugongju, {
output$box_huitugongju13 <- fluid_renderUI("box_huitugongju13","Box line plot","app41.png","Box line plot","","box_huitugongju13_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju14 <- fluid_renderUI("box_huitugongju14","Violin plot","app42.png","Violin plot","","box_huitugongju14_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju15 <- fluid_renderUI("box_huitugongju15","Bubble diagram","app43.png","Bubble diagram","","box_huitugongju15_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju16 <- fluid_renderUI("box_huitugongju16","Correlation plot","app44.png","Correlation plot","","box_huitugongju16_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju17 <- fluid_renderUI("box_huitugongju17","UpSet Chart","app45.png","UpSet Chart","","box_huitugongju17_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju18 <- fluid_renderUI("box_huitugongju18","Density map","app46.png","Density map","","box_huitugongju18_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju19 <- fluid_renderUI("box_huitugongju19","Cloud and rain map","app47.png","Cloud and rain map","","box_huitugongju19_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju20 <- fluid_renderUI("box_huitugongju20","Pod Plot","app48.png","Pod Plot","","box_huitugongju20_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju21 <- fluid_renderUI("box_huitugongju21","Dot Plot","app49.png","Dot Plot","","box_huitugongju21_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju22 <- fluid_renderUI("box_huitugongju22","Lollipop diagram","app50.png","Lollipop diagram","","box_huitugongju22_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju23 <- fluid_renderUI("box_huitugongju23","Cleveland plot","app51.png","Cleveland plot","","box_huitugongju23_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju24 <- fluid_renderUI("box_huitugongju24","Classification bar chart","app52.png","Classification bar chart","","box_huitugongju24_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju25 <- fluid_renderUI("box_huitugongju25","QQ diagram","app53.png","QQ diagram","","box_huitugongju25_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju26 <- fluid_renderUI("box_huitugongju26","Deviation Chart","app54.png","Deviation Chart","","box_huitugongju26_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju27 <- fluid_renderUI("box_huitugongju27","Error Line Plot","app55.png","Error Line Plot","","box_huitugongju27_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju28 <- fluid_renderUI("box_huitugongju28","Strip Chart","app56.png","Strip Chart","","box_huitugongju28_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju29 <- fluid_renderUI("box_huitugongju29","Doughnut diagram","app57.png","Doughnut diagram","","box_huitugongju29_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju30 <- fluid_renderUI("box_huitugongju30","Regression Plot","app58.png","Regression Plot","","box_huitugongju30_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju31 <- fluid_renderUI("box_huitugongju31","MA Plot","app59.png","MA Plot","","box_huitugongju31_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju32 <- fluid_renderUI("box_huitugongju32","Paired Box","app60.png","Paired Box","","box_huitugongju32_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju33 <- fluid_renderUI("box_huitugongju33","Plotting Tables","app61.png","Plotting Tables","","box_huitugongju33_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju34 <- fluid_renderUI("box_huitugongju34","Edge scatter","app62.png","Edge scatter","","box_huitugongju34_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju35 <- fluid_renderUI("box_huitugongju35","Rose diagram","app63.png","Rose diagram","","box_huitugongju35_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju36 <- fluid_renderUI("box_huitugongju36","Swarm Plot","app64.png","Swarm Plot","","box_huitugongju36_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju37 <- fluid_renderUI("box_huitugongju37","Circos diagram","app65.png","Circos diagram","","box_huitugongju37_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju38 <- fluid_renderUI("box_huitugongju38","Broken bar","app66.png","Broken bar","","box_huitugongju38_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju39 <- fluid_renderUI("box_huitugongju39","Krona Chart","app67.png","Krona Chart","","box_huitugongju39_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju40 <- fluid_renderUI("box_huitugongju40","RNA-Protein","app80.png","RNA-Protein","","box_huitugongju40_button","danger4")
  })
  observeEvent(input$huitugongju, {
output$box_huitugongju41 <- fluid_renderUI("box_huitugongju41","RNA-Met","app81.png","RNA-Met","","box_huitugongju41_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju42 <- fluid_renderUI("box_huitugongju42","Sankey diagram","app82.png","Sankey diagram","","box_huitugongju42_button","danger4")
  })
  observeEvent(input$huitugongju, {
output$box_huitugongju43 <- fluid_renderUI("box_huitugongju43","Ternary diagram","app83.png","Ternary diagram","","box_huitugongju43_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju44 <- fluid_renderUI("box_huitugongju44","Area plot","app84.png","Area plot","","box_huitugongju44_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju45 <- fluid_renderUI("box_huitugongju45","Radar Plot","app85.png","Radar Plot","","box_huitugongju45_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju46 <- fluid_renderUI("box_huitugongju46","3D scatter plot","app86.png","3D scatter plot","","box_huitugongju46_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju47 <- fluid_renderUI("box_huitugongju47","Air bubble diagram","app87.png","Air bubble diagram","","box_huitugongju47_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju48 <- fluid_renderUI("box_huitugongju48","Cumulative Distribution Curve","app88.png","Cumulative Distribution Curve","","box_huitugongju48_button","danger4")
  })
  
  observeEvent(input$huitugongju, {
output$box_huitugongju49 <- fluid_renderUI("box_huitugongju49","Waterfall","app91.png","Waterfall","","box_huitugongju49_button","danger4")
  })
  
  observeEvent(input$huitugongju, {
output$box_huitugongju50 <- fluid_renderUI("box_huitugongju50","Ms2Plot","app92.png","Ms2Plot","","box_huitugongju50_button","danger4")
  })

  observeEvent(input$huitugongju, {
output$box_huitugongju9 <- fluid_renderUI("box_huitugongju9","IQTREE","app96.png","IQTREE","","box_huitugongju51_button","danger4")
  })  
  
  observeEvent(input$dongtaihuitu, {
output$box_dongtaihuitu1 <- fluid_renderUI("box_dongtaihuitu1","Dynamic Scatter Plot","app79.png","Dynamic Scatter Plot","","box_dongtaihuitu1_button","danger9")
  })

  
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi1 <- fluid_renderUI("box_biaogegeshi1","Two-table merge","app2.png","Two-table merge","","box_biaogegeshi1_button","danger5")
  })

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi2 <- fluid_renderUI("box_biaogegeshi2","GTF Extraction Information","app9.png","GTF Extraction Information","","box_biaogegeshi2_button","danger5")
  })

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi3 <- fluid_renderUI("box_biaogegeshi3","SVG conversion","app16.png","SVG conversion","","box_biaogegeshi3_button","danger5")
  })

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi4 <- fluid_renderUI("box_biaogegeshi4","GFF3 to GTF","app22.png","GFF3 to GTF","","box_biaogegeshi4_button","danger5")
  })
  
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi5 <- fluid_renderUI("box_biaogegeshi5","DICT file construction","app23.png","DICT file construction","","box_biaogegeshi5_button","danger5")
  })  

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi6 <- fluid_renderUI("box_biaogegeshi6","GTF Extraction FASTA","app24.png","GTF Extraction FASTA","","box_biaogegeshi6_button","danger5")
  }) 

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi7 <- fluid_renderUI("box_biaogegeshi7","VCF extraction of SNPs","app33.png","VCF extraction of SNPs","","box_biaogegeshi7_button","danger5")
  }) 
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi8 <- fluid_renderUI("box_biaogegeshi8","Gene ID Conversion","app71.png","Gene ID Conversion","","box_biaogegeshi8_button","danger5")
  })
  
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi9 <- fluid_renderUI("box_biaogegeshi9","Table Extract","app72.png","Table Extract","","box_biaogegeshi9_button","danger5")
  })
  
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi10 <- fluid_renderUI("box_biaogegeshi10","Table transposition","app73.png","Table transposition","","box_biaogegeshi10_button","danger5")
  })
    
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi11 <- fluid_renderUI("box_biaogegeshi110","SAM Flag","app74.png","SAM Flag","","box_biaogegeshi11_button","danger5")
  })
  

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi12 <- fluid_renderUI("box_biaogegeshi12","Wide2Long","app89.png","Wide2Long","","box_biaogegeshi12_button","danger5")
  })

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi13 <- fluid_renderUI("box_biaogegeshi13","Long2wide","app90.png","Long2wide","","box_biaogegeshi13_button","danger5")
  }) 

  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi14 <- fluid_renderUI("box_biaogegeshi14","msconvert","app93.png","msconvert","","box_biaogegeshi14_button","danger5")
  }) 
  
  observeEvent(input$biaogegeshi, {  
output$box_biaogegeshi15 <- fluid_renderUI("box_biaogegeshi15","xcms","app94.png","xcms","","box_biaogegeshi15_button","danger5")
  })  
  
  observeEvent(input$xuliechuli, {  
output$box_xuliechuli1 <- fluid_renderUI("box_xuliechuli1","Sequence one row","app3.png","Sequence one row","","box_xuliechuli1_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli2 <- fluid_renderUI("box_xuliechuli2","Sequence formatting","app10.png","Sequence formatting","","box_xuliechuli2_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli3 <- fluid_renderUI("box_xuliechuli3","CDS to protein","app11.png","CDS to protein","","box_xuliechuli3_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli4 <- fluid_renderUI("box_xuliechuli4","Sequence length filter","app12.png","Sequence length filter","","box_xuliechuli4_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli5 <- fluid_renderUI("box_xuliechuli5","Sequence interception","app14.png","Sequence interception","","box_xuliechuli5_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli6 <- fluid_renderUI("box_xuliechuli6","Sequence reverse complementarity","app17.png","Sequence reverse complementarity","","box_xuliechuli6_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli7 <- fluid_renderUI("box_xuliechuli7","FASTQ QC (single-end)","app20.png","FASTQ QC (single-end)","","box_xuliechuli7_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli8 <- fluid_renderUI("box_xuliechuli8","FASTQ QC (pair-end)","app21.png","FASTQ QC (pair-end)","","box_xuliechuli8_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli9 <- fluid_renderUI("box_xuliechuli9","Sequence name simple","app25.png","Sequence name simple","","box_xuliechuli9_button","danger6")
  })

      observeEvent(input$xuliechuli, {  
output$box_xuliechuli10 <- fluid_renderUI("box_xuliechuli10","Longest Transcript","app26.png","Longest Transcript","","box_xuliechuli10_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli11 <- fluid_renderUI("box_xuliechuli11","MUSCLE","app77.png","MUSCLE","","box_xuliechuli11_button","danger6")
  })

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli12 <- fluid_renderUI("box_xuliechuli12","DNA&RNA ","app78.png","DNA&RNA","","box_xuliechuli12_button","danger6")
  })  

    observeEvent(input$xuliechuli, {  
output$box_xuliechuli13 <- fluid_renderUI("box_xuliechuli13","Blast","app95.png","Blast","","box_xuliechuli13_button","danger6")
  })  
 
  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan1 <- fluid_renderUI("box_tongjijianyan1","Statistical GC content","app7.png","Statistical GC content","","box_tongjijianyan1_button","danger7")
  })

  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan2 <- fluid_renderUI("box_tongjijianyan2","Statistical sequence length","app8.png","Statistical sequence length","","box_tongjijianyan2_button","danger7")
  })

  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan3 <- fluid_renderUI("box_tongjijianyan3","Statistical N-value","app13.png","Statistical N-value","","box_tongjijianyan3_button","danger7")
  })

  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan4 <- fluid_renderUI("box_tongjijianyan4","Statistical FASTQ file","app18.png","Statistical FASTQ file","","box_tongjijianyan4_button","danger7")
  })
  
  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan5 <- fluid_renderUI("box_tongjijianyan5","DEseq2","app68.png","DEseq2","","box_tongjijianyan5_button","danger7")
  })  
  
  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan6 <- fluid_renderUI("box_tongjijianyan6","DEseq_no_replicate","app69.png","DEseq_no_replicate","","box_tongjijianyan6_button","danger7")
  })  
  
  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan7 <- fluid_renderUI("box_tongjijianyan7","DEseq","app70.png","DEseq","","box_tongjijianyan7_button","danger7")
  })  

    observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan8 <- fluid_renderUI("box_tongjijianyan8","MetNorm","app75.png","MetNorm","","box_tongjijianyan8_button","danger7")
  }) 

  observeEvent(input$tongjijianyan, {  
output$box_tongjijianyan9 <- fluid_renderUI("box_tongjijianyan9","MetCleaning","app76.png","MetCleaning","","box_tongjijianyan9_button","danger7")
  }) 
  
  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi1 <- fluid_renderUI("box_gongnengzhushi1","MetAnno","app97.png","MetAnno","","box_gongnengzhushi1_button","danger8")
  })
  
  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi2 <- fluid_renderUI("box_gongnengzhushi2","msconvert","app98.png","msconvert","","box_gongnengzhushi2_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi3 <- fluid_renderUI("box_gongnengzhushi3","xcms","app99.png","xcms","","box_gongnengzhushi3_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi4 <- fluid_renderUI("box_gongnengzhushi4","MetCleaning","app100.png","MetCleaning","","box_gongnengzhushi4_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi5 <- fluid_renderUI("box_gongnengzhushi5","MetNorm","app101.png","MetNorm","","box_gongnengzhushi5_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi6 <- fluid_renderUI("box_gongnengzhushi6","MetDiff","app102.png","MetDiff","","box_gongnengzhushi6_button","danger8")
  })
  
  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi7 <- fluid_renderUI("box_gongnengzhushi7","MetOpls","app103.png","MetOpls","","box_gongnengzhushi7_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi8 <- fluid_renderUI("box_gongnengzhushi8","MetPathway","app104.png","MetPathway","","box_gongnengzhushi8_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi9 <- fluid_renderUI("box_gongnengzhushi9","MS1plot","app105.png","MS1plot","","box_gongnengzhushi9_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi10 <- fluid_renderUI("box_gongnengzhushi10","MS2plot","app106.png","MS2plot","","box_gongnengzhushi10_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi11 <- fluid_renderUI("box_gongnengzhushi11","Heatmap","app107.png","Heatmap","","box_gongnengzhushi11_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi12 <- fluid_renderUI("box_gongnengzhushi12","VennDiagram","app108.png","VennDiagram","","box_gongnengzhushi12_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi13 <- fluid_renderUI("box_gongnengzhushi13","VolcanoPlot","app109.png","VolcanoPlot","","box_gongnengzhushi13_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi14 <- fluid_renderUI("box_gongnengzhushi14","PCAplot","app110.png","PCAplot","","box_gongnengzhushi14_button","danger8")
  })
  
  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi15 <- fluid_renderUI("box_gongnengzhushi15","ClusterPlot","app111.png","ClusterPlot","","box_gongnengzhushi15_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi16 <- fluid_renderUI("box_gongnengzhushi16","TTest","app112.png","TTest","","box_gongnengzhushi16_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi17 <- fluid_renderUI("box_gongnengzhushi17","WilcoxonTest","app113.png","WilcoxonTest","","box_gongnengzhushi17_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi18 <- fluid_renderUI("box_gongnengzhushi18","ChisqTest","app114.png","ChisqTest","","box_gongnengzhushi18_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi19 <- fluid_renderUI("box_gongnengzhushi19","Fisher'sTest","app115.png","Fisher'sTest","","box_gongnengzhushi19_button","danger8")
  })
  
  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi20 <- fluid_renderUI("box_gongnengzhushi20","MultiGroupTest","app116.png","MultiGroupTest","","box_gongnengzhushi20_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi21 <- fluid_renderUI("box_gongnengzhushi21","BarPlot","app117.png","BarPlot","","box_gongnengzhushi21_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi22 <- fluid_renderUI("box_gongnengzhushi22","LinePlot","app118.png","LinePlot","","box_gongnengzhushi22_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi23 <- fluid_renderUI("box_gongnengzhushi23","PiePlot","app119.png","PiePlot","","box_gongnengzhushi23_button","danger8")
  })

  observeEvent(input$gongnengzhushi, {  
output$box_gongnengzhushi24 <- fluid_renderUI("box_gongnengzhushi24","BoxPlot","app120.png","BoxPlot","","box_gongnengzhushi24_button","danger8")
  })




    observeEvent(input$zuxuefenxi, {  
output$box_zuxuefenxi3 <- fluid_renderUI("box_zuxuefenxi3","Genome Analysis","appgenome.png","Genome Analysis","","box_zuxuefenxi3_button","danger10")
  })

    observeEvent(input$zuxuefenxi, {  
output$box_zuxuefenxi2 <- fluid_renderUI("box_zuxuefenxi2","Transcriptome analysis","apptranscriptome.png","Transcriptome analysis","","box_zuxuefenxi2_button","danger10")
  })

    observeEvent(input$zuxuefenxi, {  
output$box_zuxuefenxi4 <- fluid_renderUI("box_zuxuefenxi4","Proteome Analysis","appproteome.png","Proteome Analysis","","box_zuxuefenxi4_button","danger10")
  })

    observeEvent(input$zuxuefenxi, {  
output$box_zuxuefenxi1 <- fluid_renderUI("box_zuxuefenxi1","Metabolome Analysis","appmetabolome.png","Metabolome Analysis","","box_zuxuefenxi1_button","danger10")
  })  
observeEvent(input$send_button, {  
	appServer(input,output)
})




  
# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_huitugongju1_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app1/ui.R')
    source('apps/app1/server.R')
    source('apps/app1/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  
# UI - app2-表格格式-两表格合并---------------------------------
  observeEvent(input$box_biaogegeshi1_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app2/ui.R')
    source('apps/app2/server.R')
    source('apps/app2/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app3-序列处理-序列变为一行---------------------------------
  observeEvent(input$box_xuliechuli1_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app3/ui.R')
    source('apps/app3/server.R')
    source('apps/app3/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_huitugongju2_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app4/ui.R')
    source('apps/app4/server.R')
    source('apps/app4/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_huitugongju3_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app5/ui.R')
    source('apps/app5/server.R')
    source('apps/app5/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_huitugongju4_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app6/ui.R')
    source('apps/app6/server.R')
    source('apps/app6/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app7-绘图工具-统计GC含量-----------------------------------
  observeEvent(input$box_tongjijianyan1_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app7/ui.R')
    source('apps/app7/server.R')
    source('apps/app7/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app8-绘图工具-统计序列长度-----------------------------------
  observeEvent(input$box_tongjijianyan2_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app8/ui.R')
    source('apps/app8/server.R')
    source('apps/app8/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app9-表格格式-GTF提取信息---------------------------------
  observeEvent(input$box_biaogegeshi2_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app9/ui.R')
    source('apps/app9/server.R')
    source('apps/app9/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app10-序列处理-序列格式化---------------------------------
  observeEvent(input$box_xuliechuli2_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app10/ui.R')
    source('apps/app10/server.R')
    source('apps/app10/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app11-序列处理-CDS转蛋白---------------------------------
  observeEvent(input$box_xuliechuli3_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app11/ui.R')
    source('apps/app11/server.R')
    source('apps/app11/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
 

# UI - app12-序列处理-序列长度过滤---------------------------------
  observeEvent(input$box_xuliechuli4_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app12/ui.R')
    source('apps/app12/server.R')
    source('apps/app12/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app13-统计检验-统计N值-----------------------------------
  observeEvent(input$box_tongjijianyan3_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app13/ui.R')
    source('apps/app13/server.R')
    source('apps/app13/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app14-序列处理-序列截取---------------------------------
  observeEvent(input$box_xuliechuli5_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app14/ui.R')
    source('apps/app14/server.R')
    source('apps/app14/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_huitugongju5_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app15/ui.R')
    source('apps/app15/server.R')
    source('apps/app15/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app16-表格格式-SVG转换---------------------------------
  observeEvent(input$box_biaogegeshi3_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app16/ui.R')
    source('apps/app16/server.R')
    source('apps/app16/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app17-序列处理-序列反向互补---------------------------------
  observeEvent(input$box_xuliechuli6_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app17/ui.R')
    source('apps/app17/server.R')
    source('apps/app17/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
 # UI - app18-统计检验-统计FASTQ文件-----------------------------------
  observeEvent(input$box_tongjijianyan4_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app18/ui.R')
    source('apps/app18/server.R')
    source('apps/app18/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

 # UI - app19-绘图工具-碱基分布图-----------------------------------
  observeEvent(input$box_huitugongju6_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app19/ui.R')
    source('apps/app19/server.R')
    source('apps/app19/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app20-序列处理-FASTQ质控(单端)---------------------------------
  observeEvent(input$box_xuliechuli7_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app20/ui.R')
    source('apps/app20/server.R')
    source('apps/app20/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })      

# UI - app21-序列处理-FASTQ质控(双端)---------------------------------
  observeEvent(input$box_xuliechuli8_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app21/ui.R')
    source('apps/app21/server.R')
    source('apps/app21/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app22-表格格式-GFF3转GTF---------------------------------
  observeEvent(input$box_biaogegeshi4_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app22/ui.R')
    source('apps/app22/server.R')
    source('apps/app22/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app23-表格格式-DICT文件构建---------------------------------
  observeEvent(input$box_biaogegeshi5_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app23/ui.R')
    source('apps/app23/server.R')
    source('apps/app23/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
 
# UI - app24-表格格式-GTF提取FASTA---------------------------------
  observeEvent(input$box_biaogegeshi6_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app24/ui.R')
    source('apps/app24/server.R')
    source('apps/app24/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app25-序列处理-序列名称简化---------------------------------
  observeEvent(input$box_xuliechuli9_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app25/ui.R')
    source('apps/app25/server.R')
    source('apps/app25/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app26-序列处理-最长转录本提取---------------------------------
  observeEvent(input$box_xuliechuli10_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app26/ui.R')
    source('apps/app26/server.R')
    source('apps/app26/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  



 # UI - app33-表格格式-VCF提取SNP---------------------------------
  observeEvent(input$box_biaogegeshi7_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app33/ui.R')
    source('apps/app33/server.R')
    source('apps/app33/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_huitugongju7_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app34/ui.R')
    source('apps/app34/server.R')
    source('apps/app34/result.R')
	source('apps/app34/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_huitugongju8_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app35/ui.R')
    source('apps/app35/server.R')
    source('apps/app35/result.R')
	source('apps/app35/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  



# UI - app37-绘图工具-动态序列比对图---------------------------------------
  observeEvent(input$box_huitugongju9_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app37/ui.R')
    source('apps/app37/server.R')
    source('apps/app37/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
})
observeEvent(input$box_huitugongju9_button, {  
	appServer(input,output)
})

# UI - app38-绘图工具-散点图---------------------------------------
  observeEvent(input$box_huitugongju10_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app38/ui.R')
    source('apps/app38/server.R')
    source('apps/app38/result.R')
	source('apps/app38/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_huitugongju11_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app39/ui.R')
    source('apps/app39/server.R')
    source('apps/app39/result.R')
	source('apps/app39/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app40-绘图工具-直方图---------------------------------------
  observeEvent(input$box_huitugongju12_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app40/ui.R')
    source('apps/app40/server.R')
    source('apps/app40/result.R')
	source('apps/app40/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_huitugongju13_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app41/ui.R')
    source('apps/app41/server.R')
    source('apps/app41/result.R')
	source('apps/app41/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app42-绘图工具-小提琴图---------------------------------------
  observeEvent(input$box_huitugongju14_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app42/ui.R')
    source('apps/app42/server.R')
    source('apps/app42/result.R')
	source('apps/app42/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app43-绘图工具-气泡图---------------------------------------
  observeEvent(input$box_huitugongju15_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app43/ui.R')
    source('apps/app43/server.R')
    source('apps/app43/result.R')
	source('apps/app43/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app44-绘图工具-相关性图---------------------------------------
  observeEvent(input$box_huitugongju16_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app44/ui.R')
    source('apps/app44/server.R')
    source('apps/app44/result.R')
	source('apps/app44/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app45-绘图工具-UpSet图---------------------------------------
  observeEvent(input$box_huitugongju17_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app45/ui.R')
    source('apps/app45/server.R')
    source('apps/app45/result.R')
	source('apps/app45/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app46-绘图工具-密度图---------------------------------------
  observeEvent(input$box_huitugongju18_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app46/ui.R')
    source('apps/app46/server.R')
    source('apps/app46/result.R')
	source('apps/app46/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app47-绘图工具-云雨图---------------------------------------
  observeEvent(input$box_huitugongju19_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app47/ui.R')
    source('apps/app47/server.R')
    source('apps/app47/result.R')
	source('apps/app47/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app48-绘图工具-豆荚图---------------------------------------
  observeEvent(input$box_huitugongju20_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app48/ui.R')
    source('apps/app48/server.R')
    source('apps/app48/result.R')
	source('apps/app48/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app49-绘图工具-点阵图---------------------------------------
  observeEvent(input$box_huitugongju21_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app49/ui.R')
    source('apps/app49/server.R')
    source('apps/app49/result.R')
	source('apps/app49/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app50-绘图工具-棒棒糖图---------------------------------------
  observeEvent(input$box_huitugongju22_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app50/ui.R')
    source('apps/app50/server.R')
    source('apps/app50/result.R')
	source('apps/app50/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app51-绘图工具-Cleveland图---------------------------------------
  observeEvent(input$box_huitugongju23_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app51/ui.R')
    source('apps/app51/server.R')
    source('apps/app51/result.R')
	source('apps/app51/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app52-绘图工具-分类柱状图---------------------------------------
  observeEvent(input$box_huitugongju24_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app52/ui.R')
    source('apps/app52/server.R')
    source('apps/app52/result.R')
	source('apps/app52/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app53-绘图工具-QQ图---------------------------------------
  observeEvent(input$box_huitugongju25_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app53/ui.R')
    source('apps/app53/server.R')
    source('apps/app53/result.R')
	source('apps/app53/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app54-绘图工具-偏差图---------------------------------------
  observeEvent(input$box_huitugongju26_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app54/ui.R')
    source('apps/app54/server.R')
    source('apps/app54/result.R')
	source('apps/app54/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app55-绘图工具-误差线图---------------------------------------
  observeEvent(input$box_huitugongju27_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app55/ui.R')
    source('apps/app55/server.R')
    source('apps/app55/result.R')
	source('apps/app55/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app56-绘图工具-带状图---------------------------------------
  observeEvent(input$box_huitugongju28_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app56/ui.R')
    source('apps/app56/server.R')
    source('apps/app56/result.R')
	source('apps/app56/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app57-绘图工具-甜甜圈图---------------------------------------
  observeEvent(input$box_huitugongju29_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app57/ui.R')
    source('apps/app57/server.R')
    source('apps/app57/result.R')
	source('apps/app57/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app58-绘图工具-相关性回归图---------------------------------------
  observeEvent(input$box_huitugongju30_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app58/ui.R')
    source('apps/app58/server.R')
    source('apps/app58/result.R')
	source('apps/app58/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app59-绘图工具-MA图---------------------------------------
  observeEvent(input$box_huitugongju31_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app59/ui.R')
    source('apps/app59/server.R')
    source('apps/app59/result.R')
	source('apps/app59/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app60-绘图工具-配对箱线图---------------------------------------
  observeEvent(input$box_huitugongju32_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app60/ui.R')
    source('apps/app60/server.R')
    source('apps/app60/result.R')
	source('apps/app60/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app61-绘图工具-绘制表格---------------------------------------
  observeEvent(input$box_huitugongju33_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app61/ui.R')
    source('apps/app61/server.R')
    source('apps/app61/result.R')
	source('apps/app61/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app62-绘图工具-边缘分布散点图---------------------------------------
  observeEvent(input$box_huitugongju34_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app62/ui.R')
    source('apps/app62/server.R')
    source('apps/app62/result.R')
	source('apps/app62/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app63-绘图工具-玫瑰图---------------------------------------
  observeEvent(input$box_huitugongju35_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app63/ui.R')
    source('apps/app63/server.R')
    source('apps/app63/result.R')
	source('apps/app63/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app64-绘图工具-蜂群图---------------------------------------
  observeEvent(input$box_huitugongju36_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app64/ui.R')
    source('apps/app64/server.R')
    source('apps/app64/result.R')
	source('apps/app64/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app65-绘图工具-Circos关系图---------------------------------------
  observeEvent(input$box_huitugongju37_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app65/ui.R')
    source('apps/app65/server.R')
    source('apps/app65/result.R')
	source('apps/app65/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
    # UI - app66-绘图工具-断轴条形图---------------------------------------
  observeEvent(input$box_huitugongju38_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app66/ui.R')
    source('apps/app66/server.R')
    source('apps/app66/result.R')
	source('apps/app66/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app67-绘图工具-Krona分级饼图---------------------------------------
  observeEvent(input$box_huitugongju39_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app67/ui.R')
    source('apps/app67/server.R')
    source('apps/app67/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app68-统计检验-DEseq2差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan5_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app68/ui.R')
    source('apps/app68/server.R')
    source('apps/app68/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
 # UI - app69-统计检验-DEseq无重复差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan6_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app69/ui.R')
    source('apps/app69/server.R')
    source('apps/app69/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app70-统计检验-DEseq差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan7_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app70/ui.R')
    source('apps/app70/server.R')
    source('apps/app70/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app71-表格格式-基因ID转换---------------------------------
  observeEvent(input$box_biaogegeshi8_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app71/ui.R')
    source('apps/app71/server.R')
    source('apps/app71/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

 # UI - app72-表格格式-表格信息提取---------------------------------
  observeEvent(input$box_biaogegeshi9_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app72/ui.R')
    source('apps/app72/server.R')
    source('apps/app72/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
  # UI - app73-表格格式-表格转置---------------------------------
  observeEvent(input$box_biaogegeshi10_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app73/ui.R')
    source('apps/app73/server.R')
    source('apps/app73/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  # UI - app74-表格格式-SAM Flag数值解读---------------------------------
  observeEvent(input$box_biaogegeshi11_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app74/ui.R')
    source('apps/app74/server.R')
    source('apps/app74/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_tongjijianyan8_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app75/ui.R')
    source('apps/app75/server.R')
    source('apps/app75/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_tongjijianyan9_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app76/ui.R')
    source('apps/app76/server.R')
    source('apps/app76/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
# UI - app77-序列处理-MUSCLE序列比对---------------------------------
  observeEvent(input$box_xuliechuli11_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app77/ui.R')
    source('apps/app77/server.R')
    source('apps/app77/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app78-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli12_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app78/ui.R')
    source('apps/app78/server.R')
    source('apps/app78/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app95-序列处理-局部序列比对---------------------------------
  observeEvent(input$box_xuliechuli13_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app95/ui.R')
    source('apps/app95/server.R')
    source('apps/app95/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
  # UI - app79-动态绘图-动态散点图---------------------------------
  observeEvent(input$box_dongtaihuitu1_button, {
	source('apps/app79/ui.R')
    source('apps/app79/server.R')
    source('apps/app79/result.R')
    source('apps/app79/plot.R')	  
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	output$box_input <- appUI()
	output$box_info <-appResult()	
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app80-绘图工具-转录-蛋白九象限图---------------------------------------
  observeEvent(input$box_huitugongju40_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app80/ui.R')
    source('apps/app80/server.R')
    source('apps/app80/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app81-绘图工具-转录-代谢九象限图---------------------------------------
  observeEvent(input$box_huitugongju41_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app81/ui.R')
    source('apps/app81/server.R')
    source('apps/app81/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app82-桑基图---------------------------------------
  observeEvent(input$box_huitugongju42_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app82/ui.R')
    source('apps/app82/server.R')
    source('apps/app82/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
# UI - app83-三元图---------------------------------------
  observeEvent(input$box_huitugongju43_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app83/ui.R')
    source('apps/app83/server.R')
    source('apps/app83/result.R')
	#source('apps/app83/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })  

# UI - app84-面积图---------------------------------------
  observeEvent(input$box_huitugongju44_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app84/ui.R')
    source('apps/app84/server.R')
    source('apps/app84/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app85-雷达图---------------------------------------
  observeEvent(input$box_huitugongju45_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app85/ui.R')
    source('apps/app85/server.R')
    source('apps/app85/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app86-3D散点图---------------------------------------
  observeEvent(input$box_huitugongju46_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app86/ui.R')
    source('apps/app86/server.R')
    source('apps/app86/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_huitugongju47_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app87/ui.R')
    source('apps/app87/server.R')
    source('apps/app87/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app88-累积分布曲线---------------------------------------
  observeEvent(input$box_huitugongju48_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app88/ui.R')
    source('apps/app88/server.R')
    source('apps/app88/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app96-最大似然法建树---------------------------------------
observeEvent(input$box_huitugongju9_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app96/ui.R')
    source('apps/app96/server.R')
    source('apps/app96/result.R')
	#source('apps/app96/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  }) 
  
  # UI - app89-表格格式-宽表格转长---------------------------------
  observeEvent(input$box_biaogegeshi12_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app89/ui.R')
    source('apps/app89/server.R')
    source('apps/app89/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

  # UI - app90-表格格式-长表格转宽---------------------------------
  observeEvent(input$box_biaogegeshi13_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app90/ui.R')
    source('apps/app90/server.R')
    source('apps/app90/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app91-瀑布图---------------------------------------
  observeEvent(input$box_huitugongju49_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app91/ui.R')
    source('apps/app91/server.R')
    source('apps/app91/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app92-Ms2Plot---------------------------------------
observeEvent(input$box_huitugongju50_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app92/ui.R')
    source('apps/app92/server.R')
    source('apps/app92/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_biaogegeshi14_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app93/ui.R')
    source('apps/app93/server.R')
    source('apps/app93/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_biaogegeshi15_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app94/ui.R')
    source('apps/app94/server.R')
    source('apps/app94/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_huitugongju1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app1/ui.R')
    source('apps/app1/server.R')
    source('apps/app1/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  
# UI - app2-表格格式-两表格合并---------------------------------
  observeEvent(input$box_biaogegeshi1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app2/ui.R')
    source('apps/app2/server.R')
    source('apps/app2/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app3-序列处理-序列变为一行---------------------------------
  observeEvent(input$box_xuliechuli1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app3/ui.R')
    source('apps/app3/server.R')
    source('apps/app3/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_huitugongju2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app4/ui.R')
    source('apps/app4/server.R')
    source('apps/app4/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_huitugongju3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app5/ui.R')
    source('apps/app5/server.R')
    source('apps/app5/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_huitugongju4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app6/ui.R')
    source('apps/app6/server.R')
    source('apps/app6/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app7-绘图工具-统计GC含量-----------------------------------
  observeEvent(input$box_tongjijianyan1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app7/ui.R')
    source('apps/app7/server.R')
    source('apps/app7/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app8-绘图工具-统计序列长度-----------------------------------
  observeEvent(input$box_tongjijianyan2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app8/ui.R')
    source('apps/app8/server.R')
    source('apps/app8/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app9-表格格式-GTF提取信息---------------------------------
  observeEvent(input$box_biaogegeshi2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app9/ui.R')
    source('apps/app9/server.R')
    source('apps/app9/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app10-序列处理-序列格式化---------------------------------
  observeEvent(input$box_xuliechuli2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app10/ui.R')
    source('apps/app10/server.R')
    source('apps/app10/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app11-序列处理-CDS转蛋白---------------------------------
  observeEvent(input$box_xuliechuli3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app11/ui.R')
    source('apps/app11/server.R')
    source('apps/app11/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
 

# UI - app12-序列处理-序列长度过滤---------------------------------
  observeEvent(input$box_xuliechuli4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app12/ui.R')
    source('apps/app12/server.R')
    source('apps/app12/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app13-统计检验-统计N值-----------------------------------
  observeEvent(input$box_tongjijianyan3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app13/ui.R')
    source('apps/app13/server.R')
    source('apps/app13/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app14-序列处理-序列截取---------------------------------
  observeEvent(input$box_xuliechuli5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app14/ui.R')
    source('apps/app14/server.R')
    source('apps/app14/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_huitugongju5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app15/ui.R')
    source('apps/app15/server.R')
    source('apps/app15/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app16-表格格式-SVG转换---------------------------------
  observeEvent(input$box_biaogegeshi3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app16/ui.R')
    source('apps/app16/server.R')
    source('apps/app16/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app17-序列处理-序列反向互补---------------------------------
  observeEvent(input$box_xuliechuli6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app17/ui.R')
    source('apps/app17/server.R')
    source('apps/app17/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
 # UI - app18-统计检验-统计FASTQ文件-----------------------------------
  observeEvent(input$box_tongjijianyan4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app18/ui.R')
    source('apps/app18/server.R')
    source('apps/app18/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

 # UI - app19-绘图工具-碱基分布图-----------------------------------
  observeEvent(input$box_huitugongju6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app19/ui.R')
    source('apps/app19/server.R')
    source('apps/app19/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app20-序列处理-FASTQ质控(单端)---------------------------------
  observeEvent(input$box_xuliechuli7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app20/ui.R')
    source('apps/app20/server.R')
    source('apps/app20/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })      

# UI - app21-序列处理-FASTQ质控(双端)---------------------------------
  observeEvent(input$box_xuliechuli8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app21/ui.R')
    source('apps/app21/server.R')
    source('apps/app21/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app22-表格格式-GFF3转GTF---------------------------------
  observeEvent(input$box_biaogegeshi4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app22/ui.R')
    source('apps/app22/server.R')
    source('apps/app22/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app23-表格格式-DICT文件构建---------------------------------
  observeEvent(input$box_biaogegeshi5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app23/ui.R')
    source('apps/app23/server.R')
    source('apps/app23/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
 
# UI - app24-表格格式-GTF提取FASTA---------------------------------
  observeEvent(input$box_biaogegeshi6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app24/ui.R')
    source('apps/app24/server.R')
    source('apps/app24/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app25-序列处理-序列名称简化---------------------------------
  observeEvent(input$box_xuliechuli9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app25/ui.R')
    source('apps/app25/server.R')
    source('apps/app25/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app26-序列处理-最长转录本提取---------------------------------
  observeEvent(input$box_xuliechuli10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app26/ui.R')
    source('apps/app26/server.R')
    source('apps/app26/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  


 
 # UI - app33-表格格式-VCF提取SNP---------------------------------
  observeEvent(input$box_biaogegeshi7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app33/ui.R')
    source('apps/app33/server.R')
    source('apps/app33/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_huitugongju7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app34/ui.R')
    source('apps/app34/server.R')
    source('apps/app34/result.R')
	source('apps/app34/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_huitugongju8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app35/ui.R')
    source('apps/app35/server.R')
    source('apps/app35/result.R')
	source('apps/app35/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  


# UI - app37-绘图工具-动态序列比对图---------------------------------------
  observeEvent(input$box_huitugongju9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app37/ui.R')
    source('apps/app37/server.R')
    source('apps/app37/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
observeEvent(input$box_huitugongju9_button2, {  
	appServer(input,output)
})

# UI - app38-绘图工具-散点图---------------------------------------
  observeEvent(input$box_huitugongju10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app38/ui.R')
    source('apps/app38/server.R')
    source('apps/app38/result.R')
	source('apps/app38/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_huitugongju11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app39/ui.R')
    source('apps/app39/server.R')
    source('apps/app39/result.R')
	source('apps/app39/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
  # UI - app40-绘图工具-直方图---------------------------------------
  observeEvent(input$box_huitugongju12_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app40/ui.R')
    source('apps/app40/server.R')
    source('apps/app40/result.R')
	source('apps/app40/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_huitugongju13_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app41/ui.R')
    source('apps/app41/server.R')
    source('apps/app41/result.R')
	source('apps/app41/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app42-绘图工具-小提琴图---------------------------------------
  observeEvent(input$box_huitugongju14_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app42/ui.R')
    source('apps/app42/server.R')
    source('apps/app42/result.R')
	source('apps/app42/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app43-绘图工具-气泡图---------------------------------------
  observeEvent(input$box_huitugongju15_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app43/ui.R')
    source('apps/app43/server.R')
    source('apps/app43/result.R')
	source('apps/app43/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app44-绘图工具-相关性图---------------------------------------
  observeEvent(input$box_huitugongju16_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app44/ui.R')
    source('apps/app44/server.R')
    source('apps/app44/result.R')
	source('apps/app44/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app45-绘图工具-UpSet图---------------------------------------
  observeEvent(input$box_huitugongju17_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app45/ui.R')
    source('apps/app45/server.R')
    source('apps/app45/result.R')
	source('apps/app45/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app46-绘图工具-密度图---------------------------------------
  observeEvent(input$box_huitugongju18_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app46/ui.R')
    source('apps/app46/server.R')
    source('apps/app46/result.R')
	source('apps/app46/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app47-绘图工具-云雨图---------------------------------------
  observeEvent(input$box_huitugongju19_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app47/ui.R')
    source('apps/app47/server.R')
    source('apps/app47/result.R')
	source('apps/app47/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app48-绘图工具-豆荚图---------------------------------------
  observeEvent(input$box_huitugongju20_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app48/ui.R')
    source('apps/app48/server.R')
    source('apps/app48/result.R')
	source('apps/app48/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app49-绘图工具-点阵图---------------------------------------
  observeEvent(input$box_huitugongju21_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app49/ui.R')
    source('apps/app49/server.R')
    source('apps/app49/result.R')
	source('apps/app49/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app50-绘图工具-棒棒糖图---------------------------------------
  observeEvent(input$box_huitugongju22_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app50/ui.R')
    source('apps/app50/server.R')
    source('apps/app50/result.R')
	source('apps/app50/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app51-绘图工具-Cleveland图---------------------------------------
  observeEvent(input$box_huitugongju23_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app51/ui.R')
    source('apps/app51/server.R')
    source('apps/app51/result.R')
	source('apps/app51/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app52-绘图工具-分类柱状图---------------------------------------
  observeEvent(input$box_huitugongju24_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app52/ui.R')
    source('apps/app52/server.R')
    source('apps/app52/result.R')
	source('apps/app52/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
    # UI - app53-绘图工具-QQ图---------------------------------------
  observeEvent(input$box_huitugongju25_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app53/ui.R')
    source('apps/app53/server.R')
    source('apps/app53/result.R')
	source('apps/app53/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app54-绘图工具-偏差图---------------------------------------
  observeEvent(input$box_huitugongju26_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app54/ui.R')
    source('apps/app54/server.R')
    source('apps/app54/result.R')
	source('apps/app54/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app55-绘图工具-误差线图---------------------------------------
  observeEvent(input$box_huitugongju27_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app55/ui.R')
    source('apps/app55/server.R')
    source('apps/app55/result.R')
	source('apps/app55/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app56-绘图工具-带状图---------------------------------------
  observeEvent(input$box_huitugongju28_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app56/ui.R')
    source('apps/app56/server.R')
    source('apps/app56/result.R')
	source('apps/app56/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app57-绘图工具-甜甜圈图---------------------------------------
  observeEvent(input$box_huitugongju29_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app57/ui.R')
    source('apps/app57/server.R')
    source('apps/app57/result.R')
	source('apps/app57/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app58-绘图工具-相关性回归图---------------------------------------
  observeEvent(input$box_huitugongju30_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app58/ui.R')
    source('apps/app58/server.R')
    source('apps/app58/result.R')
	source('apps/app58/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app59-绘图工具-MA图---------------------------------------
  observeEvent(input$box_huitugongju31_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app59/ui.R')
    source('apps/app59/server.R')
    source('apps/app59/result.R')
	source('apps/app59/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app60-绘图工具-配对箱线图---------------------------------------
  observeEvent(input$box_huitugongju32_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app60/ui.R')
    source('apps/app60/server.R')
    source('apps/app60/result.R')
	source('apps/app60/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app61-绘图工具-绘制表格---------------------------------------
  observeEvent(input$box_huitugongju33_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app61/ui.R')
    source('apps/app61/server.R')
    source('apps/app61/result.R')
	source('apps/app61/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app62-绘图工具-边缘分布散点图---------------------------------------
  observeEvent(input$box_huitugongju34_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app62/ui.R')
    source('apps/app62/server.R')
    source('apps/app62/result.R')
	source('apps/app62/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app63-绘图工具-玫瑰图---------------------------------------
  observeEvent(input$box_huitugongju35_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app63/ui.R')
    source('apps/app63/server.R')
    source('apps/app63/result.R')
	source('apps/app63/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app64-绘图工具-蜂群图---------------------------------------
  observeEvent(input$box_huitugongju36_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app64/ui.R')
    source('apps/app64/server.R')
    source('apps/app64/result.R')
	source('apps/app64/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app65-绘图工具-Circos关系图---------------------------------------
  observeEvent(input$box_huitugongju37_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app65/ui.R')
    source('apps/app65/server.R')
    source('apps/app65/result.R')
	source('apps/app65/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app66-绘图工具-断轴条形图---------------------------------------
  observeEvent(input$box_huitugongju38_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app66/ui.R')
    source('apps/app66/server.R')
    source('apps/app66/result.R')
	source('apps/app66/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app67-绘图工具-Krona分级饼图---------------------------------------
  observeEvent(input$box_huitugongju39_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app67/ui.R')
    source('apps/app67/server.R')
    source('apps/app67/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app68-统计检验-DEseq2差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app68/ui.R')
    source('apps/app68/server.R')
    source('apps/app68/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app69-统计检验-DEseq无重复差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app69/ui.R')
    source('apps/app69/server.R')
    source('apps/app69/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app70-统计检验-DEseq差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app70/ui.R')
    source('apps/app70/server.R')
    source('apps/app70/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

 # UI - app71-表格格式-基因ID转换---------------------------------
  observeEvent(input$box_biaogegeshi8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app71/ui.R')
    source('apps/app71/server.R')
    source('apps/app71/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
observeEvent(input$app71_select1, {
        appServer(input,output,session)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")
}) 

# UI - app72-表格格式-表格信息提取--------------------------------------------------------------------
  observeEvent(input$box_biaogegeshi9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app72/ui.R')
    source('apps/app72/server.R')
    source('apps/app72/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  # UI - app73-表格格式-表格转置---------------------------------
  observeEvent(input$box_biaogegeshi10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app73/ui.R')
    source('apps/app73/server.R')
    source('apps/app73/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  # UI - app74-表格格式-SAM Flag数值解读---------------------------------
  observeEvent(input$box_biaogegeshi11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app74/ui.R')
    source('apps/app74/server.R')
    source('apps/app74/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_tongjijianyan8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app75/ui.R')
    source('apps/app75/server.R')
    source('apps/app75/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

observeEvent(input$app75_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})
	

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_tongjijianyan9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app76/ui.R')
    source('apps/app76/server.R')
    source('apps/app76/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

  observeEvent(input$app76_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})

  observeEvent(input$app76_select2, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

}) 
 
# UI - app77-序列处理-MUSCLE序列比对---------------------------------
  observeEvent(input$box_xuliechuli11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app77/ui.R')
    source('apps/app77/server.R')
    source('apps/app77/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app78-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli12_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app78/ui.R')
    source('apps/app78/server.R')
    source('apps/app78/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
  # UI - app79-动态绘图-动态散点图---------------------------------
  observeEvent(input$box_dongtaihuitu1_button2, {
	source('apps/app79/ui.R')
    source('apps/app79/server.R')
    source('apps/app79/result.R')
    source('apps/app79/plot.R')	  
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	output$box_input <- appUI()
	output$box_info <-appResult()	
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app80-绘图工具-转录-蛋白九象限图---------------------------------------
  observeEvent(input$box_huitugongju40_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app80/ui.R')
    source('apps/app80/server.R')
    source('apps/app80/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app81-绘图工具-转录-代谢九象限图---------------------------------------
  observeEvent(input$box_huitugongju41_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app81/ui.R')
    source('apps/app81/server.R')
    source('apps/app81/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app82-桑基图---------------------------------------
  observeEvent(input$box_huitugongju42_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app82/ui.R')
    source('apps/app82/server.R')
    source('apps/app82/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app83-三元图---------------------------------------
  observeEvent(input$box_huitugongju43_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app83/ui.R')
    source('apps/app83/server.R')
    source('apps/app83/result.R')
	#source('apps/app83/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app83_select1, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

# UI - app84-面积图---------------------------------------
  observeEvent(input$box_huitugongju44_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app84/ui.R')
    source('apps/app84/server.R')
    source('apps/app84/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app85-雷达图---------------------------------------
  observeEvent(input$box_huitugongju45_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app85/ui.R')
    source('apps/app85/server.R')
    source('apps/app85/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app86-3D散点图---------------------------------------
  observeEvent(input$box_huitugongju46_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app86/ui.R')
    source('apps/app86/server.R')
    source('apps/app86/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_huitugongju47_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app105/ui.R')
    source('apps/app105/server.R')
    source('apps/app105/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app88-累积分布曲线---------------------------------------
  observeEvent(input$box_huitugongju48_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app88/ui.R')
    source('apps/app88/server.R')
    source('apps/app88/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
  # UI - app89-表格格式-宽表格转长---------------------------------
  observeEvent(input$box_biaogegeshi12_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app89/ui.R')
    source('apps/app89/server.R')
    source('apps/app89/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app90-表格格式-长表格转宽---------------------------------
  observeEvent(input$box_biaogegeshi13_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app90/ui.R')
    source('apps/app90/server.R')
    source('apps/app90/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app91-瀑布图---------------------------------------
  observeEvent(input$box_huitugongju49_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app91/ui.R')
    source('apps/app91/server.R')
    source('apps/app91/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app92-Ms2Plot---------------------------------------
  observeEvent(input$box_huitugongju50_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app92/ui.R')
    source('apps/app92/server.R')
    source('apps/app92/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app92_select1, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_biaogegeshi14_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app93/ui.R')
    source('apps/app93/server.R')
    source('apps/app93/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_biaogegeshi15_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app94/ui.R')
    source('apps/app94/server.R')
    source('apps/app94/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app95-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli13_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app95/ui.R')
    source('apps/app95/server.R')
    source('apps/app95/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app96-最大似然法建树---------------------------------------
  observeEvent(input$box_huitugongju9_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app96/ui.R')
    source('apps/app96/server.R')
    source('apps/app96/result.R')
	#source('apps/app96/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app96_select2, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_gongnengzhushi2_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app98/ui.R')
    source('apps/app98/server.R')
    source('apps/app98/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_gongnengzhushi3_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app99/ui.R')
    source('apps/app99/server.R')
    source('apps/app99/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_gongnengzhushi4_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app100/ui.R')
    source('apps/app100/server.R')
    source('apps/app100/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

    observeEvent(input$app100_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})

  observeEvent(input$app100_select2, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

}) 

# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_gongnengzhushi5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app101/ui.R')
    source('apps/app101/server.R')
    source('apps/app101/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

observeEvent(input$app101_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})


# UI - app111-统计检验-方差分析（单因素）-----------------------------------
  observeEvent(input$box_gongnengzhushi6_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app102/ui.R')
    source('apps/app102/server.R')
    source('apps/app102/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
# UI - app116-OPLS-DA---------------------------------------
  observeEvent(input$box_gongnengzhushi7_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app103/ui.R')
    source('apps/app103/server.R')
    source('apps/app103/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app92-Ms2Plot---------------------------------------
observeEvent(input$box_gongnengzhushi10_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app106/ui.R')
    source('apps/app106/server.R')
    source('apps/app106/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })  
  
  
# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_gongnengzhushi11_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app107/ui.R')
    source('apps/app107/server.R')
    source('apps/app107/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_gongnengzhushi12_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app108/ui.R')
    source('apps/app108/server.R')
    source('apps/app108/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_gongnengzhushi13_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app109/ui.R')
    source('apps/app109/server.R')
    source('apps/app109/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_gongnengzhushi14_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app110/ui.R')
    source('apps/app110/server.R')
    source('apps/app110/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_gongnengzhushi15_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app111/ui.R')
    source('apps/app111/server.R')
    source('apps/app111/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app97-统计检验-T检验-----------------------------------
  observeEvent(input$box_gongnengzhushi16_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app112/ui.R')
    source('apps/app112/server.R')
    source('apps/app112/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app101-统计检验-秩和检验-----------------------------------
  observeEvent(input$box_gongnengzhushi17_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app113/ui.R')
    source('apps/app113/server.R')
    source('apps/app113/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app102-统计检验-卡方检验-----------------------------------
  observeEvent(input$box_gongnengzhushi18_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app114/ui.R')
    source('apps/app114/server.R')
    source('apps/app114/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app103-统计检验-Fisher's检验-----------------------------------
  observeEvent(input$box_gongnengzhushi19_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app115/ui.R')
    source('apps/app115/server.R')
    source('apps/app115/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app105-统计检验-多组检验-----------------------------------
  observeEvent(input$box_gongnengzhushi20_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app116/ui.R')
    source('apps/app116/server.R')
    source('apps/app116/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_gongnengzhushi21_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app117/ui.R')
    source('apps/app117/server.R')
    source('apps/app117/result.R')
	source('apps/app117/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_gongnengzhushi22_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app118/ui.R')
    source('apps/app118/server.R')
    source('apps/app118/result.R')
	source('apps/app118/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_gongnengzhushi23_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app119/ui.R')
    source('apps/app119/server.R')
    source('apps/app119/result.R')
	source('apps/app119/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_gongnengzhushi24_button, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app120/ui.R')
    source('apps/app120/server.R')
    source('apps/app120/result.R')
	source('apps/app120/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_gongnengzhushi9_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app105/ui.R')
    source('apps/app105/server.R')
    source('apps/app105/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_gongnengzhushi1_button, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app97/ui.R')
    source('apps/app97/server.R')
    source('apps/app97/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })


# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_huitugongju1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app1/ui.R')
    source('apps/app1/server.R')
    source('apps/app1/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  
# UI - app2-表格格式-两表格合并---------------------------------
  observeEvent(input$box_biaogegeshi1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app2/ui.R')
    source('apps/app2/server.R')
    source('apps/app2/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app3-序列处理-序列变为一行---------------------------------
  observeEvent(input$box_xuliechuli1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app3/ui.R')
    source('apps/app3/server.R')
    source('apps/app3/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_huitugongju2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app4/ui.R')
    source('apps/app4/server.R')
    source('apps/app4/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_huitugongju3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app5/ui.R')
    source('apps/app5/server.R')
    source('apps/app5/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_huitugongju4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app6/ui.R')
    source('apps/app6/server.R')
    source('apps/app6/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app7-绘图工具-统计GC含量-----------------------------------
  observeEvent(input$box_tongjijianyan1_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app7/ui.R')
    source('apps/app7/server.R')
    source('apps/app7/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app8-绘图工具-统计序列长度-----------------------------------
  observeEvent(input$box_tongjijianyan2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app8/ui.R')
    source('apps/app8/server.R')
    source('apps/app8/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app9-表格格式-GTF提取信息---------------------------------
  observeEvent(input$box_biaogegeshi2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app9/ui.R')
    source('apps/app9/server.R')
    source('apps/app9/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app10-序列处理-序列格式化---------------------------------
  observeEvent(input$box_xuliechuli2_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app10/ui.R')
    source('apps/app10/server.R')
    source('apps/app10/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app11-序列处理-CDS转蛋白---------------------------------
  observeEvent(input$box_xuliechuli3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app11/ui.R')
    source('apps/app11/server.R')
    source('apps/app11/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
 

# UI - app12-序列处理-序列长度过滤---------------------------------
  observeEvent(input$box_xuliechuli4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app12/ui.R')
    source('apps/app12/server.R')
    source('apps/app12/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app13-统计检验-统计N值-----------------------------------
  observeEvent(input$box_tongjijianyan3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app13/ui.R')
    source('apps/app13/server.R')
    source('apps/app13/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app14-序列处理-序列截取---------------------------------
  observeEvent(input$box_xuliechuli5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app14/ui.R')
    source('apps/app14/server.R')
    source('apps/app14/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_huitugongju5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app15/ui.R')
    source('apps/app15/server.R')
    source('apps/app15/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app16-表格格式-SVG转换---------------------------------
  observeEvent(input$box_biaogegeshi3_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app16/ui.R')
    source('apps/app16/server.R')
    source('apps/app16/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app17-序列处理-序列反向互补---------------------------------
  observeEvent(input$box_xuliechuli6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app17/ui.R')
    source('apps/app17/server.R')
    source('apps/app17/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
 # UI - app18-统计检验-统计FASTQ文件-----------------------------------
  observeEvent(input$box_tongjijianyan4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app18/ui.R')
    source('apps/app18/server.R')
    source('apps/app18/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

 # UI - app19-绘图工具-碱基分布图-----------------------------------
  observeEvent(input$box_huitugongju6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app19/ui.R')
    source('apps/app19/server.R')
    source('apps/app19/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app20-序列处理-FASTQ质控(单端)---------------------------------
  observeEvent(input$box_xuliechuli7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app20/ui.R')
    source('apps/app20/server.R')
    source('apps/app20/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })      

# UI - app21-序列处理-FASTQ质控(双端)---------------------------------
  observeEvent(input$box_xuliechuli8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app21/ui.R')
    source('apps/app21/server.R')
    source('apps/app21/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app22-表格格式-GFF3转GTF---------------------------------
  observeEvent(input$box_biaogegeshi4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app22/ui.R')
    source('apps/app22/server.R')
    source('apps/app22/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app23-表格格式-DICT文件构建---------------------------------
  observeEvent(input$box_biaogegeshi5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app23/ui.R')
    source('apps/app23/server.R')
    source('apps/app23/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
 
# UI - app24-表格格式-GTF提取FASTA---------------------------------
  observeEvent(input$box_biaogegeshi6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app24/ui.R')
    source('apps/app24/server.R')
    source('apps/app24/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app25-序列处理-序列名称简化---------------------------------
  observeEvent(input$box_xuliechuli9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app25/ui.R')
    source('apps/app25/server.R')
    source('apps/app25/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app26-序列处理-最长转录本提取---------------------------------
  observeEvent(input$box_xuliechuli10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app26/ui.R')
    source('apps/app26/server.R')
    source('apps/app26/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  



 # UI - app33-表格格式-VCF提取SNP---------------------------------
  observeEvent(input$box_biaogegeshi7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app33/ui.R')
    source('apps/app33/server.R')
    source('apps/app33/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_huitugongju7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app34/ui.R')
    source('apps/app34/server.R')
    source('apps/app34/result.R')
	source('apps/app34/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_huitugongju8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app35/ui.R')
    source('apps/app35/server.R')
    source('apps/app35/result.R')
	source('apps/app35/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  



# UI - app37-绘图工具-动态序列比对图---------------------------------------
  observeEvent(input$box_huitugongju9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app37/ui.R')
    source('apps/app37/server.R')
    source('apps/app37/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
})
observeEvent(input$box_huitugongju9_button2, {  
	appServer(input,output)
})

# UI - app38-绘图工具-散点图---------------------------------------
  observeEvent(input$box_huitugongju10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app38/ui.R')
    source('apps/app38/server.R')
    source('apps/app38/result.R')
	source('apps/app38/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_huitugongju11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app39/ui.R')
    source('apps/app39/server.R')
    source('apps/app39/result.R')
	source('apps/app39/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app40-绘图工具-直方图---------------------------------------
  observeEvent(input$box_huitugongju12_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app40/ui.R')
    source('apps/app40/server.R')
    source('apps/app40/result.R')
	source('apps/app40/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_huitugongju13_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app41/ui.R')
    source('apps/app41/server.R')
    source('apps/app41/result.R')
	source('apps/app41/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app42-绘图工具-小提琴图---------------------------------------
  observeEvent(input$box_huitugongju14_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app42/ui.R')
    source('apps/app42/server.R')
    source('apps/app42/result.R')
	source('apps/app42/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app43-绘图工具-气泡图---------------------------------------
  observeEvent(input$box_huitugongju15_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app43/ui.R')
    source('apps/app43/server.R')
    source('apps/app43/result.R')
	source('apps/app43/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app44-绘图工具-相关性图---------------------------------------
  observeEvent(input$box_huitugongju16_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app44/ui.R')
    source('apps/app44/server.R')
    source('apps/app44/result.R')
	source('apps/app44/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app45-绘图工具-UpSet图---------------------------------------
  observeEvent(input$box_huitugongju17_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app45/ui.R')
    source('apps/app45/server.R')
    source('apps/app45/result.R')
	source('apps/app45/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app46-绘图工具-密度图---------------------------------------
  observeEvent(input$box_huitugongju18_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app46/ui.R')
    source('apps/app46/server.R')
    source('apps/app46/result.R')
	source('apps/app46/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app47-绘图工具-云雨图---------------------------------------
  observeEvent(input$box_huitugongju19_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app47/ui.R')
    source('apps/app47/server.R')
    source('apps/app47/result.R')
	source('apps/app47/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app48-绘图工具-豆荚图---------------------------------------
  observeEvent(input$box_huitugongju20_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app48/ui.R')
    source('apps/app48/server.R')
    source('apps/app48/result.R')
	source('apps/app48/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app49-绘图工具-点阵图---------------------------------------
  observeEvent(input$box_huitugongju21_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app49/ui.R')
    source('apps/app49/server.R')
    source('apps/app49/result.R')
	source('apps/app49/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app50-绘图工具-棒棒糖图---------------------------------------
  observeEvent(input$box_huitugongju22_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app50/ui.R')
    source('apps/app50/server.R')
    source('apps/app50/result.R')
	source('apps/app50/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app51-绘图工具-Cleveland图---------------------------------------
  observeEvent(input$box_huitugongju23_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app51/ui.R')
    source('apps/app51/server.R')
    source('apps/app51/result.R')
	source('apps/app51/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app52-绘图工具-分类柱状图---------------------------------------
  observeEvent(input$box_huitugongju24_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app52/ui.R')
    source('apps/app52/server.R')
    source('apps/app52/result.R')
	source('apps/app52/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app53-绘图工具-QQ图---------------------------------------
  observeEvent(input$box_huitugongju25_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app53/ui.R')
    source('apps/app53/server.R')
    source('apps/app53/result.R')
	source('apps/app53/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app54-绘图工具-偏差图---------------------------------------
  observeEvent(input$box_huitugongju26_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app54/ui.R')
    source('apps/app54/server.R')
    source('apps/app54/result.R')
	source('apps/app54/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app55-绘图工具-误差线图---------------------------------------
  observeEvent(input$box_huitugongju27_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app55/ui.R')
    source('apps/app55/server.R')
    source('apps/app55/result.R')
	source('apps/app55/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app56-绘图工具-带状图---------------------------------------
  observeEvent(input$box_huitugongju28_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app56/ui.R')
    source('apps/app56/server.R')
    source('apps/app56/result.R')
	source('apps/app56/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app57-绘图工具-甜甜圈图---------------------------------------
  observeEvent(input$box_huitugongju29_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app57/ui.R')
    source('apps/app57/server.R')
    source('apps/app57/result.R')
	source('apps/app57/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app58-绘图工具-相关性回归图---------------------------------------
  observeEvent(input$box_huitugongju30_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app58/ui.R')
    source('apps/app58/server.R')
    source('apps/app58/result.R')
	source('apps/app58/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app59-绘图工具-MA图---------------------------------------
  observeEvent(input$box_huitugongju31_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app59/ui.R')
    source('apps/app59/server.R')
    source('apps/app59/result.R')
	source('apps/app59/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app60-绘图工具-配对箱线图---------------------------------------
  observeEvent(input$box_huitugongju32_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app60/ui.R')
    source('apps/app60/server.R')
    source('apps/app60/result.R')
	source('apps/app60/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app61-绘图工具-绘制表格---------------------------------------
  observeEvent(input$box_huitugongju33_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app61/ui.R')
    source('apps/app61/server.R')
    source('apps/app61/result.R')
	source('apps/app61/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app62-绘图工具-边缘分布散点图---------------------------------------
  observeEvent(input$box_huitugongju34_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app62/ui.R')
    source('apps/app62/server.R')
    source('apps/app62/result.R')
	source('apps/app62/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app63-绘图工具-玫瑰图---------------------------------------
  observeEvent(input$box_huitugongju35_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app63/ui.R')
    source('apps/app63/server.R')
    source('apps/app63/result.R')
	source('apps/app63/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app64-绘图工具-蜂群图---------------------------------------
  observeEvent(input$box_huitugongju36_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app64/ui.R')
    source('apps/app64/server.R')
    source('apps/app64/result.R')
	source('apps/app64/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app65-绘图工具-Circos关系图---------------------------------------
  observeEvent(input$box_huitugongju37_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app65/ui.R')
    source('apps/app65/server.R')
    source('apps/app65/result.R')
	source('apps/app65/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
    # UI - app66-绘图工具-断轴条形图---------------------------------------
  observeEvent(input$box_huitugongju38_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app66/ui.R')
    source('apps/app66/server.R')
    source('apps/app66/result.R')
	source('apps/app66/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app67-绘图工具-Krona分级饼图---------------------------------------
  observeEvent(input$box_huitugongju39_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app67/ui.R')
    source('apps/app67/server.R')
    source('apps/app67/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app68-统计检验-DEseq2差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan5_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app68/ui.R')
    source('apps/app68/server.R')
    source('apps/app68/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
 # UI - app69-统计检验-DEseq无重复差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app69/ui.R')
    source('apps/app69/server.R')
    source('apps/app69/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app70-统计检验-DEseq差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app70/ui.R')
    source('apps/app70/server.R')
    source('apps/app70/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app71-表格格式-基因ID转换---------------------------------
  observeEvent(input$box_biaogegeshi8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app71/ui.R')
    source('apps/app71/server.R')
    source('apps/app71/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

 # UI - app72-表格格式-表格信息提取---------------------------------
  observeEvent(input$box_biaogegeshi9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app72/ui.R')
    source('apps/app72/server.R')
    source('apps/app72/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
  # UI - app73-表格格式-表格转置---------------------------------
  observeEvent(input$box_biaogegeshi10_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app73/ui.R')
    source('apps/app73/server.R')
    source('apps/app73/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  # UI - app74-表格格式-SAM Flag数值解读---------------------------------
  observeEvent(input$box_biaogegeshi11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app74/ui.R')
    source('apps/app74/server.R')
    source('apps/app74/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_tongjijianyan8_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app75/ui.R')
    source('apps/app75/server.R')
    source('apps/app75/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_tongjijianyan9_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app76/ui.R')
    source('apps/app76/server.R')
    source('apps/app76/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
# UI - app77-序列处理-MUSCLE序列比对---------------------------------
  observeEvent(input$box_xuliechuli11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app77/ui.R')
    source('apps/app77/server.R')
    source('apps/app77/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app78-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli12_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app78/ui.R')
    source('apps/app78/server.R')
    source('apps/app78/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app95-序列处理-局部序列比对---------------------------------
  observeEvent(input$box_xuliechuli13_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app95/ui.R')
    source('apps/app95/server.R')
    source('apps/app95/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
  # UI - app79-动态绘图-动态散点图---------------------------------
  observeEvent(input$box_dongtaihuitu1_button2, {
	source('apps/app79/ui.R')
    source('apps/app79/server.R')
    source('apps/app79/result.R')
    source('apps/app79/plot.R')	  
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	output$box_input <- appUI()
	output$box_info <-appResult()	
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app80-绘图工具-转录-蛋白九象限图---------------------------------------
  observeEvent(input$box_huitugongju40_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app80/ui.R')
    source('apps/app80/server.R')
    source('apps/app80/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app81-绘图工具-转录-代谢九象限图---------------------------------------
  observeEvent(input$box_huitugongju41_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app81/ui.R')
    source('apps/app81/server.R')
    source('apps/app81/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app82-桑基图---------------------------------------
  observeEvent(input$box_huitugongju42_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app82/ui.R')
    source('apps/app82/server.R')
    source('apps/app82/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
# UI - app83-三元图---------------------------------------
  observeEvent(input$box_huitugongju43_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app83/ui.R')
    source('apps/app83/server.R')
    source('apps/app83/result.R')
	#source('apps/app83/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })  

# UI - app84-面积图---------------------------------------
  observeEvent(input$box_huitugongju44_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app84/ui.R')
    source('apps/app84/server.R')
    source('apps/app84/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app85-雷达图---------------------------------------
  observeEvent(input$box_huitugongju45_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app85/ui.R')
    source('apps/app85/server.R')
    source('apps/app85/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app86-3D散点图---------------------------------------
  observeEvent(input$box_huitugongju46_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app86/ui.R')
    source('apps/app86/server.R')
    source('apps/app86/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_huitugongju47_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app87/ui.R')
    source('apps/app87/server.R')
    source('apps/app87/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app88-累积分布曲线---------------------------------------
  observeEvent(input$box_huitugongju48_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app88/ui.R')
    source('apps/app88/server.R')
    source('apps/app88/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app96-最大似然法建树---------------------------------------
observeEvent(input$box_huitugongju9_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app96/ui.R')
    source('apps/app96/server.R')
    source('apps/app96/result.R')
	#source('apps/app96/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  }) 
  
  # UI - app89-表格格式-宽表格转长---------------------------------
  observeEvent(input$box_biaogegeshi12_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app89/ui.R')
    source('apps/app89/server.R')
    source('apps/app89/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

  # UI - app90-表格格式-长表格转宽---------------------------------
  observeEvent(input$box_biaogegeshi13_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app90/ui.R')
    source('apps/app90/server.R')
    source('apps/app90/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app91-瀑布图---------------------------------------
  observeEvent(input$box_huitugongju49_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app91/ui.R')
    source('apps/app91/server.R')
    source('apps/app91/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app92-Ms2Plot---------------------------------------
observeEvent(input$box_huitugongju50_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app92/ui.R')
    source('apps/app92/server.R')
    source('apps/app92/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_biaogegeshi14_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app93/ui.R')
    source('apps/app93/server.R')
    source('apps/app93/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_biaogegeshi15_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app94/ui.R')
    source('apps/app94/server.R')
    source('apps/app94/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_huitugongju1_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app1/ui.R')
    source('apps/app1/server.R')
    source('apps/app1/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  
# UI - app2-表格格式-两表格合并---------------------------------
  observeEvent(input$box_biaogegeshi1_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app2/ui.R')
    source('apps/app2/server.R')
    source('apps/app2/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app3-序列处理-序列变为一行---------------------------------
  observeEvent(input$box_xuliechuli1_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	source('apps/app3/ui.R')
    source('apps/app3/server.R')
    source('apps/app3/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_huitugongju2_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app4/ui.R')
    source('apps/app4/server.R')
    source('apps/app4/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_huitugongju3_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app5/ui.R')
    source('apps/app5/server.R')
    source('apps/app5/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_huitugongju4_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app6/ui.R')
    source('apps/app6/server.R')
    source('apps/app6/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app7-绘图工具-统计GC含量-----------------------------------
  observeEvent(input$box_tongjijianyan1_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app7/ui.R')
    source('apps/app7/server.R')
    source('apps/app7/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
 # UI - app8-绘图工具-统计序列长度-----------------------------------
  observeEvent(input$box_tongjijianyan2_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app8/ui.R')
    source('apps/app8/server.R')
    source('apps/app8/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app9-表格格式-GTF提取信息---------------------------------
  observeEvent(input$box_biaogegeshi2_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app9/ui.R')
    source('apps/app9/server.R')
    source('apps/app9/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app10-序列处理-序列格式化---------------------------------
  observeEvent(input$box_xuliechuli2_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app10/ui.R')
    source('apps/app10/server.R')
    source('apps/app10/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app11-序列处理-CDS转蛋白---------------------------------
  observeEvent(input$box_xuliechuli3_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app11/ui.R')
    source('apps/app11/server.R')
    source('apps/app11/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
 

# UI - app12-序列处理-序列长度过滤---------------------------------
  observeEvent(input$box_xuliechuli4_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app12/ui.R')
    source('apps/app12/server.R')
    source('apps/app12/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
 # UI - app13-统计检验-统计N值-----------------------------------
  observeEvent(input$box_tongjijianyan3_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app13/ui.R')
    source('apps/app13/server.R')
    source('apps/app13/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app14-序列处理-序列截取---------------------------------
  observeEvent(input$box_xuliechuli5_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app14/ui.R')
    source('apps/app14/server.R')
    source('apps/app14/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_huitugongju5_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app15/ui.R')
    source('apps/app15/server.R')
    source('apps/app15/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app16-表格格式-SVG转换---------------------------------
  observeEvent(input$box_biaogegeshi3_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app16/ui.R')
    source('apps/app16/server.R')
    source('apps/app16/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app17-序列处理-序列反向互补---------------------------------
  observeEvent(input$box_xuliechuli6_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app17/ui.R')
    source('apps/app17/server.R')
    source('apps/app17/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
 # UI - app18-统计检验-统计FASTQ文件-----------------------------------
  observeEvent(input$box_tongjijianyan4_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app18/ui.R')
    source('apps/app18/server.R')
    source('apps/app18/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

 # UI - app19-绘图工具-碱基分布图-----------------------------------
  observeEvent(input$box_huitugongju6_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app19/ui.R')
    source('apps/app19/server.R')
    source('apps/app19/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app20-序列处理-FASTQ质控(单端)---------------------------------
  observeEvent(input$box_xuliechuli7_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app20/ui.R')
    source('apps/app20/server.R')
    source('apps/app20/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })      

# UI - app21-序列处理-FASTQ质控(双端)---------------------------------
  observeEvent(input$box_xuliechuli8_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app21/ui.R')
    source('apps/app21/server.R')
    source('apps/app21/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app22-表格格式-GFF3转GTF---------------------------------
  observeEvent(input$box_biaogegeshi4_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app22/ui.R')
    source('apps/app22/server.R')
    source('apps/app22/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app23-表格格式-DICT文件构建---------------------------------
  observeEvent(input$box_biaogegeshi5_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app23/ui.R')
    source('apps/app23/server.R')
    source('apps/app23/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
 
# UI - app24-表格格式-GTF提取FASTA---------------------------------
  observeEvent(input$box_biaogegeshi6_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app24/ui.R')
    source('apps/app24/server.R')
    source('apps/app24/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app25-序列处理-序列名称简化---------------------------------
  observeEvent(input$box_xuliechuli9_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app25/ui.R')
    source('apps/app25/server.R')
    source('apps/app25/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app26-序列处理-最长转录本提取---------------------------------
  observeEvent(input$box_xuliechuli10_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app26/ui.R')
    source('apps/app26/server.R')
    source('apps/app26/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  


 
 # UI - app33-表格格式-VCF提取SNP---------------------------------
  observeEvent(input$box_biaogegeshi7_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app33/ui.R')
    source('apps/app33/server.R')
    source('apps/app33/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_huitugongju7_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app34/ui.R')
    source('apps/app34/server.R')
    source('apps/app34/result.R')
	source('apps/app34/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_huitugongju8_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app35/ui.R')
    source('apps/app35/server.R')
    source('apps/app35/result.R')
	source('apps/app35/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  


# UI - app37-绘图工具-动态序列比对图---------------------------------------
  observeEvent(input$box_huitugongju9_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app37/ui.R')
    source('apps/app37/server.R')
    source('apps/app37/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
observeEvent(input$box_huitugongju9_button22, {  
	appServer(input,output)
})

# UI - app38-绘图工具-散点图---------------------------------------
  observeEvent(input$box_huitugongju10_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app38/ui.R')
    source('apps/app38/server.R')
    source('apps/app38/result.R')
	source('apps/app38/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_huitugongju11_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app39/ui.R')
    source('apps/app39/server.R')
    source('apps/app39/result.R')
	source('apps/app39/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
  # UI - app40-绘图工具-直方图---------------------------------------
  observeEvent(input$box_huitugongju12_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app40/ui.R')
    source('apps/app40/server.R')
    source('apps/app40/result.R')
	source('apps/app40/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_huitugongju13_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app41/ui.R')
    source('apps/app41/server.R')
    source('apps/app41/result.R')
	source('apps/app41/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app42-绘图工具-小提琴图---------------------------------------
  observeEvent(input$box_huitugongju14_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app42/ui.R')
    source('apps/app42/server.R')
    source('apps/app42/result.R')
	source('apps/app42/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app43-绘图工具-气泡图---------------------------------------
  observeEvent(input$box_huitugongju15_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app43/ui.R')
    source('apps/app43/server.R')
    source('apps/app43/result.R')
	source('apps/app43/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app44-绘图工具-相关性图---------------------------------------
  observeEvent(input$box_huitugongju16_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app44/ui.R')
    source('apps/app44/server.R')
    source('apps/app44/result.R')
	source('apps/app44/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app45-绘图工具-UpSet图---------------------------------------
  observeEvent(input$box_huitugongju17_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app45/ui.R')
    source('apps/app45/server.R')
    source('apps/app45/result.R')
	source('apps/app45/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app46-绘图工具-密度图---------------------------------------
  observeEvent(input$box_huitugongju18_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app46/ui.R')
    source('apps/app46/server.R')
    source('apps/app46/result.R')
	source('apps/app46/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app47-绘图工具-云雨图---------------------------------------
  observeEvent(input$box_huitugongju19_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app47/ui.R')
    source('apps/app47/server.R')
    source('apps/app47/result.R')
	source('apps/app47/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app48-绘图工具-豆荚图---------------------------------------
  observeEvent(input$box_huitugongju20_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app48/ui.R')
    source('apps/app48/server.R')
    source('apps/app48/result.R')
	source('apps/app48/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app49-绘图工具-点阵图---------------------------------------
  observeEvent(input$box_huitugongju21_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app49/ui.R')
    source('apps/app49/server.R')
    source('apps/app49/result.R')
	source('apps/app49/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app50-绘图工具-棒棒糖图---------------------------------------
  observeEvent(input$box_huitugongju22_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app50/ui.R')
    source('apps/app50/server.R')
    source('apps/app50/result.R')
	source('apps/app50/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app51-绘图工具-Cleveland图---------------------------------------
  observeEvent(input$box_huitugongju23_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app51/ui.R')
    source('apps/app51/server.R')
    source('apps/app51/result.R')
	source('apps/app51/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app52-绘图工具-分类柱状图---------------------------------------
  observeEvent(input$box_huitugongju24_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app52/ui.R')
    source('apps/app52/server.R')
    source('apps/app52/result.R')
	source('apps/app52/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
    # UI - app53-绘图工具-QQ图---------------------------------------
  observeEvent(input$box_huitugongju25_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app53/ui.R')
    source('apps/app53/server.R')
    source('apps/app53/result.R')
	source('apps/app53/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

    # UI - app54-绘图工具-偏差图---------------------------------------
  observeEvent(input$box_huitugongju26_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app54/ui.R')
    source('apps/app54/server.R')
    source('apps/app54/result.R')
	source('apps/app54/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app55-绘图工具-误差线图---------------------------------------
  observeEvent(input$box_huitugongju27_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app55/ui.R')
    source('apps/app55/server.R')
    source('apps/app55/result.R')
	source('apps/app55/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app56-绘图工具-带状图---------------------------------------
  observeEvent(input$box_huitugongju28_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app56/ui.R')
    source('apps/app56/server.R')
    source('apps/app56/result.R')
	source('apps/app56/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app57-绘图工具-甜甜圈图---------------------------------------
  observeEvent(input$box_huitugongju29_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app57/ui.R')
    source('apps/app57/server.R')
    source('apps/app57/result.R')
	source('apps/app57/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app58-绘图工具-相关性回归图---------------------------------------
  observeEvent(input$box_huitugongju30_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app58/ui.R')
    source('apps/app58/server.R')
    source('apps/app58/result.R')
	source('apps/app58/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app59-绘图工具-MA图---------------------------------------
  observeEvent(input$box_huitugongju31_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app59/ui.R')
    source('apps/app59/server.R')
    source('apps/app59/result.R')
	source('apps/app59/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app60-绘图工具-配对箱线图---------------------------------------
  observeEvent(input$box_huitugongju32_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app60/ui.R')
    source('apps/app60/server.R')
    source('apps/app60/result.R')
	source('apps/app60/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app61-绘图工具-绘制表格---------------------------------------
  observeEvent(input$box_huitugongju33_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app61/ui.R')
    source('apps/app61/server.R')
    source('apps/app61/result.R')
	source('apps/app61/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app62-绘图工具-边缘分布散点图---------------------------------------
  observeEvent(input$box_huitugongju34_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app62/ui.R')
    source('apps/app62/server.R')
    source('apps/app62/result.R')
	source('apps/app62/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app63-绘图工具-玫瑰图---------------------------------------
  observeEvent(input$box_huitugongju35_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app63/ui.R')
    source('apps/app63/server.R')
    source('apps/app63/result.R')
	source('apps/app63/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app64-绘图工具-蜂群图---------------------------------------
  observeEvent(input$box_huitugongju36_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app64/ui.R')
    source('apps/app64/server.R')
    source('apps/app64/result.R')
	source('apps/app64/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app65-绘图工具-Circos关系图---------------------------------------
  observeEvent(input$box_huitugongju37_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app65/ui.R')
    source('apps/app65/server.R')
    source('apps/app65/result.R')
	source('apps/app65/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app66-绘图工具-断轴条形图---------------------------------------
  observeEvent(input$box_huitugongju38_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app66/ui.R')
    source('apps/app66/server.R')
    source('apps/app66/result.R')
	source('apps/app66/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

    # UI - app67-绘图工具-Krona分级饼图---------------------------------------
  observeEvent(input$box_huitugongju39_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app67/ui.R')
    source('apps/app67/server.R')
    source('apps/app67/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app68-统计检验-DEseq2差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan5_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app68/ui.R')
    source('apps/app68/server.R')
    source('apps/app68/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })     
  
# UI - app69-统计检验-DEseq无重复差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan6_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app69/ui.R')
    source('apps/app69/server.R')
    source('apps/app69/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app70-统计检验-DEseq差异表达分析-----------------------------------
  observeEvent(input$box_tongjijianyan7_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app70/ui.R')
    source('apps/app70/server.R')
    source('apps/app70/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

 # UI - app71-表格格式-基因ID转换---------------------------------
  observeEvent(input$box_biaogegeshi8_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app71/ui.R')
    source('apps/app71/server.R')
    source('apps/app71/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
observeEvent(input$app71_select1, {
        appServer(input,output,session)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")
}) 

# UI - app72-表格格式-表格信息提取--------------------------------------------------------------------
  observeEvent(input$box_biaogegeshi9_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app72/ui.R')
    source('apps/app72/server.R')
    source('apps/app72/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  # UI - app73-表格格式-表格转置---------------------------------
  observeEvent(input$box_biaogegeshi10_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app73/ui.R')
    source('apps/app73/server.R')
    source('apps/app73/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
  # UI - app74-表格格式-SAM Flag数值解读---------------------------------
  observeEvent(input$box_biaogegeshi11_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app74/ui.R')
    source('apps/app74/server.R')
    source('apps/app74/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 
  
# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_tongjijianyan8_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app75/ui.R')
    source('apps/app75/server.R')
    source('apps/app75/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

observeEvent(input$app75_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})
	

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_tongjijianyan9_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app76/ui.R')
    source('apps/app76/server.R')
    source('apps/app76/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

  observeEvent(input$app76_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})

  observeEvent(input$app76_select2, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

}) 
 
# UI - app77-序列处理-MUSCLE序列比对---------------------------------
  observeEvent(input$box_xuliechuli11_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app77/ui.R')
    source('apps/app77/server.R')
    source('apps/app77/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app78-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli12_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app78/ui.R')
    source('apps/app78/server.R')
    source('apps/app78/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
  # UI - app79-动态绘图-动态散点图---------------------------------
  observeEvent(input$box_dongtaihuitu1_button22, {
	source('apps/app79/ui.R')
    source('apps/app79/server.R')
    source('apps/app79/result.R')
    source('apps/app79/plot.R')	  
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
	output$box_input <- appUI()
	output$box_info <-appResult()	
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

# UI - app80-绘图工具-转录-蛋白九象限图---------------------------------------
  observeEvent(input$box_huitugongju40_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app80/ui.R')
    source('apps/app80/server.R')
    source('apps/app80/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
# UI - app81-绘图工具-转录-代谢九象限图---------------------------------------
  observeEvent(input$box_huitugongju41_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app81/ui.R')
    source('apps/app81/server.R')
    source('apps/app81/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app82-桑基图---------------------------------------
  observeEvent(input$box_huitugongju42_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app82/ui.R')
    source('apps/app82/server.R')
    source('apps/app82/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app83-三元图---------------------------------------
  observeEvent(input$box_huitugongju43_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app83/ui.R')
    source('apps/app83/server.R')
    source('apps/app83/result.R')
	#source('apps/app83/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app83_select1, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

# UI - app84-面积图---------------------------------------
  observeEvent(input$box_huitugongju44_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app84/ui.R')
    source('apps/app84/server.R')
    source('apps/app84/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app85-雷达图---------------------------------------
  observeEvent(input$box_huitugongju45_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app85/ui.R')
    source('apps/app85/server.R')
    source('apps/app85/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app86-3D散点图---------------------------------------
  observeEvent(input$box_huitugongju46_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app86/ui.R')
    source('apps/app86/server.R')
    source('apps/app86/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_huitugongju47_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app105/ui.R')
    source('apps/app105/server.R')
    source('apps/app105/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app88-累积分布曲线---------------------------------------
  observeEvent(input$box_huitugongju48_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app88/ui.R')
    source('apps/app88/server.R')
    source('apps/app88/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
  # UI - app89-表格格式-宽表格转长---------------------------------
  observeEvent(input$box_biaogegeshi12_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app89/ui.R')
    source('apps/app89/server.R')
    source('apps/app89/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app90-表格格式-长表格转宽---------------------------------
  observeEvent(input$box_biaogegeshi13_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app90/ui.R')
    source('apps/app90/server.R')
    source('apps/app90/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app91-瀑布图---------------------------------------
  observeEvent(input$box_huitugongju49_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app91/ui.R')
    source('apps/app91/server.R')
    source('apps/app91/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app92-Ms2Plot---------------------------------------
  observeEvent(input$box_huitugongju50_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app92/ui.R')
    source('apps/app92/server.R')
    source('apps/app92/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app92_select1, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_biaogegeshi14_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app93/ui.R')
    source('apps/app93/server.R')
    source('apps/app93/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_biaogegeshi15_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app94/ui.R')
    source('apps/app94/server.R')
    source('apps/app94/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

# UI - app95-序列处理-DNA RNA转换---------------------------------
  observeEvent(input$box_xuliechuli13_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
	source('apps/app95/ui.R')
    source('apps/app95/server.R')
    source('apps/app95/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app96-最大似然法建树---------------------------------------
  observeEvent(input$box_huitugongju9_button22, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app96/ui.R')
    source('apps/app96/server.R')
    source('apps/app96/result.R')
	#source('apps/app96/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  observeEvent(input$app96_select2, {
	appServer(input,output)
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
})

  # UI - app93-质谱格式转换---------------------------------
  observeEvent(input$box_gongnengzhushi2_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app98/ui.R')
    source('apps/app98/server.R')
    source('apps/app98/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  }) 

  # UI - app94-质谱峰提取---------------------------------
  observeEvent(input$box_gongnengzhushi3_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app99/ui.R')
    source('apps/app99/server.R')
    source('apps/app99/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   

# UI - app76-统计检验-缺失值处理-----------------------------------
  observeEvent(input$box_gongnengzhushi4_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app100/ui.R')
    source('apps/app100/server.R')
    source('apps/app100/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

    observeEvent(input$app100_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})

  observeEvent(input$app100_select2, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

}) 

# UI - app75-统计检验-标准化归一化-----------------------------------
  observeEvent(input$box_gongnengzhushi5_button22, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app101/ui.R')
    source('apps/app101/server.R')
    source('apps/app101/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
  })

observeEvent(input$app101_select1, {
        appServer(input,output)
        output$taskjobid<-renderText("")
        output$taskjobidinfo<-renderText("")
        output$taskjobidcheck<-renderText("")
        output$taskjobidcheck2<-renderText("")

})


# UI - app111-统计检验-方差分析（单因素）-----------------------------------
  observeEvent(input$box_gongnengzhushi6_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app102/ui.R')
    source('apps/app102/server.R')
    source('apps/app102/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })
  
# UI - app116-OPLS-DA---------------------------------------
  observeEvent(input$box_gongnengzhushi7_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app103/ui.R')
    source('apps/app103/server.R')
    source('apps/app103/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app92-Ms2Plot---------------------------------------
observeEvent(input$box_gongnengzhushi10_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app106/ui.R')
    source('apps/app106/server.R')
    source('apps/app106/result.R')
	#source('apps/app92/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")	
  })  
  
  
# UI - app1-绘图工具-热图---------------------------------------
  observeEvent(input$box_gongnengzhushi11_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app107/ui.R')
    source('apps/app107/server.R')
    source('apps/app107/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  
  
# UI - app4-绘图工具-韦恩图---------------------------------------
  observeEvent(input$box_gongnengzhushi12_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app108/ui.R')
    source('apps/app108/server.R')
    source('apps/app108/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    

# UI - app5-绘图工具-火山图-----------------------------------
  observeEvent(input$box_gongnengzhushi13_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app109/ui.R')
    source('apps/app109/server.R')
    source('apps/app109/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
# UI - app6-绘图工具-PCA图-----------------------------------
  observeEvent(input$box_gongnengzhushi14_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app110/ui.R')
    source('apps/app110/server.R')
    source('apps/app110/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })   
  
  
  # UI - app15-绘图工具-聚类图-----------------------------------
  observeEvent(input$box_gongnengzhushi15_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app111/ui.R')
    source('apps/app111/server.R')
    source('apps/app111/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app97-统计检验-T检验-----------------------------------
  observeEvent(input$box_gongnengzhushi16_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app112/ui.R')
    source('apps/app112/server.R')
    source('apps/app112/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
# UI - app101-统计检验-秩和检验-----------------------------------
  observeEvent(input$box_gongnengzhushi17_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app113/ui.R')
    source('apps/app113/server.R')
    source('apps/app113/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })  

# UI - app102-统计检验-卡方检验-----------------------------------
  observeEvent(input$box_gongnengzhushi18_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app114/ui.R')
    source('apps/app114/server.R')
    source('apps/app114/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app103-统计检验-Fisher's检验-----------------------------------
  observeEvent(input$box_gongnengzhushi19_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app115/ui.R')
    source('apps/app115/server.R')
    source('apps/app115/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app105-统计检验-多组检验-----------------------------------
  observeEvent(input$box_gongnengzhushi20_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app116/ui.R')
    source('apps/app116/server.R')
    source('apps/app116/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app34-绘图工具-条形图---------------------------------------
  observeEvent(input$box_gongnengzhushi21_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app117/ui.R')
    source('apps/app117/server.R')
    source('apps/app117/result.R')
	source('apps/app117/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })

# UI - app35-绘图工具-折线图---------------------------------------
  observeEvent(input$box_gongnengzhushi22_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app118/ui.R')
    source('apps/app118/server.R')
    source('apps/app118/result.R')
	source('apps/app118/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()
  })    
  
  # UI - app39-绘图工具-饼图---------------------------------------
  observeEvent(input$box_gongnengzhushi23_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app119/ui.R')
    source('apps/app119/server.R')
    source('apps/app119/result.R')
	source('apps/app119/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  
  
    # UI - app41-绘图工具-箱线图---------------------------------------
  observeEvent(input$box_gongnengzhushi24_button2, {
	hide("huitugongju_panel")
	hide("dongtaihuitu_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
	hide("zuxuefenxi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	output$box_input<-renderUI("")
	output$box_info<-renderUI("")
	source('apps/app120/ui.R')
    source('apps/app120/server.R')
    source('apps/app120/result.R')
	source('apps/app120/plot.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })  

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_gongnengzhushi9_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app105/ui.R')
    source('apps/app105/server.R')
    source('apps/app105/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })

# UI - app105-气泡图---------------------------------------
  observeEvent(input$box_gongnengzhushi1_button2, {
	hide("huitugongju_panel")
    hide("biaogegeshi_panel")
    hide("xuliechuli_panel")
    hide("tongjijianyan_panel")
	hide("gongnengzhushi_panel")
    show("function_panel")
	hide("search_panel")
	output$taskjobid<-renderText("")
	output$taskjobidinfo<-renderText("")
	output$taskjobidcheck<-renderText("")
	output$taskjobidcheck2<-renderText("")
	output$result<-renderPlot("")
	source('apps/app97/ui.R')
    source('apps/app97/server.R')
    source('apps/app97/result.R')
	output$box_input <- appUI()
	output$box_info <-appResult()	
  })
  
  
}
