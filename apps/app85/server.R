appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app85_inputFile1)&done$data=="no"){
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
	output$taskjobidinfo<-renderText({paste("请记下任务编号,分析完成后可以在左侧结果下载页面使用任务编号下载分析结果。","分析结果将保留7天,过后自动删除,请及时下载！")})
	save(jobid,file="userdata/jobid")
	temp.file <- input$app85_inputFile1$datapath
	file.copy(temp.file,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"))
	if(length(grep(".csv",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),head=T,row.names=1)
	}
	if(length(grep(".xls",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	}
	if(length(grep(".xlsx",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	}
	if(length(grep(".txt",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),sep="\t",head=T,row.names=1)
	}
	


	if(!is.null(input$app85_text1)&(input$app85_text1)!=""){
		app85_text1 <- as.character(input$app85_text1)
	}else{
		app85_text1 <-"#ACCD03"
	}
	if(!is.null(input$app85_text2)&(input$app85_text2)!=""){
		app85_text2 <- as.character(input$app85_text2)
	}else{
		app85_text2 <-"#E07EA0"
	}
	if(!is.null(input$app85_text3)&(input$app85_text3)!=""){
		app85_text3 <- as.character(input$app85_text3)
	}else{
		app85_text3 <-"#FFD101"
	}
	if(!is.null(input$app85_text4)&(input$app85_text4)!=""){
		app85_text4 <- as.character(input$app85_text4)
	}else{
		app85_text4 <-"#5EBED6"
	}
	if(!is.null(input$app85_text5)&(input$app85_text5)!=""){
		app85_text5 <- as.character(input$app85_text5)
	}else{
		app85_text5 <-"#776AAE"
	}
	if(!is.null(input$app85_text6)&(input$app85_text6)!=""){
		app85_text6 <- as.numeric(input$app85_text6)
	}else{
		app85_text6 <-0.5
	}
	if(!is.null(input$app85_text7)&(input$app85_text7)!=""){
		app85_text7 <- as.character(input$app85_text7)
	}else{
		app85_text7 <-"Plot"
	}
	if(!is.null(input$app85_select1)&(input$app85_select1)!=""){
		app85_select1 <- as.numeric(input$app85_select1)
	}else{
		app85_select1 <-0
	}
	if(!is.null(input$app85_text8)&(input$app85_text8)!=""){
		app85_text8 <- as.numeric(input$app85_text8)
	}else{
		app85_text8 <-4
	}	
	if(!is.null(input$app85_text9)&(input$app85_text9)!=""){
		app85_text9 <- as.numeric(input$app85_text9)
	}else{
		app85_text9 <-3
	}
	if(!is.null(input$app85_text10)&(input$app85_text10)!=""){
		app85_text10 <- as.numeric(input$app85_text10)
	}else{
		app85_text10 <-0.8
	}
	
    if(!is.null(input$app85_email)&(input$app85_email)!=""){
		app85_email <- as.character(input$app85_email)
	}else{
		app85_email <-"no"
	}
	
	source("/srv/myapps/keyandaydayup/apps/app85/plot.R")
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app85",mytaskid=taskidnow,myemail=app85_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
    drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
    drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
    drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app85_text1,app85_text2,app85_text3,app85_text4,app85_text5,app85_text6,app85_text7,app85_select1,app85_text8,app85_text9,app85_text10,app85_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app85/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
