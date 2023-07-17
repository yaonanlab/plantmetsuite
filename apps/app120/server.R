appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app120_inputFile1)&done$data=="no"){
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
	temp.file <- input$app120_inputFile1$datapath
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
	if(!is.null(input$app120_select1)&(input$app120_select1)!=""){
	app120_select1 <- as.character(input$app120_select1)
	}else{
	app120_select1 <-"0"
	}
	if(!is.null(input$app120_select2)&(input$app120_select2)!=""){
	app120_select2 <- as.character(input$app120_select2)
	}else{
	app120_select2 <-"0"
	}
	if(!is.null(input$app120_select3)&(input$app120_select3)!=""){
	app120_select3 <- as.character(input$app120_select3)
	}else{
	app120_select3 <-"0"
	}
	if(!is.null(input$app120_select4)&(input$app120_select4)!=""){
	app120_select4 <- as.character(input$app120_select4)
	}else{
	app120_select4 <-"0"
	}
	if(!is.null(input$app120_select5)&(input$app120_select5)!=""){
	app120_select5 <- as.character(input$app120_select5)
	}else{
	app120_select5 <-"0"
	}
	if(!is.null(input$app120_text1)&(input$app120_text1)!=""){
	app120_text1 <- as.character(input$app120_text1)
	}else{
	app120_text1 <-"#f682af"
	}
	if(!is.null(input$app120_text2)&(input$app120_text2)!=""){
	app120_text2 <- as.character(input$app120_text2)
	}else{
	app120_text2 <-"#9379e6"
	}
	if(!is.null(input$app120_text3)&(input$app120_text3)!=""){
	app120_text3 <- as.character(input$app120_text3)
	}else{
	app120_text3 <-"#efb94d"
	}
	if(!is.null(input$app120_text4)&(input$app120_text4)!=""){
	app120_text4 <- as.character(input$app120_text4)
	}else{
	app120_text4 <-"#77c0c7"
	}
	if(!is.null(input$app120_text5)&(input$app120_text5)!=""){
	app120_text5 <- as.character(input$app120_text5)
	}else{
	app120_text5 <-"#f26949"
	}
	
	if(!is.null(input$app120_text6)&(input$app120_text6)!=""){
	app120_text6 <- as.character(input$app120_text6)
	}else{
	app120_text6 <-"#FC2477"
	}
	if(!is.null(input$app120_text7)&(input$app120_text7)!=""){
	app120_text7 <- as.character(input$app120_text7)
	}else{
	app120_text7 <-"#4B15EB"
	}
	if(!is.null(input$app120_text8)&(input$app120_text8)!=""){
	app120_text8 <- as.character(input$app120_text8)
	}else{
	app120_text8 <-"#EDA407"
	}
	if(!is.null(input$app120_text9)&(input$app120_text9)!=""){
	app120_text9 <- as.character(input$app120_text9)
	}else{
	app120_text9 <-"#0FB2C4"
	}
	if(!is.null(input$app120_text10)&(input$app120_text10)!=""){
	app120_text10 <- as.character(input$app120_text10)
	}else{
	app120_text10 <-"#F73505"
	}	
	
	if(!is.null(input$app120_text11)&(input$app120_text11)!=""){
	app120_text11 <- as.character(input$app120_text11)
	}else{
	app120_text11 <-"Plot"
	}
	if(!is.null(input$app120_text12)&(input$app120_text12)!=""){
	app120_text12 <- as.character(input$app120_text12)
	}else{
	app120_text12 <-"x"
	}	
	if(!is.null(input$app120_text13)&(input$app120_text13)!=""){
	app120_text13 <- as.character(input$app120_text13)
	}else{
	app120_text13 <-"y"
	}
    if(!is.null(input$app120_email)&(input$app120_email)!=""){
	app120_email <- as.character(input$app120_email)
	}else{
	app120_email <-"no"
	}
	names(data)<-c("Group","Treatment","Value")	


	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app120",mytaskid=taskidnow,myemail=app120_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
   dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app120_select1,app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1,app120_text2,app120_text3,app120_text4,app120_text5,app120_text6,app120_text7,app120_text8,app120_text9,app120_text10,app120_text11,app120_text12,app120_text13,app120_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app120/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
