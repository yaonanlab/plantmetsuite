appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app46_inputFile1)&done$data=="no"){
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
	temp.file <- input$app46_inputFile1$datapath
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
	if(!is.null(input$app46_select1)&(input$app46_select1)!=""){
	app46_select1 <- as.character(input$app46_select1)
	}else{
	app46_select1 <-"0"
	}
	if(!is.null(input$app46_select2)&(input$app46_select2)!=""){
	app46_select2 <- as.character(input$app46_select2)
	}else{
	app46_select2 <-"0"
	}
	if(!is.null(input$app46_text1)&(input$app46_text1)!=""){
	app46_text1 <- as.character(input$app46_text1)
	}else{
	app46_text1 <-"#f682af"
	}
	if(!is.null(input$app46_text2)&(input$app46_text2)!=""){
	app46_text2 <- as.character(input$app46_text2)
	}else{
	app46_text2 <-"#9379e6"
	}
	if(!is.null(input$app46_text3)&(input$app46_text3)!=""){
	app46_text3 <- as.character(input$app46_text3)
	}else{
	app46_text3 <-"#efb94d"
	}
	if(!is.null(input$app46_text4)&(input$app46_text4)!=""){
	app46_text4 <- as.character(input$app46_text4)
	}else{
	app46_text4 <-"#77c0c7"
	}
	if(!is.null(input$app46_text5)&(input$app46_text5)!=""){
	app46_text5 <- as.character(input$app46_text5)
	}else{
	app46_text5 <-"#f26949"
	}
	if(!is.null(input$app46_text6)&(input$app46_text6)!=""){
	app46_text6 <- as.character(input$app46_text6)
	}else{
	app46_text6 <-"Plot"
	}
	if(!is.null(input$app46_text7)&(input$app46_text7)!=""){
	app46_text7 <- as.character(input$app46_text7)
	}else{
	app46_text7 <-"x"
	}	
	if(!is.null(input$app46_text8)&(input$app46_text8)!=""){
	app46_text8 <- as.character(input$app46_text8)
	}else{
	app46_text8 <-"y"
	}
    if(!is.null(input$app46_email)&(input$app46_email)!=""){
	app46_email <- as.character(input$app46_email)
	}else{
	app46_email <-"no"
	}
	names(data)<-c("value","group")	

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app46",mytaskid=taskidnow,myemail=app46_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
	myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
	myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
	myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app46_select1,app46_select2,app46_text1,app46_text2,app46_text3,app46_text4,app46_text5,app46_text6,app46_text7,app46_text8,app46_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app46/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
