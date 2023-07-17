appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app99_inputFile1)){
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
	temp.file <- input$app99_inputFile1$datapath
	temp.name<-input$app99_inputFile1$name
	file.copy(temp.file,paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",temp.name,sep="/"))
	
	if(!is.null(input$app99_text1)&(input$app99_text1)!=""){
	app99_text1 <- as.numeric(input$app99_text1)
	}else{
	app99_text1 <-15
	}	
	if(!is.null(input$app99_text2)&(input$app99_text2)!=""){
	app99_text2 <- as.numeric(input$app99_text2)
	}else{
	app99_text2 <-5
	}	
	if(!is.null(input$app99_text3)&(input$app99_text3)!=""){
	app99_text3 <- as.numeric(input$app99_text3)
	}else{
	app99_text3 <-30
	}	
	if(!is.null(input$app99_text4)&(input$app99_text4)!=""){
	app99_text4 <- as.numeric(input$app99_text4)
	}else{
	app99_text4 <-5
	}	
	if(!is.null(input$app99_text5)&(input$app99_text5)!=""){
	app99_text5 <- as.numeric(input$app99_text5)
	}else{
	app99_text5 <-500
	}
	if(!is.null(input$app99_text6)&(input$app99_text6)!=""){
	app99_text6 <- as.numeric(input$app99_text6)
	}else{
	app99_text6 <-0.5
	}
	if(!is.null(input$app99_select1)&(input$app99_select1)!=""){
	app99_select1 <- as.character(input$app99_select1)
	}else{
	app99_select1 <-"positive"
	}
    if(!is.null(input$app99_select2)&(input$app99_select2)!=""){
	app99_select2 <- as.logical(input$app99_select2)
	}else{
	app99_select2 <-"TRUE"
	}
	if(!is.null(input$app99_select3)&(input$app99_select3)!=""){
	app99_select3 <- as.logical(input$app99_select3)
	}else{
	app99_select3 <-"TRUE"
	}
	if(!is.null(input$app99_select4)&(input$app99_select4)!=""){
	app99_select4 <- as.logical(input$app99_select4)
	}else{
	app99_select4 <-"TRUE"
	}
	if(!is.null(input$app99_select5)&(input$app99_select5)!=""){
	app99_select5 <- as.logical(input$app99_select5)
	}else{
	app99_select5 <-"FALSE"
	}	

	
    if(!is.null(input$app99_email)&(input$app99_email)!=""){
	app99_email <- as.character(input$app99_email)
	}else{
	app99_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app99",mytaskid=taskidnow,myemail=app99_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	
mycmdfirst<-paste(taskidnow,app99_text1,app99_text2,app99_text3,app99_text4,app99_text5,app99_text6,app99_select1,app99_select2,app99_select3,app99_select4,app99_select5,app99_email,sep="' '")
mycmdsecond<-paste("nohup ","/usr/local/R4.2/bin/Rscript /srv/myapps/keyandaydayup/apps/app99/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
}

