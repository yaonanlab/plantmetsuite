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
source("/srv/myapps/keyandaydayup/apps/app84/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app84_select1<-args[2]
app84_text1<-args[3]
app84_text2<-args[4]
app84_text3<-args[5]
app84_text4<-args[6]
app84_text5<-args[7]
app84_text6<-args[8]
app84_text7<-args[9]
app84_text8<-args[10]
app84_text9<-args[11]
app84_email<-args[12]
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
names(data)<-c("time","group","value")	

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app84_select1=app84_select1,app84_text1=app84_text1,app84_text2=app84_text2,app84_text3=app84_text3,app84_text4=app84_text4,app84_text5=app84_text5,app84_text6=app84_text6,app84_text7=app84_text7,app84_text8=app84_text8,app84_text9=app84_text9)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app84_select1=app84_select1,app84_text1=app84_text1,app84_text2=app84_text2,app84_text3=app84_text3,app84_text4=app84_text4,app84_text5=app84_text5,app84_text6=app84_text6,app84_text7=app84_text7,app84_text8=app84_text8,app84_text9=app84_text9)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app84_select1=app84_select1,app84_text1=app84_text1,app84_text2=app84_text2,app84_text3=app84_text3,app84_text4=app84_text4,app84_text5=app84_text5,app84_text6=app84_text6,app84_text7=app84_text7,app84_text8=app84_text8,app84_text9=app84_text9)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app84_email!=""&("TRUE"%in%grepl("@",app84_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app84_email),attach=T,attach.file=attach.file)
}
