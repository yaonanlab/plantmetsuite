library(data.table)
library(DT)
library(ggridges)
library(readr)
library(svglite)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
library(plyr)
library(readxl)
library(fdrtool)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")

taskidnow<-args[1]
app112_select1<-as.logical(args[2])#单样本、配对，TRUE/FALSE
app112_select2<-args[3]#检验值，p
app112_text1<-as.numeric(args[4])#检验值的阈值
app112_text2<-as.numeric(args[5])#log2FC阈值
app112_email<-args[6]

filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")
if(length(grep(".csv",filename1))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T,check.names=F)
}
if(length(grep(".xls",filename1))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename1))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename1))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
}
if(length(grep(".csv",filename2))>0){
group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T,check.names=F)
}
if(length(grep(".xls",filename2))>0){
group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename2))>0){
group<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename2))>0){
group<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T,check.names=F)
}

#进行T检验需要的文件格式整理
data1<-tidyr::pivot_longer(data,cols=!colnames(data)[1], names_to="Sample", values_to="ExpressionQuantity")
raw<-plyr::join(data1,group,type="left")
group_name<-as.character(unique(group[,2]))
first<-group_name[1]
second<-group_name[2]
firstgroup<-subset(raw,raw$Group==first)#查询函数
firstgrouplength<-nrow(firstgroup)#返回指定矩阵的行数
secondgroup<-subset(raw,raw$Group==second)
secondgrouplength<-nrow(secondgroup)
filegroup<-rbind(firstgroup,secondgroup)
#写计算的表格，使用data作为基础数据,不考虑单样本
for (i in 2:ncol(data)){#返回指定矩阵的列数
  data[,i]<-as.numeric(as.character(data[,i]))
}

sampleA<-as.vector(subset(group,group$Group==first)[,1])
sampleA<-append(sampleA,"ID")
sampleB<-as.vector(subset(group,group$Group==second)[,1])
sampleB<-append(sampleB,"ID")
chartA<-t(data[,-which(colnames(data) %in% sampleB)])
chartB<-t(data[,-which(colnames(data) %in% sampleA)])
#写入表头
data$meanA<-NA
data$meanB<-NA
data$foldchange<-NA
data$log2foldchange<-NA
data$up_down<-NA
data$pvalue<-NA
data$qvalue<-NA
data$sig<-NA
#写入mean值
for (i in 1:nrow(data)){
  data$meanA[i]<-mean(chartA[,i],na.rm=T)
  data$meanB[i]<-mean(chartB[,i],na.rm=T)
#写入pvalue
  if(firstgrouplength<2|secondgrouplength<2){
    data$pvalue[i]<-1
  }else{
    pvalue<-t.test(chartA[,i],chartB[,i], paired=app112_select1)
    data$pvalue[i]<-pvalue$p.value
  }
  pvalue<-NA
}
#生成FoldChange列，进一步写入log2FoldChange
data$foldchange<-data$meanA/data$meanB
data$log2foldchange<-log2(data$foldchange)
data$log2foldchange[is.na(data$log2foldchange)] <- 0
data$log2foldchange[is.infinite(data$log2foldchange)] <- 0
data$pvalue[is.na(data$pvalue)] <- 1
data$pvalue[is.infinite(data$pvalue)] <- 1
#生成Qvalue
qvalue<-fdrtool(data$pvalue, statistic="pvalue",plot =FALSE)
data$qvalue<-as.numeric(qvalue$qval)
#上调/下调

for (i in 1:nrow(data)){
	if (data$log2foldchange[i]>app112_text2){
		data$up_down[i]<-"up"
	}
	if (data$log2foldchange[i]<(-app112_text2)){
		data$up_down[i]<-"down"
	}
	if ((data$log2foldchange[i]<app112_text2)&(data$log2foldchange[i]>(-app112_text2))){
		data$up_down[i]<-"-"
	}
	if (app112_select2=="p"){
	  if(firstgrouplength<2|secondgrouplength<2){
		if (data$pvalue[i]<2&(abs(data$log2foldchange[i])>app112_text2)){ #绝对值
		  data$sig[i]<-"yes"} 
		else {
		  data$sig[i]<-"no"
		}
	  }
	  if(firstgrouplength>=2&secondgrouplength>=2){
		if (data$pvalue[i]<app112_text1){#添加选项，选择Pvalue或者Qvalue
			data$sig[i]<-"yes"
		} else {
			data$sig[i]<-"no"
		}
	  }
	}
	if (app112_select2=="q"){
	  if(firstgrouplength<2|secondgrouplength<2){
		if (data$qvalue[i]<2&(abs(data$log2foldchange[i])>app112_text2)){ #绝对值
		  data$sig[i]<-"yes"} 
		else {
		  data$sig[i]<-"no"
		}
	  }
	  if(firstgrouplength>=2&secondgrouplength>=2){
		if (data$qvalue[i]<app112_text1){#添加选项，选择Pvalue或者Qvalue
			data$sig[i]<-"yes"
		} else {
			data$sig[i]<-"no"
		}
	  }
	}
}
meanA_name<-paste("mean",first,sep="")
meanB_name<-paste("mean",second,sep="")
gsub("meanA",meanA_name,names(data))
gsub("meanB",meanB_name,names(data))
write.table(data,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),row.names=F,col.names=T,quote=F,sep="\t")

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app112_email!=""&("TRUE"%in%grepl("@",app112_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app112_email),attach=T,attach.file=attach.file)
}
