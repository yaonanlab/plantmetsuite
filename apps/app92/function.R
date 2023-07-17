library(readr)
library(svglite)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app92/plot.R")
taskidnow<-args[1]
app92_select1<-as.numeric(args[2])
app92_text1<-as.numeric(args[3])
app92_text2<-as.numeric(args[4])
app92_text3<-as.numeric(args[5])
app92_text4<-as.numeric(args[6])
app92_text5<-args[7]
app92_text6<-args[8]
app92_text7<-args[9]
app92_text8<-args[10]
app92_email<-args[11]

filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")

	if(length(grep(".csv",filename1))>0){
	spectrum1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
	}
	if(length(grep(".xls",filename1))>0){
	spectrum1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename1))>0){
	spectrum1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename1))>0){
	spectrum1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
	}
if(app92_select1==1){
	if(length(grep(".csv",filename2))>0){
	spectrum2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
	}
	if(length(grep(".xls",filename2))>0){
	spectrum2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename2))>0){
	spectrum2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename2))>0){
	spectrum2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
	}
}else{
	if(length(grep(".csv",filename1))>0){
	spectrum2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
	}
	if(length(grep(".xls",filename1))>0){
	spectrum2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename1))>0){
	spectrum2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename1))>0){
	spectrum2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
	}
}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
	drawchart(spectrum1,spectrum2,app92_select1=app92_select1,app92_text1=app92_text1,app92_text2=app92_text2,app92_text3=app92_text3,app92_text4=app92_text4,app92_text5=app92_text5,app92_text6=app92_text6,app92_text7=app92_text7,app92_text8=app92_text8)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(spectrum1,spectrum2,app92_select1=app92_select1,app92_text1=app92_text1,app92_text2=app92_text2,app92_text3=app92_text3,app92_text4=app92_text4,app92_text5=app92_text5,app92_text6=app92_text6,app92_text7=app92_text7,app92_text8=app92_text8)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	drawchart(spectrum1,spectrum2,app92_select1=app92_select1,app92_text1=app92_text1,app92_text2=app92_text2,app92_text3=app92_text3,app92_text4=app92_text4,app92_text5=app92_text5,app92_text6=app92_text6,app92_text7=app92_text7,app92_text8=app92_text8)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app92_email!=""&("TRUE"%in%grepl("@",app92_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app92_email),attach=T,attach.file=attach.file)
}
