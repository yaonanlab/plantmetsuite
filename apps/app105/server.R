appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app105_inputFile1)&done$data=="no"){
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
	temp.file <- input$app105_inputFile1$datapath
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
	if(!is.null(input$app105_text1)&(input$app105_text1)!=""){
	app105_text1 <- as.character(input$app105_text1)
	}else{
	app105_text1 <-"#ACCD03"
	}
	if(!is.null(input$app105_text2)&(input$app105_text2)!=""){
	app105_text2 <- as.character(input$app105_text2)
	}else{
	app105_text2 <-"#E07EA0"
	}
	if(!is.null(input$app105_text3)&(input$app105_text3)!=""){
	app105_text3 <- as.character(input$app105_text3)
	}else{
	app105_text3 <-"#FFD101"
	}
	if(!is.null(input$app105_text4)&(input$app105_text4)!=""){
	app105_text4 <- as.character(input$app105_text4)
	}else{
	app105_text4 <-"#5EBED6"
	}	
	if(!is.null(input$app105_text5)&(input$app105_text5)!=""){
	app105_text5 <- as.character(input$app105_text5)
	}else{
	app105_text5 <-"#776AAE"
	}
	if(!is.null(input$app105_text6)&(input$app105_text6)!=""){
	app105_text6 <- as.numeric(input$app105_text6)
	}else{
	app105_text6 <-0.5
	}	
	if(!is.null(input$app105_text7)&(input$app105_text7)!=""){
	app105_text7 <- as.character(input$app105_text7)
	}else{
	app105_text7 <-"Plot"
	}
	if(!is.null(input$app105_text8)&(input$app105_text8)!=""){
	app105_text8 <- as.character(input$app105_text8)
	}else{
	app105_text8 <-"mz"
	}
	if(!is.null(input$app105_text9)&(input$app105_text9)!=""){
	app105_text9 <- as.character(input$app105_text9)
	}else{
	app105_text9 <-"rt"
	}	
	if(!is.null(input$app105_text10)&(input$app105_text10)!=""){
	app105_text10 <- as.numeric(input$app105_text10)
	}else{
	app105_text10 <-30
	}
	if(!is.null(input$app105_text11)&(input$app105_text11)!=""){
	app105_text11 <- as.numeric(input$app105_text11)
	}else{
	app105_text11 <-1
	}
	if(!is.null(input$app105_select1)&(input$app105_select1)!=""){
	app105_select1 <- as.numeric(input$app105_select1)
	}else{
	app105_select1 <-21
	}
	if(!is.null(input$app105_select2)&(input$app105_select2)!=""){
	app105_select2 <- as.numeric(input$app105_select2)
	}else{
	app105_select2 <-2
	}
	if(!is.null(input$app105_select3)&(input$app105_select3)!=""){
	app105_select3 <- as.numeric(input$app105_select3)
	}else{
	app105_select3 <-0
	}
    if(!is.null(input$app105_email)&(input$app105_email)!=""){
	app105_email <- as.character(input$app105_email)
	}else{
	app105_email <-"no"
	}
    
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app105",mytaskid=taskidnow,myemail=app105_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	source("/srv/myapps/keyandaydayup/apps/app105/plot.R")
	output$result= renderPlot({
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app105_text1,app105_text2,app105_text3,app105_text4,app105_text5,app105_text6,app105_text7,app105_text8,app105_text9,app105_text10,app105_text11,app105_select1,app105_select2,app105_select3,app105_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app105/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
