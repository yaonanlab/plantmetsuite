myhist<-function(data,app59_select1,app59_text1,app59_text2,app59_text3,app59_text4,app59_text5,app59_text6,app59_text7,app59_text8,app59_text9,app59_text10,app59_text11,app59_text12){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app59_select1<-as.character(app59_select1)
app59_text1<-as.character(app59_text1)
app59_text2<-as.character(app59_text2)
app59_text3<-as.character(app59_text3)
app59_text4<-as.character(app59_text4)
app59_text5<-as.character(app59_text5)
app59_text6<-as.character(app59_text6)
app59_text7<-as.character(app59_text7)
app59_text8<-as.character(app59_text8)
app59_text9<-as.numeric(app59_text9)
app59_text10<-as.numeric(app59_text10)
app59_text11<-as.numeric(app59_text11)
app59_text12<-as.numeric(app59_text12)

  

p1<-ggmaplot(data, main = app59_text6,fdr = app59_text9, fc = app59_text10, size = app59_text11,palette = c(app59_text1, app59_text2, app59_text3),genenames = as.vector(data$name),xlab = app59_text7,ylab = app59_text8,legend = "top", top = app59_text12, select.top.method = app59_select1,font.label = c("bold", 11),font.legend = "bold",font.main = "bold",ggtheme = ggplot2::theme_minimal(), label.rectangle = TRUE)
 

plot(p1)

}
