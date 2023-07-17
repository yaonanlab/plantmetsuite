appUI<-function(input,output){
    renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app116.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("MultiGroupTest")), h4("Testing and post-hoc testing of multiple sets of data and plotting"),style="text-align: center;display:inline;",
		h4("Required fields",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app116_fileupload",
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
                            width: 250px;
							text-align:center;
							margin-left: 0px;
                            margin-right: 0px;
                            padding: 0px;
      }
							"),br(),
		h4("Select the table data to be examined：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app116_inputFile1",
                                label = "",
                                accept = c('text/csv',
                                           'text/comma-separated-values,text/plain',
                                           '.txt',
										   '.csv',
										   '.xls',
										   '.xlsx')
                            )),
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
					   vertical-align:middle;
					   "), target = "_blank",
                            href = "app116/data.txt"),a(h4("Get sample data", class = "action-button", 
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
                            href = "app116/data.zip")))),br(),
							
h4("Graphics Options",style="text-align: left;font-weight: 1000;color:blue"),br(),
	h4("Graphic color",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app116_text1", "", value = "#D43338"),
		colourInput("app116_text2", "", value = "#FFD101"),
		colourInput("app116_text3", "", value = "#ACCD03"),
		colourInput("app116_text4", "", value = "#5EBED6"),
		colourInput("app116_text5", "", value = "#776AAE"))),
	h4("Drawing Type",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app116_select1",
                                "",
                                choices = list(
    'Drawing Type' = c(`Box diagram` = "0",
                   `Histogram` = "1"))))),
	h4("Multi-group test method",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app116_select2",
                                "",
                                choices = list(
    'Multi-group test method' = c(`Kruskal-Wallis` = "0",
					   `ANOVA` = "1"))))),
	h4("Post-test method",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(align = "left",column(12,selectizeInput(
                                "app116_select3",
                                "",
                                choices = list(
    'Post-test method' = c(`Nemenyi` = "0",
					   `TukeyHSD` = "1"))))),


h4("Send results to email upon completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app116_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
      
    ))
  })
}
