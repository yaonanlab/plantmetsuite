myhist<-function(data,app51_select1,app51_select2,app51_text1,app51_text2,app51_text3,app51_text4,app51_text5,app51_text6,app51_text7,app51_text8,app51_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app51_text1,app51_text2,app51_text3,app51_text4,app51_text5)
colornumber1<-length(unique(data[,3]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}



  name<-as.character(data$value)
  value<-as.numeric(data$group)
  group<-as.character(data$rep)
  colorbase<-c(app51_text1,app51_text2,app51_text3,app51_text4,app51_text5)
 p1<-ggdotchart(data, x = "name", y = "value",group = "group", color = "group",palette = mycolors1,rotate = TRUE,sorting = "descending",ggtheme = theme_bw(),y.text.col = TRUE )+


    labs(title=app51_text6)+xlab(app51_text7)+ ylab(app51_text8)+guides(size = FALSE)
	
plot(p1)

}