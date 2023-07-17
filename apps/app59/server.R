appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app59_inputFile1)&done$data=="no"){
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
	temp.file <- input$app59_inputFile1$datapath
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
	}#读取不同格式的数据
	if(!is.null(input$app59_select1)&(input$app59_select1)!=""){
	app59_select1 <- as.character(input$app59_select1)
	}else{
	app59_select1 <-"fc"
	}
	if(!is.null(input$app59_text1)&(input$app59_text1)!=""){
	app59_text1 <- as.character(input$app59_text1)
	}else{
	app59_text1 <-"#B31B21"
	}
	if(!is.null(input$app59_text2)&(input$app59_text2)!=""){
	app59_text2 <- as.character(input$app59_text2)
	}else{
	app59_text2 <-"#1465AC"
	}
	if(!is.null(input$app59_text3)&(input$app59_text3)!=""){
	app59_text3 <- as.character(input$app59_text3)
	}else{
	app59_text3 <-"darkgray"
	}


	app59_text4 <-"#77c0c7"
	app59_text5 <-"#f26949"

	if(!is.null(input$app59_text6)&(input$app59_text6)!=""){
	app59_text6 <- as.character(input$app59_text6)
	}else{
	app59_text6 <-"Plot"
	}
	if(!is.null(input$app59_text7)&(input$app59_text7)!=""){
	app59_text7 <- as.character(input$app59_text7)
	}else{
	app59_text7 <-"x"
	}	
	if(!is.null(input$app59_text8)&(input$app59_text8)!=""){
	app59_text8 <- as.character(input$app59_text8)
	}else{
	app59_text8 <-"y"
	}
	
	if(!is.null(input$app59_text9)&(input$app59_text9)!=""){
	app59_text9 <- as.numeric(input$app59_text9)
	}else{
	app59_text9 <-0.05
	}

	if(!is.null(input$app59_text10)&(input$app59_text10)!=""){
	app59_text10 <- as.numeric(input$app59_text10)
	}else{
	app59_text10 <-2
	}

	if(!is.null(input$app59_text11)&(input$app59_text11)!=""){
	app59_text11 <- as.numeric(input$app59_text11)
	}else{
	app59_text11 <-0.4
	}
	if(!is.null(input$app59_text12)&(input$app59_text12)!=""){
	app59_text12 <- as.numeric(input$app59_text12)
	}else{
	app59_text12 <-20
	}	
	
    if(!is.null(input$app59_email)&(input$app59_email)!=""){
	app59_email <- as.character(input$app59_email)
	}else{
	app59_email <-"no"
	}
	names(data)<-c("name","baseMean","log2FoldChange","padj")	

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app59",mytaskid=taskidnow,myemail=app59_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	myhist(data,app59_select1=app59_select1,app59_text1=app59_text1,app59_text2=app59_text2,app59_text3=app59_text3,app59_text4=app59_text4,app59_text5=app59_text5,app59_text6=app59_text6,app59_text7=app59_text7,app59_text8=app59_text8,app59_text9=app59_text9,app59_text10=app59_text10,app59_text11=app59_text11,app59_text12=app59_text12)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
	myhist(data,app59_select1=app59_select1,app59_text1=app59_text1,app59_text2=app59_text2,app59_text3=app59_text3,app59_text4=app59_text4,app59_text5=app59_text5,app59_text6=app59_text6,app59_text7=app59_text7,app59_text8=app59_text8,app59_text9=app59_text9,app59_text10=app59_text10,app59_text11=app59_text11,app59_text12=app59_text12)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
	myhist(data,app59_select1=app59_select1,app59_text1=app59_text1,app59_text2=app59_text2,app59_text3=app59_text3,app59_text4=app59_text4,app59_text5=app59_text5,app59_text6=app59_text6,app59_text7=app59_text7,app59_text8=app59_text8,app59_text9=app59_text9,app59_text10=app59_text10,app59_text11=app59_text11,app59_text12=app59_text12)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
	myhist(data,app59_select1=app59_select1,app59_text1=app59_text1,app59_text2=app59_text2,app59_text3=app59_text3,app59_text4=app59_text4,app59_text5=app59_text5,app59_text6=app59_text6,app59_text7=app59_text7,app59_text8=app59_text8,app59_text9=app59_text9,app59_text10=app59_text10,app59_text11=app59_text11,app59_text12=app59_text12)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app59_select1,app59_text1,app59_text2,app59_text3,app59_text4,app59_text5,app59_text6,app59_text7,app59_text8,app59_text9,app59_text10,app59_text11,app59_text12,app59_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app59/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
