appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app91.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Waterfall Chart")), h4("Waterfall charting with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app91_fileupload",
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
                                inputId="app91_inputFile1",
                                label = "",
                                accept = c('text/csv',
                                           'text/comma-separated-values,text/plain',
                                           '.txt',
										   '.maf')
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
                            href = "app91/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app91/data.zip")))),

h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),

h4("Color",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
		colourInput("app91_text1", "", value = "#8DD3C7"),
		colourInput("app91_text2", "", value = "#FFFFB3"),
		colourInput("app91_text3", "", value = "#BEBADA"),
		colourInput("app91_text4", "", value = "#FB8072"),
		colourInput("app91_text5", "", value = "#80B1D3"),
		colourInput("app91_text6", "", value = "#FDB462"),
		colourInput("app91_text7", "", value = "#B3DE69"),
		colourInput("app91_text8", "", value = "#FCCDE5"))),
h4("Sample name font size",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app91_text9", "","0.5", width = "180px",height="40px"))),
h4("Show how many significant genes",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app91_text10", "","20", width = "180px",height="40px"))),

h4("Site Selection",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app91_select1",
                                "",
                                choices = list(
                               'Site Selection' = c(`false` = "false",
											  `true` = "true")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),
h4("Adding statistical graphics",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app91_select2",
                                "",
                                choices = list(
                               'Adding statistical graphics' = c(`Row and column statistics` = "0",
												  `row` = "1",
												  `column` = "2")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""))),

h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app91_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
