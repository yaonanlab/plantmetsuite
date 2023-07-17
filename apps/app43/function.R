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
source("/srv/myapps/keyandaydayup/email.R")
source("/srv/myapps/keyandaydayup/apps/app43/plot.R")
taskidnow<-args[1]
app43_select1<-args[2]
app43_text1<-args[3]
app43_text2<-args[4]
app43_text3<-args[5]
app43_text4<-args[6]
app43_text5<-args[7]
app43_text6<-args[8]
app43_email<-args[9]
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

names(data)<-c("ID","Description","GeneRatio","pvalue","Count")	
				
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app43_select1=app43_select1,app43_text1=app43_text1,app43_text2=app43_text2,app43_text3=app43_text3,app43_text4=app43_text4,app43_text5=app43_text5,app43_text6=app43_text6)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app43_select1=app43_select1,app43_text1=app43_text1,app43_text2=app43_text2,app43_text3=app43_text3,app43_text4=app43_text4,app43_text5=app43_text5,app43_text6=app43_text6)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app43_select1=app43_select1,app43_text1=app43_text1,app43_text2=app43_text2,app43_text3=app43_text3,app43_text4=app43_text4,app43_text5=app43_text5,app43_text6=app43_text6)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app43_email!=""&("TRUE"%in%grepl("@",app43_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app43_email),attach=T,attach.file=attach.file)
}
