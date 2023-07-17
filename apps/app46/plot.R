myhist<-function(data,app46_select1,app46_select2,app46_text1,app46_text2,app46_text3,app46_text4,app46_text5,app46_text6,app46_text7,app46_text8,app46_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app46_select1<-as.character(app46_select1)
app46_select2<-as.character(app46_select2)
  value<-as.numeric(data$value)
  group<-as.character(data$group)
  colorbase<-c(app46_text1,app46_text2,app46_text3,app46_text4,app46_text5)
  colornumber<-length(unique(data[,2]))
  if(colornumber<=5){
    mycolors<-head(colorbase,colornumber)
  }else{
    mycolors <- colorRampPalette(colorbase)(colornumber) 
  }
  
  if (app46_select1=="0"&app46_select2=="0"){
p1<-ggdensity(data, x = "value", rug = FALSE,color = "group", fill = "group",palette =mycolors)
  }
  if (app46_select1=="0"&app46_select2=="1"){
p1<-ggdensity(data, x = "value", rug = TRUE,color = "group", fill = "group",palette =mycolors)
  }
  if (app46_select1=="1"&app46_select2=="0"){
p1<-ggdensity(data, x = "value",add = "mean", rug = FALSE,color = "group", fill = "group",palette =mycolors)
  }
  if (app46_select1=="1"&app46_select2=="1"){
p1<-ggdensity(data, x = "value",add = "mean", rug = TRUE,color = "group", fill = "group",palette =mycolors)
  }  
  
  
  
  p2<-p1+
    scale_fill_manual(values=mycolors)+
    labs(title=app46_text6)+xlab(app46_text7)+ ylab(app46_text8)
	
plot(p2)

}