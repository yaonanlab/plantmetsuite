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
library(UpSetR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app45/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app45_select1<-args[2]
app45_select2<-args[3]
app45_text1<-args[4]
app45_text2<-args[5]
app45_text3<-args[6]
app45_text4<-args[7]
app45_email<-args[8]


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

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"), onefile = FALSE)
drawchart(data,app45_select1=app45_select1,app45_select2=app45_select2,app45_text1=app45_text1,app45_text2=app45_text2,app45_text3=app45_text3,app45_text4=app45_text4)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app45_select1=app45_select1,app45_select2=app45_select2,app45_text1=app45_text1,app45_text2=app45_text2,app45_text3=app45_text3,app45_text4=app45_text4)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app45_email!=""&("TRUE"%in%grepl("@",app45_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app45_email),attach=T,attach.file=attach.file)
}
