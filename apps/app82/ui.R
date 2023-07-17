appUI<-function(x){
renderUI({
    div(style = "position: relative; backgroundColor: #ecf0f5",
        tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app82.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Sankitu")), h4("Describe the flow of one set of values to another set of values"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app82_fileupload",
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
                            width: 150px;
							text-align:center;
							margin-left: 0px;
                            margin-right: 0px;
                            padding: 0px;
      }"),br(),
h4("选择数据：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app82_inputFile1",
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
        href = "app82/data.txt"),a(h4("Download sample data", class = "action-button", 
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
        href = "app82/data.zip")))),						

h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Select color series (auto-fill transition colors)",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app82_text1", "", value = "#776AAE"),
		colourInput("app82_text2", "", value = "#5EBED6"),
		colourInput("app82_text3", "", value = "#ACCD03"),
		colourInput("app82_text4", "", value = "#FFD101"),
		colourInput("app82_text5", "", value = "#D43338")
		)),
						
	h4("Width of connecting line",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app82_text6", "","0.3", width = "180px",height="40px"))),
	h4("Linking transparency",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app82_text7", "","0.5", width = "180px",height="40px"))),
	h4("Spacing color",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app82_text8", "", value = "#FFFFFF")
		)),
	h4("Spacing width",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app82_text9", "","0.1", width = "180px",height="40px"))),
	h4("Block width",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app82_text10", "","0.5", width = "180px",height="40px"))),
	h4("Font Size",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app82_text11", "","3", width = "180px",height="40px"))),
	h4("The shape of the line",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app82_select1",
                                "",
                                choices = list(
    'The shape of the line' = c(`Linear` = "linear",
                   `Cubic` = "cubic",
				   `Quintic` = "quintic",
                   `Arctangent` = "arctangent",
				   `Sigmoid` = "sigmoid"
				   ))))),
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app82_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
