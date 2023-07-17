library(ggplot2)
library(RColorBrewer)
myhist<-function(data,app40_select1,app40_select2,app40_text1,app40_text2,app40_text3,app40_text4,app40_text5,app40_text6,app40_text7,app40_text8,app40_slider1){


#单张图
if (ncol(data)==1){
  data$value<-as.numeric(data$value)
  colorbase<-c(app40_text1,app40_text2,app40_text3,app40_text4,app40_text5)
  colornumber<-length(unique(data[,1]))
  if(colornumber<=5){
    mycolors<-head(colorbase,colornumber)
  }
  else{
    mycolors <- colorRampPalette(colorbase)(colornumber) 
  }
  
  p1<-0
  
  if (app40_select1=="0"){
    p1<-ggplot(data,aes(x=data$value))
  }
  else{
    p1<-ggplot(data,aes(y=data$value))
  }
    p2<-p1+geom_histogram(position="identity", alpha=0.6,bins=app40_slider1)+
    scale_colour_manual(values=mycolors)+
    labs(title=app40_text6)+xlab(app40_text7)+ ylab(app40_text8)+
    theme_bw()+
	theme(panel.grid.major=element_line(colour=NA),
            panel.background = element_rect(fill = "transparent",colour = NA),
            plot.background = element_rect(fill = "transparent",colour = NA),
            panel.grid.minor = element_blank())
    
    plot(p2)
}
#两组叠加,组别在第二列
if (ncol(data)==2){
  data$value<-as.numeric(data$value)
  data$group<-as.character(data$group)
  colorbase<-c(app40_text1,app40_text2,app40_text3,app40_text4,app40_text5)
  colornumber<-length(unique(data[,2]))
  if(colornumber<=5){
    mycolors<-head(colorbase,colornumber)
  }else{
    mycolors <- colorRampPalette(colorbase)(colornumber) 
  }
  
  p3<-0
  
  if (app40_select1=="0"){
    p3<-ggplot(data,aes(x=value,fill=group))
  }
  else{
    p3<-ggplot(data,aes(y=value,fill=group))
  }
  p4<-p3+geom_histogram(position="identity",alpha=0.6,bins=app40_slider1)+
    scale_fill_manual(values=mycolors)+
    labs(title=app40_text6)+xlab(app40_text7)+ ylab(app40_text8)+
    theme_bw()+
	theme(panel.grid.major=element_line(colour=NA),
            panel.background = element_rect(fill = "transparent",colour = NA),
            plot.background = element_rect(fill = "transparent",colour = NA),
            panel.grid.minor = element_blank())
	if (app40_select2=="0"){#叠加
    p5<-p4
  }
    else{#堆积
    p5<-p3+geom_histogram(position="stack",alpha=0.6,bins=app40_slider1)+
    scale_fill_manual(values=mycolors)+
    labs(title=app40_text6)+xlab(app40_text7)+ ylab(app40_text8)+
    theme_bw()+
	theme(panel.grid.major=element_line(colour=NA),
            panel.background = element_rect(fill = "transparent",colour = NA),
            plot.background = element_rect(fill = "transparent",colour = NA),
            panel.grid.minor = element_blank())
  }
plot(p5)
}
}