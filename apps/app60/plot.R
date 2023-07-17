myhist<-function(data,app60_select1,app60_select2,app60_text1,app60_text2,app60_text3,app60_text4,app60_text5,app60_text6,app60_text7,app60_text8,app60_slider1){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)


 p1<-ggpaired(data, cond1 = "before", cond2 = "after",fill = "condition", palette = c(app60_text1,app60_text2),line.color = app60_text3)+


    labs(title=app60_text6)+xlab(app60_text7)+ ylab(app60_text8)+guides(size = FALSE)
	
plot(p1)

}