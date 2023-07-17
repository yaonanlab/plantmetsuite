library(mailR)
library(readxl)
library(data.table)
library(shiny)
library(shinyBS)
library(shinycssloaders)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(readr)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app89_text1<-args[2]
app89_text2<-args[3]
app89_email<-args[4]
taskidnow<-as.character(taskidnow)
app89_text1<-as.character(app89_text1)
app89_text2<-as.character(app89_text2)
app89_email<-as.character(app89_email)

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))

if(length(grep(".csv",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F)
}
if(length(grep(".xls",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F)
}

result<-tidyr::pivot_longer(data,cols=!colnames(data)[1], names_to=app89_text1, values_to=app89_text2)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
write.table(result,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",row.names=F,col.names=T,quote=F)
if(app89_email!=""&("TRUE"%in%grepl("@",app89_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app89_email),attach=T,attach.file=attach.file)
}
