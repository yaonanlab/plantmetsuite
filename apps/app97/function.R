library(mailR)
library(readxl)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app97_email<-args[2]
app97_select1<-as.character(args[3])
app97_select2<-as.character(args[4])
app97_select3<-as.character(args[5])
app97_select4<-as.character(args[6])
app97_text1<-as.numeric(args[7])
app97_text2<-as.numeric(args[8])
app97_text3<-as.numeric(args[9])
taskidnow<-as.character(taskidnow)
app97_email <- as.character(app97_email)


#taskidnow<-"sEtiB24Q"
#app97_select1<-"positive"
#app97_select2<-"Standard database"
#app97_select3<-"0"
#app97_select4<-"both"
#app97_text1<-25
#app97_text2<-25
#app97_text3<-0.6

if(app97_select2=="Standard database"&app97_select1=="positive"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="Public database"&app97_select1=="positive"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="MS2T database"&app97_select1=="positive"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="All database"&app97_select1=="positive"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="Standard database"&app97_select1=="negative"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="Public database"&app97_select1=="negative"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="MS2T database"&app97_select1=="negative"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}
if(app97_select2=="All database"&app97_select1=="negative"){
load("/srv/myapps/keyandaydayup/database/VGDB_POS_v4.0.lib")
}

if(app97_select2=="Standard database"&app97_select3=="1"){
is.rt.score<-TRUE
}else{
is.rt.score<-FALSE
}
if(app97_select4=="both"){
w.reverse<-0.5
w.forward<-0.5
}
if(app97_select4=="forward"){
w.reverse<-0
w.forward<-1
}
if(app97_select4=="reverse"){
w.reverse<-1
w.forward<-0
}


filename1_1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern=".xls",full.names=T)
filename1_2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern=".csv",full.names=T)
filename1_3<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern=".txt",full.names=T)
if((length(filename1_1))>0){
filename1<-filename1_1
}
if((length(filename1_2))>0){
filename1<-filename1_2
}
if((length(filename1_3))>0){
filename1<-filename1_3
}

filename2_1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern=".mgf",full.names=T)
filename2_2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern=".msp",full.names=T)
if((length(filename2_1))>0){
filename2<-filename2_1
}
if((length(filename2_2))>0){
filename2<-filename2_2
}

source("/srv/myapps/keyandaydayup/metanno.R")
setwd(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
MetAnno(ms1.filename = filename1,ms2.filename = filename2,polarity = app97_select1,instrument = "scienx",mz.tol = app97_text1,ppm.ms2match = app97_text2,rt.tol = NULL,ccs.tol = NULL,is.rt.score = is.rt.score,is.ccs.score = FALSE,is.msms.score = TRUE,is.ms1.int.filter = FALSE,is.include.precursor = FALSE,pf.rt.range = 32,tolerance.rt.range = 64,w.rt = 0,w.ccs = 0,w.msms = 1,rt.cutoff = 0,ccs.cutoff = 0,msms.forward.cutoff = 0.005,msms.reverse.cutoff = 0.005,msms.cutoff = 0.005,inte.cutoff = app97_text3,ms1.int.cutoff = 0,mz.range.ms2 = NULL,extract.msms.file = NULL,w.reverse = w.reverse,w.forward = w.forward,int.ms2.min.abs = 10,int.ms2.min.relative = 0)


mycmd1<-paste("cp -f ",file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata/Result.xls")," ",file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result"))
print(mycmd1)
system(mycmd1)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app97_email!=""&("TRUE"%in%grepl("@",app97_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app97_email),attach=T,attach.file=attach.file)
}
