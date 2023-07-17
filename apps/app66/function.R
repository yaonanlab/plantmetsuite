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
source("/srv/myapps/keyandaydayup/apps/app66/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app66_select1<-args[2]
app66_select2<-args[3]
app66_select3<-args[4]
app66_select4<-args[5]
app66_select5<-args[6]
app66_text1<-args[7]
app66_text2<-args[8]
app66_text3<-args[9]
app66_text4<-args[10]
app66_text5<-args[11]
app66_text6<-as.numeric(args[12])
app66_text7<-as.numeric(args[13])
app66_text8<-as.numeric(args[14])
app66_text9<-as.numeric(args[15])
app66_text10<-as.numeric(args[16]
app66_text11<-as.numeric(args[17])
app66_text12<-as.numeric(args[18])
app66_text13<-as.numeric(args[19])
app66_text14<-as.numeric(args[20])
app66_text15<-args[21]
app66_text16<-args[22]
app66_text17<-args[23]
app66_email<-args[24]
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
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app66_select1=app66_select1,app66_select2=app66_select2,app66_select3=app66_select3,app66_select4=app66_select4,app66_select5=app66_select5,app66_text1=app66_text1,app66_text2=app66_text2,app66_text3=app66_text3,app66_text4=app66_text4,app66_text5=app66_text5,app66_text6=app66_text6,app66_text7=app66_text7,app66_text8=app66_text8,app66_text9=app66_text9,app66_text10=app66_text10,app66_text11=app66_text11,app66_text12=app66_text12,app66_text13=app66_text13,app66_text14=app66_text14,app66_text15=app66_text15,app66_text16=app66_text16,app66_text17=app66_text17)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app66_email!=""&("TRUE"%in%grepl("@",app66_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app66_email),attach=T,attach.file=attach.file)
}
