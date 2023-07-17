library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app30_select1<-as.character(args[2])
app30_email<-args[3]
taskidnow<-as.character(taskidnow)
app30_email <- as.character(app30_email)


	if(!is.null(app30_select1)&(app30_select1)!=""){
	app30_select1 <- as.character(app30_select1)
	}else{
	app30_select1 <-"nucl"
	}
	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata","input.fasta")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata","result.xls")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata","result.best.xls")
outname4<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls")
mycmd1<-paste("/srv/myapps/keyandaydayup/scripts/app30/fasta_no_blank.pl ",filename1,"|head -n 200 > ",outname1)
if(app30_select1=="nucl"){
mycmd2<-paste("/software/blast_plus/bin/blastx -task blastx-fast -query ",outname1," -db  /srv/myapps/keyandaydayup/database/swissprot/uniprot_sprot_new.fa"," -out ",outname2," -evalue 1e-5 -word_size 4 -threshold 18 -num_alignments 1 -num_threads 12 -outfmt '6'",sep="")
}else{
mycmd2<-paste("/software/blast_plus/bin/blastp -task blastp-fast -query ",outname1," -db  /srv/myapps/keyandaydayup/database/swissprot/uniprot_sprot_new.fa"," -out ",outname2," -evalue 1e-5 -word_size 4 -threshold 18 -num_alignments 1 -num_threads 12 -outfmt '6'",sep="")
}
mycmd3<-paste("/usr/bin/python3 /bin/get_best_blast.py -i ",outname2," -o ",outname3,sep="")
mycmd4<-paste("/srv/R/bin/Rscript /srv/myapps/keyandaydayup/scripts/app30/anno.r  -a /srv/myapps/keyandaydayup/database/swissprot/sprot.anno -i ",outname3," -o ",outname4,sep="")
system(mycmd1)
system(mycmd2)
system(mycmd3)
system(mycmd4)
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app30_email!=""&("TRUE"%in%grepl("@",app30_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app30_email),attach=T,attach.file=attach.file)
}
