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
source("/srv/myapps/keyandaydayup/apps/app80/plot.R")
taskidnow<-args[1]
app80_text1<-args[2]
app80_text2<-args[3]
app80_text3<-args[4]
app80_text4<-args[5]
app80_text5<-args[6]
app80_text6<-args[7]
app80_text7<-args[8]
app80_text8<-args[9]
app80_text9<-args[10]
app80_text10<-args[11]
app80_text11<-args[12]
app80_text12<-args[13]
app80_text13<-args[14]
app80_text14<-args[15]
app80_email<-args[16]

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
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T,check.names=F)
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

raw_rnatable<-as.data.frame(data1)
raw_protable<-as.data.frame(data2)

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(raw_rnatable,raw_protable,app80_text1=app80_text1,app80_text2=app80_text2,app80_text3=app80_text3,app80_text4=app80_text4,app80_text5=app80_text5,app80_text6=app80_text6,app80_text7=app80_text7,app80_text8=app80_text8,app80_text9=app80_text9,app80_text10=app80_text10,app80_text11=app80_text11,app80_text12=app80_text12,app80_text13=app80_text13,app80_text14=app80_text14,taskidnow=taskidnow)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(raw_rnatable,raw_protable,app80_text1=app80_text1,app80_text2=app80_text2,app80_text3=app80_text3,app80_text4=app80_text4,app80_text5=app80_text5,app80_text6=app80_text6,app80_text7=app80_text7,app80_text8=app80_text8,app80_text9=app80_text9,app80_text10=app80_text10,app80_text11=app80_text11,app80_text12=app80_text12,app80_text13=app80_text13,app80_text14=app80_text14,taskidnow=taskidnow)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(raw_rnatable,raw_protable,app80_text1=app80_text1,app80_text2=app80_text2,app80_text3=app80_text3,app80_text4=app80_text4,app80_text5=app80_text5,app80_text6=app80_text6,app80_text7=app80_text7,app80_text8=app80_text8,app80_text9=app80_text9,app80_text10=app80_text10,app80_text11=app80_text11,app80_text12=app80_text12,app80_text13=app80_text13,app80_text14=app80_text14,taskidnow=taskidnow)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app80_email!=""&("TRUE"%in%grepl("@",app80_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app80_email),attach=T,attach.file=attach.file)
}
