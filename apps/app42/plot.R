drawchart<-function(data,app42_select1,app42_select2,app42_select3,app42_select4,app42_select5,app42_text1,app42_text2,app42_text3,app42_text4,app42_text5,app42_text6,app42_text7,app42_text8,app42_text9,app42_text10,app42_text11,app42_text12,app42_text13){	
library(RColorBrewer)
library(ggplot2)
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
colorbase1<-c(app42_text1,app42_text2,app42_text3,app42_text4,app42_text5)
colorbase2<-c(app42_text6,app42_text7,app42_text8,app42_text9,app42_text10)
colornumber1<-length(unique(data[,1]))
colornumber2<-length(unique(data[,2]))

if(colornumber1<=5){
mycolors1<-head(colorbase1,colornumber1)
mycolors2<-head(colorbase2,colornumber1)
}else{
mycolors1 <- colorRampPalette(colorbase1)(colornumber1) 
mycolors2 <- colorRampPalette(colorbase2)(colornumber1) 
}

if(colornumber2<=5){
mycolors3<-head(colorbase1,colornumber2)
mycolors4<-head(colorbase2,colornumber2)
}else{
mycolors3 <- colorRampPalette(colorbase1)(colornumber2) 
mycolors4 <- colorRampPalette(colorbase2)(colornumber2) 
}

if(app42_select1=="0"){
p<-ggplot(data, aes(x=Group, y=Value))
}
if(app42_select1=="1"){
p<-ggplot(data, aes(x=Group, y=Value, fill=Treatment,colour=Treatment))+scale_fill_manual(values=mycolors3)+scale_colour_manual(values=mycolors4)
}
if(app42_select1=="2"){
p<-ggplot(data, aes(x=Group, y=Value, fill=Group,colour=Group))+scale_fill_manual(values=mycolors1)+scale_colour_manual(values=mycolors2)
}


if(app42_select1!="0"){
if(app42_select2=="0"){
p1<-p+geom_violin(position = position_dodge(width = 0.75))
}
if(app42_select2=="1"){
p1<-p+geom_violin(position = position_dodge(width = 0.75))+coord_flip()
}
}else{
if(app42_select2=="0"){
p1<-p+geom_violin(fill=mycolors1[1],colour=mycolors2[1],position = position_dodge(width = 0.75))
}
if(app42_select2=="1"){
p1<-p+geom_violin(fill=mycolors1[1],colour=mycolors2[1],position = position_dodge(width = 0.75))+coord_flip()
}

}

if(app42_select3=="0"){
p2<-p1
}
if(app42_select3=="1"){
p2<-p1+geom_dotplot(binaxis = 'y', stackdir = 'center', dotsize = 0.2, position = position_dodge(width = 0.75),color="black",fill="white")
}
if(app42_select3=="2"){
p2<-p1+ geom_jitter(aes(),width =0.2,shape = 16,size=1,fill="black",colour="black")
}


if(app42_select4=="0"){
p3<-p2
}
if(app42_select4=="1"){
p3<-p2+stat_summary(fun.y = mean, position = position_dodge(width = 0.75),geom = "point",fill="black",color="black",colour="black")
}

if(app42_select5=="0"){
p4<-p3
}else{
p4<-p3+geom_boxplot(colour="black",width=0.3,outlier.colour=NA, position = position_dodge(width = 0.75))
}

p5<-p4+
labs(title=app42_text11)+
			xlab(app42_text12)+ ylab(app42_text13)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

plot(p5)
}


