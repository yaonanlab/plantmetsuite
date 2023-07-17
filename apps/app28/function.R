library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app28_select1<-as.character(args[2])
app28_select2<-as.character(args[3])
app28_email<-args[4]
taskidnow<-as.character(taskidnow)
app28_email <- as.character(app28_email)


	if(!is.null(app28_select1)&(app28_select1)!=""){
	app28_select1 <- as.character(app28_select1)
	}else{
	app28_select1 <-"n"
	}

	if(!is.null(app28_select2)&(app28_select2)!=""){
	app28_select2 <- as.character(app28_select1)
	}else{
	app28_select2 <-"nucl"
	}
	
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
outname1<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata","input.fasta")
outname2<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls")
outname3<-file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.best.xls")
mycmd1<-paste("/srv/myapps/keyandaydayup/scripts/app28/fasta_no_blank.pl ",filename1,"|head -n 200 > ",outname1)
if(app28_select2=="nucl"){
mycmd2<-paste("/software/blast_plus/bin/blastn -query ",outname1," -db  /srv/myapps/keyandaydayup/database/NCBI/",app28_select1,"_dir/",app28_select1,".seq"," -out ",outname2," -evalue 1e-5 -num_alignments 1 -num_threads 12 -outfmt '6 qseqid qlen qstart qend sstart send slen pident length mismatch evalue score sseqid stitle'",sep="")
}else{
mycmd2<-paste("/software/blast_plus/bin/blastn -query ",outname1," -db  /srv/myapps/keyandaydayup/database/NCBI/",app28_select1,"_dir/",app28_select1,".seq"," -out ",outname2," -evalue 1e-5 -num_alignments 1 -num_threads 12 -outfmt '6 qseqid qlen qstart qend sstart send slen pident length mismatch evalue score sseqid stitle'",sep="")
}

mycmd3<-paste("perl /bin/get_bestblast_nt.pl ",outname2," 1 ",outname3,sep="")
system(mycmd1)
system(mycmd2)
system(mycmd3)
finish<-"Job finished"
info<-"qseqid 查询基因的ID
qlen 查询基因的长度
qstart 查询基因的匹配开始位置
qend 查询基因的匹配结束位置
sstart 库基因的匹配开始位置
send 库基因的匹配结束位置
slen 库基因的长度
pident 相同匹配百分比
length 对齐长度
mismatch 不匹配数量
evalue 期望值
score 原始得分
sseqid 库基因的ID
stitle 库基因的标题"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
write.table(info,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","info.txt"),row.names=F,col.names=F,quote=F)
if(app28_email!=""&("TRUE"%in%grepl("@",app28_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app28_email),attach=T,attach.file=attach.file)
}
