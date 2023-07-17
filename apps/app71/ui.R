appUI<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app71.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("Gene ID conversion")), h4("Complete conversion of required category IDs based on ID and category"),style="text-align: center;display:inline;",
		  h4("Required field",style="text-align: left;font-weight: 1000;color:red"),
		  div(id = "app71_fileupload",
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
							"),br(),h4("Select the list of IDs to be converted：xls、xlsx、txt、csv",style="text-align: left;font-weight: 1000;")
							,
							fluidRow(column(width=5,fileInput(
                                inputId="app71_inputFile1",
                                label = "",
                                accept = c('.xls',
                                           '.xlsx',
										   '.csv',
										   '.txt')
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
                            href = "app71/count.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app71/data.zip")))),			
					h4("Please select the species",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app71_select1",
                                "",
                                choices = list(
                               'Please select the species' = c("Arabidopsis thaliana"="org.At.tair.db","Bos taurus"="org.Bt.eg.db","Caenorhabditis elegans"="org.Ce.eg.db","Canis familiaris"="org.Cf.eg.db","Drosophila melanogaster"="org.Dm.eg.db","Danio rerio"="org.Dr.eg.db","Escherichia coli K12"="org.EcK12.eg.db","Escherichia coli Sakai"="org.EcSakai.eg.db","Gallus gallus"="org.Gg.eg.db","Homo sapiens"="org.Hs.eg.db","Mus musculus"="org.Mm.eg.db","Macaca mulatta"="org.Mmu.eg.db","Pan troglodytes"="org.Pt.eg.db","Rattus norvegicus"="org.Rn.eg.db","Saccharomyces cerevisiae"="org.Sc.sgd.db","Sus scrofa"="org.Ss.eg.db","Xenopus laevis"="org.Xl.eg.db")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),
					h4("Please select the ID type",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app71_select2",
                                "",
                                choices = list(
                               'Please select the ID type' = c("ARACYC"="ARACYC","ARACYCENZYME"="ARACYCENZYME","ENTREZID"="ENTREZID","ENZYME"="ENZYME","EVIDENCE"="EVIDENCE","EVIDENCEALL"="EVIDENCEALL","GENENAME"="GENENAME","GO"="GO","GOALL"="GOALL","ONTOLOGY"="ONTOLOGY","ONTOLOGYALL"="ONTOLOGYALL","PATH"="PATH","PMID"="PMID","REFSEQ"="REFSEQ","SYMBOL"="SYMBOL","TAIR"="TAIR")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),

					h4("Please select the ID type you need",style="text-align: left;font-weight: 1000;color:black"),
fluidRow(align = "left",column(12,selectizeInput(
                                "app71_select3",
                                "",
                                choices = list(
                               'Please select the ID type you need' = c("ARACYC"="ARACYC","ARACYCENZYME"="ARACYCENZYME","ENTREZID"="ENTREZID","ENZYME"="ENZYME","EVIDENCE"="EVIDENCE","EVIDENCEALL"="EVIDENCEALL","GENENAME"="GENENAME","GO"="GO","GOALL"="GOALL","ONTOLOGY"="ONTOLOGY","ONTOLOGYALL"="ONTOLOGYALL","PATH"="PATH","PMID"="PMID","REFSEQ"="REFSEQ","SYMBOL"="SYMBOL","TAIR"="TAIR")),
                                multiple = F,
                                options = list(placeholder = ''),
                                selected = ""
                            ))),



h4("Optional",style="text-align: left;font-weight: 1000;color:blue"),
					br(),	
h4("Send results to email after completion",style="text-align: left;font-weight: 1000;color:red"),
div(textAreaInput("app71_email", "","", width = "100%",height="40px"),style="text-align: center;font-weight: 1000;color:red"),
							actionButton(
                 inputId = "send_button2",
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
