library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/scripts/app100/missing_value_function.R")
taskidnow<-args[1]
app100_select1<-args[2]
app100_text1<-args[3]
app100_select2<-args[4]
app100_text2<-args[5]
app100_email<-args[6]
taskidnow<-as.character(taskidnow)
app100_select1 <- as.character(app100_select1)
app100_select2 <- as.numeric(app100_select2)
app100_text1<- as.character(app100_text1)
app100_text2<- as.numeric(app100_text2)
app100_email <- as.character(app100_email)

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="0")

if (app100_select1 %in% (c("NA","0"," ","-"))) {
	if(length(grep(".csv",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F,row.names=1,na.strings=app100_select1)
	}
	if(length(grep(".xls",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na=app100_select1)
	}
	if(length(grep(".xlsx",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na=app100_select1)
	}
	if(length(grep(".txt",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F,row.names=1,na.strings=app100_select1)
	}
} else if (app100_select1 =="nul"){
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
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T,check.names=F,row.names=1,na.strings=app100_text1)
	}
	if(length(grep(".xls",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na.strings=app100_text1)
	}
	if(length(grep(".xlsx",filename))>0){
		data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F,na.strings=app100_text1)
	}
	if(length(grep(".txt",filename))>0){
		data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T,check.names=F,row.names=1,na.strings=app100_text1)
	}
}

if(app100_select2==1) {
	result <- RemoveMissingPercent(data,app100_text2)
	}
if(app100_select2==2) {
	result <- ReplaceMissingByLoD2(data)
	}
if(app100_select2==3) {
	result <- ReplaceMissingByLoD5(data) 
	}
if(app100_select2==4) {
	result <- ReplaceMissingByLoD10(data)
	}
if(app100_select2==5) {
	result<-impute.missing(data,method="exclude")
	}
if(app100_select2==6) {
	result<-impute.missing(data,method="colmin") 
	}
if(app100_select2==7) {
	result<-impute.missing(data,method="mean") 
	}
if(app100_select2==8) {
	result<-impute.missing(data,method="median") 
	}
if(app100_select2==9) {
	result<-impute.missing(data,method="knn_var") 
	}
if(app100_select2==10) {
	result<-impute.missing(data,method="knn_smp") 
	}
if(app100_select2==11) {
	result<-impute.missing(data,method="bpca") 
	}
if(app100_select2==12) {
	result<-impute.missing(data,method="ppca")
	}
if(app100_select2==13) {
	result<-impute.missing(data,method="svdImpute")
	}
if(app100_select2==14) {
	result<-PerformFeatureFilter(data, "rsd",25000) 
	}
if(app100_select2==15) {
	result<-PerformFeatureFilter(data, "nrsd",25000) 
	}
if(app100_select2==16){
	result<-PerformFeatureFilter(data, "sd",25000) 
}
if(app100_select2==17) {
	result<-PerformFeatureFilter(data, "mad",25000)
	}
if(app100_select2==18) {
	result<-PerformFeatureFilter(data, "median",25000) 
	}
if(app100_select2==19) {
	result<-PerformFeatureFilter(data, "mean",25000) 
	}
if(app100_select2==20){
	result<-PerformFeatureFilter(data, "iqr",25000) 
}
 result_output<-data.frame(name=row.names(result),result)
write.table(result_output,file=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app100_email!=""&("TRUE"%in%grepl("@",app100_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app100_email),attach=T,attach.file=attach.file)
}
