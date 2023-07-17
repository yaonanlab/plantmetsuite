library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app72_email<-args[2]
app72_text1<-args[3]
app72_text2<-args[4]
taskidnow<-as.character(taskidnow)
app72_email <- as.character(app72_email)
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
# filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)

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

outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
inname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls")

mycmd1<-paste("/srv/R/bin/Rscript /srv/myapps/keyandaydayup/scripts/app72/table_info_extraction.R ",taskidnow," ",app72_text1," ",app72_text2," ",outname1)
system(mycmd1)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app72_email!=""&("TRUE"%in%grepl("@",app72_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app72_email),attach=T,attach.file=attach.file)
}
