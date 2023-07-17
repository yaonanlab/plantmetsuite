appUI<-function(input,output){
    renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_input",
        width = NULL,
        height = NULL,
        tabPanel(
          title = img(src = 'app37.png', height = '40px', width = '40px',style="display: inline;"),
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;display:inline;"
          ),div(h3(strong("动态序列比对图")), h4("动态生成个性化序列比对图"),style="text-align: center;display:inline;",
          br(),
		  h4("数据格式",style="text-align: left;font-weight: 1000;color:blue"),
		  div(id = "app37_fileupload",
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
							fluidRow(
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
                            href = "app37/sequence.txt"),a(h4("Download sample data", class = "action-button", 
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
                            href = "app37/sequence.zip")))),br(),
		  h4("使用方式：",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("1.把序列比对的alnfile拖动到右边窗口",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("2.修改排序、进行序列过滤",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("3.选择需要选择的元件",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("4.在元件按钮下的“Show scale slider”修改序列展示窗口大小",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("5.选择配色方案",style="text-align: left;font-weight: 1000;color:black"),	
		  h4("6.导出结果",style="text-align: left;font-weight: 1000;color:black"),			  
 div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:red;",
		#h4(strong(textOutput("taskjobid"), align='center')),
		),div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:green;",
		#h4(strong(textOutput("taskjobidinfo"), align='center'))
		)		   
        )
		  )
		  
        )
      )
    )
  })
}
