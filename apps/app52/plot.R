myhist<-function(data,app52_select1,app52_select2,app52_text1,app52_text2,app52_text3,app52_text4,app52_text5,app52_text6,app52_text7,app52_text8,app52_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app52_select1<-as.character(app52_select1)
app52_select2<-as.character(app52_select2)
  data$value<-as.numeric(data$value)
  data$group<-as.character(data$group)
  data$name<-as.character(data$name)
  colorbase<-c(app52_text1,app52_text2,app52_text3,app52_text4,app52_text5)
  colornumber<-length(unique(data[,3]))
  if(colornumber<=5){
    mycolors<-head(colorbase,colornumber)
  }else{
    mycolors <- colorRampPalette(colorbase)(colornumber) 
  }
  
  if (app52_select1=="0"&app52_select2=="0"){
p1<-ggbarplot(data, x = "name", y = "value",fill = "group",color = "white",palette = mycolors,sort.val = "asc",sort.by.groups = FALSE,x.text.angle = 90)
  }
  if (app52_select1=="0"&app52_select2=="1"){
p1<-ggbarplot(data, x = "name", y = "value",fill = "group",color = "white",palette = mycolors,sort.val = "asc",sort.by.groups = TRUE,x.text.angle = 90)
  }
  if (app52_select1=="1"&app52_select2=="0"){
p1<-ggbarplot(data, x = "name", y = "value",fill = "group",color = "white",palette = mycolors,sort.val = "desc",sort.by.groups = FALSE,x.text.angle = 90)
  }
  if (app52_select1=="1"&app52_select2=="1"){
p1<-ggbarplot(data, x = "name", y = "value",fill = "group",color = "white",palette = mycolors,sort.val = "desc",sort.by.groups = TRUE,x.text.angle = 90)
  }  
  
  
  
  p2<-p1+
    labs(title=app52_text6)+xlab(app52_text7)+ ylab(app52_text8)
	
plot(p2)

}