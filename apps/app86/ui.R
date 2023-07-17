appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app86.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("3D scatter plot")), h4("Plotting 3D scatter plots with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app86_fileupload",
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
                                inputId="app86_inputFile1",
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
                            href = "app86/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app86/data.zip")))),

							
h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),

h4("Color Fill",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
		colourInput("app86_text1", "", value = "#ACCD03"),
		colourInput("app86_text2", "", value = "#E07EA0"),
		colourInput("app86_text3", "", value = "#FFD101"),
		colourInput("app86_text4", "", value = "#5EBED6"),
		colourInput("app86_text5", "", value = "#776AAE"))),
h4("View Angle",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app86_text6", "","60", width = "180px",height="40px"))),
h4("Title",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app86_text7", "","Plot", width = "180px",height="40px"))),
h4("Size of the point (please enter a positive integer)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app86_text8", "","2", width = "180px",height="40px"))),

h4("Display outer frame line",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app86_select1",
                                "",
                                choices = list(
                               'Display outer frame line' = c(`YES` = "true",
													`NO` = "false")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("The shape of the point",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app86_select2",
                                "",
                                choices = list(
                               'The shape of the point' = c(`According to the grouping` = "0",
											  `Not based on grouping` = "1")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("Color of dots",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app86_select3",
                                "",
                                choices = list(
                               'Color of dots' = c(`According to the grouping` = "0",
											  `Not based on grouping` = "1")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),

h4("Data point display",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app86_select4",
                                "",
                                choices = list(
                               'Data point display' = c(`point` = "p",
												`line` = "l",
												`both` = "h")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("Add regression plane",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app86_select5",
                                "",
                                choices = list(
                               'Add regression plane' = c(`YES` = "0",
													  `NO` = "1")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),

h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app86_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
