library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app96_email<-args[2]
app96_select1<-args[3]#模型选择方式
app96_select2<-args[4]#bootstrap模式
app96_text1<-args[5]#手动输入模型
app96_text2<-as.numeric(args[6])#bootstrap数
app96_text3<-as.numeric(args[7])#SH近似似然比检验重复次数

#默认值
app96_select1<-"MFP"
app96_select2<-"-bb"
app96_text1<-"HKY"
app96_text2<-1000
app96_text3<-1000

filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),full.names=T)


mycmd1<-paste("cd /srv/myapps/keyandaydayup/userdata/",taskidnow,"/rawdata",sep="")
if (app96_select1=="MFP"){
	mycmd2<-paste("/root/iqtree-1.6.12-Linux/bin/iqtree -s ",filename," -m MFP -pre result ",app96_select2," ",app96_text2," -alrt ",app96_text3," -nt 6",sep="")
}else{
	mycmd2<-paste("/root/iqtree-1.6.12-Linux/bin/iqtree -s ",filename," -m ",app96_text1," -pre result ",app96_select2," ",app96_text2," -alrt ",app96_text3," -nt 6",sep="")
}
mycmd3<-paste("mv result.* /srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/",sep="")

system(mycmd1)
system(mycmd2)
system(mycmd3)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app96_email!=""&("TRUE"%in%grepl("@",app96_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app96_email),attach=T,attach.file=attach.file)
}
