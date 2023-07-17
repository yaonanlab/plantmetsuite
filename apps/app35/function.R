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
source("/srv/myapps/keyandaydayup/apps/app35/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app35_select1<-args[2]
app35_select2<-args[3]
app35_select3<-args[4]
app35_text1<-args[5]
app35_text2<-args[6]
app35_text3<-args[7]
app35_text4<-args[8]
app35_text5<-args[9]
app35_text6<-args[10]
app35_text7<-args[11]
app35_text8<-args[12]
app35_email<-args[13]
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
drawbarchart(data,app35_select1=app35_select1,app35_select2=app35_select2,app35_select3=app35_select3,app35_text1=app35_text1,app35_text2=app35_text2,app35_text3=app35_text3,app35_text4=app35_text4,app35_text5=app35_text5,app35_text6=app35_text6,app35_text7=app35_text7,app35_text8=app35_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawbarchart(data,app35_select1=app35_select1,app35_select2=app35_select2,app35_select3=app35_select3,app35_text1=app35_text1,app35_text2=app35_text2,app35_text3=app35_text3,app35_text4=app35_text4,app35_text5=app35_text5,app35_text6=app35_text6,app35_text7=app35_text7,app35_text8=app35_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawbarchart(data,app35_select1=app35_select1,app35_select2=app35_select2,app35_select3=app35_select3,app35_text1=app35_text1,app35_text2=app35_text2,app35_text3=app35_text3,app35_text4=app35_text4,app35_text5=app35_text5,app35_text6=app35_text6,app35_text7=app35_text7,app35_text8=app35_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app35_email!=""&("TRUE"%in%grepl("@",app35_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app35_email),attach=T,attach.file=attach.file)
}
