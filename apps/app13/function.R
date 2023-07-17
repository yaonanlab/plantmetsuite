library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app13_email<-args[2]
taskidnow<-as.character(taskidnow)
app13_email <- as.character(app13_email)



filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.txt")
outdir1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd<-paste("/srv/myapps/keyandaydayup/scripts/app13/fa_N50_stat.pl -fa ",filename1," -cut 1"," -o ",outname1)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app13_email!=""&("TRUE"%in%grepl("@",app13_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app13_email),attach=T,attach.file=attach.file)
}
