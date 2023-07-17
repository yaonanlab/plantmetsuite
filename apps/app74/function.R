library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app74_email<-args[2]
taskidnow<-as.character(taskidnow)
app74_email <- as.character(app74_email)

mycmd1<-paste("/srv/R/bin/Rscript /srv/myapps/keyandaydayup/scripts/app74/table_transposition.R ",taskidnow," ",outname1)
system(mycmd1)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app74_email!=""&("TRUE"%in%grepl("@",app74_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app74_email),attach=T,attach.file=attach.file)
}
