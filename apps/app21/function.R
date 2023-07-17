library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app21_email<-args[2]
taskidnow<-as.character(taskidnow)
app21_email <- as.character(app21_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result1.fastq")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result2.fastq")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.html")
outname4<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd1<-paste("/srv/myapps/keyandaydayup/scripts/app21/fastp -i ",filename1," -I ",filename2," -o ",outname1," -O ",outname2," -z 4 -q 20 -u 30 -n 10  -h ",outname3)
mycmd2<-paste("cp /fastp.json -f ",outname4)
system(mycmd1)
system(mycmd2)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app21_email!=""&("TRUE"%in%grepl("@",app21_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app21_email),attach=T,attach.file=attach.file)
}
