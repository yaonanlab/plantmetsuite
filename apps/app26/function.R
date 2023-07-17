library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app26_email<-args[2]
taskidnow<-as.character(taskidnow)
app26_email <- as.character(app26_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.fasta")
mycmd<-paste("/root/anaconda3/bin/python3 /srv/myapps/keyandaydayup/scripts/app26/get_longest_gene.py  -i ",filename1," -o ",outname1)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app26_email!=""&("TRUE"%in%grepl("@",app26_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app26_email),attach=T,attach.file=attach.file)
}
