appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app112_inputFile1)&!is.null(input$app112_inputFile2)){
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
	output$taskjobid<-renderText({paste("Your taskID is", taskidnow)})
	output$taskjobidinfo<-renderText({paste("Please write down the task number and you can download the results using the task number on the left-hand side of the results download page after the analysis is completed.","Analysis results will be retained for 24h, after which they will be automatically deleted, so please download them promptly!")})
	save(jobid,file="userdata/jobid")
	
	temp.file1 <- input$app112_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1<-gsub("0","1",filename1old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1old), file.path("userdata",taskidnow,"rawdata",filename1))
	
	temp.file2 <- input$app112_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	filename2old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename2<-gsub("0","2",filename2old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename2old), file.path("userdata",taskidnow,"rawdata",filename2))

	
	if(length(grep(".csv",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
	}
	if(length(grep(".xls",filename1))>0){
	data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename1))>0){
	data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
	}
	
	if(length(grep(".csv",filename2))>0){
	group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
	}
	if(length(grep(".xls",filename2))>0){
	group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename2))>0){
	group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename2))>0){
	group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
	}
	
	if(!is.null(input$app112_text1)&(input$app112_text1)!=""){
	app112_text1 <- as.numeric(input$app112_text1)
	}else{
	app112_text1 <-0.05
	}
	if(!is.null(input$app112_text2)&(input$app112_text2)!=""){
	app112_text2 <- as.numeric(input$app112_text2)
	}else{
	app112_text2 <-1
	}
	if(!is.null(input$app112_select1)&(input$app112_select1)!=""){
	app112_select1 <- as.logical(input$app112_select1)
	}else{
	app112_select1 <-TRUE
	}
	if(!is.null(input$app112_select2)&(input$app112_select2)!=""){
	app112_select2 <- as.character(input$app112_select2)
	}else{
	app112_select2 <-"p"
	}
    if(!is.null(input$app112_email)&(input$app112_email)!=""){
	app112_email <- as.character(input$app112_email)
	}else{
	app112_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app112",mytaskid=taskidnow,myemail=app112_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}

mycmdfirst<-paste(taskidnow,app112_select1,app112_select2,app112_text1,app112_text2,app112_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app112/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

}
