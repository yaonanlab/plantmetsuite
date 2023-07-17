library(dplyr)
library(ggrepel)
library(ggplot2)
library(see)
# app105_text1<-"#ACCD03"
# app105_text2<-"#E07EA0"
# app105_text3<-"#FFD101"
# app105_text4<-"#5EBED6"
# app105_text5<-"#776AAE"
# app105_text6<-0.5 #颜色透明度
# app105_text7<-"Plot" #图片标题
# app105_text8<-"X" #X轴标签
# app105_text9<-"Y" #Y轴标签
# app105_text10<-30 #点的大小最大范围
# app105_text11<-1 #点的大小最小范围
# app105_select1<-21 #气泡形状，21圆形22方形
# app105_select2<-2 #上色依据，2分组6权重/数量
# app105_select3<-0 #是否添加标签，0是1否
drawchart<-function(data,app105_text1,app105_text2,app105_text3,app105_text4,app105_text5,app105_text6,app105_text7,app105_text8,app105_text9,app105_text10,app105_text11,app105_select1,app105_select2,app105_select3){
	#填充颜色依据
	if(app105_select2==2){
		#生成颜色系列
		colorbase<-c(app105_text1,app105_text2,app105_text3,app105_text4,app105_text5)
		colornumber<-length(unique(data[,2]))
		if(colornumber<=5){
			mycolors<-head(colorbase,colornumber)
		}else{
			mycolors <- colorRampPalette(colorbase)(colornumber) 
		}
		p<-ggplot(data,aes(x=data[,3],y=data[,4]))+
		geom_point(aes(size=data[,5],fill=data[,2],colour=NA),alpha=app105_text6,shape=app105_select1,show.legend=TRUE)+scale_fill_manual(values=mycolors,name=names(data)[2])+scale_color_manual(values=mycolors)+
		scale_size(range=c(app105_text11,app105_text10),name=names(data)[5])
	}else{
		p<-ggplot(data,aes(x=data[,3],y=data[,4]),colour=NA)+
		geom_point(aes(size=data[,5],fill=data[,6]),alpha=app105_text6,shape=app105_select1,show.legend=TRUE)+scale_fill_gradient(low=app105_text1, high=app105_text2, name=names(data)[6])+
		scale_size(range=c(app105_text11,app105_text10),name=names(data)[5])
	}
	#添加共有部分
	p<-p+labs(x=app105_text8, y=app105_text9, title=app105_text7)+
		theme(legend.position = "none")+
		ylim(0,1.1*max(data$y))+
		theme_bw()+theme(panel.grid.major=element_line(colour=NA),panel.background = element_rect(fill = "transparent",colour = NA),plot.background = element_rect(fill = "transparent",colour = NA),panel.grid.minor = element_blank())
	if(app105_select3==0){
	p<-p+geom_text_repel(label=data[,1],size=5)
	}
	plot(p)
}