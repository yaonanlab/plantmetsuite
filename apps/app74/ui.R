appUI<-function(input,output){
    renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app74.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("SAMfileFLAG")), h4("Interpreting the FLAG value of sequence comparison SAMfile"),style="text-align: center;display:inline;",

		  div(id = "app74_fileupload",
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
							br(),	
h4("工具说明：",style="text-align: left;font-weight: 1000;color:black"),br(),	
		  p("You can enter the value in the input box to see the corresponding explanation, or you can check the explanation to see the corresponding number。",style="text-align: left;font-weight: 800;color:black"),	
		  p("Equivalent to "binary number conversion" + "interpretation matching"。",style="text-align: left;font-weight: 800;color:black"),	
		  p("The tool has English equivalents, which are briefly translated and basic concepts are explained here. For reference only.",style="text-align: left;font-weight: 800;color:black"),	
		  p("FLAG: 0 means positive chain, 16 means negative chain, 4 means no comparison on. The following is a detailed comparison:",style="text-align: left;font-weight: 800;color:black"),
br(),		  
		  p("FLAG value Meaning",style="text-align: left;font-weight: 800;color:black"),	
		  p("1 The read is one of the paired paired reads",style="text-align: left;font-weight: 800;color:black"),
		  p("2 Each of the paired reads is correctly aligned to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("4 The read is not compared to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("8 The matepair read paired with this read is not compared to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("16 The read whose reverse complementary sequence can be compared to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("32 Matepair reads paired with this read whose reverse complementary sequences can be compared to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("64 In the paired reads, the first entry of this read compared to the reference sequence",style="text-align: left;font-weight: 800;color:black"),
		  p("128 In the paired reads, the second of this read compared to the reference sequence条",style="text-align: left;font-weight: 800;color:black"),
		  p("256 This read suboptimal comparison results",style="text-align: left;font-weight: 800;color:black"),
		  p("512 The read did not pass quality control",style="text-align: left;font-weight: 800;color:black"),
		  p("1024 Duplicate reads due to PCR or sequencing errors",style="text-align: left;font-weight: 800;color:black"),
		  p("2048 Additional matching reads",style="text-align: left;font-weight: 800;color:black"),							
div(style="text-align: center;font-weight: 1000;color:red"),
							actionButton(
                 inputId = "send_button",
                 label = "Start reading",
                 styleclass = "info",
				 onclick ="window.open('app74/samflag.html', '_blank')",				 
				 style = "color: white; 
                       background-color: #7472d0; 
                       position: relative; 
                       height: 50px;
                       width: 100px;
                       text-align:center;
                       border-radius: 6px;
                       border-width: 2px"
               )
			   
 	   
        )
		  )
		  
        )
      )
    )
  })
}
