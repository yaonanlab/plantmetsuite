appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app106_inputFile1)){
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
	output$taskjobid<-renderText({paste("Your task number is:", taskidnow)})
	output$taskjobidinfo<-renderText({paste("Please note down the task number and you can download the analysis results using the task number on the result download page on the left after the analysis is completed.","Analysis results will be retained for 24h, after which they will be automatically deleted, so please download them in time!")})
	save(jobid,file="userdata/jobid")
	
	temp.file1 <- input$app106_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1<-gsub("0","1",filename1old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1old), file.path("userdata",taskidnow,"rawdata",filename1))
	
	temp.file2 <- input$app106_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	filename2old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename2<-gsub("0","2",filename2old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename2old), file.path("userdata",taskidnow,"rawdata",filename2))

	if(!is.null(input$app106_select1)&(input$app106_select1)!=""){
	app106_select1 <- as.numeric(input$app106_select1)
	}else{
	app106_select1 <-0
	}	
	if(!is.null(input$app106_text1)&(input$app106_text1)!=""){
	app106_text1 <- as.numeric(input$app106_text1)
	}else{
	app106_text1 <-90
	}
	if(!is.null(input$app106_text2)&(input$app106_text2)!=""){
	app106_text2 <- as.numeric(input$app106_text2)
	}else{
	app106_text2 <-120
	}
	if(!is.null(input$app106_text3)&(input$app106_text3)!=""){
	app106_text3 <- as.numeric(input$app106_text3)
	}else{
	app106_text3 <-30
	}
	if(!is.null(input$app106_text4)&(input$app106_text4)!=""){
	app106_text4 <- as.numeric(input$app106_text4)
	}else{
	app106_text4 <-400
	}
	if(!is.null(input$app106_text5)&(input$app106_text5)!=""){
	app106_text5 <- as.character(input$app106_text5)
	}else{
	app106_text5 <-"#776AAE"
	}
	
	if(!is.null(input$app106_text6)&(input$app106_text6)!=""){
	app106_text6 <- as.character(input$app106_text6)
	}else{
	app106_text6 <-"#5EBED6"
	}
	if(!is.null(input$app106_text7)&(input$app106_text7)!=""){
	app106_text7 <- as.character(input$app106_text7)
	}else{
	app106_text7 <-"Mass to charge ratio (m/z)"
	}
	if(!is.null(input$app106_text8)&(input$app106_text8)!=""){
	app106_text8 <- as.character(input$app106_text8)
	}else{
	app106_text8 <-"Relative intensity"
	}
	
    if(!is.null(input$app106_email)&(input$app106_email)!=""){
	app106_email <- as.character(input$app106_email)
	}else{
	app106_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app106",mytaskid=taskidnow,myemail=app106_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}


mycmdfirst<-paste(taskidnow,app106_select1,app106_text1,app106_text2,app106_text3,app106_text4,app106_text5,app106_text6,app106_text7,app106_text8,app106_email,sep="' '")
mycmdsecond<-paste("nohup ","/usr/local/R4.2/bin/Rscript /srv/myapps/keyandaydayup/apps/app106/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

observe({
	if (input$app106_select1 ==0){
		shinyjs::hide("app106_button1_info1")
		shinyjs::hide("app106_button1")
	} 


	if (input$app106_select1 ==1){
		shinyjs::show("app106_button1_info1")
		shinyjs::show("app106_button1")
	}
})
}
