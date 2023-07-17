myhist<-function(data,app61_text1,app61_text2,app61_text3,app61_text4,app61_text5,app61_text6,app61_text7,app61_text8){
library(ggplot2)
library(RColorBrewer)
library(shiny)
library(ggpubr)


 p1<-ggtexttable(data, rows = NULL,theme = ttheme(colnames.style = colnames_style(color = "white", fill = app61_text1),tbody.style = tbody_style(color = "black", fill = c(app61_text2, app61_text3))))
plot(p1)

}