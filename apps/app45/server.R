appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app45_inputFile1)&done$data=="no"){
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
	temp.file <- input$app45_inputFile1$datapath
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
	if(!is.null(input$app45_select1)&(input$app45_select1)!=""){
	app45_select1 <- as.character(input$app45_select1)
	}else{
	app45_select1 <-"1"
	}
	if(!is.null(input$app45_select2)&(input$app45_select2)!=""){
	app45_select2 <- as.character(input$app45_select2)
	}else{
	app45_select2 <-"0"
	}
	if(!is.null(input$app45_text1)&(input$app45_text1)!=""){
	app45_text1 <- as.character(input$app45_text1)
	}else{
	app45_text1 <-"#8C99F7"
	}
	if(!is.null(input$app45_text2)&(input$app45_text2)!=""){
	app45_text2 <- as.character(input$app45_text2)
	}else{
	app45_text2 <-"#24FF99"
	}
	if(!is.null(input$app45_text3)&(input$app45_text3)!=""){
	app45_text3 <- as.character(input$app45_text3)
	}else{
	app45_text3 <-"#FA649E"
	}
	if(!is.null(input$app45_text4)&(input$app45_text4)!=""){
	app45_text4 <- as.numeric(input$app45_text4)
	}else{
	app45_text4 <-20
	}
    if(!is.null(input$app45_email)&(input$app45_email)!=""){
	app45_email <- as.character(input$app45_email)
	}else{
	app45_email <-"no"
	}

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app45",mytaskid=taskidnow,myemail=app45_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
print(drawchart(data,app45_select1=app45_select1,app45_select2=app45_select2,app45_text1=app45_text1,app45_text2=app45_text2,app45_text3=app45_text3,app45_text4=app45_text4))	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app45_select1=app45_select1,app45_select2=app45_select2,app45_text1=app45_text1,app45_text2=app45_text2,app45_text3=app45_text3,app45_text4=app45_text4)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app45_select1=app45_select1,app45_select2=app45_select2,app45_text1=app45_text1,app45_text2=app45_text2,app45_text3=app45_text3,app45_text4=app45_text4)
   dev.off()
        },
        contentType = "image/pdf"
    )
	


mycmdfirst<-paste(taskidnow,app45_select1,app45_select2,app45_text1,app45_text2,app45_text3,app45_text4,app45_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app45/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
