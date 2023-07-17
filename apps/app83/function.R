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
source("/srv/myapps/keyandaydayup/apps/app83/plot.R")
taskidnow<-args[1]
app83_text1<-args[2]
app83_text2<-args[3]
app83_text3<-args[4]
app83_text4<-args[5]
app83_text5<-args[6]
app83_text6<-args[7]
app83_text7<-args[8]
app83_text8<-args[9]
app83_text9<-args[10]
app83_select1<-args[11]
app83_text10<-args[12]
app83_select2<-args[13]
app83_text11<-args[14]
app83_text12<-args[15]
app83_text13<-args[16]
app83_email<-args[17]

filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")

if(length(grep(".csv",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
}
if(length(grep(".xls",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
}
if(length(grep(".csv",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
}
if(length(grep(".xls",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
}

# otu1<-as.data.frame(data1)
design<-as.data.frame(data2)

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
	drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	drawchart(data1,design,app83_text1=app83_text1,app83_text2=app83_text2,app83_text3=app83_text3,app83_text4=app83_text4,app83_text5=app83_text5,app83_text6=app83_text6,app83_text7=app83_text7,app83_text8=app83_text8,app83_text9=app83_text9,app83_select1=app83_select1,app83_text10=app83_text10,app83_select2=app83_select2,app83_text11=app83_text11,app83_text12=app83_text12,app83_text13=app83_text13,taskidnow=taskidnow)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app83_email!=""&("TRUE"%in%grepl("@",app83_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app83_email),attach=T,attach.file=attach.file)
}
