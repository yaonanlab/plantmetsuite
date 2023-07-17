appUI<-function(input,output){
    renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app76.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Missing value handling")), h4("Batch processing of missing values in tables"),style="text-align: center;display:inline;",
		h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app76_fileupload",
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
		h4("Select the table data to be calculated：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app76_inputFile1",
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
                            href = "app76/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app76/data.zip")))),br(),
							
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Missing value form",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app76_select1",
                                "",
                                choices = list(
    'Missing value form' = c(`NA` = "NA",
                         `Null value` = "nul",
                         `0` = "0",
						 `Space` = " ",
						 `-` = "-",
					     `Other` = "5")),
                                multiple = F,
								width='180px',
                                options = list(placeholder = ''),
                                selected = ""
                            ))),	

div(id = 'app76_button1_info1',
h4("Please enter the missing value form：",style="text-align: left;font-weight: 1000;")),
div(id = 'app76_button1',
br(),
fluidRow(column(width=2,textAreaInput("app76_text1", "","NULL", width = "180px",height="40px")))),

h4("Missing value option",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app76_select2",
                                "",
                                choices = list(
    'Missing value option' = c(`1 Filter by missing percentage` = "1",
						   `2 Exclusion of data with missing values` = "5",
						   `3 Filtering by relative standard deviationOrder` = "14",
						   `4 According to the non-parametric relative standard deviation` = "15",
						   `5 Filter by standard deviationOrder` = "16",
						   `6 Filter by median absolute deviationOrder` = "17",
						   `7 Filter by median Order` = "18",
						   `8 Filter by average Order` = "19",
						   `9 Filter by quantile range Order` = "20",
						   `10 Fill with the minimum value of each column` = "6",
						   `11 Fill with the average of each column` = "7",
						   `12 Fill with the median of each column` = "8",		
                           `13 Fill with the minimum value of one-half` = "2",
						   `14 Fill with the minimum value of one-fifth` = "3",
						   `15 Fill with the smallest tenth of the value` = "4",
						   `16 Fill by variable using k-nearest neighbor method` = "9",
						   `17 Filling by sample using k-nearest neighbor method` = "10",
						   `18 Filling with Bayesian PCA method` = "11",
						   `19 Filling with probabilistic PCA method` = "12",
						   `20 Filling with singular value decomposition estimation method` = "13"
)),
                                multiple = F,
								width='360px',
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
	
div(id = 'app76_button2_info1',
h4("Please enter the missing percentage：",style="text-align: left;font-weight: 1000;")),						
div(id = 'app76_button2',
br(),
fluidRow(column(width=2,textAreaInput("app76_text2", "","0.2", width = "180px",height="40px")))),	
	
	  h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app76_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
