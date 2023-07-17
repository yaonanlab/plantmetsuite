source("/srv/myapps/keyandaydayup/apps/app81/plot.R")
appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app81_inputFile1)&!is.null(input$app81_inputFile2)){
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
	
	temp.file1 <- input$app81_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1<-gsub("0","1",filename1old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1old), file.path("userdata",taskidnow,"rawdata",filename1))
	
	temp.file2 <- input$app81_inputFile2$datapath
	file.copy(temp.file2,file.path("userdata",taskidnow,"rawdata"))
	filename2old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename2<-gsub("0","2",filename2old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename2old), file.path("userdata",taskidnow,"rawdata",filename2))

	if(length(grep(".csv",filename1))>0){
	data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
	}
	if(length(grep(".xls",filename1))>0){
	data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename1))>0){
	data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename1))>0){
	data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T,check.names=F)
	}
	
	if(length(grep(".csv",filename2))>0){
	data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
	}
	if(length(grep(".xls",filename2))>0){
	data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename2))>0){
	data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename2))>0){
	data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
	}
	raw_rnatable<-as.data.frame(data1)
	raw_mettable<-as.data.frame(data2)
	
	if(!is.null(input$app81_text1)&(input$app81_text1)!=""){
	app81_text1 <- as.character(input$app81_text1)
	}else{
	app81_text1 <-"#776AAE"
	}
	if(!is.null(input$app81_text2)&(input$app81_text2)!=""){
	app81_text2 <- as.character(input$app81_text2)
	}else{
	app81_text2 <-"#ACCD03"
	}
	if(!is.null(input$app81_text3)&(input$app81_text3)!=""){
	app81_text3 <- as.character(input$app81_text3)
	}else{
	app81_text3 <-"#776AAE"
	}
	if(!is.null(input$app81_text4)&(input$app81_text4)!=""){
	app81_text4 <- as.character(input$app81_text4)
	}else{
	app81_text4 <-"#FFD101"
	}
	if(!is.null(input$app81_text5)&(input$app81_text5)!=""){
	app81_text5 <- as.character(input$app81_text5)
	}else{
	app81_text5 <-"#E95368"
	}
	
	if(!is.null(input$app81_text6)&(input$app81_text6)!=""){
	app81_text6 <- as.character(input$app81_text6)
	}else{
	app81_text6 <-"#FFD101"
	}
	if(!is.null(input$app81_text7)&(input$app81_text7)!=""){
	app81_text7 <- as.character(input$app81_text7)
	}else{
	app81_text7 <-"#776AAE"
	}
	if(!is.null(input$app81_text8)&(input$app81_text8)!=""){
	app81_text8 <- as.character(input$app81_text8)
	}else{
	app81_text8 <-"#ACCD03"
	}
	if(!is.null(input$app81_text9)&(input$app81_text9)!=""){
	app81_text9 <- as.character(input$app81_text9)
	}else{
	app81_text9 <-"#776AAE"
	}
	if(!is.null(input$app81_text10)&(input$app81_text10)!=""){
	app81_text10 <- as.character(input$app81_text10)
	}else{
	app81_text10 <-"log2 ratio of gene"
	}	
	if(!is.null(input$app81_text11)&(input$app81_text11)!=""){
	app81_text11 <- as.character(input$app81_text11)
	}else{
	app81_text11 <-"log2 ratio of metabolite"
	}
	if(!is.null(input$app81_text12)&(input$app81_text12)!=""){
	app81_text12 <- as.numeric(input$app81_text12)
	}else{
	app81_text12 <-1
	}	
	if(!is.null(input$app81_text13)&(input$app81_text13)!=""){
	app81_text13 <- as.numeric(input$app81_text13)
	}else{
	app81_text13 <-1
	}
	if(!is.null(input$app81_select1)&(input$app81_select1)!=""){
	app81_select1 <- as.character(input$app81_select1)
	}else{
	app81_select1 <-"pearson"
	}
	if(!is.null(input$app81_text14)&(input$app81_text14)!=""){
	app81_text14 <- as.numeric(input$app81_text14)
	}else{
	app81_text14 <-0.95
	}
	if(!is.null(input$app81_text15)&(input$app81_text15)!=""){
	app81_text15 <- as.numeric(input$app81_text15)
	}else{
	app81_text15 <-0.01
	}
	if(!is.null(input$app81_text16)&(input$app81_text16)!=""){
	app81_text16 <- as.numeric(input$app81_text16)
	}else{
	app81_text16 <-1
	}
    if(!is.null(input$app81_email)&(input$app81_email)!=""){
	app81_email <- as.character(input$app81_email)
	}else{
	app81_email <-"no"
	}

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app81",mytaskid=taskidnow,myemail=app81_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	
output$result= renderPlot({
	drawchart(raw_rnatable,raw_mettable,app81_text1=app81_text1,app81_text2=app81_text2,app81_text3=app81_text3,app81_text4=app81_text4,app81_text5=app81_text5,app81_text6=app81_text6,app81_text7=app81_text7,app81_text8=app81_text8,app81_text9=app81_text9,app81_text10=app81_text10,app81_text11=app81_text11,app81_text12=app81_text12,app81_text13=app81_text13,app81_select1=app81_select1,app81_text14=app81_text14,app81_text15=app81_text15,app81_text16=app81_text16,taskidnow=taskidnow)
}) 
output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(raw_rnatable,raw_mettable,app81_text1=app81_text1,app81_text2=app81_text2,app81_text3=app81_text3,app81_text4=app81_text4,app81_text5=app81_text5,app81_text6=app81_text6,app81_text7=app81_text7,app81_text8=app81_text8,app81_text9=app81_text9,app81_text10=app81_text10,app81_text11=app81_text11,app81_text12=app81_text12,app81_text13=app81_text13,app81_select1=app81_select1,app81_text14=app81_text14,app81_text15=app81_text15,app81_text16=app81_text16,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/png"
)
  
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
        pdf(file)
		drawchart(raw_rnatable,raw_mettable,app81_text1=app81_text1,app81_text2=app81_text2,app81_text3=app81_text3,app81_text4=app81_text4,app81_text5=app81_text5,app81_text6=app81_text6,app81_text7=app81_text7,app81_text8=app81_text8,app81_text9=app81_text9,app81_text10=app81_text10,app81_text11=app81_text11,app81_text12=app81_text12,app81_text13=app81_text13,app81_select1=app81_select1,app81_text14=app81_text14,app81_text15=app81_text15,app81_text16=app81_text16,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/pdf"
)
	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(raw_rnatable,raw_mettable,app81_text1=app81_text1,app81_text2=app81_text2,app81_text3=app81_text3,app81_text4=app81_text4,app81_text5=app81_text5,app81_text6=app81_text6,app81_text7=app81_text7,app81_text8=app81_text8,app81_text9=app81_text9,app81_text10=app81_text10,app81_text11=app81_text11,app81_text12=app81_text12,app81_text13=app81_text13,app81_select1=app81_select1,app81_text14=app81_text14,app81_text15=app81_text15,app81_text16=app81_text16,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app81_text1,app81_text2,app81_text3,app81_text4,app81_text5,app81_text6,app81_text7,app81_text8,app81_text9,app81_text10,app81_text11,app81_text12,app81_text13,app81_select1,app81_text14,app81_text15,app81_text16,app81_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app81/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
}
