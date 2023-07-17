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
source("/srv/myapps/keyandaydayup/apps/app40/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app40_select1<-args[2]
app40_select2<-args[3]
app40_text1<-args[4]
app40_text2<-args[5]
app40_text3<-args[6]
app40_text4<-args[7]
app40_text5<-args[8]
app40_text6<-args[9]
app40_text7<-args[10]
app40_text8<-args[11]
app40_slider1<-as.numeric(args[12])
app40_email<-args[13]

# app40_select1<-"0"
# app40_select2<-"0"
# app40_text1<-"#f682af"
# app40_text2<-"#9379e6"
# app40_text3<-"#efb94d"
# app40_text4<-"#77c0c7"
# app40_text5<-"#f26949"
# app40_text6<-"plot"
# app40_text7<-"x"
# app40_text8<-"y"
# app40_slider1<-30

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
if(ncol(data)==2){
	names(data)<-c("value","group")	
}else{
	names(data)<-c("value")	
}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
myhist(data,app40_select1=app40_select1,app40_select2=app40_select2,app40_text1=app40_text1,app40_text2=app40_text2,app40_text3=app40_text3,app40_text4=app40_text4,app40_text5=app40_text5,app40_text6=app40_text6,app40_text7=app40_text7,app40_text8=app40_text8,app40_slider1=app40_slider1)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
myhist(data,app40_select1=app40_select1,app40_select2=app40_select2,app40_text1=app40_text1,app40_text2=app40_text2,app40_text3=app40_text3,app40_text4=app40_text4,app40_text5=app40_text5,app40_text6=app40_text6,app40_text7=app40_text7,app40_text8=app40_text8,app40_slider1=app40_slider1)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
myhist(data,app40_select1=app40_select1,app40_select2=app40_select2,app40_text1=app40_text1,app40_text2=app40_text2,app40_text3=app40_text3,app40_text4=app40_text4,app40_text5=app40_text5,app40_text6=app40_text6,app40_text7=app40_text7,app40_text8=app40_text8,app40_slider1=app40_slider1)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app40_email!=""&("TRUE"%in%grepl("@",app40_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app40_email),attach=T,attach.file=attach.file)
}
