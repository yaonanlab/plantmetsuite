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
source("/srv/myapps/keyandaydayup/apps/app88/plot.R")
taskidnow<-args[1]
app88_select1<-args[2]
app88_text1<-args[3]
app88_text2<-args[4]
app88_text3<-args[5]
app88_text4<-args[6]
app88_text5<-args[7]
app88_text6<-args[8]
app88_select2<-args[9]
app88_text7<-args[10]
app88_text8<-args[11]
app88_text9<-args[12]
app88_email<-args[13]

filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")
	
	if(length(grep(".csv",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
	}
	if(length(grep(".xls",filename1))>0){
	data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename1))>0){
	data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
	}
	
	if(length(grep(".csv",filename2))>0){
	group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
	}
	if(length(grep(".xls",filename2))>0){
	group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename2))>0){
	group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename2))>0){
	group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
	}

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
	drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	drawchart(data,group,app88_select1=app88_select1,app88_text1=app88_text1,app88_text2=app88_text2,app88_text3=app88_text3,app88_text4=app88_text4,app88_text5=app88_text5,app88_text6=app88_text6,app88_select2=app88_select2,app88_text7=app88_text7,app88_text8=app88_text8,app88_text9=app88_text9)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app88_email!=""&("TRUE"%in%grepl("@",app88_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app88_email),attach=T,attach.file=attach.file)
}
