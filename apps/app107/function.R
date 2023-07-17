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
library(pheatmap)
library(svglite)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
library(pheatmap)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app107_text1<-args[2]
app107_text2<-args[3]
app107_text3<-args[4]
app107_text4<-args[5]
app107_select1<-args[6]
app107_select2<-args[7]
app107_select3<-args[8]
app107_select4<-args[9]
app107_select5<-args[10]
app107_select6<-args[11]
app107_select7<-args[12]
app107_email<-args[13]
app107_text1<-as.character(app107_text1)
app107_text2<-as.character(app107_text2)
app107_text3<-as.character(app107_text3)
app107_text4<-as.numeric(as.character((app107_text4)))
app107_select1 <- as.logical(app107_select1)
app107_select2 <- as.logical(app107_select2)
app107_select3 <- as.character(app107_select3)
app107_select4 <- as.logical(app107_select4)
app107_select5 <- as.logical(app107_select5)
app107_select6 <- as.logical(app107_select6)
app107_select7 <- as.character(app107_select7)
app107_email <- as.character(app107_email)
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
if(length(grep(".csv",filename))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,row.names=1)
}
if(length(grep(".xls",filename))>0){
data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
data1<-data0[,-1]
row.names(data1)<-data0[,1]
}
if(length(grep(".xlsx",filename))>0){
data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
data1<-data0[,-1]
row.names(data1)<-data0[,1]
}
if(length(grep(".txt",filename))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,row.names=1)
}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","heatmap.pdf"))
pheatmap(data1,color=colorRampPalette(c(app107_text1,app107_text2,app107_text3))(1000),fontsize=app107_text4,cluster_rows=app107_select1,cluster_cols=app107_select2,scale=app107_select3,display_numbers = app107_select4,show_rownames=app107_select5,show_colnames=app107_select6,border_color=app107_select7)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","heatmap.png"))
pheatmap(data1,color=colorRampPalette(c(app107_text1,app107_text2,app107_text3))(1000),fontsize=app107_text4,cluster_rows=app107_select1,cluster_cols=app107_select2,scale=app107_select3,display_numbers = app107_select4,show_rownames=app107_select5,show_colnames=app107_select6,border_color=app107_select7)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","heatmap.svg"))
pheatmap(data1,color=colorRampPalette(c(app107_text1,app107_text2,app107_text3))(1000),fontsize=app107_text4,cluster_rows=app107_select1,cluster_cols=app107_select2,scale=app107_select3,display_numbers = app107_select4,show_rownames=app107_select5,show_colnames=app107_select6,border_color=app107_select7)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app107_email!=""&("TRUE"%in%grepl("@",app107_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app107_email),attach=T,attach.file=attach.file)
}
