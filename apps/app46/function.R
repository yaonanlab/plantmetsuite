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
source("/srv/myapps/keyandaydayup/apps/app46/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app46_select1<-args[2]
app46_select2<-args[3]
app46_text1<-args[4]
app46_text2<-args[5]
app46_text3<-args[6]
app46_text4<-args[7]
app46_text5<-args[8]
app46_text6<-args[9]
app46_text7<-args[10]
app46_text8<-args[11]
app46_email<-args[12]
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
	if(ncol(data)==2){
	names(data)<-c("value","group")	
	}else{
	names(data)<-c("value")	
	}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
myhist(data,app46_select1=app46_select1,app46_select2=app46_select2,app46_text1=app46_text1,app46_text2=app46_text2,app46_text3=app46_text3,app46_text4=app46_text4,app46_text5=app46_text5,app46_text6=app46_text6,app46_text7=app46_text7,app46_text8=app46_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app46_email!=""&("TRUE"%in%grepl("@",app46_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app46_email),attach=T,attach.file=attach.file)
}
