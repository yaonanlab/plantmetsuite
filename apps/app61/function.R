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
source("/srv/myapps/keyandaydayup/apps/app61/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app61_text1<-as.character(args[2])
app61_text2<-as.character(args[3])
app61_text3<-as.character(args[4])
app61_text4<-args[5]
app61_text5<-args[6]
app61_text6<-args[7]
app61_text7<-args[8]
app61_text8<-args[9]
app61_email<-args[10]
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
			
	
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
myhist(data,app61_text1=app61_text1,app61_text2=app61_text2,app61_text3=app61_text3,app61_text4=app61_text4,app61_text5=app61_text5,app61_text6=app61_text6,app61_text7=app61_text7,app61_text8=app61_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
myhist(data,app61_text1=app61_text1,app61_text2=app61_text2,app61_text3=app61_text3,app61_text4=app61_text4,app61_text5=app61_text5,app61_text6=app61_text6,app61_text7=app61_text7,app61_text8=app61_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
myhist(data,app61_text1=app61_text1,app61_text2=app61_text2,app61_text3=app61_text3,app61_text4=app61_text4,app61_text5=app61_text5,app61_text6=app61_text6,app61_text7=app61_text7,app61_text8=app61_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app61_email!=""&("TRUE"%in%grepl("@",app61_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app61_email),attach=T,attach.file=attach.file)
}
