appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app93_inputFile1)){
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
	temp.file <- input$app93_inputFile1$datapath
	temp.name<-input$app93_inputFile1$name
	file.copy(temp.file,paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",temp.name,sep="/"))
	#setwd(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
	#file.rename(temp.file,)
	
   if(!is.null(input$app93_select1)&(input$app93_select1)!=""){
	app93_select1 <- as.character(input$app93_select1)
	}else{
	app93_select1 <-"mzXML"
	}	

    if(!is.null(input$app93_select2)&(input$app93_select2)!=""){
	app93_select2 <- as.character(input$app93_select2)
	}else{
	app93_select2 <-"positive"
	}
	
    if(!is.null(input$app93_email)&(input$app93_email)!=""){
	app93_email <- as.character(input$app93_email)
	}else{
	app93_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app93",mytaskid=taskidnow,myemail=app93_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	
mycmdfirst<-paste(taskidnow,app93_select1,app93_select2,app93_email,sep="' '")
mycmdsecond<-paste("nohup ","/usr/local/R4.2/bin/Rscript /srv/myapps/keyandaydayup/apps/app93/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
}

