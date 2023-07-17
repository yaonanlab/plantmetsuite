appServer<-function(input,output){
library(VennDiagram)
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app4_inputFile)&done$data=="no"){
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
	temp.file <- input$app4_inputFile$datapath
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
	app4_text1<-as.character(input$app4_text1)
	app4_text2<-as.character(input$app4_text2)
	app4_text3<-as.character(input$app4_text3)
	app4_text4<-as.character(input$app4_text4)
	app4_text5<-as.character(input$app4_text5)
	app4_text6<-as.numeric(as.character((input$app4_text6)))
	app4_text7<-as.numeric(as.character((input$app4_text7)))	
    if(!is.null(input$app4_email)&(input$app4_email)!=""){
	app4_email <- as.character(input$app4_email)
	}else{
	app4_email <-"no"
	}
		ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app4",mytaskid=taskidnow,myemail=app4_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,fill = c(app4_text1, app4_text2),alpha = c(0.5, 0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4, app4_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,fill = c(app4_text1, app4_text2),alpha = c(0.5, 0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4, app4_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,fill = c(app4_text1, app4_text2),alpha = c(0.5, 0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4, app4_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,fill = c(app4_text1, app4_text2),alpha = c(0.5, 0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app4_text1, app4_text2, app4_text3, app4_text4, app4_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app4_text6, cex=app4_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app4_text1,app4_text2,app4_text3,app4_text4,app4_text5,app4_text6,app4_text7,app4_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app4/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
if(length(list.files("/srv/myapps/keyandaydayup/",pattern="VennDiagram"))>0){
	system("rm /srv/myapps/keyandaydayup/VennDiagram* -f")	
}

    }
}
