myhist<-function(data,app54_select1,app54_select2,app54_text1,app54_text2,app54_text3,app54_text4,app54_text5,app54_text6,app54_text7,app54_text8,app54_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app54_select1<-as.character(app54_select1)
app54_select2<-as.character(app54_select2)
data$value<-as.numeric(data$value)
data$name<-as.character(data$name)
  
data$value_z <- (data$value -mean(data$value))/sd(data$value)
data$value_group <- factor(ifelse(data$value_z < 0, "low", "high"), levels = c("low", "high"))
  
  
  colorbase<-c(app54_text1,app54_text2,app54_text3,app54_text4,app54_text5)
  colornumber<-2
  if(colornumber<=5){
    mycolors<-head(colorbase,colornumber)
  }else{
    mycolors <- colorRampPalette(colorbase)(colornumber) 
  }
  
  if (app54_select1=="0"&app54_select2=="0"){
p1<-ggbarplot(data, x = "name", y = "value_z",fill = "value_group",color = "white",palette = mycolors,sort.val = "asc",sort.by.groups = FALSE,x.text.angle = 90,ylab = "Z-score",legend.title = "Level")
  }
  if (app54_select1=="0"&app54_select2=="1"){
p1<-ggbarplot(data, x = "name", y = "value_z",fill = "value_group",color = "white",palette = mycolors,sort.val = "asc",sort.by.groups = FALSE,x.text.angle = 90,ylab = "Z-score",legend.title = "Level",rotate = TRUE)  }
  if (app54_select1=="1"&app54_select2=="0"){
p1<-ggbarplot(data, x = "name", y = "value_z",fill = "value_group",color = "white",palette = mycolors,sort.val = "desc",sort.by.groups = FALSE,x.text.angle = 90,ylab = "Z-score",legend.title = "Level")  }
  if (app54_select1=="1"&app54_select2=="1"){
p1<-ggbarplot(data, x = "name", y = "value_z",fill = "value_group",color = "white",palette = mycolors,sort.val = "desc",sort.by.groups = FALSE,x.text.angle = 90,ylab = "Z-score",legend.title = "Level",rotate = TRUE)  }  
  
  
  
  p2<-p1+
    labs(title=app54_text6)+xlab(app54_text7)+ ylab(app54_text8)
	
plot(p2)

}