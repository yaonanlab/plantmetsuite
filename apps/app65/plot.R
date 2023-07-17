drawchart<-function(data,app65_select1,app65_select2,app65_select3,app65_select4,app65_select5,app65_text1,app65_text2,app65_text3,app65_text4,app65_text5,app65_text6,app65_text7,app65_text8,app65_text9,app65_text10,app65_text11,app65_text12,app65_text13){	
library(RColorBrewer)
library(ggplot2)
library(circlize)
data$name<-factor(data$name, levels=unique(data$name))
data$feature<-factor(data$feature, levels=unique(data$feature))
colorbase1<-c(app65_text1,app65_text2,app65_text3,app65_text4,app65_text5)
colornumber1<-(length(unique(data[,1]))+length(unique(data[,2])))


if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}

circos.par(gap.degree = c(rep(1, length(unique(data$name))-1), 5,rep(1, length(unique(data$feature))-1),5))
circos.clear()

if(app65_select1=="0"){
chordDiagram(data, transparency = app65_text11, big.gap = app65_text12,small.gap=app65_text13,grid.col = mycolors1)
}
if(app65_select1=="1"){
chordDiagram(data, transparency = app65_text11, big.gap = app65_text12,small.gap=app65_text13,grid.col = mycolors1, annotationTrack = c("name", "grid"))
}
if(app65_select1=="2"){
chordDiagram(data, transparency = app65_text11, big.gap = app65_text12,small.gap=app65_text13,grid.col = mycolors1, annotationTrack = "grid")
}
if(app65_select1=="3"){
chordDiagram(data, transparency = app65_text11, big.gap = app65_text12,small.gap=app65_text13,grid.col = mycolors1, annotationTrack = NULL)
}
}


