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
library(Hmisc)
library(corrplot)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/apps/app44/plot.R",encoding = "UTF-8")
taskidnow<-args[1]
app44_select1<-args[2]
app44_select2<-args[3]
app44_select3<-args[4]
app44_select4<-args[5]
app44_select5<-args[6]
app44_text1<-args[7]
app44_text2<-args[8]
app44_text3<-args[9]
app44_text4<-args[10]
app44_text5<-args[11]
app44_email<-args[12]
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
	if(length(grep(".csv",filename))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,row.names=1)
	}
	if(length(grep(".xls",filename))>0){
	data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".xlsx",filename))>0){
	data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".txt",filename))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,row.names=1)
	}

res<-rcorr(as.matrix(data))
res$P[is.na(res$P)]<-0
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
    )
}
library(Hmisc)
result<-flattenCorrMatrix(res$r, res$P)
	
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
drawchart(data,app44_select1,app44_select2,app44_select3,app44_select4,app44_select5,app44_text1,app44_text2,app44_text3,app44_text4,app44_text5)
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
drawchart(data,app44_select1,app44_select2,app44_select3,app44_select4,app44_select5,app44_text1,app44_text2,app44_text3,app44_text4,app44_text5)
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
drawchart(data,app44_select1,app44_select2,app44_select3,app44_select4,app44_select5,app44_text1,app44_text2,app44_text3,app44_text4,app44_text5)
dev.off()
finish<-"Job finished"
write.table(result,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),row.names=F,sep="\t",quote=F)
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app44_email!=""&("TRUE"%in%grepl("@",app44_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app44_email),attach=T,attach.file=attach.file)
}
