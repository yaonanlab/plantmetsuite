appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app64_inputFile1)&done$data=="no"){
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
	temp.file <- input$app64_inputFile1$datapath
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
	if(!is.null(input$app64_select1)&(input$app64_select1)!=""){
	app64_select1 <- as.character(input$app64_select1)
	}else{
	app64_select1 <-"swarm"
	}
	if(!is.null(input$app64_select2)&(input$app64_select2)!=""){
	app64_select2 <- as.character(input$app64_select2)
	}else{
	app64_select2 <-"0"
	}
	app64_select3 <-"0"
	app64_select4 <-"0"
	app64_select5 <-"0"
	if(!is.null(input$app64_text1)&(input$app64_text1)!=""){
	app64_text1 <- as.character(input$app64_text1)
	}else{
	app64_text1 <-"#f682af"
	}
	if(!is.null(input$app64_text2)&(input$app64_text2)!=""){
	app64_text2 <- as.character(input$app64_text2)
	}else{
	app64_text2 <-"#9379e6"
	}
	if(!is.null(input$app64_text3)&(input$app64_text3)!=""){
	app64_text3 <- as.character(input$app64_text3)
	}else{
	app64_text3 <-"#efb94d"
	}
	if(!is.null(input$app64_text4)&(input$app64_text4)!=""){
	app64_text4 <- as.character(input$app64_text4)
	}else{
	app64_text4 <-"#77c0c7"
	}
	if(!is.null(input$app64_text5)&(input$app64_text5)!=""){
	app64_text5 <- as.character(input$app64_text5)
	}else{
	app64_text5 <-"#f26949"
	}
	

	app64_text6 <-"#FC2477"
	app64_text7 <-"#4B15EB"
	app64_text8 <-"#EDA407"
	app64_text9 <-"#0FB2C4"
	app64_text10 <-"#F73505"
	
	if(!is.null(input$app64_text11)&(input$app64_text11)!=""){
	app64_text11 <- as.character(input$app64_text11)
	}else{
	app64_text11 <-"Plot"
	}
	if(!is.null(input$app64_text12)&(input$app64_text12)!=""){
	app64_text12 <- as.character(input$app64_text12)
	}else{
	app64_text12 <-"x"
	}	
	if(!is.null(input$app64_text13)&(input$app64_text13)!=""){
	app64_text13 <- as.character(input$app64_text13)
	}else{
	app64_text13 <-"y"
	}
    if(!is.null(input$app64_email)&(input$app64_email)!=""){
	app64_email <- as.character(input$app64_email)
	}else{
	app64_email <-"no"
	}
	names(data)<-c("group","value")	


	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app64",mytaskid=taskidnow,myemail=app64_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
drawchart(data,app64_select1=app64_select1,app64_select2=app64_select2,app64_select3=app64_select3,app64_select4=app64_select4,app64_select5=app64_select5,app64_text1=app64_text1,app64_text2=app64_text2,app64_text3=app64_text3,app64_text4=app64_text4,app64_text5=app64_text5,app64_text6=app64_text6,app64_text7=app64_text7,app64_text8=app64_text8,app64_text9=app64_text9,app64_text10=app64_text10,app64_text11=app64_text11,app64_text12=app64_text12,app64_text13=app64_text13)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app64_select1=app64_select1,app64_select2=app64_select2,app64_select3=app64_select3,app64_select4=app64_select4,app64_select5=app64_select5,app64_text1=app64_text1,app64_text2=app64_text2,app64_text3=app64_text3,app64_text4=app64_text4,app64_text5=app64_text5,app64_text6=app64_text6,app64_text7=app64_text7,app64_text8=app64_text8,app64_text9=app64_text9,app64_text10=app64_text10,app64_text11=app64_text11,app64_text12=app64_text12,app64_text13=app64_text13)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app64_select1=app64_select1,app64_select2=app64_select2,app64_select3=app64_select3,app64_select4=app64_select4,app64_select5=app64_select5,app64_text1=app64_text1,app64_text2=app64_text2,app64_text3=app64_text3,app64_text4=app64_text4,app64_text5=app64_text5,app64_text6=app64_text6,app64_text7=app64_text7,app64_text8=app64_text8,app64_text9=app64_text9,app64_text10=app64_text10,app64_text11=app64_text11,app64_text12=app64_text12,app64_text13=app64_text13)
   dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app64_select1=app64_select1,app64_select2=app64_select2,app64_select3=app64_select3,app64_select4=app64_select4,app64_select5=app64_select5,app64_text1=app64_text1,app64_text2=app64_text2,app64_text3=app64_text3,app64_text4=app64_text4,app64_text5=app64_text5,app64_text6=app64_text6,app64_text7=app64_text7,app64_text8=app64_text8,app64_text9=app64_text9,app64_text10=app64_text10,app64_text11=app64_text11,app64_text12=app64_text12,app64_text13=app64_text13)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app64_select1,app64_select2,app64_select3=app64_select3,app64_select4=app64_select4,app64_select5=app64_select5,app64_text1,app64_text2,app64_text3,app64_text4,app64_text5,app64_text6,app64_text7,app64_text8,app64_text9,app64_text10,app64_text11,app64_text12,app64_text13,app64_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app64/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
