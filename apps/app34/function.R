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
source("/srv/myapps/keyandaydayup/apps/app34/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app34_select1<-args[2]
app34_select2<-args[3]
app34_select3<-args[4]
app34_text1<-args[5]
app34_text2<-args[6]
app34_text3<-args[7]
app34_text4<-args[8]
app34_text5<-args[9]
app34_text6<-args[10]
app34_text7<-args[11]
app34_text8<-args[12]
app34_email<-args[13]
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
	names(data)<-c("time","group","value","se")	
	}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawbarchart(data,app34_select1=app34_select1,app34_select2=app34_select2,app34_select3=app34_select3,app34_text1=app34_text1,app34_text2=app34_text2,app34_text3=app34_text3,app34_text4=app34_text4,app34_text5=app34_text5,app34_text6=app34_text6,app34_text7=app34_text7,app34_text8=app34_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawbarchart(data,app34_select1=app34_select1,app34_select2=app34_select2,app34_select3=app34_select3,app34_text1=app34_text1,app34_text2=app34_text2,app34_text3=app34_text3,app34_text4=app34_text4,app34_text5=app34_text5,app34_text6=app34_text6,app34_text7=app34_text7,app34_text8=app34_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawbarchart(data,app34_select1=app34_select1,app34_select2=app34_select2,app34_select3=app34_select3,app34_text1=app34_text1,app34_text2=app34_text2,app34_text3=app34_text3,app34_text4=app34_text4,app34_text5=app34_text5,app34_text6=app34_text6,app34_text7=app34_text7,app34_text8=app34_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app34_email!=""&("TRUE"%in%grepl("@",app34_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app34_email),attach=T,attach.file=attach.file)
}
