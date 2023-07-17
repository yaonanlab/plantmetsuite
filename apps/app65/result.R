appResult<-function(x){
renderUI({
    div(
      style = "position: relative; backgroundColor: #ecf0f5",
      tabBox(
        id = "box_info",
        width = NULL,
        height = 100,
		tabPanel(
          title = "Result",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),
		  		  div(style="text-align:center;",fluidRow(column(11, br(),span(strong("Example result"),style="font-size:20px;text-align:center;"),br(),br(),img(src = "app65/app65.png", height = 300),br()))),
		  div(style="text-align:center;",fluidRow(column(11, br(),span(strong("Plotting area"),style="font-size:20px;text-align:center;"),br()))), 
		  br(),

		  fluidRow(column(11,
									
                                    div(class = "thumbnail",
									plotOutput("result", height = "600px")),
                                    downloadButton("downloadpng", label = "png format",style= "color: white;background-color: #7472d0;"),
                                    downloadButton("downloadpdf", label = "pdf format",style= "color: white;background-color: #7472d0;"),
                                    downloadButton("downloadsvg", label = "svg format",style= "color: white;background-color: #7472d0;")
                                )
        )),
        tabPanel(
          title = "Video Tutorials",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app65/video.html"))
        )),tabPanel(
          title = "Instructions",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app65/manual.html"))
        )),tabPanel(
          title = "FAQ",
          div(
            style = "position: absolute; left: 0.5em; bottom: 0.5em;"
          ),fluidRow(column(11,includeHTML("apps/app65/question.html"))
        ))
      )
    )
  })  
}
