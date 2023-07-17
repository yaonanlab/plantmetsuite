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
source("/srv/myapps/keyandaydayup/apps/app120/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app120_select1<-args[2]
app120_select2<-args[3]
app120_select3<-args[4]
app120_select4<-args[5]
app120_select5<-args[6]
app120_text1<-args[7]
app120_text2<-args[8]
app120_text3<-args[9]
app120_text4<-args[10]
app120_text5<-args[11]
app120_text6<-args[12]
app120_text7<-args[13]
app120_text8<-args[14]
app120_text9<-args[15]
app120_text10<-args[16]
app120_text11<-args[17]
app120_text12<-args[18]
app120_text13<-args[19]
app120_email<-args[20]
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
	names(data)<-c("Group","Treatment","Value")	

pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app120_select1=app120_select1,app120_select2=app120_select2,app120_select3=app120_select3,app120_select4=app120_select4,app120_select5=app120_select5,app120_text1=app120_text1,app120_text2=app120_text2,app120_text3=app120_text3,app120_text4=app120_text4,app120_text5=app120_text5,app120_text6=app120_text6,app120_text7=app120_text7,app120_text8=app120_text8,app120_text9=app120_text9,app120_text10=app120_text10,app120_text11=app120_text11,app120_text12=app120_text12,app120_text13=app120_text13)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app120_email!=""&("TRUE"%in%grepl("@",app120_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app120_email),attach=T,attach.file=attach.file)
}
