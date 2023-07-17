library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app2_select1<-args[2]
app2_email<-args[3]
taskidnow<-as.character(taskidnow)
app2_select1 <- as.character(app2_select1)
app2_email <- as.character(app2_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")

if(length(grep(".csv",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T)
}
if(length(grep(".xls",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
}



if(length(grep(".csv",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T)
}
if(length(grep(".xls",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T)
}

result<-join(data1,data2,type=app2_select1)
write.table(result,file=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app2_email!=""&("TRUE"%in%grepl("@",app2_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app2_email),attach=T,attach.file=attach.file)
}
