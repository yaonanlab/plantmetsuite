appUI<-function(x){
renderUI({
    div(style = "position: relative; backgroundColor: #ecf0f5",
        tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app103.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("OPLS-DA")), h4("OPLS-DA analysis using tabular data"),style="text-align: center;display:inline;",
		  h4("Required fields",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app103_fileupload",
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
      }"),br(),
h4("Select data：txt(tabular separator)、csv、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app103_inputFile1",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View Data Format", class = "action-button", 
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
		vertical-align:middle;"), 
		target = "_blank",
        href = "app103/data.txt"),a(h4("Get sample data", class = "action-button", 
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
		vertical-align:middle;"), target = "_blank",
        href = "app103/data.zip")))),						
h4("Select group data：txt(tabular separator)、csv、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app103_inputFile2",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xlsx'))),
    column(width=2,column(width=12,a(h4("View Data Format", class = "action-button", 
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
		vertical-align:middle;"), 
		target = "_blank",
        href = "app103/group.txt"),a(h4("Get sample data", class = "action-button", 
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
		vertical-align:middle;"), target = "_blank",
        href = "app103/data.zip")))),

h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),
					
	h4("VIP cutoff",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app103_text1", "","1", width = "180px",height="40px"))),

	
h4("Send results to email upon completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app103_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
