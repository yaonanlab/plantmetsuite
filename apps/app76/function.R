library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/scripts/app76/missing_value_function.R")
taskidnow<-args[1]
app76_select1<-args[2]
app76_text1<-args[3]
app76_select2<-args[4]
app76_text2<-args[5]
app76_email<-args[6]
taskidnow<-as.character(taskidnow)
app76_select1 <- as.character(app76_select1)
app76_select2 <- as.numeric(app76_select2)
app76_text1<- as.character(app76_text1)
app76_text2<- as.numeric(app76_text2)
app76_email <- as.character(app76_email)

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="0")

if (app76_select1 %in% (c("NA","0"," ","-"))) {
	if(length(grep(".csv",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F,row.names=1,na.strings=app76_select1)
	}
	if(length(grep(".xls",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na=app76_select1)
	}
	if(length(grep(".xlsx",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na=app76_select1)
	}
	if(length(grep(".txt",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F,row.names=1,na.strings=app76_select1)
	}
} else if (app76_select1 =="nul"){
if(length(grep(".csv",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F,row.names=1)
	}
	if(length(grep(".xls",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F,row.names=1)
	}
} else {
	if(length(grep(".csv",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F,row.names=1,na.strings=app76_text1)
	}
	if(length(grep(".xls",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na.strings=app76_text1)
	}
	if(length(grep(".xlsx",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na.strings=app76_text1)
	}
	if(length(grep(".txt",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F,row.names=1,na.strings=app76_text1)
	}
}

if(app76_select2==1) {
	result <- RemoveMissingPercent(data,app76_text2)
	}
if(app76_select2==2) {
	result <- ReplaceMissingByLoD2(data)
	}
if(app76_select2==3) {
	result <- ReplaceMissingByLoD5(data) 
	}
if(app76_select2==4) {
	result <- ReplaceMissingByLoD10(data)
	}
if(app76_select2==5) {
	result<-impute.missing(data,method="exclude")
	}
if(app76_select2==6) {
	result<-impute.missing(data,method="colmin") 
	}
if(app76_select2==7) {
	result<-impute.missing(data,method="mean") 
	}
if(app76_select2==8) {
	result<-impute.missing(data,method="median") 
	}
if(app76_select2==9) {
	result<-impute.missing(data,method="knn_var") 
	}
if(app76_select2==10) {
	result<-impute.missing(data,method="knn_smp") 
	}
if(app76_select2==11) {
	result<-impute.missing(data,method="bpca") 
	}
if(app76_select2==12) {
	result<-impute.missing(data,method="ppca")
	}
if(app76_select2==13) {
	result<-impute.missing(data,method="svdImpute")
	}
if(app76_select2==14) {
	result<-PerformFeatureFilter(data, "rsd",25000) 
	}
if(app76_select2==15) {
	result<-PerformFeatureFilter(data, "nrsd",25000) 
	}
if(app76_select2==16){
	result<-PerformFeatureFilter(data, "sd",25000) 
}
if(app76_select2==17) {
	result<-PerformFeatureFilter(data, "mad",25000)
	}
if(app76_select2==18) {
	result<-PerformFeatureFilter(data, "median",25000) 
	}
if(app76_select2==19) {
	result<-PerformFeatureFilter(data, "mean",25000) 
	}
if(app76_select2==20){
	result<-PerformFeatureFilter(data, "iqr",25000) 
}
 result_output<-data.frame(name=row.names(result),result)
write.table(result_output,file=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app76_email!=""&("TRUE"%in%grepl("@",app76_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app76_email),attach=T,attach.file=attach.file)
}
