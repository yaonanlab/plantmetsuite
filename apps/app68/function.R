library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app68_email<-args[2]
app68_text1<-args[3]
app68_text2<-as.numeric(args[4])
app68_text3<-as.numeric(args[5])
app68_text4<-as.numeric(args[6])
taskidnow<-as.character(taskidnow)
app68_email <- as.character(app68_email)
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","report_raw.xls")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","report.xls")
inname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","transcript.xls")



mycmd1<-paste("/srv/R/bin/Rscript /srv/myapps/keyandaydayup/scripts/app68/DESeq2.R ",filename1," ",filename2," ",app68_text1," ",outname1)
mycmd2<-paste("/usr/bin/python3 /srv/myapps/keyandaydayup/scripts/app68/prepare_deseq2_report.py -i ",inname2," -c ",app68_text1," ",app68_text2," -o ",outname2)
mycmd3<-paste("/usr/bin/perl /srv/myapps/keyandaydayup/scripts/app68/adjust_parameter.pl -i ",outname2," -fc ",app68_text2," -p ",app68_text3," -q ",app68_text4," -o ",outname3)
mycmd4<-paste("rm -f ",outname2," ",inname2)
print(mycmd1)
print(mycmd2)
print(mycmd3)
system(mycmd1)
system(mycmd2)
system(mycmd3)
system(mycmd4)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app68_email!=""&("TRUE"%in%grepl("@",app68_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app68_email),attach=T,attach.file=attach.file)
}
