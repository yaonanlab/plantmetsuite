library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
source("/srv/myapps/keyandaydayup/scripts/app75/standardization_normalization.R")
taskidnow<-args[1]
app75_select1<-args[2]
app75_text1<-args[3]
app75_email<-args[4]
taskidnow<-as.character(taskidnow)
app75_select1 <- as.numeric(app75_select1)
app75_email <- as.character(app75_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")
# filename3<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="3")
#data,原始数据
	if(length(grep(".csv",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,row.names=1)
	}
	if(length(grep(".xls",filename1))>0){
	data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".xlsx",filename1))>0){
	data0<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F,row.names=1)
	data<-data0[,-1]
	row.names(data)<-data0[,1]
	}
	if(length(grep(".txt",filename1))>0){
	data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T,row.names=1)
	}
#data2，分组信息
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
#data3，取样量	
# if(length(grep(".csv",filename3))>0){
# data3<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename3),head=T)
# }
# if(length(grep(".xls",filename3))>0){
# data3<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename3),sheet = 1),check.names=F)
# }
# if(length(grep(".xlsx",filename3))>0){
# data3<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename3),sheet = 1),check.names=F)
# }
# if(length(grep(".txt",filename3))>0){
# data3<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename3),sep="\t",head=T)
# }

if(app75_select1==1) {
	result<-Normalization(data, NormMethod="QuantileNorm")
	}
if(app75_select1==2) {
		cls<-as.vector(data2[,1])
		ref<-app75_text1
		result<-Normalization(data, NormMethod="GroupPQN",cls=cls,ref=ref)
	}
if(app75_select1==3) {
		cls<-as.vector(data2[,1])
		ref<-app75_text1
		result<-Normalization(data, NormMethod="SamplePQN",cls=cls,ref=ref) 
	}
if(app75_select1==4) {
		cls<-as.vector(data2[,1])
		ref<-app75_text1
		result<-Normalization(data, NormMethod="CompNorm",cls=cls,ref=ref) 
	}
if(app75_select1==5) {
		result<-Normalization(data, NormMethod="SumNorm") 
		}
if(app75_select1==6) {
		result<-Normalization(data, NormMethod="MedianNorm") 
	}
if(app75_select1==7) {
		norm.vec<-as.vector(data2[,2])
		result<-Normalization(data, NormMethod="SpecNorm",norm.vec=norm.vec) 
	}
if(app75_select1==8) {
		result<-Normalization(data, NormMethod="Log2Norm") 
	}
if(app75_select1==9) {
		result<-Normalization(data, NormMethod="Log10Norm") 
	}
if(app75_select1==10) {
		result<-Normalization(data, NormMethod="SrNorm") 
	}
if(app75_select1==11) {
		result<-Normalization(data, NormMethod="CrNorm") 
	}
if(app75_select1==12) {
		result<-Normalization(data, NormMethod="MeanCenter") 
	}
if(app75_select1==13) {
		result<-Normalization(data, NormMethod="Z-score") 
	}
if(app75_select1==14) {
		result<-Normalization(data, NormMethod="ParetoNorm") 
	}
if(app75_select1==15) {
		result<-Normalization(data, NormMethod="MeanNorm") 
	}
if(app75_select1==16){
		result<-Normalization(data, NormMethod="MinMaxNorm") 
}

result_output<-data.frame(sample=row.names(result),result)

write.table(result_output,file=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app75_email!=""&("TRUE"%in%grepl("@",app75_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app75_email),attach=T,attach.file=attach.file)
}
