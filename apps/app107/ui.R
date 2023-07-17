appUI<-function(input,output){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app107.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Heatmap")), h4("Heat map with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app107_fileupload",
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
                                inputId="app107_inputFile",
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
                            href = "app107/heatmap.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app107/heatmap.zip")))),
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
							h4("Color (from low to high)",style="text-align: left;font-weight: 1000;color:black"),
							colourInput("app107_text1", "", value = "#436fa9"),
							colourInput("app107_text2", "", value = "#ffffff"),
							colourInput("app107_text3", "", value = "#d04030"),
h4("字体大小",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app107_text4", "","8", width = "90px",height="40px",))),
							h4("Cluster rows",style="text-align: left;font-weight: 1000;"),
							fluidRow(align = "left",
       column(12,selectizeInput(
                                "app107_select1",
                                "",
                                choices = list(
    'Cluster rows' = c(`yes` = "1",
                  `no` = "0")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Cluster columns",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
	column(12,selectizeInput(
                                "app107_select2",
                                "",
                                choices = list(
    'Cluster columns' = c(`yes` = "1",
                  `no` = "0")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Standardization method",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
    column(12,selectizeInput(
                                "app107_select3",
                                "",
                                choices = list(
    'Standardization method' = c(`none` = "none",`row` = "row",
                  `column` = "column")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Display numbers",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
    column(12,selectizeInput(
                                "app107_select4",
                                "",
                                choices = list(
    'Display numbers' = c(`no` = "0",`yes` = "1"
                  )),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Display row names",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
column(12,selectizeInput(
                                "app107_select5",
                                "",
                                choices = list(
    'Display row names' = c(`yes` = "1",
                  `no` = "0")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Display column names",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
column(12,selectizeInput(
                                "app107_select6",
                                "",
                                choices = list(
    'Display column names' = c(`yes` = "1",
                  `no` = "0")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            )),
							h4("Border",style="text-align: left;font-weight: 1000;margin-left: 18px;"),
column(12,selectizeInput(
                                "app107_select7",
                                "",
                                choices = list(
    'Border' = c(`yes` = "white",
                  `no` = NA)),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))							
				
      ),			
	  h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app107_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
