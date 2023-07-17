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
library(colourpicker)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app91/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app91_text1<-args[2]
app91_text2<-args[3]
app91_text3<-args[4]
app91_text4<-args[5]
app91_text5<-args[6]
app91_text6<-args[7]
app91_text7<-args[8]
app91_text8<-args[9]
app91_text9<-as.numeric(args[10])
app91_text10<-as.numeric(args[11])
app91_select1<-as.logical(args[12])
app91_select2<-as.character(args[13])
app91_email<-args[14]

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
	if(length(grep(".maf",filename))>0){
	laml<-read.maf(maf = file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename))
	}
	if(length(grep(".txt",filename))>0){
	laml<-read.maf(maf = file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename))
	}


pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
	drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
	drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
	drawchart(laml,app91_text1=app91_text1,app91_text2=app91_text2,app91_text3=app91_text3,app91_text4=app91_text4,app91_text5=app91_text5,app91_text6=app91_text6,app91_text7=app91_text7,app91_text8=app91_text8,app91_text9=app91_text9,app91_text10=app91_text10,app91_select1=app91_select1,app91_select2=app91_select2)
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app91_email!=""&("TRUE"%in%grepl("@",app91_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app91_email),attach=T,attach.file=attach.file)
}
