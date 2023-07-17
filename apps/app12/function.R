library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app12_text1<-as.numeric(args[2])
app12_text2<-as.numeric(args[3])
app12_email<-args[4]
taskidnow<-as.character(taskidnow)
app12_email <- as.character(app12_email)

    if(!is.na(app12_text1)){
	app12_text1 <- as.numeric(app12_text1)
	}else{
	app12_text1 <-100
	}
	
    if(!is.na(app12_text2)){
	app12_text2 <- as.numeric(app12_text2)
	}else{
	app12_text2 <-1000
	}

	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.fasta")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","tooshort.fasta")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","toolong.fasta")
outdir1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd<-paste("/srv/myapps/keyandaydayup/scripts/app12/fasta_length_select_ali.pl -input ",filename1," -min ",app12_text1," -max ",app12_text2," -outok ",outname1," -outshort ",outname2," -outlong ",outname3)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app12_email!=""&("TRUE"%in%grepl("@",app12_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app12_email),attach=T,attach.file=attach.file)
}
