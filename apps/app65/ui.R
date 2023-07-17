appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app65.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Circos Relationship Chart")), h4("Plotting Circos relationships with tabular data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app65_fileupload",
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
                                inputId="app65_inputFile1",
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
                            href = "app65/data.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app65/data.zip")))),						
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Block Color (select color style, auto-adaptation group)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=12,
							colourInput("app65_text1", "", value = "#f682af"),
							colourInput("app65_text2", "", value = "#9379e6"),
							colourInput("app65_text3", "", value = "#efb94d"),
							colourInput("app65_text4", "", value = "#77c0c7"),
							colourInput("app65_text5", "", value = "#f26949"))),
							
h4("Transparency",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app65_text11", "","0.5", width = "180px",height="40px"))),
h4("Large notch width",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app65_text12", "","20", width = "180px",height="40px"))),
h4("Small notch width",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app65_text13", "","5", width = "180px",height="40px"))),
h4("Note Information",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app65_select1",
                                "",
                                choices = list(
                               'Note Information' = c(`Names and blocks with coordinates` = "0",
                               `Names and Blocks` = "1",`Block` = "2",`No comment` = "3")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),				
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app65_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
