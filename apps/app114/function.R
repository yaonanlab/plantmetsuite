library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app114_text1<-as.numeric(args[2])
app114_email<-args[3]

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="0")
	if(length(grep(".csv",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),head=T)
	}
	if(length(grep(".xls",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".xlsx",filename))>0){
	data<-as.data.frame(read_excel(file.path("userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
	}
	if(length(grep(".txt",filename))>0){
	data<-read.csv(file.path("userdata",taskidnow,"rawdata",filename),sep="\t",head=T)
	}

data1<-data[,-1]
matrix_value<-as.matrix(data1)
df_matrix=(nrow(data1)-1)*(ncol(data1)-1)
if (df_matrix==1){#2*2表格
	test_matrix<-chisq.test(matrix_value,correct=T)$expected
	matrix_vector<-as.vector(matrix_value)
	n=0
	a=0
	b=0
	for (i in matrix_vector){n=n+i}
	for (i in matrix_vector){#根据假设矩阵的情况，判断采用哪种检验方式
	if (i>=5){a=a+1}
	if (i<1){b=b+1}
	}
	print(paste("n=",n," a=",a," b=",b,sep=""))
	if ((a=4)&(n>=40)){result_matrix<-chisq.test(matrix_value,correct=F)}#Pearson
	if ((b=0)&(a<4)&(n>=40)){result_matrix<-chisq.test(matrix_value,correct=T)}#连续性校正卡方检验
	if ((b>0)|(n<40)){result_matrix<-fisher.test(matrix_value)}#Fisher's检验，额外确认结果如何输出
}else{#其他表格
	result_matrix<-chisq.test(matrix_value,correct=F)
}
result<-data[1:2,1:3]
result$Xsquared<-result_matrix$statistic
result$df<-result_matrix$parameter
result$p.value<-result_matrix$p.value
result$method<-result_matrix$method
if (result_matrix$p.value>=app114_text1){result$sig<-"no"}else{result$sig<-"yes"}
result1<-result[-2,4:8]#计算结果表格
#生成过程矩阵,observed expected residuals stdres
dataframe2<-result_matrix[6:9]
for (i in 1:4) {
  write.table(dataframe2[i], file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","matrix.xls"),sep = "\t",col.names = T,row.names = F, append = T)
}
write.table(result1,file=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app114_email!=""&("TRUE"%in%grepl("@",app114_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app114_email),attach=T,attach.file=attach.file)
}
