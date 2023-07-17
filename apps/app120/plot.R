drawchart<-function(data,app120_select1,app120_select2,app120_select3,app120_select4,app120_select5,app120_text1,app120_text2,app120_text3,app120_text4,app120_text5,app120_text6,app120_text7,app120_text8,app120_text9,app120_text10,app120_text11,app120_text12,app120_text13){	
library(RColorBrewer)
library(ggplot2)
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
colorbase1<-c(app120_text1,app120_text2,app120_text3,app120_text4,app120_text5)
colorbase2<-c(app120_text6,app120_text7,app120_text8,app120_text9,app120_text10)
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

if(app120_select1=="0"){
p<-ggplot(data, aes(x=Group, y=Value))
}
if(app120_select1=="1"){
p<-ggplot(data, aes(x=Group, y=Value, fill=Treatment,colour=Treatment))+scale_fill_manual(values=mycolors3)+scale_colour_manual(values=mycolors4)
}
if(app120_select1=="2"){
p<-ggplot(data, aes(x=Group, y=Value, fill=Group,colour=Group))+scale_fill_manual(values=mycolors1)+scale_colour_manual(values=mycolors2)
}


if(app120_select1!="0"){
if(app120_select2=="0"){
p1<-p+geom_boxplot(position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}
if(app120_select2=="1"){
p1<-p+geom_boxplot(varwidth = TRUE, position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}
if(app120_select2=="2"){
p1<-p+geom_boxplot(notch=TRUE, position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}
}else{
if(app120_select2=="0"){
p1<-p+geom_boxplot(fill=mycolors1[1],colour=mycolors2[1], position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}
if(app120_select2=="1"){
p1<-p+geom_boxplot(varwidth = TRUE,fill=mycolors1[1],colour=mycolors2[1], position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}
if(app120_select2=="2"){
p1<-p+geom_boxplot(notch=TRUE,fill=mycolors1[1],colour=mycolors2[1], position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)
}

}

if(app120_select3=="0"){
p2<-p1
}
if(app120_select3=="1"){
p2<-p1+geom_dotplot(binaxis = 'y', stackdir = 'center', dotsize = 0.2, position = position_dodge(0.75),color="black")
}
if(app120_select3=="2"){
p2<-p1+ geom_jitter(aes(),width =0.2,shape = 16,size=1,fill="black",colour="black")
}

if(app120_select4=="0"|app120_select1=="0"){
p3<-p2
}else{
p3<-p2+geom_boxplot(outlier.colour="black", outlier.shape=16,outlier.size=2,position = position_dodge(width = 0.75),width=0.6)
}



if(app120_select5=="0"){
p4<-p3
}
if(app120_select5=="1"){
p4<-p3+stat_summary(fun.y = mean, position = position_dodge(0.75),geom = "point",fill="black",color="black",colour="black")
}

p5<-p4+
labs(title=app120_text11)+
			xlab(app120_text12)+ ylab(app120_text13)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

plot(p5)
}


