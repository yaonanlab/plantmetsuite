appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app94.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Mass spectrometry peak extraction")), h4("Extraction of mass spectrometry peaks from mass spectrometry data"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app94_fileupload",
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
							"),br(),
h4("Select data: (any format)",style="text-align: left;font-weight: 1000;"),
	fluidRow(column(width=5,fileInput(
        inputId="app94_inputFile1",
        label = "",
        accept = NULL,
		multiple=TRUE)
		),
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
                            href = "app94/sample.raw"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app94/data.zip")))),
h4("ppm value for peak-to-peak comparison",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text1", "","15", width = "180px",height="40px"))),	
h4("Peak width (left side of the range, usually ranging from 5 to 30)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text2", "","5", width = "180px",height="40px"))),
h4("Peak width (right side of the range, typically ranging from 5-30)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text3", "","30", width = "180px",height="40px"))),		
h4("Signal-to-noise ratio threshold",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text4", "","5", width = "180px",height="40px"))),			
h4("Noise Threshold",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text5", "","500", width = "180px",height="40px"))),		
h4("Percentage threshold",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app94_text6", "","0.5", width = "180px",height="40px"))),

h4("Mode",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app94_select1",
                                "",
                                choices = list(
                               'Percentage threshold' = c("positive"="positive" ,
											  "negative"="negative")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),

h4("Output TIC",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app94_select2",
                                "",
                                choices = list(
                               'Output TIC' = c("YES"="TRUE" ,"NO"="FALSE")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),							

h4("Output BPC",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app94_select3",
                                "",
                                choices = list(
                               'Output BPC' = c("YES"="TRUE" ,"NO"="FALSE")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
h4("Output RT dev",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app94_select4",
                                "",
                                choices = list(
                               'Output RT dev' = c("YES"="TRUE" ,"NO"="FALSE")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
h4("Fill na",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app94_select5",
                                "",
                                choices = list(
                               'Fill na' = c("YES"="TRUE" ,"NO"="FALSE")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),

h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),	
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app94_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
actionButton(inputId = "send_button",
             label = "Submit",
             styleclass = "info",
			 style = "color: white; 
                       background-color: #7472d0; 
                       position: relative; 
                       height: 50px;
                       width: 100px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"),

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
