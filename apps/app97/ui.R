appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app97.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("MetAnno")), h4("Perform metabolite identification based on MS1 and MS2 data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app97_fileupload",
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
      }
							"),br(),h4("Select the ms1 data：xls、csv、txt",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app97_inputFile1",
                                label = "",
                                accept = c('.xls',
										   '.csv',
										   '.txt'
										   )
                            )),
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
					   vertical-align:middle;
					   "), target = "_blank",
                            href = "app97/data.csv"),a(h4("Download sample data", class = "action-button", 
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
					   vertical-align:middle;
					   "), target = "_blank",
                            href = "app97/data.zip")))),
						h4("Select the ms2 data：mgf、msp",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app97_inputFile2",
                                label = "",
                                accept = c('.mgf',
                                           '.msp'),multiple = TRUE
                            )),
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
					   vertical-align:middle;
					   "), target = "_blank",
                            href = "app97/data.mgf"),a(h4("Download sample data", class = "action-button", 
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
					   vertical-align:middle;
					   "), target = "_blank",
                            href = "app97/data.zip")))),								
					h4("",style="text-align: left;font-weight: 1000;color:blue"),
					br(),
					h4("Mode",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,selectizeInput("app97_select1",
               "",
               choices = list(
    'Mode' = c(`positive` = "positive",
                  `negative` = "negative")),
               multiple = F,
               options = list(placeholder = ''),
               selected = ""
                            ))),	
h4("Database",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,selectizeInput("app97_select2",
               "",
               choices = list(
    'Database' = c(`Standard database` = "Standard database",
	               `Public database` = "Public database",
				   `MS2T database` = "MS2T database",
                  `All database` = "All database")),
               multiple = F,
               options = list(placeholder = ''),
               selected = ""
                            ))),		
h4("RT scoring",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,selectizeInput("app97_select3",
               "",
               choices = list(
    'RT scoring' = c(`FALSE` = "0",
                  `TRUE` = "1")),
               multiple = F,
               options = list(placeholder = ''),
               selected = ""
                            ))),	
h4("MS/MS scoring method",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,selectizeInput("app97_select4",
               "",
               choices = list(
    'MS/MS scoring method' = c(`both` = "both",
	               `forward` = "forward",
	               `reverse` = "reverse"
                  )),
               multiple = F,
               options = list(placeholder = ''),
               selected = ""
                            ))),
                    h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),							
					h4("m/z tolerance",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,textAreaInput("app97_text1", "","25", width = "180px",height="40px"))),
					h4("MS/MS tolerance",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,textAreaInput("app97_text2", "","10", width = "180px",height="40px"))),
					h4("Score cutoff",style="text-align: left;font-weight: 1000;color:black"),
					fluidRow(column(width=12,textAreaInput("app97_text3", "","0.6", width = "180px",height="40px"))),
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app97_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
