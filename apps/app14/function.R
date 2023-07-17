library(mailR)
library(plyr)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app14_email<-args[2]
taskidnow<-as.character(taskidnow)
app14_email <- as.character(app14_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/","result.fasta")
mycmd<-paste("/srv/myapps/keyandaydayup/scripts/app14/grep_seq_v2.pl -fa ",filename1," -pos ",filename2," -out ",outname1)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app14_email!=""&("TRUE"%in%grepl("@",app14_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app14_email),attach=T,attach.file=attach.file)
}
