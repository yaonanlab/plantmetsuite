myhist<-function(data,app57_select1,app57_select2,app57_text1,app57_text2,app57_text3,app57_text4,app57_text5,app57_text6,app57_text7,app57_text8,app57_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app57_text1,app57_text2,app57_text3,app57_text4,app57_text5)
colornumber1<-length(unique(data[,1]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}

  
labs <- paste0(data$Group, " (", round(data$Value*100,2), "%)")



  colorbase<-c(app57_text1,app57_text2,app57_text3,app57_text4,app57_text5)
 p1<-ggdonutchart(data, "Value", label = labs,lab.pos = "in", lab.font = "white",fill = "Group", color = "white",palette = mycolors1)+

    labs(title=app57_text6)+xlab(app57_text7)+ ylab(app57_text8)+guides(size = FALSE)
	
plot(p1)

}