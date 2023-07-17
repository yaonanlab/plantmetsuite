library(ggplot2)
library(RColorBrewer)
library(ggalluvial)
drawchart<-function(data,app82_text1,app82_text2,app82_text3,app82_text4,app82_text5,app82_text6,app82_text7,app82_text8,app82_text9,app82_text10,app82_text11,app82_select1){
df <- to_lodes_form(data[,1:ncol(data)],axes = 1:ncol(data),id = "value")

colorbase<-c(app82_text1,app82_text2,app82_text3,app82_text4,app82_text5)
col<- colorRampPalette(colorbase)(length(unique(df$stratum))) 
p<-ggplot(df, aes(x = x, fill=stratum, label=stratum,stratum = stratum, alluvium  = value))+
geom_flow(width = app82_text6,curve_type = app82_select1,alpha = app82_text7,color=app82_text8,size = app82_text9)+
geom_stratum(width = app82_text10)+
geom_text(stat = 'stratum', size = app82_text11 , color = 'black')+
scale_fill_manual(values = col)+
theme_void()+
theme(legend.position = 'none')

plot(p)

}