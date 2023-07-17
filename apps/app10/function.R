library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app10_text1<-as.numeric(args[2])
app10_text2<-as.numeric(args[3])
app10_select1<-as.character(args[4])
app10_email<-args[5]
taskidnow<-as.character(taskidnow)
app10_email <- as.character(app10_email)

    if(!is.na(app10_text1)){
	app10_text1 <- as.numeric(app10_text1)
	}else{
	app10_text1 <-10
	}
	
    if(!is.na(app10_text2)){
	app10_text2 <- as.numeric(app10_text2)
	}else{
	app10_text2 <-50
	}

	if(!is.null(app10_select1)&(app10_select1)!=""){
	app10_select1 <- as.character(app10_select1)
	}else{
	app10_select1 <-"n"
	}
	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("result.txt")
outdir1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result")
mycmd<-paste("/srv/myapps/keyandaydayup/scripts/app10/Sequence_formatting.pl  -input ",filename1,"  -output ",outname1," -outdir ",outdir1," -width ",app10_text2," -block ",app10_text1," -rc n -ul ",app10_select1)
system(mycmd)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app10_email!=""&("TRUE"%in%grepl("@",app10_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app10_email),attach=T,attach.file=attach.file)
}
