library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app78_select1<-args[2]
app78_email<-args[3]
taskidnow<-as.character(taskidnow)
app78_select1<-as.numeric(app78_select1)
app78_email <- as.character(app78_email)


filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.fasta")

if(app78_select1==1){
mycmd<-paste("/usr/bin/perl /srv/myapps/keyandaydayup/scripts/app78/dna2rna.pl ",filename1," >",outname1)
}
if(app78_select1==2){
mycmd<-paste("/usr/bin/perl /srv/myapps/keyandaydayup/scripts/app78/rna2dna.pl ",filename1," >",outname1)
}
system(mycmd)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app78_email!=""&("TRUE"%in%grepl("@",app78_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app78_email),attach=T,attach.file=attach.file)
}
