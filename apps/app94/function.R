library(tidymass)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-as.character(args[1])
app94_text1<-as.numeric(args[2])
app94_text2<-as.numeric(args[3])
app94_text3<-as.numeric(args[4])
app94_text4<-as.numeric(args[5])
app94_text5<-as.numeric(args[6])
app94_text6<-as.numeric(args[7])
app94_select1<-as.character(args[8])
app94_select2<-as.logical(args[9])
app94_select3<-as.logical(args[10])
app94_select4<-as.logical(args[11])
app94_select5<-as.logical(args[12])
app94_email<-as.character(args[13])
#默认值
# app94_text1<-15
# app94_text2<-5
# app94_text3<-30
# app94_text4<-5
# app94_text5<-500
# app94_text6<-0.5
# app94_select1<-"positive"
# app94_select2<-TRUE
# app94_select3<-TRUE
# app94_select4<-TRUE
# app94_select5<-TRUE

massprocesser::process_data(
  path = paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",sep="/"),
  polarity = app94_select1,
  ppm = app94_text1,
  peakwidth = c(app94_text2, app94_text3),
  snthresh = app94_text4,
  noise = app94_text5,
  threads = 1,
  output_tic = app94_select2,
  output_bpc = app94_select3,
  output_rt_correction_plot = app94_select4,
  min_fraction = app94_text6,
  fill_peaks = app94_select5
)
# rm -rf /srv/myapps/keyandaydayup/userdata/taskidnow/rawdata/result/intermediate_data
# rm -rf /srv/myapps/keyandaydayup/userdata/taskidnow/rawdata/result/object
# mv /srv/myapps/keyandaydayup/userdata/taskidnow/rawdata/result/* /srv/myapps/keyandaydayup/userdata/taskidnow/result
mycmdA<-paste("rm -rf /srv/myapps/keyandaydayup/userdata/",taskidnow,"/rawdata/Result/intermediate_data",sep="")
mycmdB<-paste("rm -rf /srv/myapps/keyandaydayup/userdata/",taskidnow,"/rawdata/Result/object",sep="")
mycmdC<-paste("mv /srv/myapps/keyandaydayup/userdata/",taskidnow,"/rawdata/Result/* /srv/myapps/keyandaydayup/userdata/",taskidnow,"/result",sep="")
system(mycmdA)
system(mycmdB)
system(mycmdC)
# file.remove(paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata/Result/intermediate_data",sep="/"))
# unlink(paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata/Result/object",sep="/"),recursive=TRUE)
# allfiles=list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata/Result"),recursive = T,full.names = T)
# file.copy(allfiles,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result"))
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app94_email!=""&("TRUE"%in%grepl("@",app94_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app94_email),attach=T,attach.file=attach.file)
}
