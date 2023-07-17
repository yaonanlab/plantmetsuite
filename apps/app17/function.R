library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app17_email<-args[2]
taskidnow<-as.character(taskidnow)
app17_email <- as.character(app17_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls")
mycmd<-paste(" python2 /srv/myapps/keyandaydayup/scripts/app17/calculate_index.py -i ",filename1," -o ",outname1)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app17_email!=""&("TRUE"%in%grepl("@",app17_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app17_email),attach=T,attach.file=attach.file)
}
