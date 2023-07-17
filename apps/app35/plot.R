drawbarchart<-function(data,app35_select1,app35_select2,app35_select3,app35_text1,app35_text2,app35_text3,app35_text4,app35_text5,app35_text6,app35_text7,app35_text8){	
library(RColorBrewer)
library(ggplot2)
if(ncol(data)==3){
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
colorbase<-c(app35_text1,app35_text2,app35_text3,app35_text4,app35_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app35_select3=="0"){
p<-ggplot(data=data,aes(x=time,y=value,colour=group,group=group))+ geom_line()+scale_colour_manual(values=mycolors)+
			scale_fill_manual(values=mycolors)+labs(title=app35_text6)+
			xlab(app35_text7)+ ylab(app35_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
}else{
p<-ggplot(data=data,aes(x=time,y=value,colour=group,group=group))+ geom_line()+scale_colour_manual(values=mycolors)+
			scale_fill_manual(values=mycolors)+labs(title=app35_text6)+
			xlab(app35_text7)+ ylab(app35_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

}

if(app35_select1=="0"){
p1<-p
}else{
p1<-p+geom_point(size=4, shape=16)
}

if(app35_select2=="0"){
p2<-p1
}else{
p2<-p1
}
}

if(ncol(data)==4){
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
data[,4]<-as.numeric(data[,4])
colorbase<-c(app35_text1,app35_text2,app35_text3,app35_text4,app35_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}

if(app35_select3=="0"){
p<-ggplot(data=data,aes(x=time,y=value,colour=group,group=group))+ geom_line()+scale_colour_manual(values=mycolors)+
			scale_fill_manual(values=mycolors)+labs(title=app35_text6)+
			xlab(app35_text7)+ ylab(app35_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
}else{
p<-ggplot(data, aes(x=time, y=value, ymin=value-se, ymax=value+se, colour=group,fill=group, group=group)) + geom_line() + geom_ribbon(alpha=0.5)+scale_colour_manual(values=mycolors)+
			scale_fill_manual(values=mycolors)+labs(title=app35_text6)+
			xlab(app35_text7)+ ylab(app35_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))

}

if(app35_select1=="0"){
p1<-p
}else{
p1<-p+geom_point(size=4, shape=16)
}

if(app35_select2=="0"){
p2<-p1
}else{
p2<-p1+geom_errorbar(aes(ymin=value-se, ymax=value+se),width=.1)
}
}
plot(p2)
}


