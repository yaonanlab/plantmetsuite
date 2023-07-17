appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app66_inputFile1)&done$data=="no"){
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
	temp.file <- input$app66_inputFile1$datapath
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
	if(!is.null(input$app66_select1)&(input$app66_select1)!=""){
	app66_select1 <- as.character(input$app66_select1)
	}else{
	app66_select1 <-"0"
	}
	app66_select2 <-"0"
	app66_select3 <-"0"
	app66_select4 <-"0"
	app66_select5 <-"0"
	if(!is.null(input$app66_text1)&(input$app66_text1)!=""){
	app66_text1 <- as.character(input$app66_text1)
	}else{
	app66_text1 <-"#f682af"
	}
	if(!is.null(input$app66_text2)&(input$app66_text2)!=""){
	app66_text2 <- as.character(input$app66_text2)
	}else{
	app66_text2 <-"#9379e6"
	}
	if(!is.null(input$app66_text3)&(input$app66_text3)!=""){
	app66_text3 <- as.character(input$app66_text3)
	}else{
	app66_text3 <-"#efb94d"
	}
	if(!is.null(input$app66_text4)&(input$app66_text4)!=""){
	app66_text4 <- as.character(input$app66_text4)
	}else{
	app66_text4 <-"#77c0c7"
	}
	if(!is.null(input$app66_text5)&(input$app66_text5)!=""){
	app66_text5 <- as.character(input$app66_text5)
	}else{
	app66_text5 <-"#f26949"
	}
	
		if(!is.null(input$app66_text6)&(input$app66_text6)!=""){
	app66_text6 <- as.numeric(input$app66_text6)
	}else{
	app66_text6 <-"0"
	}
		if(!is.null(input$app66_text7)&(input$app66_text7)!=""){
	app66_text7 <- as.numeric(input$app66_text7)
	}else{
	app66_text7 <-"0"
	}
		if(!is.null(input$app66_text8)&(input$app66_text8)!=""){
	app66_text8 <- as.numeric(input$app66_text8)
	}else{
	app66_text8 <-"0"
	}
		if(!is.null(input$app66_text9)&(input$app66_text9)!=""){
	app66_text9 <- as.numeric(input$app66_text9)
	}else{
	app66_text9 <-"0"
	}

		if(!is.null(input$app66_text10)&(input$app66_text10)!=""){
	app66_text10 <- as.numeric(input$app66_text10)
	}else{
	app66_text10 <-"9999"
	}
	
	if(!is.null(input$app66_text11)&(input$app66_text11)!=""){
	app66_text11 <- as.numeric(input$app66_text11)
	}else{
	app66_text11 <-"0"
	}
	if(!is.null(input$app66_text12)&(input$app66_text12)!=""){
	app66_text12 <- as.numeric(input$app66_text12)
	}else{
	app66_text12 <-"10"
	}	
	if(!is.null(input$app66_text13)&(input$app66_text13)!=""){
	app66_text13 <- as.numeric(input$app66_text13)
	}else{
	app66_text13 <-"5"
	}
	if(!is.null(input$app66_text14)&(input$app66_text14)!=""){
	app66_text14 <- as.numeric(input$app66_text14)
	}else{
	app66_text14 <-"1"
	}	
	if(!is.null(input$app66_text15)&(input$app66_text15)!=""){
	app66_text15 <- as.character(input$app66_text15)
	}else{
	app66_text15 <-"Plot"
	}	
	if(!is.null(input$app66_text16)&(input$app66_text16)!=""){
	app66_text16 <- as.character(input$app66_text16)
	}else{
	app66_text16 <-"x"
	}	
	if(!is.null(input$app66_text17)&(input$app66_text17)!=""){
	app66_text17 <- as.character(input$app66_text17)
	}else{
	app66_text17 <-"y"
	}		
    if(!is.null(input$app66_email)&(input$app66_email)!=""){
	app66_email <- as.numeric(input$app66_email)
	}else{
	app66_email <-"no"
	}



	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app66",mytaskid=taskidnow,myemail=app66_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
   dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app66_select1,app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1,app66_text2,app66_text3,app66_text4,app66_text5,app66_text6,app66_text7,app66_text8,app66_text9,app66_text10,app66_text11,app66_text12,app66_text13,app66_text14,app66_text15,app66_text16,app66_text17,app66_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app66/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
