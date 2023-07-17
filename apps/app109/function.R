library(data.table)
library(DT)
library(ggridges)
library(rintrojs)
library(shiny)
library(shinyBS)
library(shinycssloaders)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(readr)
library(svglite)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
library(VennDiagram)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app109_text1<-args[2]
app109_text2<-args[3]
app109_text3<-args[4]
app109_text4<-args[5]
app109_text5<-args[6]
app109_text6<-args[7]
app109_text7<-args[8]
app109_text8<-args[9]
app109_select1<-args[10]
app109_select2<-args[11]
app109_email<-args[12]
app109_text1<-as.numeric(app109_text1)
app109_text2<-as.numeric(app109_text2)
app109_text3<-as.character(app109_text3)
app109_text4<-as.character(app109_text4)
app109_text5<-as.character(app109_text5)
app109_text6<-as.character((app109_text6))
app109_text7<-as.numeric(as.character((app109_text7)))	
app109_text8<-as.numeric(as.character((app109_text8)))	
app109_select1<-as.character((app109_select1))
app109_select2<-as.character((app109_select2))	
app109_email <- as.character(app109_email)
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
if(length(grep(".csv",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T)
}
if(length(grep(".xls",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T)
}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
Volcano_log2fold<-data[,app109_text1]
Volcano_pvalue<-data[,app109_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app109_select1=="yes"|app109_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
if(app109_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
Volcano_log2fold<-data[,app109_text1]
Volcano_pvalue<-data[,app109_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app109_select1=="yes"|app109_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
if(app109_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
Volcano_log2fold<-data[,app109_text1]
Volcano_pvalue<-data[,app109_text2]
Volcano_raw<- data.frame(Volcano_pvalue,Volcano_log2fold)

if(app109_select1=="yes"|app109_select1==""){
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
if(app109_select1=="no"){
Volcano_raw<- data.frame(Volcano_pvalue,log2(Volcano_log2fold))
Volcano_pos<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold>1& Volcano_raw$Volcano_pvalue < 0.05)
Volcano_neg<-subset(Volcano_raw,Volcano_raw$Volcano_log2fold<(-1)& Volcano_raw$Volcano_pvalue < 0.05)
par(font=2,font.axis=2,font.lab=2,cex.axis=1.5,mar=c(5,5,4,6),cex.lab=1.5,cex.main=2)
plot(x =Volcano_raw$Volcano_log2fold,y = -log10(Volcano_raw$Volcano_pvalue), xlab="log2 Fold change",ylab="-Log10(Pvalue)",main="Volcano Plot", xlim=c(-10,10),pch=20, cex=app109_text7,col=app109_text5)
xy<-par("usr")
legend(x=xy[2L]-xinch(0.1),y=xy[4L],c("Down","Up","None"),pch=20,col=c(app109_text3,app109_text4,app109_text5),bty="n",cex=1.5,xpd=T)
points(Volcano_neg$Volcano_log2fold, -log10(Volcano_neg$Volcano_pvalue), pch=20, col=app109_text4,cex=app109_text7)
points(Volcano_pos$Volcano_log2fold, -log10(Volcano_pos$Volcano_pvalue), pch=20, col=app109_text3,cex=app109_text7)
if(app109_select2=="yes"){
abline(h=0,lty=1,lwd=app109_text8)
abline(v=-1,lty=2,lwd=app109_text8,col=app109_text6)
abline(v=1,lty=2,lwd=app109_text8,col=app109_text6)
abline(h=-log10(0.05),lty=2,lwd=app109_text8,col=app109_text6)
}else{
}
}
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app109_email!=""&("TRUE"%in%grepl("@",app109_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app109_email),attach=T,attach.file=attach.file)
}
