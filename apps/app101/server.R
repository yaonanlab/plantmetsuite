appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app101_inputFile1)){
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
	temp.file1 <- input$app101_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename1)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1), file.path("userdata",taskidnow,"rawdata",filename1new))
	temp.file2 <- input$app101_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	filename2<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename2new<-gsub("0","2",filename2)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename2), file.path("userdata",taskidnow,"rawdata",filename2new))
	# temp.file3 <- input$app101_inputFile3$datapath
	# file.copy(temp.file3,file.path("userdata",taskidnow,"rawdata"))
	# filename3<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	# filename3new<-gsub("0","3",filename3)
	# file.rename(file.path("userdata",taskidnow,"rawdata",filename3), file.path("userdata",taskidnow,"rawdata",filename3new))
	

    app101_select1 <- as.numeric(input$app101_select1)
	if(!is.null(input$app101_select1)&(input$app101_select1)!=""){
	app101_select1 <- as.numeric(input$app101_select1)
	}else{
	app101_select1 <-1
	}
	
	app101_text1 <- as.character(input$app101_text1)
	if(!is.null(input$app101_text1)&(input$app101_text1)!=""){
	app101_text1 <- as.character(input$app101_text1)
	}else{
	app101_text1 <-"A"
	}
	
    if(!is.null(input$app101_email)&(input$app101_email)!=""){
	app101_email <- as.character(input$app101_email)
	}else{
	app101_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app101",mytaskid=taskidnow,myemail=app101_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}

mycmdfirst<-paste(taskidnow,app101_select1,app101_text1,app101_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app101/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

 observe({
if (input$app101_select1 %in% (c("1","5","6","8","9","10","11","12","13","14","15","16"))) {
shinyjs::hide("app101_button1_info1") 
shinyjs::hide("app101_button1_info2")
shinyjs::hide("app101_button1")
shinyjs::hide("app101_button2_info1")
shinyjs::hide("app101_button2_info2") 
shinyjs::hide("app101_button2_info3")
shinyjs::hide("app101_button2")} 


if (input$app101_select1 =="2") {
shinyjs::show("app101_button1_info1") 
shinyjs::hide("app101_button1_info2")
shinyjs::show("app101_button1")
shinyjs::show("app101_button2_info1")
shinyjs::hide("app101_button2_info2") 
shinyjs::hide("app101_button2_info3")
shinyjs::show("app101_button2")}

if (input$app101_select1 =="3") {
shinyjs::show("app101_button1_info1") 
shinyjs::hide("app101_button1_info2")
shinyjs::show("app101_button1")
shinyjs::hide("app101_button2_info1")
shinyjs::show("app101_button2_info2") 
shinyjs::hide("app101_button2_info3")
shinyjs::show("app101_button2")}

if (input$app101_select1 =="4") {
shinyjs::show("app101_button1_info1") 
shinyjs::hide("app101_button1_info2")
shinyjs::show("app101_button1")
shinyjs::hide("app101_button2_info1")
shinyjs::hide("app101_button2_info2") 
shinyjs::show("app101_button2_info3")
shinyjs::show("app101_button2")}

if (input$app101_select1 =="7") {
shinyjs::hide("app101_button1_info1") 
shinyjs::show("app101_button1_info2")
shinyjs::show("app101_button1")
shinyjs::hide("app101_button2_info1")
shinyjs::hide("app101_button2_info2") 
shinyjs::hide("app101_button2_info3")
shinyjs::hide("app101_button2")}


	 })	
	
}
