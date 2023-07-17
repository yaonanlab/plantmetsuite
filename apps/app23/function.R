library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app23_email<-args[2]
taskidnow<-as.character(taskidnow)
app23_email <- as.character(app23_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.dict")
filename2<-paste("R=",filename1,sep="")
outname2<-paste("O=",outname1,sep="")
mycmd<-paste("/usr/bin/java -jar -Xms35480m -Xmx35480m /software/picard-tools-1.115/CreateSequenceDictionary.jar ",filename2," ",outname2)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app23_email!=""&("TRUE"%in%grepl("@",app23_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app23_email),attach=T,attach.file=attach.file)
}
