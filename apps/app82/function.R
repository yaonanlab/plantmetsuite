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
library(plyr)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app82/plot.R")
taskidnow<-args[1]
app82_text1<-args[2]
app82_text2<-args[3]
app82_text3<-args[4]
app82_text4<-args[5]
app82_text5<-args[6]
app82_text6<-args[7]
app82_text7<-args[8]
app82_text8<-args[9]
app82_text9<-args[10]
app82_text10<-args[11]
app82_text10<-args[12]
app82_select1<-args[13]
app82_email<-args[14]


if(length(grep(".csv",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F)
}
if(length(grep(".xls",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F)
}

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app82_text1=app82_text1,app82_text2=app82_text2,app82_text3=app82_text3,app82_text4=app82_text4,app82_text5=app82_text5,app82_text6=app82_text6,app82_text7=app82_text7,app82_text8=app82_text8,app82_text9=app82_text9,app82_text10=app82_text10,app82_text11=app82_text11,app82_select1=app82_select1)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app82_email!=""&("TRUE"%in%grepl("@",app82_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app82_email),attach=T,attach.file=attach.file)
}
