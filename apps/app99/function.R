library(tidymass)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-as.character(args[1])
app99_text1<-as.numeric(args[2])
app99_text2<-as.numeric(args[3])
app99_text3<-as.numeric(args[4])
app99_text4<-as.numeric(args[5])
app99_text5<-as.numeric(args[6])
app99_text6<-as.numeric(args[7])
app99_select1<-as.character(args[8])
app99_select2<-as.logical(args[9])
app99_select3<-as.logical(args[10])
app99_select4<-as.logical(args[11])
app99_select5<-as.logical(args[12])
app99_email<-as.character(args[13])
#默认值
# app99_text1<-15
# app99_text2<-5
# app99_text3<-30
# app99_text4<-5
# app99_text5<-500
# app99_text6<-0.5
# app99_select1<-"positive"
# app99_select2<-TRUE
# app99_select3<-TRUE
# app99_select4<-TRUE
# app99_select5<-TRUE

massprocesser::process_data(
  path = paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",sep="/"),
  polarity = app99_select1,
  ppm = app99_text1,
  peakwidth = c(app99_text2, app99_text3),
  snthresh = app99_text4,
  noise = app99_text5,
  threads = 1,
  output_tic = app99_select2,
  output_bpc = app99_select3,
  output_rt_correction_plot = app99_select4,
  min_fraction = app99_text6,
  fill_peaks = app99_select5
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

if(app99_email!=""&("TRUE"%in%grepl("@",app99_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app99_email),attach=T,attach.file=attach.file)
}
