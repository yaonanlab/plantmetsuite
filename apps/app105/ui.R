appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app105.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("MS1plot")), h4("Plotting MS1plot with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app105_fileupload",
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
                                inputId="app105_inputFile1",
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
                            href = "app105/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app105/data.zip")))),						
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Color (automatic color series generation)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app105_text1", "", value = "#ACCD03"),
							colourInput("app105_text2", "", value = "#E07EA0"),
							colourInput("app105_text3", "", value = "#FFD101"),
							colourInput("app105_text4", "", value = "#5EBED6"),
							colourInput("app105_text5", "", value = "#776AAE"))),
h4("Transparency",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text6", "","0.5", width = "180px",height="40px"))),
h4("Title",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text7", "","Plot", width = "180px",height="40px"))),
h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text8", "","rt", width = "180px",height="40px"))),
h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text9", "","mz", width = "180px",height="40px"))),
h4("Distribution range of points (maximum)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text10", "","30", width = "180px",height="40px"))),
h4("Range of distribution of points (minimum)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app105_text11", "","1", width = "180px",height="40px"))),
h4("Data point shape",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app105_select1","",
                                choices = list(
                               'Data point shape' = c(`Round` = "21",
												`Square` = "22")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("Coloring basis",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app105_select2","",
                                choices = list(
                               'Coloring basis' = c(`group` = "2",
											  `value` = "6")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("Add Tags",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app105_select3","",
                                choices = list(
                               'YESNO添加标签' = c(`NO` = "1",
												  `YES` = "0")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),

		
													
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app105_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
