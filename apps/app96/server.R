appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app96_inputFile1)){
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
	temp.file1 <- input$app96_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename), file.path("userdata",taskidnow,"rawdata",filename1new))
	
	 if(!is.null(input$app96_select1)&(input$app96_select1)!=""){
	 app96_select1 <- as.character(input$app96_select1)
	 }else{
	 app96_select1 <-"MFP"}
	
	 if(!is.null(input$app96_select2)&(input$app96_select2)!=""){
	 app96_select2 <- as.character(input$app96_select2)
	 }else{
	 app96_select2 <-"-bb"}
	 
	 if(!is.null(input$app96_text1)&(input$app96_text1)!=""){
	 app96_text1 <- as.character(input$app96_text1)
	 }else{
	 app96_text1 <-"HKY"}
		 
	 if(!is.null(input$app96_text2)&(input$app96_text2)!=""){
	 app96_text2 <- as.numeric(input$app96_text2)
	 }else{
	 app96_text2 <-1000}

	 if(!is.null(input$app96_text3)&(input$app96_text3)!=""){
	 app96_text3 <- as.numeric(input$app96_text3)
	 }else{
	 app96_text3 <-1000}
	 
    if(!is.null(input$app96_email)&(input$app96_email)!=""){
	app96_email <- as.character(input$app96_email)
	}else{
	app96_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app96",mytaskid=taskidnow,myemail=app96_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mycmdfirst<-paste(taskidnow,app96_select1,app96_select2,app96_text1,app96_text2,app96_text3,app96_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app96/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    } 

observe({
	if(input$app96_select1=="1"){
		shinyjs::show("app96_button1_info1")
		shinyjs::show("app96_button1")
	}else{
		shinyjs::hide("app96_button1_info1")
		shinyjs::hide("app96_button1")
	}
})

}

