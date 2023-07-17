appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app100_inputFile1)){
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
	temp.file <- input$app100_inputFile1$datapath
	file.copy(temp.file,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"))
	if(length(grep(".csv",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),head=T)
	}
	if(length(grep(".xls",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),sep="\t",head=T)
	}
	

    app100_select1 <- as.character(input$app100_select1)
	if(!is.null(input$app100_select1)&(input$app100_select1)!=""){
	app100_select1 <- as.character(input$app100_select1)
	}else{
	app100_select1 <-"NA"
	}
	
	app100_text1 <- as.character(input$app100_text1)
	if(!is.null(input$app100_text1)&(input$app100_text1)!=""){
	app100_text1 <- as.character(input$app100_text1)
	}else{
	app100_text1 <-"NULL"
	}
	
	app100_select2 <- as.numeric(input$app100_select2)
	if(!is.null(input$app100_select2)&(input$app100_select2)!=""){
	app100_select2 <- as.numeric(input$app100_select2)
	}else{
	app100_select2 <-2
	}
	
	app100_text2 <- as.numeric(input$app100_text2)
	if(!is.null(input$app100_text2)&(input$app100_text2)!=""){
	app100_text2 <- as.numeric(input$app100_text2)
	}else{
	app100_text2 <-0.2
	}
	
    if(!is.null(input$app100_email)&(input$app100_email)!=""){
	app100_email <- as.character(input$app100_email)
	}else{
	app100_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app100",mytaskid=taskidnow,myemail=app100_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}

mycmdfirst<-paste(taskidnow,app100_select1,app100_text1,app100_select2,app100_text2,app100_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app100/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

# input$app100_select1 %in% (c("NA","0"," ","-"))
# input$app100_select1 =="5"
# input$app100_select2 %in% (c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20))
# input$app100_select2 == 1

observe({
	if ((input$app100_select1 =="5")&(input$app100_select2 == 1)){
		shinyjs::show("app100_button1_info1")
		shinyjs::show("app100_button1")
		shinyjs::show("app100_button2_info1")
		shinyjs::show("app100_button2")
	} 


	if ((input$app100_select1 =="5")&(input$app100_select2 %in% (c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)))){
		shinyjs::show("app100_button1_info1")
		shinyjs::show("app100_button1")
		shinyjs::hide("app100_button2_info1")
		shinyjs::hide("app100_button2")
	}

	if ((input$app100_select1 %in% (c("NA","0"," ","-","")))&(input$app100_select2 == 1)){
		shinyjs::hide("app100_button1_info1")
		shinyjs::hide("app100_button1")
		shinyjs::show("app100_button2_info1")
		shinyjs::show("app100_button2")
	}
	
	if ((input$app100_select1 %in% (c("NA","0"," ","-","")))&(input$app100_select2 %in% (c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)))){
		shinyjs::hide("app100_button1_info1")
		shinyjs::hide("app100_button1")
		shinyjs::hide("app100_button2_info1")
		shinyjs::hide("app100_button2")
	}

})	
	
}
