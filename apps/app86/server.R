appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app86_inputFile1)&done$data=="no"){
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
	temp.file <- input$app86_inputFile1$datapath
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
	


	if(!is.null(input$app86_text1)&(input$app86_text1)!=""){
		app86_text1 <- as.character(input$app86_text1)
	}else{
		app86_text1 <-"#ACCD03"
	}
	if(!is.null(input$app86_text2)&(input$app86_text2)!=""){
		app86_text2 <- as.character(input$app86_text2)
	}else{
		app86_text2 <-"#E07EA0"
	}
	if(!is.null(input$app86_text3)&(input$app86_text3)!=""){
		app86_text3 <- as.character(input$app86_text3)
	}else{
		app86_text3 <-"#FFD101"
	}
	if(!is.null(input$app86_text4)&(input$app86_text4)!=""){
		app86_text4 <- as.character(input$app86_text4)
	}else{
		app86_text4 <-"#5EBED6"
	}
	if(!is.null(input$app86_text5)&(input$app86_text5)!=""){
		app86_text5 <- as.character(input$app86_text5)
	}else{
		app86_text5 <-"#776AAE"
	}
	if(!is.null(input$app86_text6)&(input$app86_text6)!=""){
		app86_text6 <- as.numeric(input$app86_text6)
	}else{
		app86_text6 <-60
	}
	if(!is.null(input$app86_text7)&(input$app86_text7)!=""){
		app86_text7 <- as.character(input$app86_text7)
	}else{
		app86_text7 <-"Plot"
	}
	if(!is.null(input$app86_text8)&(input$app86_text8)!=""){
		app86_text8 <- as.numeric(input$app86_text8)
	}else{
		app86_text8 <-2
	}
	
	if(!is.null(input$app86_select1)&(input$app86_select1)!=""){
		app86_select1 <- as.logical(input$app86_select1)
	}else{
		app86_select1 <-"true"
	}
	if(!is.null(input$app86_select2)&(input$app86_select2)!=""){
		app86_select2 <- as.character(input$app86_select2)
	}else{
		app86_select2 <-"0"
	}
	if(!is.null(input$app86_select3)&(input$app86_select3)!=""){
		app86_select3 <- as.character(input$app86_select3)
	}else{
		app86_select3 <-"0"
	}
	if(!is.null(input$app86_select4)&(input$app86_select4)!=""){
		app86_select4 <- as.character(input$app86_select4)
	}else{
		app86_select4 <-"p"
	}
	if(!is.null(input$app86_select5)&(input$app86_select5)!=""){
		app86_select5 <- as.character(input$app86_select5)
	}else{
		app86_select5 <-"0"
	}
	
    if(!is.null(input$app86_email)&(input$app86_email)!=""){
		app86_email <- as.character(input$app86_email)
	}else{
		app86_email <-"no"
	}
	
	source("/srv/myapps/keyandaydayup/apps/app86/plot.R")
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
		ipresult<-data.frame(myip=ip,myapp="app86",mytaskid=taskidnow,myemail=app86_email)
		write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
		drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
	}
   ) 
output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
		dev.off()
    },
    contentType = "image/png"
)
    
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
		pdf(file)
		drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
    dev.off()
    },
    contentType = "image/pdf"
)
	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
		dev.off()
    },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app86_text1,app86_text2,app86_text3,app86_text4,app86_text5,app86_text6,app86_text7,app86_text8,app86_select1,app86_select2,app86_select3,app86_select4,app86_select5,app86_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app86/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
