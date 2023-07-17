appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app87_inputFile1)&done$data=="no"){
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
	output$taskjobidinfo<-renderText({paste("Please note down the task number and use it to download the results on the left-hand side of the results download page after the analysis is completed.","The results will be retained for 24 h, after which they will be automatically deleted, please download them in time!")})
	save(jobid,file="userdata/jobid")
	temp.file <- input$app87_inputFile1$datapath
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
	if(!is.null(input$app87_text1)&(input$app87_text1)!=""){
	app87_text1 <- as.character(input$app87_text1)
	}else{
	app87_text1 <-"#ACCD03"
	}
	if(!is.null(input$app87_text2)&(input$app87_text2)!=""){
	app87_text2 <- as.character(input$app87_text2)
	}else{
	app87_text2 <-"#E07EA0"
	}
	if(!is.null(input$app87_text3)&(input$app87_text3)!=""){
	app87_text3 <- as.character(input$app87_text3)
	}else{
	app87_text3 <-"#FFD101"
	}
	if(!is.null(input$app87_text4)&(input$app87_text4)!=""){
	app87_text4 <- as.character(input$app87_text4)
	}else{
	app87_text4 <-"#5EBED6"
	}	
	if(!is.null(input$app87_text5)&(input$app87_text5)!=""){
	app87_text5 <- as.character(input$app87_text5)
	}else{
	app87_text5 <-"#776AAE"
	}
	if(!is.null(input$app87_text6)&(input$app87_text6)!=""){
	app87_text6 <- as.numeric(input$app87_text6)
	}else{
	app87_text6 <-0.5
	}	
	if(!is.null(input$app87_text7)&(input$app87_text7)!=""){
	app87_text7 <- as.character(input$app87_text7)
	}else{
	app87_text7 <-"Plot"
	}
	if(!is.null(input$app87_text8)&(input$app87_text8)!=""){
	app87_text8 <- as.character(input$app87_text8)
	}else{
	app87_text8 <-"X"
	}
	if(!is.null(input$app87_text9)&(input$app87_text9)!=""){
	app87_text9 <- as.character(input$app87_text9)
	}else{
	app87_text9 <-"Y"
	}	
	if(!is.null(input$app87_text10)&(input$app87_text10)!=""){
	app87_text10 <- as.numeric(input$app87_text10)
	}else{
	app87_text10 <-30
	}
	if(!is.null(input$app87_text11)&(input$app87_text11)!=""){
	app87_text11 <- as.numeric(input$app87_text11)
	}else{
	app87_text11 <-1
	}
	if(!is.null(input$app87_select1)&(input$app87_select1)!=""){
	app87_select1 <- as.numeric(input$app87_select1)
	}else{
	app87_select1 <-21
	}
	if(!is.null(input$app87_select2)&(input$app87_select2)!=""){
	app87_select2 <- as.numeric(input$app87_select2)
	}else{
	app87_select2 <-2
	}
	if(!is.null(input$app87_select3)&(input$app87_select3)!=""){
	app87_select3 <- as.numeric(input$app87_select3)
	}else{
	app87_select3 <-0
	}
    if(!is.null(input$app87_email)&(input$app87_email)!=""){
	app87_email <- as.character(input$app87_email)
	}else{
	app87_email <-"no"
	}
    
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app87",mytaskid=taskidnow,myemail=app87_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	source("/srv/myapps/keyandaydayup/apps/app87/plot.R")
	output$result= renderPlot({
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app87_text1,app87_text2,app87_text3,app87_text4,app87_text5,app87_text6,app87_text7,app87_text8,app87_text9,app87_text10,app87_text11,app87_select1,app87_select2,app87_select3,app87_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app87/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
