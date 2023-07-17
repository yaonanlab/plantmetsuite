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
source("/srv/myapps/keyandaydayup/apps/app85/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app85_select1<-as.numeric(args[2])
app85_text1<-args[3]
app85_text2<-args[4]
app85_text3<-args[5]
app85_text4<-args[6]
app85_text5<-args[7]
app85_text6<-as.numeric(args[8])
app85_text7<-args[9]
app85_text8<-as.numeric(args[10])
app85_text9<-as.numeric(args[11])
app85_text10<-as.numeric(args[12])
app85_email<-args[13]
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
if(length(grep(".csv",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,row.names=1)
}
if(length(grep(".xls",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1,row.names=1),check.names=F)
}
if(length(grep(".xlsx",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
}
if(length(grep(".txt",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,row.names=1)
}


pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app85_text1=app85_text1,app85_text2=app85_text2,app85_text3=app85_text3,app85_text4=app85_text4,app85_text5=app85_text5,app85_text6=app85_text6,app85_text7=app85_text7,app85_select1=app85_select1,app85_text8=app85_text8,app85_text9=app85_text9,app85_text10=app85_text10)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app85_email!=""&("TRUE"%in%grepl("@",app85_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app85_email),attach=T,attach.file=attach.file)
}
