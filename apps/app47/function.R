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
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app47/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app47_select1<-args[2]
app47_select2<-args[3]
app47_text1<-args[7]
app47_text2<-args[8]
app47_text3<-args[9]
app47_text4<-args[10]
app47_text5<-args[11]
app47_text6<-args[12]
app47_text7<-args[13]
app47_text8<-args[14]
app47_text9<-args[15]
app47_text10<-args[16]
app47_text11<-args[17]
app47_text12<-args[18]
app47_text13<-args[19]
app47_email<-args[20]
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
	names(data)<-c("Group","Treatment","Value")	

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app47_select1,app47_select2,app47_text1,app47_text2,app47_text3,app47_text4,app47_text5,app47_text6,app47_text7,app47_text8,app47_text9,app47_text10,app47_text11,app47_text12,app47_text13)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app47_select1,app47_select2,app47_text1,app47_text2,app47_text3,app47_text4,app47_text5,app47_text6,app47_text7,app47_text8,app47_text9,app47_text10,app47_text11,app47_text12,app47_text13)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app47_select1,app47_select2,app47_text1,app47_text2,app47_text3,app47_text4,app47_text5,app47_text6,app47_text7,app47_text8,app47_text9,app47_text10,app47_text11,app47_text12,app47_text13)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app47_email!=""&("TRUE"%in%grepl("@",app47_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app47_email),attach=T,attach.file=attach.file)
}
