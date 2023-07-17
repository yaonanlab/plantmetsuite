appServer<-function(input,output){
library(VennDiagram)
job.path <- reactiveValues(data = NULL)
done <- reactiveValues(data = NULL)
	done$data<-"no"
    if(!is.null(input$app5_inputFile)&done$data=="no"){
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
	temp.file <- input$app5_inputFile$datapath
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
	app5_text1<-as.numeric(input$app5_text1)
	app5_text2<-as.numeric(input$app5_text2)
	app5_text3<-as.character(input$app5_text3)
	app5_text4<-as.character(input$app5_text4)
	app5_text5<-as.character(input$app5_text5)
	app5_text6<-as.character((input$app5_text6))
	app5_text7<-as.numeric(as.character((input$app5_text7)))	
	app5_text8<-as.numeric(as.character((input$app5_text8)))	
	app5_select1<-as.character((input$app5_select1))
	app5_select2<-as.character((input$app5_select2))
	
    if(!is.null(input$app5_email)&(input$app5_email)!=""){
	app5_email <- as.character(input$app5_email)
	}else{
	app5_email <-"no"
	}
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app5",mytaskid=taskidnow,myemail=app5_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
	output$result= renderPlot({
		Volcano_log2fold<-data[,app5_text1]
    Volcano_pvalue<-data[,app5_text2]
    Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)
if(app5_select1=="yes"|app5_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
if(app5_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
	}
   ) 
output$downloadpng <- downloadHandler(
        filename = "result.png",
        content = function(file) {
            png(file)
Volcano_log2fold<-data[,app5_text1]
Volcano_pvalue<-data[,app5_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app5_select1=="yes"|app5_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
if(app5_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
	dev.off()
        },
        contentType = "image/png"
    )
    
output$downloadpdf <- downloadHandler(
        filename = "result.pdf",
        content = function(file) {
        pdf(file)
Volcano_log2fold<-data[,app5_text1]
Volcano_pvalue<-data[,app5_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app5_select1=="yes"|app5_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
if(app5_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
    dev.off()
        },
        contentType = "image/pdf"
    )
	
output$downloadsvg <- downloadHandler(
        filename = "result.svg",
        content = function(file) {
            svglite(file)
Volcano_log2fold<-data[,app5_text1]
Volcano_pvalue<-data[,app5_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app5_select1=="yes"|app5_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
if(app5_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app5_text7,col=app5_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app5_text3,app5_text4,app5_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app5_text4,cex=app5_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app5_text3,cex=app5_text7)
if(app5_select2=="yes"){
abline(h=0,lty=1,lwd=app5_text8)
abline(v=-1,lty=2,lwd=app5_text8,col=app5_text6)
abline(v=1,lty=2,lwd=app5_text8,col=app5_text6)
abline(h=-log10(0.05),lty=2,lwd=app5_text8,col=app5_text6)
}else{
}
}
	dev.off()
        },
        contentType = "image/svg"
    )

mycmdfirst<-paste(taskidnow,app5_text1,app5_text2,app5_text3,app5_text4,app5_text5,app5_text6,app5_text7,app5_text8,app5_select1,app5_select2,app5_email,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app5/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    done$data<-"yes"
    }
}
