appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app5.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Volcano map")), h4("Volcano map"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app5_fileupload",
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
							"),br(),h4("Select the data to be uploaded:txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app5_inputFile",
                                label = "",
                                accept = c('text/csv',
                                           'text/comma-separated-values,text/plain',
                                           '.txt',
										   '.csv',
										   '.xls',
										   '.xlsx')
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
                            href = "app5/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app5/data.zip")))),
h4("FoldChange column",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app5_text1", "","2", width = "90px",height="40px"))),	
h4("Have logFoldChange",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app5_select1",
                                "",
                                choices = list(
    'Is log2FC data' = c(`YES` = "yes",
	               `NO` = "no")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = NULL
                            ))),						
h4("Pvalue column",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app5_text2", "","3", width = "90px",height="40px"))),							
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
							h4("Color (up point/down point/no change point/reference line)",style="text-align: left;font-weight: 1000;color:black"),
							colourInput("app5_text3", "", value = "#ed6464"),
							colourInput("app5_text4", "", value = "#6764ed"),
							colourInput("app5_text5", "", value = "#C0C0C0"),
							colourInput("app5_text6", "", value = "#98FB98"),
h4("Size of the point",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app5_text7", "","0.5", width = "90px",height="40px"))),
h4("Reference line thickness",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app5_text8", "","1", width = "90px",height="40px"))),	
h4("Reference line",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app5_select2",
                                "",
                                choices = list(
    'Reference line' = c(`YES` = "yes",
	               `NO` = "no")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = NULL
                            ))),		
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app5_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
