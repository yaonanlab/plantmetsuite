library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app29_select1<-as.character(args[2])
app29_email<-args[3]
taskidnow<-as.character(taskidnow)
app29_email <- as.character(app29_email)


	if(!is.null(app29_select1)&(app29_select1)!=""){
	app29_select1 <- as.character(app29_select1)
	}else{
	app29_select1 <-"nucl"
	}
	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata","input.fasta")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.best.xls")
mycmd1<-paste("/srv/myapps/keyandaydayup/scripts/app29/fasta_no_blank.pl ",filename1,"|head -n 200 > ",outname1)
if(app29_select1=="nucl"){
mycmd2<-paste("/software/blast_plus/bin/blastx -task blastx-fast -query ",outname1," -db  /srv/myapps/keyandaydayup/database/swissprot/uniprot_sprot.fasta"," -out ",outname2," -evalue 1e-5 -word_size 4 -threshold 18 -num_alignments 1 -num_threads 12 -outfmt '6'",sep="")
}else{
mycmd2<-paste("/software/blast_plus/bin/blastp -task blastp-fast -query ",outname1," -db  /srv/myapps/keyandaydayup/database/swissprot/uniprot_sprot.fasta"," -out ",outname2," -evalue 1e-5 -word_size 4 -threshold 18 -num_alignments 1 -num_threads 12 -outfmt '6'",sep="")
}

mycmd3<-paste("/usr/bin/python3 /bin/get_best_blast.py -i ",outname2," -o ",outname3,sep="")
system(mycmd1)
system(mycmd2)
system(mycmd3)
finish<-"Job finished"
info<-"qseqid 查询基因的ID
sseqid 库基因的ID
pident 相同匹配百分比
length 对齐长度
mismatch 不匹配数量
gapopen 缺口数量
qstart 查询基因的匹配开始位置
qend 查询基因的匹配结束位置
sstart 库基因的匹配开始位置
send 库基因的匹配结束位置
evalue 期望值
bitscore 比对结果的bit score值"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
write.table(info,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","info.txt"),row.names=F,col.names=F,quote=F)
if(app29_email!=""&("TRUE"%in%grepl("@",app29_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app29_email),attach=T,attach.file=attach.file)
}
