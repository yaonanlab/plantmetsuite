appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
   # if(!is.null(input$app37_inputFile1)){
	load("userdata/jobid")
	load("userdata/taskid")
	jobid <- jobid + 1
	taskidnow<-taskid$id[jobid]
    dir.create(file.path("userdata",taskidnow))
    dir.create(file.path("userdata",taskidnow,"rawdata"))	
    dir.create(file.path("userdata",taskidnow,"result"))	
	dir.create(file.path("userdata",taskidnow,"cmd"))
	job.path.raw<-job.path$data<-file.path("userdata",taskidnow)
	job.path$data<-attach.file <- file.path("userdata",taskidnow,"result.zip")
	output$taskjobid<-renderText({paste("Your taskID is:", taskidnow)})
	output$taskjobidinfo<-renderText({paste("Please note down the task number and you can download the analysis results using the task number on the result download page on the left after the analysis is completed.","The analysis results will be retained for 24 hour, after which they will be automatically deleted, so please download them in time.！")})
	save(jobid,file="userdata/jobid")
	temp.file1 <- input$app37_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	file.copy(temp.file1,file.path("userdata",taskidnow,"result"))
	filename1<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename1)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1), file.path("userdata",taskidnow,"rawdata",filename1new))
	filename2<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="1")
	filename3<-list.files(file.path("userdata",taskidnow,"result"),pattern="0")
	filename2new<-gsub("0","data",filename1)
	file.rename(file.path("userdata",taskidnow,"result",filename3), file.path("userdata",taskidnow,"result",filename2new))
	
	#output$msa <- renderMsaR(msaR(filename2))
	 output$msa <- renderUI({
     tags$iframe(src=isolate("https://www.keyandaydayup.com/msa.html"), height=600, width=950)
     })
    #output$msa= renderPlot({plot(1,1)}) 
#mycmdfirst<-paste(taskidnow,app37_email,sep="' '")
#mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app37/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
#system(mycmdsecond)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
   # }

}
