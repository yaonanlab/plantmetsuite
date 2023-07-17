drawbarchart<-function(data,app39_select1,app39_select2,app39_select3,app39_text1,app39_text2,app39_text3,app39_text4,app39_text5,app39_text6){	
library(RColorBrewer)
library(ggplot2)
library(plotrix)
par(mar = c(10,0,10,0))
data[,1]<-as.character(data[,1])
data[,2]<-as.numeric(data[,2])
colorbase<-c(app39_text1,app39_text2,app39_text3,app39_text4,app39_text5)
colornumber<-length(unique(data[,1]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app39_select2=="0"){
piepercent = paste(data$Group," ",round(100*data$Value/sum(data$Value)), "%")
}
if(app39_select2=="1"){
piepercent = paste(data$Group)
}
if(app39_select2=="2"){
piepercent = paste(round(100*data$Value/sum(data$Value)), "%")
}

if(app39_select1=="0"&app39_select3=="0"){
pie(data$Value, labels=piepercent, main = app39_text6, col=mycolors)

}

if(app39_select1=="1"&app39_select3=="0"){
pie3D(data$Value,labels = piepercent,explode = 0.1, main = app39_text6,col=mycolors)

}

if(app39_select1=="0"&app39_select3=="1"){
pie(data$Value, labels=piepercent, main = app39_text6, col=mycolors,border=F)

}

if(app39_select1=="1"&app39_select3=="1"){
pie3D(data$Value,labels = piepercent,explode = 0.1, main = app39_text6,col=mycolors,border=F)

}

}


