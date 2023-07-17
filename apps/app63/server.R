appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app63_inputFile1)&done$data=="no"){
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
	temp.file <- input$app63_inputFile1$datapath
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

	app63_select1 <-"boxplot"
	if(!is.null(input$app63_text1)&(input$app63_text1)!=""){
	app63_text1 <- as.character(input$app63_text1)
	}else{
	app63_text1 <-"#54778f"
	}
	if(!is.null(input$app63_text2)&(input$app63_text2)!=""){
	app63_text2 <- as.character(input$app63_text2)
	}else{
	app63_text2 <-"#4EB043"
	}
	if(!is.null(input$app63_text3)&(input$app63_text3)!=""){
	app63_text3 <- as.character(input$app63_text3)
	}else{
	app63_text3 <-"#E69D2A"
	}
	if(!is.null(input$app63_text4)&(input$app63_text4)!=""){
	app63_text4 <- as.character(input$app63_text4)
	}else{
	app63_text4 <-"#DD4714"
	}
	if(!is.null(input$app63_text5)&(input$app63_text5)!=""){
	app63_text5 <- as.character(input$app63_text5)
	}else{
	app63_text5 <-"#A61650"
	}



	app63_text6 <-"Plot"
	app63_text7 <-"x"
	app63_text8 <-"y"	
	app63_text9 <-0.05
	app63_text10 <-2
	app63_text11 <-0.4
	app63_text12 <-20
	
    if(!is.null(input$app63_email)&(input$app63_email)!=""){
	app63_email <- as.character(input$app63_email)
	}else{
	app63_email <-"no"
	}
	names(data)<-c("id","height","label")	

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app63",mytaskid=taskidnow,myemail=app63_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	myhist(data,app63_select1=app63_select1,app63_text1=app63_text1,app63_text2=app63_text2,app63_text3=app63_text3,app63_text4=app63_text4,app63_text5=app63_text5,app63_text6=app63_text6,app63_text7=app63_text7,app63_text8=app63_text8,app63_text9=app63_text9,app63_text10=app63_text10,app63_text11=app63_text11,app63_text12=app63_text12)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
	myhist(data,app63_select1=app63_select1,app63_text1=app63_text1,app63_text2=app63_text2,app63_text3=app63_text3,app63_text4=app63_text4,app63_text5=app63_text5,app63_text6=app63_text6,app63_text7=app63_text7,app63_text8=app63_text8,app63_text9=app63_text9,app63_text10=app63_text10,app63_text11=app63_text11,app63_text12=app63_text12)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file, onefile = FALSE)
	myhist(data,app63_select1=app63_select1,app63_text1=app63_text1,app63_text2=app63_text2,app63_text3=app63_text3,app63_text4=app63_text4,app63_text5=app63_text5,app63_text6=app63_text6,app63_text7=app63_text7,app63_text8=app63_text8,app63_text9=app63_text9,app63_text10=app63_text10,app63_text11=app63_text11,app63_text12=app63_text12)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
	myhist(data,app63_select1=app63_select1,app63_text1=app63_text1,app63_text2=app63_text2,app63_text3=app63_text3,app63_text4=app63_text4,app63_text5=app63_text5,app63_text6=app63_text6,app63_text7=app63_text7,app63_text8=app63_text8,app63_text9=app63_text9,app63_text10=app63_text10,app63_text11=app63_text11,app63_text12=app63_text12)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app63_select1,app63_text1,app63_text2,app63_text3,app63_text4,app63_text5,app63_text6,app63_text7,app63_text8,app63_text9,app63_text10,app63_text11,app63_text12,app63_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app63/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
