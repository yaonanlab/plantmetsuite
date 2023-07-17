library(data.table)
library(DT)
library(ggridges)
library(readr)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app116/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app116_text1<-args[2]
app116_text2<-args[3]
app116_text3<-args[4]
app116_text4<-args[5]
app116_text5<-args[6]
app116_select1<-as.numeric(args[7])
app116_select2<-as.numeric(args[8])
app116_select3<-as.numeric(args[9])
app116_email<-args[10]

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
	drawchart(data,app116_text1=app116_text1,app116_text2=app116_text2,app116_text3=app116_text3,app116_text4=app116_text4,app116_text5=app116_text5,app116_select1=app116_select1,app116_select2=app116_select2,app116_select3=app116_select3,taskidnow=taskidnow)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(data,app116_text1=app116_text1,app116_text2=app116_text2,app116_text3=app116_text3,app116_text4=app116_text4,app116_text5=app116_text5,app116_select1=app116_select1,app116_select2=app116_select2,app116_select3=app116_select3,taskidnow=taskidnow)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app116_email!=""&("TRUE"%in%grepl("@",app116_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app116_email),attach=T,attach.file=attach.file)
}
