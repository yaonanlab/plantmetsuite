appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app116_inputFile1)&done$data=="no"){
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
	output$taskjobidinfo<-renderText({paste("Please write down the task number and use it to download the results on the left-hand side of the results download page after the analysis is completed.","Analysis results will be kept for 24h, after that it will be deleted automatically, please download it in time!")})
	save(jobid,file="userdata/jobid")
	temp.file <- input$app116_inputFile1$datapath
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
	


	if(!is.null(input$app116_text1)&(input$app116_text1)!=""){
		app116_text1 <- as.character(input$app116_text1)
	}else{
		app116_text1 <-"#D43338"
	}
	if(!is.null(input$app116_text2)&(input$app116_text2)!=""){
		app116_text2 <- as.character(input$app116_text2)
	}else{
		app116_text2 <-"#FFD101"
	}
	if(!is.null(input$app116_text3)&(input$app116_text3)!=""){
		app116_text3 <- as.character(input$app116_text3)
	}else{
		app116_text3 <-"#ACCD03"
	}
	if(!is.null(input$app116_text4)&(input$app116_text4)!=""){
		app116_text4 <- as.character(input$app116_text4)
	}else{
		app116_text4 <-"#5EBED6"
	}
	if(!is.null(input$app116_text5)&(input$app116_text5)!=""){
		app116_text5 <- as.character(input$app116_text5)
	}else{
		app116_text5 <-"#776AAE"
	}

	if(!is.null(input$app116_select1)&(input$app116_select1)!=""){
		app116_select1 <- as.numeric(input$app116_select1)
	}else{
		app116_select1 <-0
	}
	if(!is.null(input$app116_select2)&(input$app116_select2)!=""){
		app116_select2 <- as.numeric(input$app116_select2)
	}else{
		app116_select2 <-0
	}
	if(!is.null(input$app116_select3)&(input$app116_select3)!=""){
		app116_select3 <- as.numeric(input$app116_select3)
	}else{
		app116_select3 <-0
	}

    if(!is.null(input$app116_email)&(input$app116_email)!=""){
		app116_email <- as.character(input$app116_email)
	}else{
		app116_email <-"no"
	}
	
	source("/srv/myapps/keyandaydayup/apps/app116/plot.R")
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
		ipresult<-data.frame(myip=ip,myapp="app116",mytaskid=taskidnow,myemail=app116_email)
		write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
		drawchart(data,app116_text1=app116_text1,app116_text2=app116_text2,app116_text3=app116_text3,app116_text4=app116_text4,app116_text5=app116_text5,app116_select1=app116_select1,app116_select2=app116_select2,app116_select3=app116_select3,taskidnow=taskidnow)
	}
   ) 


mycmdfirst<-paste(taskidnow,app116_text1,app116_text2,app116_text3,app116_text4,app116_text5,app116_select1,app116_select2,app116_select3,app116_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app116/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
