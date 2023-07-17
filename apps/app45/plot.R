drawchart<-function(data,app45_select1,app45_select2,app45_text1,app45_text2,app45_text3,app45_text4){	
library(RColorBrewer)
library(ggplot2)
library(plyr)
library(UpSetR)
library(ggplotify)
data<-as.data.frame(data)
app45_select1<-as.character(app45_select1)
app45_select2<-as.character(app45_select2)
app45_text1<-as.character(app45_text1)
app45_text2<-as.character(app45_text2)
app45_text3<-as.character(app45_text3)
app45_text4<-as.numeric(app45_text4)
for (i in 1:(ncol(data))){
data[,i]<-as.character(data[,i])
}
datagene<-as.character(do.call(cbind,data))
datagene_trim<-unique(datagene)
datagene_trim<-subset(datagene_trim,datagene_trim!="")
mydata<-list()
for (i in 1:(ncol(data))){
mydata[[i]]<-data.frame(gene=data[,i][data[,i]!=""],value=1)
names(mydata[[i]])[2]<-names(data)[i]
}

result<-data.frame(gene=datagene_trim)
for (i in 1:(ncol(data))){
result<-join(result,mydata[[i]],type="left")
}
result[is.na(result)]<-0
if(app45_select1=="0"&app45_select2=="0"){
plot(as.ggplot(upset(result,nsets = ncol(data),sets = names(data),nintersects = app45_text4,keep.order=FALSE,matrix.color=app45_text3,main.bar.color=app45_text2,sets.bar.color=app45_text1)))
}
if(app45_select1=="0"&app45_select2=="1"){
plot(as.ggplot(upset(result,nsets = ncol(data),sets = names(data),nintersects = app45_text4,keep.order=FALSE,matrix.color=app45_text3,main.bar.color=app45_text2,sets.bar.color=app45_text1,empty.intersections = "on")))
}
if(app45_select1=="1"&app45_select2=="0"){
plot(as.ggplot(upset(result,nsets = ncol(data),sets = names(data),nintersects = app45_text4,keep.order=TRUE,matrix.color=app45_text3,main.bar.color=app45_text2,sets.bar.color=app45_text1)))
}
if(app45_select1=="1"&app45_select2=="1"){
plot(as.ggplot(upset(result,nsets = ncol(data),sets = names(data),nintersects = app45_text4,keep.order=TRUE,matrix.color=app45_text3,main.bar.color=app45_text2,sets.bar.color=app45_text1,empty.intersections = "on")))
}

}


