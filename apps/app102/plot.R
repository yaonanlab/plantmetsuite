library(agricolae)
library(ggplot2)
library(RColorBrewer)
#default
# app102_select1<-1
# app102_select2<-"set3"
# app102_text2<-"Plot"
# app102_text3<-"Groups"
# data<-read.csv(file.path("C:/Users/verygenome/Desktop/Linux/collection/app102/scripts里的内容/data.txt"), sep="\t",head=T)

drawchart<-function(data,app102_select1,app102_select2,app102_text1,app102_text2,taskidnow){	
	dat<-as.data.frame(data)
	datnames <- names(dat)
	num<-length(datnames)
	pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result/plot.pdf"))
	for (i in 2:num){
		shapiro<-shapiro.test(dat[,i])
		bartlett<-bartlett.test(dat[,i]~dat[,1], data = dat)
		anova <- aov(dat[,i]~dat[,1], data = dat)
		anova_s<-summary(anova)
		write.table(unlist(shapiro),file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/result_test_",i-1,".txt",sep="")),sep="\t",quote = F)
		write.table(unlist(bartlett),file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/result_test_",i-1,".txt",sep="")),sep="\t",quote = F,append=T)
		write.table(anova$coefficients,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/result_test_",i-1,".txt",sep="")),sep="\t",quote = F,append=T)
		
		if (app102_select1==1){result <- HSD.test(anova, "dat[, 1]")}
		if (app102_select1==2){result <-duncan.test(anova, "dat[, 1]")}
		if (app102_select1==3){result <- LSD.test(anova, "dat[, 1]")}
		write.table(result$statistics,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/result_test_",i-1,".txt",sep="")),sep="\t",quote = F,append=T)
		
		datmeans <- result$means
		datgroups <- result$groups
		ind <- match(row.names(datmeans), row.names(datgroups))
		datmeans$groups <- datgroups$groups[ind]
		names(datmeans)[1] <- datnames[1]
		plotdata <- as.data.frame(cbind(row.names(datmeans), datmeans[, 1], datmeans$std, as.character(datmeans$groups)))
		names(plotdata) <- c("Treat", "y", "std", "groups")
		plotdata$y <- as.numeric(as.character(plotdata$y))
		plotdata$std <- as.numeric(as.character(plotdata$std))
		write.table(plotdata,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/result_plot_",i-1,".xls",sep="")),sep="\t",row.names = F,quote = F)
		colorbase<-brewer.pal(nrow(plotdata),name=app102_select2)
		theplot <- ggplot(plotdata, aes(x = Treat, y = y, fill = Treat)) + 
		geom_col()  +
		scale_fill_manual(values=colorbase)+ 
		labs(title = app102_text1, x = app102_text2, y= datnames[i]) + 
		geom_errorbar(aes(ymin = y - std, ymax = y + std), width = 0.2, position=position_dodge(0.9)) + 
		ylim(min(0,min(plotdata$y)-max(plotdata$std)), max(max(plotdata$y)+max(plotdata$std), max(plotdata$y) * 1.2)) + 
		geom_text(mapping = aes(y = y + std, label = groups), vjust = -0.7)+
		theme_bw() +
		theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
		theme(plot.title = element_text(vjust =1,hjust = 0.5,face="bold"))+
		theme(axis.text.x = element_text(hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
		plot(theplot)	
	}
	dev.off()
	return(plot(theplot))
}