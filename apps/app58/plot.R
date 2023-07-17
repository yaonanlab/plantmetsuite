myhist<-function(data,app58_select1,app58_select2,app58_select3,app58_text1,app58_text2,app58_text3,app58_text4,app58_text5,app58_text6,app58_text7,app58_text8,app58_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)
app58_select1<-as.character(app58_select1)
app58_select2<-as.character(app58_select2)
app58_select3<-as.character(app58_select3)

  
  if (app58_select3=="1"){
p1<-ggscatter(data, x = "A", y = "B",color = app58_text1,add = app58_select1, conf.int = TRUE,add.params = list(color = app58_text2, fill = app58_text3),lineconf.int = TRUE,cor.coef = TRUE,cor.coeff.args = list(method = app58_select2, label.x = 3, label.sep = "\n"))

  }

  if (app58_select3=="0"){
p1<-ggscatter(data, x = "A", y = "B",color = app58_text1,add = app58_select1, conf.int = FALSE,add.params = list(color = app58_text2, fill = app58_text3),lineconf.int = TRUE,cor.coef = TRUE,cor.coeff.args = list(method = app58_select2, label.x = 3, label.sep = "\n"))  
}  
  
  
  
  p2<-p1+labs(title=app58_text6)+xlab(app58_text7)+ ylab(app58_text8)
	
plot(p2)

}