appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app97_inputFile1)&!is.null(input$app97_inputFile2)){
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
	temp.file1 <- input$app97_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	#filename1<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	#filename1new<-gsub("0","1",filename1)
	#file.rename(file.path("userdata",taskidnow,"rawdata",filename1), file.path("userdata",taskidnow,"rawdata",filename1new))
	temp.file2 <- input$app97_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	#filename2<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	#filename2new<-gsub("0","2",filename2)
	#file.rename(file.path("userdata",taskidnow,"rawdata",filename2), file.path("userdata",taskidnow,"rawdata",filename2new))

	if(!is.null(input$app97_select1)&(input$app97_select1)!=""){
	app97_select1 <- as.character(input$app97_select1)
	}else{
	app97_select1 <-"positive"}

	if(!is.null(input$app97_select2)&(input$app97_select2)!=""){
	app97_select2 <- as.character(input$app97_select2)
	}else{
	app97_select2 <-"Public database"}
	
	if(!is.null(input$app97_select3)&(input$app97_select3)!=""){
	app97_select3 <- as.character(input$app97_select3)
	}else{
	app97_select3 <-"0"}

	if(!is.null(input$app97_select4)&(input$app97_select4)!=""){
	app97_select4 <- as.character(input$app97_select4)
	}else{
	app97_select4 <-"both"}	

	
	if(!is.null(input$app97_text1)&(input$app97_text1)!=""){
	app97_text1 <- as.numeric(input$app97_text1)
	}else{
	app97_text1 <-25}
	
	if(!is.null(input$app97_text2)&(input$app97_text2)!=""){
	app97_text2 <- as.numeric(input$app97_text2)
	}else{
	app97_text2 <-10}
	
	if(!is.null(input$app97_text3)&(input$app97_text3)!=""){
	app97_text3 <- as.numeric(input$app97_text3)
	}else{
	app97_text3 <-0.6}
	
	
	
	
	
	
	
    if(!is.null(input$app97_email)&(input$app97_email)!=""){
	app97_email <- as.character(input$app97_email)
	}else{
	app97_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app97",mytaskid=taskidnow,myemail=app97_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mycmdfirst<-paste(taskidnow,app97_email,app97_select1,app97_select2,app97_select3,app97_select4,app97_text1,app97_text2,app97_text3,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app97/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

}
