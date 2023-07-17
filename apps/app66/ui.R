appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app66.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Broken shaft bar graph")), h4("Plotting broken axis bar graphs with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app66_fileupload",
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
                                inputId="app66_inputFile1",
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
                            href = "app66/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app66/data.zip")))),						
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Color (select color style, auto-adaptation group)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app66_text1", "", value = "#f682af"),
							colourInput("app66_text2", "", value = "#9379e6"),
							colourInput("app66_text3", "", value = "#efb94d"),
							colourInput("app66_text4", "", value = "#77c0c7"),
							colourInput("app66_text5", "", value = "#f26949"))),
h4("First column of data",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text6", "","0", width = "180px",height="40px"))),
h4("Last column of the data",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text7", "","0", width = "180px",height="40px"))),
h4("First column of error",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text8", "","0", width = "180px",height="40px"))),
h4("Last column of error",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text9", "","0", width = "180px",height="40px"))),
h4("Upper breakpoint",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text10", "","9999", width = "180px",height="40px"))),							
h4("Lower breakpoint",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text11", "","0", width = "180px",height="40px"))),
h4("Maximum and minimum data ratio",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text12", "","10", width = "180px",height="40px"))),
h4("Upper Breakpoint Lower Breakpoint Ratio",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text13", "","5", width = "180px",height="40px"))),
h4("Upper section to lower section ratio",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text14", "","1", width = "180px",height="40px"))),
h4("Title",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text15", "","Plot", width = "180px",height="40px"))),
h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text16", "","x", width = "180px",height="40px"))),
h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app66_text17", "","y", width = "180px",height="40px"))),
h4("Breakpoint shape",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app66_select1",
                                "",
                                choices = list(
                               'Breakpoint shape' = c(`Double line segment` = "0",
                               `Pointed Corner` = "1")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),				
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app66_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
