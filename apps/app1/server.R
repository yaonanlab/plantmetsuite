appServer<-function(input,output){
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app1_inputFile)&done$data=="no"){
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
	output$taskjobidinfo<-renderText({paste("Please note down the task number and you can download the analysis results using the task number on the result download page on the left after the analysis is completed.","The analysis results will be retained for 24 hour, after which they will be automatically deleted, so please download them in time.！")})
	save(jobid,file="userdata/jobid")
	temp.file <- input$app1_inputFile$datapath
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
	app1_text1<-as.character(input$app1_text1)
	app1_text2<-as.character(input$app1_text2)
	app1_text3<-as.character(input$app1_text3)
	app1_text4<-as.numeric(as.character((input$app1_text4)))
    app1_select1 <- as.logical(as.numeric(input$app1_select1))
	app1_select2 <- as.logical(as.numeric(input$app1_select2))
	app1_select3 <- as.character(input$app1_select3)
	app1_select4 <- as.logical(as.numeric(input$app1_select4))
	app1_select5 <- as.logical(as.numeric(input$app1_select5))
	app1_select6 <- as.logical(as.numeric(input$app1_select6))
	app1_select7 <- as.character(input$app1_select7)
    if(!is.null(input$app1_email)&(input$app1_email)!=""){
	app1_email <- as.character(input$app1_email)
	}else{
	app1_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app1",mytaskid=taskidnow,myemail=app1_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
	pheatmap(data,color=colorRampPalette(c(app1_text1,app1_text2,app1_text3))(1000),fontsize=app1_text4,cluster_rows=app1_select1,cluster_cols=app1_select2,scale=app1_select3,display_numbers = app1_select4,show_rownames=app1_select5,show_colnames=app1_select6,border_color=app1_select7)
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "heatmap.png",
        content = function(file) {
            png(file)
	pheatmap(data,color=colorRampPalette(c(app1_text1,app1_text2,app1_text3))(1000),fontsize=app1_text4,cluster_rows=app1_select1,cluster_cols=app1_select2,scale=app1_select3,display_numbers = app1_select4,show_rownames=app1_select5,show_colnames=app1_select6,border_color=app1_select7)
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "heatmap.pdf",
        content = function(file) {
        pdf(file)
	pheatmap(data,color=colorRampPalette(c(app1_text1,app1_text2,app1_text3))(1000),fontsize=app1_text4,cluster_rows=app1_select1,cluster_cols=app1_select2,scale=app1_select3,display_numbers = app1_select4,show_rownames=app1_select5,show_colnames=app1_select6,border_color=app1_select7)
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "heatmap.svg",
        content = function(file) {
            svglite(file)
	pheatmap(data,color=colorRampPalette(c(app1_text1,app1_text2,app1_text3))(1000),fontsize=app1_text4,cluster_rows=app1_select1,cluster_cols=app1_select2,scale=app1_select3,display_numbers = app1_select4,show_rownames=app1_select5,show_colnames=app1_select6,border_color=app1_select7)
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app1_text1,app1_text2,app1_text3,app1_text4,app1_select1,app1_select2,app1_select3,app1_select4,app1_select5,app1_select6,app1_select7,app1_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app1/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
