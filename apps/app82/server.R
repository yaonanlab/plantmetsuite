source("/srv/myapps/keyandaydayup/apps/app82/plot.R")
appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app82_inputFile1)){
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
	
	temp.file <- input$app82_inputFile1$datapath
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
	
	if(!is.null(input$app82_text1)&(input$app82_text1)!=""){
	app82_text1 <- as.character(input$app82_text1)
	}else{
	app82_text1 <-"#776AAE"
	}
	if(!is.null(input$app82_text2)&(input$app82_text2)!=""){
	app82_text2 <- as.character(input$app82_text2)
	}else{
	app82_text2 <-"#5EBED6"
	}
	if(!is.null(input$app82_text3)&(input$app82_text3)!=""){
	app82_text3 <- as.character(input$app82_text3)
	}else{
	app82_text3 <-"#ACCD03"
	}
	if(!is.null(input$app82_text4)&(input$app82_text4)!=""){
	app82_text4 <- as.character(input$app82_text4)
	}else{
	app82_text4 <-"#FFD101"
	}
	if(!is.null(input$app82_text5)&(input$app82_text5)!=""){
	app82_text5 <- as.character(input$app82_text5)
	}else{
	app82_text5 <-"#D43338"
	}
	
	if(!is.null(input$app82_text6)&(input$app82_text6)!=""){
	app82_text6 <- as.numeric(input$app82_text6)
	}else{
	app82_text6 <-0.3
	}
	if(!is.null(input$app82_text7)&(input$app82_text7)!=""){
	app82_text7 <- as.numeric(input$app82_text7)
	}else{
	app82_text7 <-0.5
	}
	if(!is.null(input$app82_text8)&(input$app82_text8)!=""){
	app82_text8 <- as.character(input$app82_text8)
	}else{
	app82_text8 <-"#FFFFFF"
	}
	if(!is.null(input$app82_text9)&(input$app82_text9)!=""){
	app82_text9 <- as.numeric(input$app82_text9)
	}else{
	app82_text9 <-0.1
	}
	if(!is.null(input$app82_text10)&(input$app82_text10)!=""){
	app82_text10 <- as.numeric(input$app82_text10)
	}else{
	app82_text10 <-0.5
	}
	if(!is.null(input$app82_text11)&(input$app82_text11)!=""){
	app82_text11 <- as.numeric(input$app82_text11)
	}else{
	app82_text11 <-3
	}
	if(!is.null(input$app82_select1)&(input$app82_select1)!=""){
	app82_select1 <- as.character(input$app82_select1)
	}else{
	app82_select1 <-"linear"
	}
    if(!is.null(input$app82_email)&(input$app82_email)!=""){
	app82_email <- as.character(input$app82_email)
	}else{
	app82_email <-"no"
	}

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app82",mytaskid=taskidnow,myemail=app82_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	
output$result= renderPlot({
	drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
}) 
output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
		dev.off()
        },
    contentType = "image/png"
)
  
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
        pdf(file)
		drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
		dev.off()
        },
    contentType = "image/pdf"
)
	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
		dev.off()
        },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app82_text1,app82_text2,app82_text3,app82_text4,app82_text5,app82_text6,app82_text7,app82_text8,app82_text9,app82_text10,app82_select1,app82_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app82/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
}
