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
source("/srv/myapps/keyandaydayup/apps/app87/plot.R")
taskidnow<-args[1]
app87_text1<-args[2]
app87_text2<-args[3]
app87_text3<-args[4]
app87_text4<-args[5]
app87_text5<-args[6]
app87_text6<-as.numeric(args[7])
app87_text7<-args[8]
app87_text8<-args[9]
app87_text9<-args[10]
app87_text10<-as.numeric(args[11])
app87_text11<-as.numeric(args[12])
app87_select1<-as.numeric(args[13])
app87_select2<-as.numeric(args[14])
app87_select3<-as.numeric(args[15])
app87_email<-args[16]
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
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app87_text1=app87_text1,app87_text2=app87_text2,app87_text3=app87_text3,app87_text4=app87_text4,app87_text5=app87_text5,app87_text6=app87_text6,app87_text7=app87_text7,app87_text8=app87_text8,app87_text9=app87_text9,app87_text10=app87_text10,app87_text11=app87_text11,app87_select1=app87_select1,app87_select2=app87_select2,app87_select3=app87_select3)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app87_email!=""&("TRUE"%in%grepl("@",app87_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app87_email),attach=T,attach.file=attach.file)
}
