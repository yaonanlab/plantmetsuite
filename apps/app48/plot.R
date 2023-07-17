drawchart<-function(data,app48_select1,app48_select2,app48_text1,app48_text2,app48_text3,app48_text4,app48_text5,app48_text6,app48_text7){	
library(RColorBrewer)
library(ggplot2)
library(beanplot)

colorbase1<-list(app48_text1,app48_text2)
colorbase2<-c(app48_text3,app48_text4)
colorbase1_1<-c(app48_text1,app48_text2)

dose<-as.character(data[,3])
supp<-as.character(data[,2])
len<-as.numeric(data[,1])

a<-as.character(unique(supp))

beanplot(len ~ reorder(supp, len, mean) * dose, data ,side=app48_select2,col=colorbase1,border=colorbase2, main=app48_text5,xlab=app48_text6, ylab =app48_text7, horizontal=as.logical(app48_select1),show.names=TRUE)
legend("bottomright", bty="n",a,fill = colorbase1_1)

}


