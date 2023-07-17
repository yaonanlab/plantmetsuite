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
source("/srv/myapps/keyandaydayup/apps/app86/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app86_text1<-args[2]
app86_text2<-args[3]
app86_text3<-args[4]
app86_text4<-args[5]
app86_text5<-args[6]
app86_text6<-as.numeric(args[7])
app86_text7<-args[8]
app86_text8<-as.numeric(args[9])
app86_select1<-as.logical(args[10])
app86_select2<-args[11]
app86_select3<-args[12]
app86_select4<-args[13]
app86_select5<-args[14]
app86_email<-args[15]

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
	drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	drawchart(data,app86_text1=app86_text1,app86_text2=app86_text2,app86_text3=app86_text3,app86_text4=app86_text4,app86_text5=app86_text5,app86_text6=app86_text6,app86_text7=app86_text7,app86_text8=app86_text8,app86_select1=app86_select1,app86_select2=app86_select2,app86_select3=app86_select3,app86_select4=app86_select4,app86_select5=app86_select5)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app86_email!=""&("TRUE"%in%grepl("@",app86_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app86_email),attach=T,attach.file=attach.file)
}
