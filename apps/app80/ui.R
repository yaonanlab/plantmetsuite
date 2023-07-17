appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app80.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Transcription-protein nine-quadrant diagram")), h4("Association analysis of transcriptome and proteome for nine-quadrant mapping"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app80_fileupload",
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
h4("Select transcriptome expression data：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app80_inputFile1",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
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
		vertical-align:middle;"), 
		target = "_blank",
        href = "app80/rna.table.txt"),a(h4("Download sample data", class = "action-button", 
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
        href = "app80/data.zip")))),						
h4("Select proteome expression data：txt(tabular separator)、csv、xls、xlsx",style="text-align: left;font-weight: 1000;"),
fluidRow(column(width=5,fileInput(
    inputId="app80_inputFile2",
        label = "",
        accept = c('text/csv',
        'text/comma-separated-values,text/plain',
        '.txt',
		'.csv',
		'.xls',
		'.xlsx'))),
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
		vertical-align:middle;"), 
		target = "_blank",
        href = "app80/pro.table.txt"),a(h4("Download sample data", class = "action-button", 
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
        href = "app80/data.zip")))),

h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
br(),
	h4("Fill color (from top to bottom in the order of nine quadrants of the fill color)",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=12,
		colourInput("app80_text1", "", value = "#776AAE"),
		colourInput("app80_text2", "", value = "#ACCD03"),
		colourInput("app80_text3", "", value = "#776AAE"),
		colourInput("app80_text4", "", value = "#FFD101"),
		colourInput("app80_text5", "", value = "#E95368"),
		colourInput("app80_text6", "", value = "#FFD101"),
		colourInput("app80_text7", "", value = "#776AAE"),
		colourInput("app80_text8", "", value = "#ACCD03"),
		colourInput("app80_text9", "", value = "#776AAE"),
		)),
						
	h4("X-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app80_text10", "","log2 ratio of gene", width = "180px",height="40px"))),
	h4("Y-axis label",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app80_text11", "","log2 ratio of protein", width = "180px",height="40px"))),
	h4("Transcriptome difference ploidy threshold（log2FC）",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app80_text12", "","1", width = "180px",height="40px"))),
	h4("Protein group difference multiplier threshold（log2FC）",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app80_text13", "","1", width = "180px",height="40px"))),
	h4("Size of the point",style="text-align: left;font-weight: 1000;color:black"),
	fluidRow(column(width=2,textAreaInput("app80_text14", "","1", width = "180px",height="40px"))),
	
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app80_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
