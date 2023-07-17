appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app102_inputFile1)&done$data=="no"){
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
	output$taskjobidinfo<-renderText({paste("请记下任务编号,分析完成后可以在左侧结果下载页面使用任务编号Download Analysis Results。","分析结果将保留7天,过后自动删除,请及时下载！")})
	save(jobid,file="userdata/jobid")
	temp.file <- input$app102_inputFile1$datapath
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
	
	if(!is.null(input$app102_select1)&(input$app102_select1)!=""){
	app102_select1 <- as.numeric(input$app102_select1)
	}else{
	app102_select1 <-1
	}
	if(!is.null(input$app102_select2)&(input$app102_select2)!=""){
	app102_select2 <- as.character(input$app102_select2)
	}else{
	app102_select2 <-"Set3"
	}
	
	if(!is.null(input$app102_text1)&(input$app102_text1)!=""){
	app102_text1 <- as.character(input$app102_text1)
	}else{
	app102_text1 <-"Plot"
	}
	if(!is.null(input$app102_text2)&(input$app102_text2)!=""){
	app102_text2 <- as.character(input$app102_text2)
	}else{
	app102_text2 <-"Groups"
	}

	
    if(!is.null(input$app102_email)&(input$app102_email)!=""){
	app102_email <- as.character(input$app102_email)
	}else{
	app102_email <-"no"
	}
source("/srv/myapps/keyandaydayup/apps/app102/plot.R")
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app102",mytaskid=taskidnow,myemail=app102_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	drawchart(data,app102_select1=app102_select1,app102_select2=app102_select2,app102_text1=app102_text1,app102_text2=app102_text2,taskidnow=taskidnow)
	}
   ) 

mycmdfirst<-paste(taskidnow,app102_select1,app102_select2,app102_text1,app102_text2,app102_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app102/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
