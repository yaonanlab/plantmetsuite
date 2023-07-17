appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)

      test <- paste0("http://news.scibite.com/scibites/news.html?q=GENE$","BCRA1")
 
  output$frame <- renderUI({
   my_test <- tags$iframe(src=test, height=600, width=535, frameborder = "no")
    print(my_test)
    my_test
  })
   }


