appResult<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_info",
        width = NULL,
        height = 100,
		tabPanel(
          title = "Analysis results",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),
		  		  div(style="text-align:center;",fluidRow(column(11, br(),span(strong("Color example"),style="font-size:20px;text-align:center;"),br(),br(),img(src = "app102/RColorBrewer.png", height = 100),br()))),
		  div(style="text-align:center;",fluidRow(column(11, br(),span(strong("Plotting area"),style="font-size:20px;text-align:center;"),br()))), 
		  br(),
		  fluidRow(column(11,
									
                                    div(class = "thumbnail",
									plotOutput("result", height = "600px"))#,
                                    # downloadButton("downloadpng", label = "下载png格式结果",style= "color: white;background-color: #7472d0;"),
                                    # downloadButton("downloadpdf", label = "下载pdf格式结果",style= "color: white;background-color: #7472d0;"),
                                    # downloadButton("downloadsvg", label = "下载svg格式结果",style= "color: white;background-color: #7472d0;")
                                )
        ),
		div(style="text-align:center;
        position:relative;
		text-align: left;
		color:green;",
		h4(strong("Please enter the task number to view the status of the task, if the analysis is completed, you can click the button to download the analysis results", align='left'))
		),
		textInput("jobidinput2", "", ""),
		downloadButton("downloadjob2", label = "Download Analysis Results",style= "color: white;background-color: #7472d0;"),
		div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:red;",
		h4(strong(textOutput("taskjobidcheck2"), align='left'))
		#添加observe？
		)
		),
		
        tabPanel(
          title = "Video Tutorials",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app102/video.html"))
        )),tabPanel(
          title = "Instructions",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app102/manual.html"))
        )),tabPanel(
          title = "FAQ",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app102/question.html"))
        ))
      )
    )
  })  
}
