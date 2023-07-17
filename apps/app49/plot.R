myhist<-function(data,app49_select1,app49_select2,app49_text1,app49_text2,app49_text3,app49_text4,app49_text5,app49_text6,app49_text7,app49_text8,app49_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
  value<-as.numeric(data$value)
  group<-as.character(data$group)
  rep<-as.character(data$rep)
  colorbase<-c(app49_text1,app49_text2,app49_text3,app49_text4,app49_text5)
 p1<-ggballoonplot(data, x = "group", y = "rep",size = "value", fill = "value")+
    gradient_fill(colorbase)+
    labs(title=app49_text6)+xlab(app49_text7)+ ylab(app49_text8)+guides(size = FALSE)
	
plot(p1)

}