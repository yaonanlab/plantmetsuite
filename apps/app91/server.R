appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app91_inputFile1)&done$data=="no"){
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
	temp.file <- input$app91_inputFile1$datapath
	file.copy(temp.file,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"))
	source("/srv/myapps/keyandaydayup/apps/app91/plot.R")
	
	if(length(grep(".maf",filename))>0){
	laml<-read.maf(maf = file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename))
	}
	if(length(grep(".txt",filename))>0){
	laml<-read.maf(maf = file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename))
	}

	if(!is.null(input$app91_text1)&(input$app91_text1)!=""){
		app91_text1 <- as.character(input$app91_text1)
	}else{
		app91_text1 <-"#8DD3C7"
	}
	if(!is.null(input$app91_text2)&(input$app91_text2)!=""){
		app91_text2 <- as.character(input$app91_text2)
	}else{
		app91_text2 <-"#FFFFB3"
	}
	if(!is.null(input$app91_text3)&(input$app91_text3)!=""){
		app91_text3 <- as.character(input$app91_text3)
	}else{
		app91_text3 <-"#BEBADA"
	}
	if(!is.null(input$app91_text4)&(input$app91_text4)!=""){
		app91_text4 <- as.character(input$app91_text4)
	}else{
		app91_text4 <-"#FB8072"
	}
	if(!is.null(input$app91_text5)&(input$app91_text5)!=""){
		app91_text5 <- as.character(input$app91_text5)
	}else{
		app91_text5 <-"#80B1D3"
	}
	if(!is.null(input$app91_text6)&(input$app91_text6)!=""){
		app91_text6 <- as.character(input$app91_text6)
	}else{
		app91_text6 <-"#FDB462"
	}
	if(!is.null(input$app91_text7)&(input$app91_text7)!=""){
		app91_text7 <- as.character(input$app91_text7)
	}else{
		app91_text7 <-"#B3DE69"
	}
	if(!is.null(input$app91_text8)&(input$app91_text8)!=""){
		app91_text8 <- as.character(input$app91_text8)
	}else{
		app91_text8 <-"#FCCDE5"
	}
	if(!is.null(input$app91_text9)&(input$app91_text9)!=""){
		app91_text9 <- as.numeric(input$app91_text9)
	}else{
		app91_text9 <-0.5
	}
	if(!is.null(input$app91_text10)&(input$app91_text10)!=""){
		app91_text10 <- as.numeric(input$app91_text10)
	}else{
		app91_text10 <-20
	}
	
	if(!is.null(input$app91_select1)&(input$app91_select1)!=""){
		app91_select1 <- as.logical(input$app91_select1)
	}else{
		app91_select1 <-"false"
	}
	if(!is.null(input$app91_select2)&(input$app91_select2)!=""){
		app91_select2 <- as.character(input$app91_select2)
	}else{
		app91_select2 <-"0"
	}
	
    if(!is.null(input$app91_email)&(input$app91_email)!=""){
		app91_email <- as.character(input$app91_email)
	}else{
		app91_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
		ipresult<-data.frame(myip=ip,myapp="app91",mytaskid=taskidnow,myemail=app91_email)
		write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
		drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
	}
   ) 
output$downloadpng <- downloadHandler(
    filename = "result.png",
    content = function(file) {
        png(file)
		drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
		dev.off()
    },
    contentType = "image/png"
)
    
output$downloadpdf <- downloadHandler(
    filename = "result.pdf",
    content = function(file) {
		pdf(file)
		drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
    dev.off()
    },
    contentType = "image/pdf"
)
	
output$downloadsvg <- downloadHandler(
    filename = "result.svg",
    content = function(file) {
        svglite(file)
		drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
		dev.off()
    },
    contentType = "image/svg"
)

mycmdfirst<-paste(taskidnow,app91_text1,app91_text2,app91_text3,app91_text4,app91_text5,app91_text6,app91_text7,app91_text8,app91_text9,app91_text10,app91_select1,app91_select2,app91_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app91/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
