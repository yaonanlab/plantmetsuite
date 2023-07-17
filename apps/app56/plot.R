myhist<-function(data,app56_select1,app56_select2,app56_text1,app56_text2,app56_text3,app56_text4,app56_text5,app56_text6,app56_text7,app56_text8,app56_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app56_text1,app56_text2,app56_text3,app56_text4,app56_text5)
colornumber1<-length(unique(data[,1]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}

  


  name<-as.character(data$value)
  value<-as.numeric(data$group)
  group<-as.character(data$rep)
  colorbase<-c(app56_text1,app56_text2,app56_text3,app56_text4,app56_text5)
 p1<-ggstripchart(data, "Group", "Value",  shape = "Treatment",color = "Treatment",position = position_jitterdodge() ,palette = mycolors1)+

    labs(title=app56_text6)+xlab(app56_text7)+ ylab(app56_text8)+guides(size = FALSE)
	
plot(p1)

}