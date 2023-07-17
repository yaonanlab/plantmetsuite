library(RColorBrewer)
library(ggplot2)
drawchart<-function(data,app84_select1,app84_text1,app84_text2,app84_text3,app84_text4,app84_text5,app84_text6,app84_text7,app84_text8,app84_text9){
#读取数据，第一列为x轴数据，第二列为fill依据，第三列为y轴数据
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
#生成色彩系列
colorbase<-c(app84_text1,app84_text2,app84_text3,app84_text4,app84_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
	mycolors<-head(colorbase,colornumber)
}else{
	mycolors <- colorRampPalette(colorbase)(colornumber) 
}
#重叠
if(app84_select1==0){
p<-ggplot(data,aes(x=time,y=value,fill=group,group=group))+
	geom_area(position = position_dodge(width=0),alpha=app84_text6)+ 
	scale_colour_manual(values=mycolors)+scale_fill_manual(values=mycolors)+
	labs(title=app84_text7)+xlab(app84_text8)+ ylab(app84_text9)+theme_bw()+theme(panel.grid.major=element_line(colour=NA),panel.background = element_rect(fill = "transparent",colour = NA),plot.background = element_rect(fill = "transparent",colour = NA),panel.grid.minor = element_blank())+
	theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
}
#堆积
if(app84_select1==1){
	p<-ggplot(data,aes(x=time,y=value,fill=group,group=group))+
		geom_area(alpha=app84_text6)+ 
		scale_colour_manual(values=mycolors)+scale_fill_manual(values=mycolors)+
		labs(title=app84_text7)+xlab(app84_text8)+ ylab(app84_text9)+theme_bw()+theme(panel.grid.major=element_line(colour=NA),panel.background = element_rect(fill = "transparent",colour = NA),plot.background = element_rect(fill = "transparent",colour = NA),panel.grid.minor = element_blank())+
		theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
}
#百分比面积图
if(app84_select1==2){
	p<-ggplot(data,aes(x=time,y=value,fill=group,group=group))+
		geom_area(position = position_fill(),alpha=app84_text6)+ 
		scale_colour_manual(values=mycolors)+scale_fill_manual(values=mycolors)+
		labs(title=app84_text7)+xlab(app84_text8)+ ylab(app84_text9)+theme_bw()+theme(panel.grid.major=element_line(colour=NA),panel.background = element_rect(fill = "transparent",colour = NA),plot.background = element_rect(fill = "transparent",colour = NA),panel.grid.minor = element_blank())+
		theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
}
plot(p)

}