appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app48.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Bean Chart")), h4("Bean Chart"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app48_fileupload",
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
                                inputId="app48_inputFile1",
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
                            href = "app48/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app48/data.zip")))),						
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Fill color (choose two colors)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app48_text1", "", value = "#f682af"),
							colourInput("app48_text2", "", value = "#9379e6"),
							)),										
h4("Frame line color (choose two colors)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app48_text3", "", value = "#efb94d"),
							colourInput("app48_text4", "", value = "#77c0c7"),
							)),
h4("Title",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app48_text5", "","Plot", width = "180px",height="40px"))),
h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app48_text6", "","x", width = "180px",height="40px"))),
h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app48_text7", "","y", width = "180px",height="40px"))),
h4("Direction",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app48_select1",
                                "",
                                choices = list(
                               'Direction' = c(`Horizontal` = "TRUE",
                               `Vertical` = "FALSE")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),		
h4("Display of two groups",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app48_select2",
                                "",
                                choices = list(
                               'Display of two groups' = c(`Group` = "no",
                               `Combine` = "b")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),						
							
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app48_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
