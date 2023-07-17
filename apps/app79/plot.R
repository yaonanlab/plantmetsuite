drawchart<-function(data,app79_select1,app79_select2,app79_select3,app79_select4,app79_select5,app79_select6,app79_text1,app79_text2,app79_text3,app79_text4,app79_text5,app79_text6,app79_text7,app79_text8){	
library(RColorBrewer)
library(ggplot2)
if(ncol(data)==3){
data[,1]<-as.numeric(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
colorbase<-c(app79_text1,app79_text2,app79_text3,app79_text4,app79_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app79_select1=="0"&app79_select2=="0"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="0"&app79_select2=="1"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="0"&app79_select2=="2"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="0"&app79_select2=="0"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="0"&app79_select2=="1"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="0"&app79_select2=="2"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="1"&app79_select2=="0"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="1"&app79_select2=="1"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="1"&app79_select2=="2"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="1"&app79_select2=="0"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="1"&app79_select2=="1"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="1"&app79_select2=="2"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group, color=weight))+geom_point(colour=app79_text1,size=3)
}

if(app79_select4=="0"){
p1<-p
}
if(app79_select4=="1"){
p1<-ggplot(data, aes(x=time, y=value, shape=group, colour=group,size=weight))+stat_bin2d()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}
if(app79_select4=="2"){
p1<-ggplot(data, aes(x=time, y=value, shape=group, colour=group,size=weight))+stat_binhex()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select5=="0"){
p2<-p1
}
if(app79_select5=="1"){
p2<-p1+ stat_smooth(method=lm, level=0.99)
}
if(app79_select5=="2"){
p2<-p1+ stat_smooth(method=loess)
}

if(app79_select6=="0"){
p3<-p2
}
if(app79_select6=="1"){
p3<-p2+geom_rug(position="jitter", size=.2)
}

}

if(ncol(data)==4){
data[,1]<-as.numeric(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
data[,4]<-as.numeric(data[,4])
colorbase<-c(app79_text1,app79_text2,app79_text3,app79_text4,app79_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app79_select1=="0"&app79_select2=="0"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="0"&app79_select2=="1"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="0"&app79_select2=="2"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, color=weight))+geom_point() +scale_colour_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select1=="0"&app79_select2=="0"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value,size=weight))+geom_point(colour=app79_text1)
}

if(app79_select1=="0"&app79_select2=="1"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, colour=group,size=weight))+geom_point()+scale_colour_manual(values=mycolors)
}

if(app79_select1=="0"&app79_select2=="2"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, color=weight,size=weight))+geom_point() +scale_colour_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select1=="1"&app79_select2=="0"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group))+geom_point(colour=app79_text1,size=3)
}

if(app79_select1=="1"&app79_select2=="1"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group, colour=group))+geom_point(size=3)+scale_colour_manual(values=mycolors)
}

if(app79_select1=="1"&app79_select2=="2"&app79_select3=="0"){
p<-ggplot(data, aes(x=time, y=value, shape=group, color=weight))+geom_point(size=3) +scale_colour_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select1=="1"&app79_select2=="0"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group,size=weight))+geom_point(colour=app79_text1)
}

if(app79_select1=="1"&app79_select2=="1"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group, colour=group,size=weight))+geom_point()+scale_colour_manual(values=mycolors)
}

if(app79_select1=="1"&app79_select2=="2"&app79_select3=="1"){
p<-ggplot(data, aes(x=time, y=value, shape=group, color=weight,size=weight))+geom_point() +scale_colour_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select4=="0"){
p1<-p
}
if(app79_select4=="1"&app79_select1=="0"){
p1<-ggplot(data, aes(x=time, y=value))+stat_bin2d()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}
if(app79_select4=="2"&app79_select1=="0"){
p1<-ggplot(data, aes(x=time, y=value))+stat_binhex()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select4=="1"&app79_select1=="1"){
p1<-ggplot(data, aes(x=time, y=value, shape=group))+scale_colour_manual(values=mycolors)+stat_bin2d()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}
if(app79_select4=="2"&app79_select1=="1"){
p1<-ggplot(data, aes(x=time, y=value, shape=group))+scale_colour_manual(values=mycolors)+stat_binhex()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select4=="1"&app79_select2=="0"){
p1<-ggplot(data, aes(x=time, y=value))+stat_bin2d()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}
if(app79_select4=="2"&app79_select2=="0"){
p1<-ggplot(data, aes(x=time, y=value))+stat_binhex()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}

if(app79_select4=="1"&app79_select2=="1"){
p1<-ggplot(data, aes(x=time, y=value, color=group))+scale_colour_manual(values=mycolors)+stat_bin2d()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}
if(app79_select4=="2"&app79_select2=="1"){
p1<-ggplot(data, aes(x=time, y=value, color=group))+scale_colour_manual(values=mycolors)+stat_binhex()+scale_fill_gradient(low=app79_text2, high=app79_text1)
}


if(app79_select5=="0"){
p2<-p1
}
if(app79_select5=="1"){
p2<-p1+ stat_smooth(method=lm, level=0.99)
}
if(app79_select5=="2"){
p2<-p1+ stat_smooth(method=loess)
}

if(app79_select6=="0"){
p3<-p2
}
if(app79_select6=="1"){
p3<-p2+geom_rug(position="jitter", size=.2)
}

}

p4<-p3+
labs(title=app79_text6)+
			xlab(app79_text7)+ ylab(app79_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

plot(p4)
}


