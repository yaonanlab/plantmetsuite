appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app59.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("MA Chart")), h4("Plotting MA graphs with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app59_fileupload",
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
							"),
														   tags$style(HTML(".js-irs-0 .irs-bar {border-top-color: #6b6db1;border-bottom-color: #6b6db1;} .js-irs-0 .irs-bar-edge {border-color: #6b6db1;}.js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #6b6db1;}")),					   
							   tags$style(HTML(".js-irs-1 .irs-bar {border-top-color: #cd9c7c;border-bottom-color: #cd9c7c;} .js-irs-1 .irs-bar-edge {border-color: #cd9c7c;}.js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #cd9c7c;}")),					   
							   tags$style(HTML(".js-irs-2 .irs-bar {border-top-color: #70aaba;border-bottom-color: #70aaba;} .js-irs-2 .irs-bar-edge {border-color: #70aaba;}.js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {background: #70aaba;}")),					   
							   tags$style(HTML(".js-irs-3 .irs-bar {border-top-color: #bd729c;border-bottom-color: #bd729c;} .js-irs-3 .irs-bar-edge {border-color: #bd729c;}.js-irs-3 .irs-single, .js-irs-3 .irs-bar-edge, .js-irs-3 .irs-bar {background: #bd729c;}")),br(),h4("Select the data to be uploaded:txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app59_inputFile1",
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
                            href = "app59/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app59/data.zip")))),						
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Color of the upper tone point",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app59_text1", "", value = "#B31B21"),
							)),
h4("The color of the downward point",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app59_text2", "", value = "#1465AC"),
							)),
h4("Color with no point of difference",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app59_text3", "", value = "darkgray"),
							)),							
h4("Title",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text6", "","Plot", width = "180px",height="40px"))),
h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text7", "","x", width = "180px",height="40px"))),
h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text8", "","y", width = "180px",height="40px"))),

h4("FDR",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text9", "","0.05", width = "180px",height="40px"))),
h4("FoldChange",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text10", "","2", width = "180px",height="40px"))),
h4("Size of the point",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text11", "","0.4", width = "180px",height="40px"))),
h4("Showing the most significant number of genes",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app59_text12", "","20", width = "180px",height="40px"))),
h4("Significant Indicators",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app59_select1",
                                "",
                                choices = list('显著指标' = c(`foldchange` = "fc",`p.adjust` = "padj")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),													
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app59_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
