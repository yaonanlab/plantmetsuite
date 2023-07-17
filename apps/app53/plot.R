myhist<-function(data,app53_select1,app53_select2,app53_text1,app53_text2,app53_text3,app53_text4,app53_text5,app53_text6,app53_text7,app53_text8,app53_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)

colorbase1<-c(app53_text1,app53_text2,app53_text3,app53_text4,app53_text5)
colornumber1<-length(unique(data[,1]))
if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
}



  value<-as.numeric(data$group)
  group<-as.character(data$rep)
 p1<-ggqqplot(data, x = "value",color = "group", palette = mycolors1)+
labs(title=app53_text6)+xlab(app53_text7)+ ylab(app53_text8)
	
plot(p1)

}