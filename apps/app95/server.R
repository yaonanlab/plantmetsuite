appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app95_inputFile1)&!is.null(input$app95_inputFile2)){
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
	temp.file1 <- input$app95_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename1)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1), file.path("userdata",taskidnow,"rawdata",filename1new))
	temp.file2 <- input$app95_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	filename2<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename2new<-gsub("0","2",filename2)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename2), file.path("userdata",taskidnow,"rawdata",filename2new))
	
	if(!is.null(input$app95_select1)&(input$app95_select1)!=""){
	app95_select1 <- as.character(input$app95_select1)
	}else{
	app95_select1 <-"blastn"
	}
	
	if(!is.null(input$app95_select2)&(input$app95_select2)!=""){
	app95_select2 <- as.character(input$app95_select2)
	}else{
	app95_select2 <-"nucl"
	}
	
	if(!is.null(input$app95_select3)&(input$app95_select3)!=""){
	app95_select3 <- as.numeric(input$app95_select3)
	}else{
	app95_select3 <-6
	}
	
	if(!is.null(input$app95_text1)&(input$app95_text1)!=""){
	app95_text1 <- as.numeric(input$app95_text1)
	}else{
	app95_text1 <-1e-5
	}
	
    if(!is.null(input$app95_email)&(input$app95_email)!=""){
	app95_email <- as.character(input$app95_email)
	}else{
	app95_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app95",mytaskid=taskidnow,myemail=app95_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mycmdfirst<-paste(taskidnow,app95_select1,app95_select2,app95_select3,app95_text1,app95_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app95/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

}
