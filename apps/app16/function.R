library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app16_text1<-as.numeric(args[2])
app16_email<-args[3]
taskidnow<-as.character(taskidnow)
app16_email <- as.character(app16_email)

    if(!is.na(app16_text1)){
	app16_text1 <- as.numeric(app16_text1)
	}else{
	app16_text1 <-5
	}

	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png")
outdir1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd1<-paste("/root/anaconda3/bin/python3 /srv/myapps/keyandaydayup/scripts/app16/SVG_to_other_format.py --infile ",filename1," --format pdf --outfile ",outname1)
mycmd2<-paste("/root/anaconda3/bin/python3 /srv/myapps/keyandaydayup/scripts/app16/SVG_to_other_format.py --infile ",filename1," --format png --outfile ",outname2)
system(mycmd1)
system(mycmd2)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app16_email!=""&("TRUE"%in%grepl("@",app16_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app16_email),attach=T,attach.file=attach.file)
}
