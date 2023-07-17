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
source("/srv/myapps/keyandaydayup/apps/app62/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app62_select1<-args[2]
app62_text1<-args[3]
app62_text2<-args[4]
app62_text3<-args[5]
app62_text4<-args[6]
app62_text5<-args[7]
app62_text6<-args[8]
app62_text7<-args[9]
app62_text8<-args[10]
app62_text9<-args[11]
app62_text10<-args[12]
app62_text11<-args[13]
app62_text12<-args[14]
app62_email<-args[15]
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
	names(data)<-c("value1","value2","group")	
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"), onefile = FALSE)
	myhist(data,app62_select1=app62_select1,app62_text1=app62_text1,app62_text2=app62_text2,app62_text3=app62_text3,app62_text4=app62_text4,app62_text5=app62_text5,app62_text6=app62_text6,app62_text7=app62_text7,app62_text8=app62_text8,app62_text9=app62_text9,app62_text10=app62_text10,app62_text11=app62_text11,app62_text12=app62_text12)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"), onefile = FALSE)
	myhist(data,app62_select1=app62_select1,app62_text1=app62_text1,app62_text2=app62_text2,app62_text3=app62_text3,app62_text4=app62_text4,app62_text5=app62_text5,app62_text6=app62_text6,app62_text7=app62_text7,app62_text8=app62_text8,app62_text9=app62_text9,app62_text10=app62_text10,app62_text11=app62_text11,app62_text12=app62_text12)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	myhist(data,app62_select1=app62_select1,app62_text1=app62_text1,app62_text2=app62_text2,app62_text3=app62_text3,app62_text4=app62_text4,app62_text5=app62_text5,app62_text6=app62_text6,app62_text7=app62_text7,app62_text8=app62_text8,app62_text9=app62_text9,app62_text10=app62_text10,app62_text11=app62_text11,app62_text12=app62_text12)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app62_email!=""&("TRUE"%in%grepl("@",app62_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app62_email),attach=T,attach.file=attach.file)
}
