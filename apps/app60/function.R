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
source("/srv/myapps/keyandaydayup/apps/app60/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app60_text1<-args[2]
app60_text2<-args[3]
app60_text3<-args[4]
app60_text4<-args[5]
app60_text5<-args[6]
app60_text6<-args[7]
app60_text7<-args[8]
app60_text8<-args[9]
app60_email<-args[10]
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

	names(data)<-c("before","after")			
	
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
myhist(data,app60_text1=app60_text1,app60_text2=app60_text2,app60_text3=app60_text3,app60_text4=app60_text4,app60_text5=app60_text5,app60_text6=app60_text6,app60_text7=app60_text7,app60_text8=app60_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
myhist(data,app60_text1=app60_text1,app60_text2=app60_text2,app60_text3=app60_text3,app60_text4=app60_text4,app60_text5=app60_text5,app60_text6=app60_text6,app60_text7=app60_text7,app60_text8=app60_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
myhist(data,app60_text1=app60_text1,app60_text2=app60_text2,app60_text3=app60_text3,app60_text4=app60_text4,app60_text5=app60_text5,app60_text6=app60_text6,app60_text7=app60_text7,app60_text8=app60_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app60_email!=""&("TRUE"%in%grepl("@",app60_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app60_email),attach=T,attach.file=attach.file)
}
