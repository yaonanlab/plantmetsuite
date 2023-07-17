library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app95_select1<-args[2]
app95_select2<-args[3]
app95_select3<-as.numeric(args[4])
app95_text1<-as.numeric(args[5])
app95_email<-args[6]
#默认值，测试用
# app95_select1<-"blastn"
# app95_select2<-"nucl"
# app95_select3<-6
# app95_text1<-1e-5
# taskidnow<-"iYGj4VyV"
# filename1<-"/srv/myapps/keyandaydayup/userdata/iYGj4VyV/rawdata/1.fasta"
# filename2<-"/srv/myapps/keyandaydayup/userdata/iYGj4VyV/rawdata/2.fasta"
filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1",full.names=T)
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2",full.names=T)

# cd /srv/myapps/keyandaydayup/userdata/iYGj4VyV/rawdata/
# /software/blast_plus/bin/makeblastdb -in 1.fasta -dbtype nucl -parse_seqids -out index
# /software/blast_plus/bin/blastn -query 2.fasta -db index -evalue 1e-05 -num_threads 6 -out result.out

# /software/blast_plus/bin/makeblastdb -in 1.fasta -dbtype nucl
# /software/blast_plus/bin/blastn -query 2.fasta -db 1.fasta -out a.txt -evalue 1e-5 -outfmt 0

setwd(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
# mycmd0<-paste("cd userdata/",taskidnow,"/rawdata",sep="")
mycmd1<-paste("/software/blast_plus/bin/makeblastdb -in ",filename1," -dbtype ",app95_select2," -parse_seqids -out index",sep="")
mycmd2<-paste("/software/blast_plus/bin/",app95_select1," -query ",filename2," -db index -evalue ",app95_text1," -outfmt ",app95_select3," -num_threads 6 -out result.out",sep="")
# mycmd3<-paste("cp userdata/",taskidnow,"/rawdata/",aaa.out," userdata/",taskidnow,"/result/",sep="")
# system(mycmd0)
system(mycmd1)
system(mycmd2)
# system(mycmd3)
file.copy(from=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata/result.out"),to=file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result"))

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app95_email!=""&("TRUE"%in%grepl("@",app95_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app95_email),attach=T,attach.file=attach.file)
}
