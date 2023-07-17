appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app72_inputFile1)){
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
	temp.file1 <- input$app72_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename), file.path("userdata",taskidnow,"rawdata",filename1new))

	if(!is.null(input$app72_text1)&(input$app72_text1)!=""){
	app72_text1 <- as.numeric(input$app72_text1)
	}else{
	app72_text1 <-"2"}
	
	if(!is.null(input$app72_text2)&(input$app72_text2)!=""){
	app72_text2 <- as.character(input$app72_text2)
	}else{
	app72_text2 <-"0,1"}
	
	if(!is.null(input$app72_email)&(input$app72_email)!=""){
	app72_email <- as.character(input$app72_email)
	}else{
	app72_email <-"no"}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app72",mytaskid=taskidnow,myemail=app72_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mycmdfirst<-paste(taskidnow,app72_email,app72_text1,app72_text2,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app72/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

}

