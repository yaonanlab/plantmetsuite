appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app95.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Partial sequence matching")), h4("Local sequence matching tool based on blast+"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app95_fileupload",
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
                            width: 240px;
							text-align:center;
							margin-left: 0px;
                            margin-right: 0px;
                            padding: 0px;
      }
							"),br(),h4("Select the database：fasta、fna",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app95_inputFile1",
                                label = "",
                                accept = NULL)),
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
                            href = "app95/data_1.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app95/data.zip")))),
						h4("Select the target：fasta、txt",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app95_inputFile2",
                                label = "",
                                accept = NULL
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
                            href = "app95/data_2.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app95/data.zip")))),								
							h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
							br(),
h4("Software",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app95_select1",
                                "",
                                choices = list(
                               'Software' = c("blastn"="blastn" ,
												  "blastp"="blastp",
												  "blastx"="blastx" ,
												  "tblastn"="tblastn",
												  "tblastx"="tblastx")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
h4("Database Type",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app95_select2",
                                "",
                                choices = list(
                               'Database Type' = c("核苷酸数据库"="nucl" ,
													"氨基酸数据库"="prot")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
h4("Output Format",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app95_select3",
                                "",
                                choices = list(
                               'Output Format' = c("0 Pairwise" = "0",
											"1 Query-anchored showing identities" = "1",
											"2 Query-anchored no identities" = "2",
											"3 Flat query-anchored showing identities" = "3",
											"4 Flat query-anchored no identities" = "4",
											"5 XML Blast output" = "5",
											"6 Tabular" = "6",
											"7 Tabular with comment lines" = "7",
											"8 Text ASN.1" = "8",
											"9 Binary ASN.1" = "9",
											"10 Comma-separated values" = "10",
											"11 BLAST archive (ASN.1)" = "11",
											"12 JSON Seqalign output" = "12",
											"13 JSON Blast output" = "13",
											"14 XML2 Blast output" = "14")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),							


h4("Expected value (enter a number, scientific notation is available)",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(column(width=2,textAreaInput("app95_text1", "","1e-5", width = "180px",height="40px"))),	
							
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app95_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
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
