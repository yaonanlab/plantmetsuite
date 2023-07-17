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
source("/srv/myapps/keyandaydayup/apps/app39/plot.R",encoding = "UTF-8")
par(mar=c(0,0,0,0))
taskidnow<-args[1]
app39_select1<-args[2]
app39_select2<-args[3]
app39_select3<-args[4]
app39_text1<-args[5]
app39_text2<-args[6]
app39_text3<-args[7]
app39_text4<-args[8]
app39_text5<-args[9]
app39_text6<-args[10]
app39_email<-args[11]
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

names(data)<-c("Group","Value")	

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawbarchart(data,app39_select1=app39_select1,app39_select2=app39_select2,app39_select3=app39_select3,app39_text1=app39_text1,app39_text2=app39_text2,app39_text3=app39_text3,app39_text4=app39_text4,app39_text5=app39_text5,app39_text6=app39_text6)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawbarchart(data,app39_select1=app39_select1,app39_select2=app39_select2,app39_select3=app39_select3,app39_text1=app39_text1,app39_text2=app39_text2,app39_text3=app39_text3,app39_text4=app39_text4,app39_text5=app39_text5,app39_text6=app39_text6)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawbarchart(data,app39_select1=app39_select1,app39_select2=app39_select2,app39_select3=app39_select3,app39_text1=app39_text1,app39_text2=app39_text2,app39_text3=app39_text3,app39_text4=app39_text4,app39_text5=app39_text5,app39_text6=app39_text6)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app39_email!=""&("TRUE"%in%grepl("@",app39_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app39_email),attach=T,attach.file=attach.file)
}
