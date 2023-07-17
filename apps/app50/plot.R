myhist<-function(data,app50_select1,app50_select2,app50_text1,app50_text2,app50_text3,app50_text4,app50_text5,app50_text6,app50_text7,app50_text8,app50_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app50_text1,app50_text2,app50_text3,app50_text4,app50_text5)
colornumber1<-length(unique(data[,3]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}



  name<-as.character(data$value)
  value<-as.numeric(data$group)
  group<-as.character(data$rep)
  colorbase<-c(app50_text1,app50_text2,app50_text3,app50_text4,app50_text5)
 p1<-ggdotchart(data, x = "name", y = "value",color = "group",palette = mycolors1,sorting = "descending",add = "segments",rotate = TRUE,group = "group",dot.size = 6,label = round(data$value),font.label = list(color = "white", size = 9,vjust = 0.5),ggtheme = theme_pubr())+

    labs(title=app50_text6)+xlab(app50_text7)+ ylab(app50_text8)+guides(size = FALSE)
	
plot(p1)

}