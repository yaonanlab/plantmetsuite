appUI<-function(x){
renderUI({
    div(style = "position: relative; backgroundColor: #ecf0f5",
        tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app83.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Ternary Chart")), h4("Using tables to draw ternary diagrams"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app83_fileupload",
                            tags$style("
                            .btn-file {
                            background-color:#7472d0;
							background-color-hover:#7472d0;
                            border-color: #7472d0;
							color:white;
							display: flex;
					        align-items: center;
							vertical-align:middle;
                            }
                            .progress-bar {
                            background-color: lightgreen;
                            }
							.btn-file:hover {
                            background-color:#7472d0;
							background-color-hover:#7472d0;
                            border-color: #7472d0;
							color:white;
                            }
							.selectize-input {
                            width: 240px;
							text-align:center;
							margin-left: 0px;
                            margin-right: 0px;
                            padding: 0px;
      }"),br(),
h4("Upload data：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app83_inputFile1",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View sample data", class = "action-button", 
        style = "color: white; 
        background-color: #53d362; 
        height: 40px;
        width: 90px;
		font-size:15px;
        text-align:center;
        border-radius: 6px;
        border-width: 2px;
		position: relative;
		display: flex;
		align-items: center;
		vertical-align:middle;"), 
		target = "_blank",
        href = "app83/data.txt"),a(h4("Download sample data", class = "action-button", 
        style = "color: white; 
        background-color: #53d362; 
        height: 40px;
        width: 90px;
		font-size:15px;
        text-align:center;
        border-radius: 6px;
        border-width: 2px;
		position: relative;
		display: flex;
		align-items: center;
		vertical-align:middle;"), target = "_blank",
        href = "app83/data.zip")))),						
h4("Upload group data：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app83_inputFile2",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View sample data", class = "action-button", 
        style = "color: white; 
        background-color: #53d362; 
        height: 40px;
        width: 90px;
		font-size:15px;
        text-align:center;
        border-radius: 6px;
        border-width: 2px;
		position: relative;
		display: flex;
		align-items: center;
		vertical-align:middle;"), 
		target = "_blank",
        href = "app83/group.txt"),a(h4("Download sample data", class = "action-button", 
        style = "color: white; 
        background-color: #53d362; 
        height: 40px;
        width: 90px;
		font-size:15px;
        text-align:center;
        border-radius: 6px;
        border-width: 2px;
		position: relative;
		display: flex;
		align-items: center;
		vertical-align:middle;"), target = "_blank",
        href = "app83/data.zip")))),

h4("Appearance Options",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Fill Color",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app83_text1", "", value = "#776AAE"),
		colourInput("app83_text2", "", value = "#5EBED6"),
		colourInput("app83_text3", "", value = "#ACCD03"),
		colourInput("app83_text4", "", value = "#FFD101"),
		colourInput("app83_text5", "", value = "#D43338")
		)),	
	h4("Color transparency",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app83_text6", "","0.7", width = "180px",height="40px"))),		
	h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app83_text7", "","x", width = "180px",height="40px"))),
	h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app83_text8", "","y", width = "180px",height="40px"))),
	h4("Y-axis",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app83_text9", "","z", width = "180px",height="40px"))),
	h4("Coloring method",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app83_select1",
                                "",
                                choices = list(
    'Coloring method' = c(`Coloring according to abundance ranking (top abundance)` = "0",
					`Coloring according to the degree of enrichment` = "1",
					`Coloring according to classification` = "2",
					`No coloring (black and white)` = "3"))))),
	#h4("点的大小范围（输入最大值）",style="text-align: left;font-weight: 1000;color:black"),
	#fluidRow(column(width=2,textAreaInput("app83_text10", "","6", width = "180px",height="40px"))),
	
	
h4("Data Options",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Abundance type",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app83_select2",
                                "",
                                choices = list(
    'Abundance type' = c(`absolute` = "absolute",
                   `relative` = "relative"))))),	
	h4("Abundance filtering threshold",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app83_text11", "","0.001", width = "180px",height="40px"))),
	
div(id = 'app83_button1_info1',	
	h4("Number of abundances highlighted (from highest to lowest)",style="text-align: left;font-weight: 1000;color:black")),
div(id = 'app83_button1',		
	fluidRow(column(width=2,textAreaInput("app83_text12", "","10", width = "180px",height="40px")))),
	
div(id = 'app83_button2_info1',	
	h4("Pvalue threshold for the degree of enrichment",style="text-align: left;font-weight: 1000;color:black")),
div(id = 'app83_button2',
	fluidRow(column(width=2,textAreaInput("app83_text13", "","0.05", width = "180px",height="40px")))),
	
div(id = 'app83_button3',	
	h4("Please put the category in the second column！",style="text-align: left;font-weight: 1000;color:black")),	
	
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app83_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
							actionButton(
                 inputId = "send_button",
                 label = "Submit",
                 styleclass = "info",
				 style = "color: white; 
                       background-color: #7472d0; 
                       position: relative; 
                       height: 50px;
                       width: 100px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               ),
			   
 div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:red;",
		h4(strong(textOutput("taskjobid"), align='center')),
		),div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:green;",
		h4(strong(textOutput("taskjobidinfo"), align='center'))
		)		   
        )
		  
		  )
		  
        )
      )
    )
  })
}
