drawchart<-function(data,app47_select1,app47_select2,app47_text1,app47_text2,app47_text3,app47_text4,app47_text5,app47_text6,app47_text7,app47_text8,app47_text9,app47_text10,app47_text11,app47_text12,app47_text13){	
library(RColorBrewer)
library(ggplot2)
library(gghalves)
library(see)
data[,1]<-as.character(data[,1])
data[,2]<-as.numeric(data[,2])
colorbase1<-c(app47_text1,app47_text2,app47_text3,app47_text4,app47_text5)
colorbase2<-c(app47_text6,app47_text7,app47_text8,app47_text9,app47_text10)
colornumber<-length(unique(data[,1]))

if(colornumber<=5){
mycolors1<-head(colorbase1,colornumber)
mycolors2<-head(colorbase2,colornumber)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber) 
mycolors2 <- colorRampPalette(colorbase2)(colornumber) 
}
#select1 横向/竖向
if(app47_select1=="0"){
p<-ggplot(data, aes(x=Group, y=Value))+scale_fill_manual(values=mycolors1)+coord_flip()
}
if(app47_select1=="1"){
p<-ggplot(data, aes(x=Group, y=Value))+scale_fill_manual(values=mycolors1)
}
#是否添加箱线图 是/否
if(app47_select2=="0"){
p1<-p+geom_half_violin(aes(fill = Group),
        position = position_nudge(x = .15, y = 0),
        adjust=1.5, trim=FALSE, colour=NA, side = 'r') +
    geom_point(aes(x = Group,
        y = Value,color = Group),
        position = position_jitter(width = .05),size = .25, shape = 20) +
	geom_boxplot(aes(x = Group,y = Value, fill = Group),
		position = position_nudge(x = .15, y = 0),
        outlier.shape = NA,
        width = .05,
        color = "black")+scale_colour_manual(values=mycolors1)
}
else{
p1<-p+geom_half_violin(aes(fill = Group),
        position = position_nudge(x = .15, y = 0),
        adjust=1.5, trim=FALSE, colour=NA, side = 'r') +
    geom_point(aes(x = Group,
        y = Value,color = Group),
        position = position_jitter(width = .05),size = .25, shape = 20)+scale_colour_manual(values=mycolors1)
}





p2<-p1+
labs(title=app47_text11)+
			xlab(app47_text12)+ ylab(app47_text13)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

plot(p2)
}


