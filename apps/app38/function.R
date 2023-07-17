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
source("/srv/myapps/keyandaydayup/apps/app38/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app38_select1<-args[2]
app38_select2<-args[3]
app38_select3<-args[4]
app38_select4<-args[5]
app38_select5<-args[6]
app38_select6<-args[7]
app38_text1<-args[8]
app38_text2<-args[9]
app38_text3<-args[10]
app38_text4<-args[11]
app38_text5<-args[12]
app38_text6<-args[13]
app38_text7<-args[14]
app38_text8<-args[15]
app38_email<-args[16]
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
	if(ncol(data)==3){
	names(data)<-c("time","group","value")	
	}else{
	names(data)<-c("time","group","value","weight")	
	}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app38_select1=app38_select1,app38_select2=app38_select2,app38_select3=app38_select3,app38_select4=app38_select4,app38_select5=app38_select5,app38_select6=app38_select6,app38_text1=app38_text1,app38_text2=app38_text2,app38_text3=app38_text3,app38_text4=app38_text4,app38_text5=app38_text5,app38_text6=app38_text6,app38_text7=app38_text7,app38_text8=app38_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app38_select1=app38_select1,app38_select2=app38_select2,app38_select3=app38_select3,app38_select4=app38_select4,app38_select5=app38_select5,app38_select6=app38_select6,app38_text1=app38_text1,app38_text2=app38_text2,app38_text3=app38_text3,app38_text4=app38_text4,app38_text5=app38_text5,app38_text6=app38_text6,app38_text7=app38_text7,app38_text8=app38_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app38_select1=app38_select1,app38_select2=app38_select2,app38_select3=app38_select3,app38_select4=app38_select4,app38_select5=app38_select5,app38_select6=app38_select6,app38_text1=app38_text1,app38_text2=app38_text2,app38_text3=app38_text3,app38_text4=app38_text4,app38_text5=app38_text5,app38_text6=app38_text6,app38_text7=app38_text7,app38_text8=app38_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app38_email!=""&("TRUE"%in%grepl("@",app38_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app38_email),attach=T,attach.file=attach.file)
}
