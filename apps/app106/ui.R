appUI<-function(x){
renderUI({
    div(style = "position: relative; backgroundColor: #ecf0f5",
        tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app106.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Ms2Plot")), h4("Plotting Ms2Plot using tables"),style="text-align: center;display:inline;",
		  h4("Required fields",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app106_fileupload",
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
	h4("Drawing Type",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
        "app106_select1",
        "",
        choices = list('Drawing Type' = c(` single Ms2Plot` = "0",`compare Ms2MatchPlot` = "1"))))),
		
h4("Upload data: txt (tab separated)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app106_inputFile1",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View Data Format", class = "action-button", 
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
        href = "app106/spectrum1.txt"),a(h4("Get sample data", class = "action-button", 
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
        href = "app106/data.zip")))),		
div(id = 'app106_button1_info1',
h4("Upload grouped data: txt (tab separated)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")),
div(id = 'app106_button1',
fluidRow(column(width=5,fileInput(
    inputId="app106_inputFile2",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View sample Format", class = "action-button", 
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
        href = "app106/spectrum2.txt"),a(h4("Get sample data", class = "action-button", 
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
        href = "app106/data.zip"))))),

															  
h4("Data Options",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Ms2 mass-to-charge ratio range of mass spectra (lower limit)",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app106_text1", "","90", width = "180px",height="40px"))),
	h4("Ms2 mass-to-charge ratio range of mass spectra (upper limit)",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app106_text2", "","120", width = "180px",height="40px"))),
	
	h4("Ms2 fragment matching ppm",style="text-align: left;font-weight: 1000;color:black"),	
	fluidRow(column(width=2,textAreaInput("app106_text3", "","30", width = "180px",height="40px"))),
	
	h4("Threshold value for mass-to-charge ratio error calculation",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app106_text4", "","400", width = "180px",height="40px"))),
	
h4("Appearance Options",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Fill Color",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app106_text5", "", value = "#776AAE"),
		colourInput("app106_text6", "", value = "#5EBED6"))),	
	h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app106_text7", "","Mass to charge ratio (m/z)", width = "180px",height="40px"))),
	h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app106_text8", "","Relative intensity", width = "180px",height="40px"))),
	
	
h4("Send results to email upon completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app106_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
