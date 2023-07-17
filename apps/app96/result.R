appResult<-function(input,output){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_info",
        width = NULL,
        height = 100,
		 tabPanel(
          title = "Result",
		  br(),
		  div(style="text-align:center;
        position:relative;
		text-align: left;
		color:blue;",h4(strong("The analysis will be completed in tens of seconds to minutes, depending on the size of the data.", align='left')),br()),div(style="text-align:center;
        position:relative;
		text-align: left;
		color:green;",
		h4(strong("Please enter the task number to view the status of the task, if the analysis is completed, you can click the button to download the analysis results", align='left'))
		),
		  textInput("jobidinput2", "", ""),
		  downloadButton("downloadjob2", label = "Download",style= "color: white;background-color: #7472d0;"),
		  div(style="text-align:center;
        padding-top:10px;
        position:relative;
		text-align: left;
		color:red;",
		h4(strong(textOutput("taskjobidcheck2"), align='left'))
		)
        ),
        tabPanel(
          title = "Video Tutorials",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app96/video.html"))
        )),tabPanel(
          title = "Instructions",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app96/manual.html"))
        )),tabPanel(
          title = "FAQ",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app96/question.html"))
        ))
      )
    )
  })  

}
