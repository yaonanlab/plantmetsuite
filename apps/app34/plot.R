drawbarchart<-function(data,app34_select1,app34_select2,app34_select3,app34_text1,app34_text2,app34_text3,app34_text4,app34_text5,app34_text6,app34_text7,app34_text8){	
library(RColorBrewer)
library(ggplot2)
if(ncol(data)==3){
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
colorbase<-c(app34_text1,app34_text2,app34_text3,app34_text4,app34_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}
	if(app34_select1=="1"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'black', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = -0.2, hjust = 0.5)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			  xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
	}

	if(app34_select1=="2"){  
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', vjust = 2, hjust = .5, position = position_stack())+
			 xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}

	if(app34_select1=="3"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = 0.5, hjust = 1.5)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}
}

if(ncol(data)==4){
data[,1]<-as.character(data[,1])
data[,2]<-as.character(data[,2])
data[,3]<-as.numeric(data[,3])
data[,4]<-as.numeric(data[,4])
colorbase<-c(app34_text1,app34_text2,app34_text3,app34_text4,app34_text5)
colornumber<-length(unique(data[,2]))
if(colornumber<=5){
mycolors<-head(colorbase,colornumber)
}else{
mycolors <- colorRampPalette(colorbase)(colornumber) 
}
if(app34_select3=="0"){
	if(app34_select1=="1"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'black', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = -0.2, hjust = 0.5)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			  xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
	}

	if(app34_select1=="2"){  
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', vjust = 2, hjust = .5, position = position_stack())+
			 xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}

	if(app34_select1=="3"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = 0.5, hjust = 1.5)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}



}else{

	if(app34_select1=="1"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+geom_errorbar(aes(ymin=value-se, ymax=value+se),position=position_dodge(0.9), width=.2)+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'black', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = -0.2, hjust = 0.5)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+geom_errorbar(aes(ymin=value-se, ymax=value+se),position=position_dodge(0.9), width=.2)+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			  xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)}
	}

	if(app34_select1=="2"){  
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', vjust = 2, hjust = .5, position = position_stack())+
			 xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity")+
			scale_fill_manual(values=mycolors)+
			labs(title=app34_text6)+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}

	if(app34_select1=="3"){ 
		if(app34_select2=="1"){
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+geom_errorbar(aes(ymin=value-se, ymax=value+se),position=position_dodge(0.9), width=.2)+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			geom_text(mapping = aes(label = value), size = 5, colour = 'white', 
            position = position_dodge2(width = 0.9, preserve = 'single'), 
            vjust = 0.5, hjust = 1.5)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
		else{
			plot(ggplot(data=data,aes(x=time,y=value,fill=group))+
			geom_bar(stat="identity",position="dodge")+geom_errorbar(aes(ymin=value-se, ymax=value+se),position=position_dodge(0.9), width=.2)+
			scale_fill_manual(values=mycolors)+labs(title=app34_text6)+
			coord_flip()+ xlab(app34_text7)+ ylab(app34_text8)+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(angle=45, hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
)
			}
	}



}

}
}


