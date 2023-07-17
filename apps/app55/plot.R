myhist<-function(data,app55_select1,app55_select2,app55_text1,app55_text2,app55_text3,app55_text4,app55_text5,app55_text6,app55_text7,app55_text8,app55_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app55_text1,app55_text2,app55_text3,app55_text4,app55_text5)
colornumber1<-length(unique(data[,2]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}


  data$Value<-as.numeric(data$Value)
  data$Treatment<-as.character(data$Treatment)
  data$Group<-as.character(data$Group)
 p1<-ggerrorplot(data, x = "Group", y = "Value", color = "Treatment", palette = mycolors1,error.plot = "pointrange",position = position_dodge(0.5))+
labs(title=app55_text6)+xlab(app55_text7)+ ylab(app55_text8)
	
plot(p1)

}