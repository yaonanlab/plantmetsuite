drawchart<-function(data,app43_select1,app43_text1,app43_text2,app43_text3,app43_text4,app43_text5,app43_text6){	
library(RColorBrewer)
library(ggplot2)
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.character(data[,3])
if( grepl("/",data[,3][1])==TRUE){
pre<-do.call(rbind,strsplit(data[,3],"/"))
data[,3]<-as.numeric(pre[,1])/as.numeric(pre[,2])
}else{
data[,3]<-as.numeric(data[,3])
}
data[,4]<-as.numeric(data[,4])
data[,5]<-as.numeric(data[,5])

data2<-head(data,app43_text6)


if(app43_select1=="0"){
data3<-data2[order(data2[,4],decreasing=TRUE),]
data3$Description<-as.character(data3$Description)
data3$Description<-factor(data3$Description, levels=data3$Description)
}
if(app43_select1=="1"){
data3<-data2[order(data2[,4],decreasing=FALSE),]
data3$Description<-as.character(data3$Description)
data3$Description<-factor(data3$Description, levels=data3$Description)
}
if(app43_select1=="2"){
data3<-data2[order(data2[,3],decreasing=TRUE),]
data3$Description<-as.character(data3$Description)
data3$Description<-factor(data3$Description, levels=data3$Description)
}
if(app43_select1=="3"){
data3<-data2[order(data2[,3],decreasing=FALSE),]
data3$Description<-as.character(data3$Description)
data3$Description<-factor(data3$Description, levels=data3$Description)
}
p<-ggplot(data3,aes(x=GeneRatio,y=Description,size=Count,colour=pvalue))+geom_point()+scale_color_gradient(low=app43_text1,high = app43_text2)


p4<-p+
labs(title=app43_text3)+
xlab(app43_text4)+ ylab(app43_text5)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
plot(p4)
}


