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
source("/srv/myapps/keyandaydayup/apps/app65/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app65_select1<-args[2]
app65_select2<-args[3]
app65_select3<-args[4]
app65_select4<-args[5]
app65_select5<-args[6]
app65_text1<-args[7]
app65_text2<-args[8]
app65_text3<-args[9]
app65_text4<-args[10]
app65_text5<-args[11]
app65_text6<-args[12]
app65_text7<-args[13]
app65_text8<-args[14]
app65_text9<-args[15]
app65_text10<-args[16]
app65_text11<-as.numeric(args[17])
app65_text12<-as.numeric(args[18])
app65_text13<-as.numeric(args[19])
app65_email<-args[20]
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
	names(data)<-c("name","feature","Freq")	

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app65_select1=app65_select1,app65_select2=app65_select2,app65_select3=app65_select3,app65_select4=app65_select4,app65_select5=app65_select5,app65_text1=app65_text1,app65_text2=app65_text2,app65_text3=app65_text3,app65_text4=app65_text4,app65_text5=app65_text5,app65_text6=app65_text6,app65_text7=app65_text7,app65_text8=app65_text8,app65_text9=app65_text9,app65_text10=app65_text10,app65_text11=app65_text11,app65_text12=app65_text12,app65_text13=app65_text13)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app65_select1=app65_select1,app65_select2=app65_select2,app65_select3=app65_select3,app65_select4=app65_select4,app65_select5=app65_select5,app65_text1=app65_text1,app65_text2=app65_text2,app65_text3=app65_text3,app65_text4=app65_text4,app65_text5=app65_text5,app65_text6=app65_text6,app65_text7=app65_text7,app65_text8=app65_text8,app65_text9=app65_text9,app65_text10=app65_text10,app65_text11=app65_text11,app65_text12=app65_text12,app65_text13=app65_text13)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app65_select1=app65_select1,app65_select2=app65_select2,app65_select3=app65_select3,app65_select4=app65_select4,app65_select5=app65_select5,app65_text1=app65_text1,app65_text2=app65_text2,app65_text3=app65_text3,app65_text4=app65_text4,app65_text5=app65_text5,app65_text6=app65_text6,app65_text7=app65_text7,app65_text8=app65_text8,app65_text9=app65_text9,app65_text10=app65_text10,app65_text11=app65_text11,app65_text12=app65_text12,app65_text13=app65_text13)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app65_email!=""&("TRUE"%in%grepl("@",app65_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app65_email),attach=T,attach.file=attach.file)
}
