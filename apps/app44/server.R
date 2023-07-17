appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app44_inputFile1)&done$data=="no"){
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
	temp.file <- input$app44_inputFile1$datapath
	file.copy(temp.file,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"))
	if(length(grep(".csv",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),head=T,row.names=1)
	}
	if(length(grep(".xls",filename))>0){
	data0<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".xlsx",filename))>0){
	data0<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".txt",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),sep="\t",head=T,row.names=1)
	}
	if(!is.null(input$app44_text1)&(input$app44_text1)!=""){
	app44_text1 <- as.character(input$app44_text1)
	}else{
	app44_text1 <-"#77C034"
	}
	if(!is.null(input$app44_text2)&(input$app44_text2)!=""){
	app44_text2 <- as.character(input$app44_text2)
	}else{
	app44_text2 <-"#FFFFFF"
	}
	if(!is.null(input$app44_text3)&(input$app44_text3)!=""){
	app44_text3 <- as.character(input$app44_text3)
	}else{
	app44_text3 <-"#C388FE"
	}
	app44_text4 <-""	
	if(!is.null(input$app44_text5)&(input$app44_text5)!=""){
	app44_text5 <- as.numeric(input$app44_text5)
	}else{
	app44_text5 <-1
	}
	if(!is.null(input$app44_select1)&(input$app44_select1)!=""){
	app44_select1 <- as.character(input$app44_select1)
	}else{
	app44_select1 <-"circle"
	}	
	if(!is.null(input$app44_select2)&(input$app44_select2)!=""){
	app44_select2 <- as.character(input$app44_select2)
	}else{
	app44_select2 <-"full"
	}	
	if(!is.null(input$app44_select3)&(input$app44_select3)!=""){
	app44_select3 <- as.character(input$app44_select3)
	}else{
	app44_select3 <-"hclust"
	}	
	if(!is.null(input$app44_select4)&(input$app44_select4)!=""){
	app44_select4 <- as.character(input$app44_select4)
	}else{
	app44_select4 <-"0"
	}	
	if(!is.null(input$app44_select5)&(input$app44_select5)!=""){
	app44_select5 <- as.character(input$app44_select5)
	}else{
	app44_select5 <-"0"
	}		
    if(!is.null(input$app44_email)&(input$app44_email)!=""){
	app44_email <- as.character(input$app44_email)
	}else{
	app44_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app44",mytaskid=taskidnow,myemail=app44_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
drawchart(data,app44_select1=app44_select1,app44_select2=app44_select2,app44_select3=app44_select3,app44_select4=app44_select4,app44_select5=app44_select5,app44_text1=app44_text1,app44_text2=app44_text2,app44_text3=app44_text3,app44_text4=app44_text4,app44_text5=app44_text5)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app44_select1=app44_select1,app44_select2=app44_select2,app44_select3=app44_select3,app44_select4=app44_select4,app44_select5=app44_select5,app44_text1=app44_text1,app44_text2=app44_text2,app44_text3=app44_text3,app44_text4=app44_text4,app44_text5=app44_text5)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app44_select1=app44_select1,app44_select2=app44_select2,app44_select3=app44_select3,app44_select4=app44_select4,app44_select5=app44_select5,app44_text1=app44_text1,app44_text2=app44_text2,app44_text3=app44_text3,app44_text4=app44_text4,app44_text5=app44_text5)   
 dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app44_select1=app44_select1,app44_select2=app44_select2,app44_select3=app44_select3,app44_select4=app44_select4,app44_select5=app44_select5,app44_text1=app44_text1,app44_text2=app44_text2,app44_text3=app44_text3,app44_text4=app44_text4,app44_text5=app44_text5)
dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app44_select1,app44_select2,app44_select3,app44_select4,app44_select5,app44_text1,app44_text2,app44_text3,app44_text4,app44_text5,app44_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app44/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
