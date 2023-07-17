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
source("/srv/myapps/keyandaydayup/apps/app105/plot.R")
taskidnow<-args[1]
app105_text1<-args[2]
app105_text2<-args[3]
app105_text3<-args[4]
app105_text4<-args[5]
app105_text5<-args[6]
app105_text6<-as.numeric(args[7])
app105_text7<-args[8]
app105_text8<-args[9]
app105_text9<-args[10]
app105_text10<-as.numeric(args[11])
app105_text11<-as.numeric(args[12])
app105_select1<-as.numeric(args[13])
app105_select2<-as.numeric(args[14])
app105_select3<-as.numeric(args[15])
app105_email<-args[16]
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
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app105_text1=app105_text1,app105_text2=app105_text2,app105_text3=app105_text3,app105_text4=app105_text4,app105_text5=app105_text5,app105_text6=app105_text6,app105_text7=app105_text7,app105_text8=app105_text8,app105_text9=app105_text9,app105_text10=app105_text10,app105_text11=app105_text11,app105_select1=app105_select1,app105_select2=app105_select2,app105_select3=app105_select3)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app105_email!=""&("TRUE"%in%grepl("@",app105_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app105_email),attach=T,attach.file=attach.file)
}
