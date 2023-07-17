appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app79_inputFile1)){
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
	temp.file <- input$app79_inputFile1$datapath
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
	if(!is.null(input$app79_select1)&(input$app79_select1)!=""){
	app79_select1 <- as.character(input$app79_select1)
	}else{
	app79_select1 <-"0"
	}
	if(!is.null(input$app79_select2)&(input$app79_select2)!=""){
	app79_select2 <- as.character(input$app79_select2)
	}else{
	app79_select2 <-"0"
	}
	if(!is.null(input$app79_select3)&(input$app79_select3)!=""){
	app79_select3 <- as.character(input$app79_select3)
	}else{
	app79_select3 <-"0"
	}
	if(!is.null(input$app79_select4)&(input$app79_select4)!=""){
	app79_select4 <- as.character(input$app79_select4)
	}else{
	app79_select4 <-"0"
	}
	if(!is.null(input$app79_select5)&(input$app79_select5)!=""){
	app79_select5 <- as.character(input$app79_select5)
	}else{
	app79_select5 <-"0"
	}
	if(!is.null(input$app79_select6)&(input$app79_select6)!=""){
	app79_select6 <- as.character(input$app79_select6)
	}else{
	app79_select6 <-"0"
	}
	if(!is.null(input$app79_text1)&(input$app79_text1)!=""){
	app79_text1 <- as.character(input$app79_text1)
	}else{
	app79_text1 <-"#f682af"
	}
	if(!is.null(input$app79_text2)&(input$app79_text2)!=""){
	app79_text2 <- as.character(input$app79_text2)
	}else{
	app79_text2 <-"#9379e6"
	}
	if(!is.null(input$app79_text3)&(input$app79_text3)!=""){
	app79_text3 <- as.character(input$app79_text3)
	}else{
	app79_text3 <-"#efb94d"
	}
	if(!is.null(input$app79_text4)&(input$app79_text4)!=""){
	app79_text4 <- as.character(input$app79_text4)
	}else{
	app79_text4 <-"#77c0c7"
	}
	if(!is.null(input$app79_text5)&(input$app79_text5)!=""){
	app79_text5 <- as.character(input$app79_text5)
	}else{
	app79_text5 <-"#f26949"
	}
	if(!is.null(input$app79_text6)&(input$app79_text6)!=""){
	app79_text6 <- as.character(input$app79_text6)
	}else{
	app79_text6 <-"Plot"
	}
	if(!is.null(input$app79_text7)&(input$app79_text7)!=""){
	app79_text7 <- as.character(input$app79_text7)
	}else{
	app79_text7 <-"x"
	}	
	if(!is.null(input$app79_text8)&(input$app79_text8)!=""){
	app79_text8 <- as.character(input$app79_text8)
	}else{
	app79_text8 <-"y"
	}
    if(!is.null(input$app79_email)&(input$app79_email)!=""){
	app79_email <- as.character(input$app79_email)
	}else{
	app79_email <-"no"
	}
	if(ncol(data)==3){
	names(data)<-c("time","group","value")	
	}else{
	names(data)<-c("time","group","value","weight")	
	}

	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app79",mytaskid=taskidnow,myemail=app79_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
 output$plotlyresult= renderPlotly(
 
    p <- 
	ggplotly({drawchart(data,app79_select1=app79_select1,app79_select2=app79_select2,app79_select3=app79_select3,app79_select4=app79_select4,app79_select5=app79_select5,app79_select6=app79_select6,app79_text1=app79_text1,app79_text2=app79_text2,app79_text3=app79_text3,app79_text4=app79_text4,app79_text5=app79_text5,app79_text6=app79_text6,app79_text7=app79_text7,app79_text8=app79_text8)})
    
     %>% 
      layout(dragmode = "select") %>%
      event_register("plotly_selecting")%>%
	  config(displaylogo = FALSE)%>%
	  config(modeBarButtonsToRemove = c("toggleHover","toggleSpikelines","hoverClosestCartesian", "hoverCompareCartesian"))
)

 output$rawdata <- renderPrint({
   head(data,10)
  })
  
 output$hover <- renderPrint({
    d <- event_data("plotly_click")
    if (is.null(d)) "双击鼠标查看单个数据点，空白处双击还原" else d
  })


  output$selecting <- renderPrint({
    d <- event_data("plotly_selecting")
    if (is.null(d)) "框选范围查看多个数据点，空白处双击还原" else d
  })
   
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
	drawchart(data,app79_select1=app79_select1,app79_select2=app79_select2,app79_select3=app79_select3,app79_select4=app79_select4,app79_select5=app79_select5,app79_select6=app79_select6,app79_text1=app79_text1,app79_text2=app79_text2,app79_text3=app79_text3,app79_text4=app79_text4,app79_text5=app79_text5,app79_text6=app79_text6,app79_text7=app79_text7,app79_text8=app79_text8)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
	drawchart(data,app79_select1=app79_select1,app79_select2=app79_select2,app79_select3=app79_select3,app79_select4=app79_select4,app79_select5=app79_select5,app79_select6=app79_select6,app79_text1=app79_text1,app79_text2=app79_text2,app79_text3=app79_text3,app79_text4=app79_text4,app79_text5=app79_text5,app79_text6=app79_text6,app79_text7=app79_text7,app79_text8=app79_text8)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
	drawchart(data,app79_select1=app79_select1,app79_select2=app79_select2,app79_select3=app79_select3,app79_select4=app79_select4,app79_select5=app79_select5,app79_select6=app79_select6,app79_text1=app79_text1,app79_text2=app79_text2,app79_text3=app79_text3,app79_text4=app79_text4,app79_text5=app79_text5,app79_text6=app79_text6,app79_text7=app79_text7,app79_text8=app79_text8)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app79_select1,app79_select2,app79_select3=app79_select3,app79_select4=app79_select4,app79_select5=app79_select5,app79_select6=app79_select6,app79_text1,app79_text2,app79_text3,app79_text4,app79_text5,app79_text6,app79_text7,app79_text8,app79_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app79/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
}
