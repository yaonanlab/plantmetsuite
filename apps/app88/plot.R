library(ggplot2)
library(RColorBrewer)
#library(edgeR)
app88_select1=0 #数据处理方式，0→log2,1→log10,2→不处理
app88_text1="#776AAE" #线条颜色
app88_text2="#5EBED6"
app88_text3="#ACCD03"
app88_text4="#FFD101"
app88_text5="#D43338"
app88_text6=1.2 #线条粗细
app88_select2="smooth" #线条形状，smooth平滑，step阶梯
app88_text7="x" #x轴标签
app88_text8="y" #y轴标签
app88_text9="Plot" #图片标题

drawchart<-function(data,group,app88_select1,app88_text1,app88_text2,app88_text3,app88_text4,app88_text5,app88_text6,app88_select2,app88_text7,app88_text8,app88_text9){
#数据处理
if(app88_select1==0){ #log2
data[,3]<-log2(data[,3])
}
if(app88_select1==1){ #log10
data[,3]<-log10(data[,3])
}
if(app88_select1==2){ #不处理
data[,3]<-data[,3]
}
data<-plyr::join(data,group)
#颜色准备
colorbase<-c(app88_text1,app88_text2,app88_text3,app88_text4,app88_text5)
colornumber<-length(unique(group[,2]))
if(colornumber<=5){
	mycolors<-head(colorbase,colornumber)
}else{
	mycolors <- colorRampPalette(colorbase)(colornumber) 
}
#绘制图形
p<-ggplot(data,aes(x=data[,3], col=data[,4]))+
	stat_ecdf(geom=app88_select2, se=F, size=app88_text6)+
	scale_colour_manual(values=mycolors, name=names(data)[4])+
	labs(x=app88_text7, y=app88_text8, title=app88_text9)+
	theme_bw()+
	theme(panel.grid.major=element_line(colour=NA),panel.background = element_rect(fill = "transparent",colour = NA),plot.background = element_rect(fill = "transparent",colour = NA),panel.grid.minor = element_blank())
plot(p)
}
