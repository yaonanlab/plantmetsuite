drawchart<-function(data,app64_select1,app64_select2,app64_select3,app64_select4,app64_select5,app64_text1,app64_text2,app64_text3,app64_text4,app64_text5,app64_text6,app64_text7,app64_text8,app64_text9,app64_text10,app64_text11,app64_text12,app64_text13){	
library(RColorBrewer)
library(ggplot2)
library(beeswarm)
data[,1]<-as.character(data[,1])
data[,2]<-as.numeric(data[,2])
colorbase1<-c(app64_text1,app64_text2,app64_text3,app64_text4,app64_text5)
colornumber1<-length(unique(data[,1]))

if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}


if(app64_select2=="0"){
beeswarm(data$value ~ data$group,main=app64_text11,xlab=app64_text12,ylab=app64_text13,pch = 19, col = mycolors1,method = app64_select1,vertical=T)

}
if(app64_select2=="1"){
beeswarm(data$value ~ data$group,main=app64_text11,xlab=app64_text12,ylab=app64_text13,pch = 19, col = mycolors1,method = app64_select1,vertical=F)

}

}


