appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app83_inputFile1)&!is.null(input$app83_inputFile2)){
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
	
	temp.file1 <- input$app83_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename1old<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1<-gsub("0","1",filename1old)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename1old), file.path("userdata",taskidnow,"rawdata",filename1))
	
	temp.file2 <- input$app83_inputFile2$datapath
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
	data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
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
	#data0
	design<-as.data.frame(data2)
	
	if(!is.null(input$app83_text1)&(input$app83_text1)!=""){
	app83_text1 <- as.character(input$app83_text1)
	}else{
	app83_text1 <-"#776AAE"
	}
	if(!is.null(input$app83_text2)&(input$app83_text2)!=""){
	app83_text2 <- as.character(input$app83_text2)
	}else{
	app83_text2 <-"#5EBED6"
	}
	if(!is.null(input$app83_text3)&(input$app83_text3)!=""){
	app83_text3 <- as.character(input$app83_text3)
	}else{
	app83_text3 <-"#ACCD03"
	}
	if(!is.null(input$app83_text4)&(input$app83_text4)!=""){
	app83_text4 <- as.character(input$app83_text4)
	}else{
	app83_text4 <-"#FFD101"
	}
	if(!is.null(input$app83_text5)&(input$app83_text5)!=""){
	app83_text5 <- as.character(input$app83_text5)
	}else{
	app83_text5 <-"#D43338"
	}
	
	if(!is.null(input$app83_text6)&(input$app83_text6)!=""){
	app83_text6 <- as.numeric(input$app83_text6)
	}else{
	app83_text6 <-0.7
	}
	if(!is.null(input$app83_text7)&(input$app83_text7)!=""){
	app83_text7 <- as.character(input$app83_text7)
	}else{
	app83_text7 <-"x"
	}
	if(!is.null(input$app83_text8)&(input$app83_text8)!=""){
	app83_text8 <- as.character(input$app83_text8)
	}else{
	app83_text8 <-"y"
	}
	if(!is.null(input$app83_text9)&(input$app83_text9)!=""){
	app83_text9 <- as.character(input$app83_text9)
	}else{
	app83_text9 <-"z"
	}
	if(!is.null(input$app83_select1)&(input$app83_select1)!=""){
	app83_select1 <- as.numeric(input$app83_select1)
	}else{
	app83_select1 <-0
	}
	app83_text10 <-6
	if(!is.null(input$app83_select2)&(input$app83_select2)!=""){
	app83_select2 <- as.character(input$app83_select2)
	}else{
	app83_select2 <-"absolute"
	}
	if(!is.null(input$app83_text11)&(input$app83_text11)!=""){
	app83_text11 <- as.numeric(input$app83_text11)
	}else{
	app83_text11 <-0.001
	}
	if(!is.null(input$app83_text12)&(input$app83_text12)!=""){
	app83_text12 <- as.numeric(input$app83_text12)
	}else{
	app83_text12 <-10
	}	
	if(!is.null(input$app83_text13)&(input$app83_text13)!=""){
	app83_text13 <- as.numeric(input$app83_text13)
	}else{
	app83_text13 <-0.05
	}
	# if(!is.null(input$app83_text14)&(input$app83_text14)!=""){
	# app83_text14 <- as.numeric(input$app83_text14)
	# }else{
	# app83_text14 <-2
	# }
	
    if(!is.null(input$app83_email)&(input$app83_email)!=""){
	app83_email <- as.character(input$app83_email)
	}else{
	app83_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app83",mytaskid=taskidnow,myemail=app83_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
source("/srv/myapps/keyandaydayup/apps/app83/plot.R")	
output$result= renderPlot({
	drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
}) 

output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/png"
) 
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
        pdf(file)
		drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/pdf"
)	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
		dev.off()
        },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app83_text1,app83_text2,app83_text3,app83_text4,app83_text5,app83_text6,app83_text7,app83_text8,app83_text9,app83_select1,app83_text10,app83_select2,app83_text11,app83_text12,app83_text13,app83_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app83/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }

observe({
	if (input$app83_select1 ==0){
		shinyjs::show("app83_button1_info1")
		shinyjs::show("app83_button1")
		shinyjs::hide("app83_button2_info1")
		shinyjs::hide("app83_button2")
		shinyjs::hide("app83_button3")
	} 


	if (input$app83_select1 ==1){
		shinyjs::hide("app83_button1_info1")
		shinyjs::hide("app83_button1")
		shinyjs::show("app83_button2_info1")
		shinyjs::show("app83_button2")
		shinyjs::hide("app83_button3")
	}

	if (input$app83_select1== 2){
		shinyjs::hide("app83_button1_info1")
		shinyjs::hide("app83_button1")
		shinyjs::hide("app83_button2_info1")
		shinyjs::hide("app83_button2")
		shinyjs::show("app83_button3")
	}

	if (input$app83_select1== 3){
		shinyjs::hide("app83_button1_info1")
		shinyjs::hide("app83_button1")
		shinyjs::hide("app83_button2_info1")
		shinyjs::hide("app83_button2")
		shinyjs::hide("app83_button3")
	}
})

}
