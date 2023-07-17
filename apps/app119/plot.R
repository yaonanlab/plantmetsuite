drawbarchart<-function(data,app119_select1,app119_select2,app119_select3,app119_text1,app119_text2,app119_text3,app119_text4,app119_text5,app119_text6){	
library(RColorBrewer)
library(ggplot2)
library(plotrix)
par(mar = c(10,0,10,0))
data[,1]<-as.character(data[,1])
data[,2]<-as.numeric(data[,2])
colorbase<-c(app119_text1,app119_text2,app119_text3,app119_text4,app119_text5)
colornumber<-length(unique(data[,1]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app119_select2=="0"){
piepercent = paste(data$Group," ",round(100*data$Value/sum(data$Value)), "%")
}
if(app119_select2=="1"){
piepercent = paste(data$Group)
}
if(app119_select2=="2"){
piepercent = paste(round(100*data$Value/sum(data$Value)), "%")
}

if(app119_select1=="0"&app119_select3=="0"){
pie(data$Value, labels=piepercent, main = app119_text6, col=mycolors)

}

if(app119_select1=="1"&app119_select3=="0"){
pie3D(data$Value,labels = piepercent,explode = 0.1, main = app119_text6,col=mycolors)

}

if(app119_select1=="0"&app119_select3=="1"){
pie(data$Value, labels=piepercent, main = app119_text6, col=mycolors,border=F)

}

if(app119_select1=="1"&app119_select3=="1"){
pie3D(data$Value,labels = piepercent,explode = 0.1, main = app119_text6,col=mycolors,border=F)

}

}


