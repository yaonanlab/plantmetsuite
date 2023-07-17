appUI<-function(input,output){
    renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app75.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Standardized Normalization")), h4("Normalization or normalization of tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app75_fileupload",
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
							"),br(),h4("Select the table data to be calculated：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app75_inputFile1",
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
                            href = "app75/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app75/data.zip")))),br(),
							
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("标准化归一化方法",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app75_select1",
                                "",
                                choices = list(
    'Standardized normalization methods' = c(`1 Quantile normalization` = "1",
                           `2 Probability quotient normalization according to the reference group` = "2",
						   `3 Probability quotient standardization based on reference samples` = "3",
						   `4 Probability quotient normalization based on reference features` = "4",
						   `5 Standardization based on sample sums` = "5",
						   `6 Standardization according to median of samples` = "6",
						   `7 Standardization based on sample information` = "7",
						   `8 Perform Log2 transform normalization` = "8",
						   `9 Perform Log10 transformation standardization` = "9",
						   `10 Perform square root transformation normalization` = "10",
						   `11 Perform cube root transformation normalization` = "11",
						   `12 Performing mean-centeredness` = "12",
						   `13 Perform Z-score normalization` = "13",
						   `14 Perform Pareto standardization` = "14",
						   `15 Perform mean normalization (normalization)` = "15",
						   `16 Perform Min-max normalization (normalization)` = "16")),
                                multiple = F,
								width='180px',
                                options = list(placeholder = ''),
                                selected = ""
                            ))),	
div(id = 'app75_button1_info1',
h4("Select the Grouping Information",style="text-align: left;font-weight: 1000;")),
div(id = 'app75_button1_info2',
h4("Select the Sample information (e.g. sampling volume, etc.)",style="text-align: left;font-weight: 1000;")),
div(id = 'app75_button1',
		fluidRow(column(width=5,fileInput(
                                inputId="app75_inputFile2",
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
                            href = "app75/group.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app75/data.zip"))))),
							br(),
div(id = 'app75_button2_info1',
h4("Please enter a reference group",style="text-align: left;font-weight: 1000;")),	
div(id = 'app75_button2_info2',
h4("Please enter a reference sample",style="text-align: left;font-weight: 1000;")),	
div(id = 'app75_button2_info3',
h4("Please enter reference characteristics",style="text-align: left;font-weight: 1000;")),							
div(id = 'app75_button2',							
br(),
fluidRow(column(width=2,textAreaInput("app75_text1", "","ref", width = "180px",height="40px")))),	
	
	  h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app75_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
