appResult<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_info",
        width = NULL,
        height = NULL,
		tabPanel(
          title = "Result",
            htmlOutput("msa")),
        tabPanel(
          title = "Video Tutorials",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app37/video.html"))
        )),tabPanel(
          title = "Instructions",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app37/manual.html"))
        )),tabPanel(
          title = "FAQ",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app37/question.html"))
        ))
      )
    )
  })  
}
