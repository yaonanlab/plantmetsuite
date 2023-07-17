appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app88_inputFile1)&!is.null(input$app88_inputFile2)){
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
	
	temp.file1 <- input$app88_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1<-gsub("0","1",filename1old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1old), file.path("userdata",taskidnow,"rawdata",filename1))
	
	temp.file2 <- input$app88_inputFile2$datapath
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
	
	if(!is.null(input$app88_select1)&(input$app88_select1)!=""){
	app88_select1 <- as.numeric(input$app88_select1)
	}else{
	app88_select1 <-2
	}	
	if(!is.null(input$app88_text1)&(input$app88_text1)!=""){
	app88_text1 <- as.character(input$app88_text1)
	}else{
	app88_text1 <-"#D43338"
	}
	if(!is.null(input$app88_text2)&(input$app88_text2)!=""){
	app88_text2 <- as.character(input$app88_text2)
	}else{
	app88_text2 <-"#FFD101"
	}
	if(!is.null(input$app88_text3)&(input$app88_text3)!=""){
	app88_text3 <- as.character(input$app88_text3)
	}else{
	app88_text3 <-"#ACCD03"
	}
	if(!is.null(input$app88_text4)&(input$app88_text4)!=""){
	app88_text4 <- as.character(input$app88_text4)
	}else{
	app88_text4 <-"#5EBED6"
	}
	if(!is.null(input$app88_text5)&(input$app88_text5)!=""){
	app88_text5 <- as.character(input$app88_text5)
	}else{
	app88_text5 <-"#776AAE"
	}
	if(!is.null(input$app88_text6)&(input$app88_text6)!=""){
	app88_text6 <- as.numeric(input$app88_text6)
	}else{
	app88_text6 <-0.5
	}
	if(!is.null(input$app88_select2)&(input$app88_select2)!=""){
	app88_select2 <- as.character(input$app88_select2)
	}else{
	app88_select2 <-"smooth"
	}
	if(!is.null(input$app88_text7)&(input$app88_text7)!=""){
	app88_text7 <- as.character(input$app88_text7)
	}else{
	app88_text7 <-"x"
	}
	if(!is.null(input$app88_text8)&(input$app88_text8)!=""){
	app88_text8 <- as.character(input$app88_text8)
	}else{
	app88_text8 <-"y"
	}
	if(!is.null(input$app88_text9)&(input$app88_text9)!=""){
	app88_text9 <- as.character(input$app88_text9)
	}else{
	app88_text9 <-"Plot"
	}
	
    if(!is.null(input$app88_email)&(input$app88_email)!=""){
	app88_email <- as.character(input$app88_email)
	}else{
	app88_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app88",mytaskid=taskidnow,myemail=app88_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
source("/srv/myapps/keyandaydayup/apps/app88/plot.R")	
output$result= renderPlot({
	drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
}) 

output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
		dev.off()
        },
    contentType = "image/png"
) 
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
        pdf(file)
		drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
		dev.off()
        },
    contentType = "image/pdf"
)	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
		dev.off()
        },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app88_select1,app88_text1,app88_text2,app88_text3,app88_text4,app88_text5,app88_text6,app88_select2,app88_text7,app88_text8,app88_text9,app88_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app88/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

}
