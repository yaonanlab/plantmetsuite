library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app111_text1<-as.numeric(args[2])
app111_email<-args[3]
taskidnow<-as.character(taskidnow)
app111_email <- as.character(app111_email)

    if(!is.na(app111_text1)){
	app111_text1 <- as.numeric(app111_text1)
	}else{
	app111_text1 <-5
	}

	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.txt")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf")
outdir1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd1<-paste("/usr/local/python35/bin/python3.5 /srv/myapps/keyandaydayup/scripts/app111/cluster.py -i ",filename1," -n ",app111_text1," -o1 ",outname1," -o2 ",outname2)
mycmd2<-paste("/usr/local/python35/bin/python3.5 /srv/myapps/keyandaydayup/scripts/app111/cluster.py -i ",filename1," -n ",app111_text1," -o1 ",outname3," -o2 ",outname2)
print(mycmd1)
print(mycmd2)
system(mycmd1)
system(mycmd2)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app111_email!=""&("TRUE"%in%grepl("@",app111_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app111_email),attach=T,attach.file=attach.file)
}
