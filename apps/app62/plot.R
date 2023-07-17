myhist<-function(data,app62_select1,app62_text1,app62_text2,app62_text3,app62_text4,app62_text5,app62_text6,app62_text7,app62_text8,app62_text9,app62_text10,app62_text11,app62_text12){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app62_select1<-as.character(app62_select1)
app62_text1<-as.character(app62_text1)
app62_text2<-as.character(app62_text2)
app62_text3<-as.character(app62_text3)
app62_text4<-as.character(app62_text4)
app62_text5<-as.character(app62_text5)
app62_text6<-as.character(app62_text6)
app62_text7<-as.character(app62_text7)
app62_text8<-as.character(app62_text8)
app62_text9<-as.numeric(app62_text9)
app62_text10<-as.numeric(app62_text10)
app62_text11<-as.numeric(app62_text11)
app62_text12<-as.numeric(app62_text12)
colorbase1<-c(app62_text1,app62_text2,app62_text3,app62_text4,app62_text5)
colornumber1<-length(unique(data[,3]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}
  

ggscatterhist(data, x="value1", y="value2",color = "group", size = 3, alpha = 0.6,palette = mycolors1,margin.plot = app62_select1,ggtheme = theme_bw(),margin.params = list(fill = "group", color = "black", size = 0.2))


}