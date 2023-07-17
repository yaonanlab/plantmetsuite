myhist<-function(data,app63_select1,app63_text1,app63_text2,app63_text3,app63_text4,app63_text5,app63_text6,app63_text7,app63_text8,app63_text9,app63_text10,app63_text11,app63_text12){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app63_select1<-as.character(app63_select1)
app63_text1<-as.character(app63_text1)
app63_text2<-as.character(app63_text2)
app63_text3<-as.character(app63_text3)
app63_text4<-as.character(app63_text4)
app63_text5<-as.character(app63_text5)
app63_text6<-as.character(app63_text6)
app63_text7<-as.character(app63_text7)
app63_text8<-as.character(app63_text8)
app63_text9<-as.numeric(app63_text9)
app63_text10<-as.numeric(app63_text10)
app63_text11<-as.numeric(app63_text11)
app63_text12<-as.numeric(app63_text12)


  

p1<-ggplot(data = data, aes(x = id, y = height, label = label))+geom_col(aes(fill = id), width = 1, size = 0) +geom_col(aes(y = 40),fill = "white",width = 1,alpha = 0.2,size = 0)+geom_col(aes(y = 20),fill = "white",width = 1,alpha = 0.2,size = 0)+coord_polar() +theme_void() +scale_y_continuous()+geom_text(data = data,fontface = "bold",color="grey",angle = 180 - 180 * c(1:nrow(data))/nrow(data)) +scale_fill_gradientn(colors = c(app63_text1, app63_text2, app63_text3, app63_text4, app63_text5),guide = F)

plot(p1)
}