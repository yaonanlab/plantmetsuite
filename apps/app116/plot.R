library(ggplot2)
library(ggsignif)
#default
# app116_text1<-"#D43338"
# app116_text2<-"#FFD101"
# app116_text3<-"#ACCD03"
# app116_text4<-"#5EBED6"
# app116_text5<-"#776AAE"
# app116_select1<-0
# app116_select2<-0
# app116_select3<-0

drawchart<-function(data,app116_text1,app116_text2,app116_text3,app116_text4,app116_text5,app116_select1,app116_select2,app116_select3,taskidnow){
colorbase<-c(app116_text1,app116_text2,app116_text3,app116_text4,app116_text5)
colornumber<-length(unique(data[,1]))
if(colornumber<=5){
	mycolors<-head(colorbase,colornumber)
}else{
	mycolors <- colorRampPalette(colorbase)(colornumber)
}

names(data)<-c("group","values")
result<-data
result$compare<-NA
result$pvalue<-NA
result$sig<-NA
result$method<-NA
list_group<-unique(data$group)
x<-character()
for (i in 2:colornumber){
   x=paste(x,"-",list_group[i],sep="") 
}
x<-paste(list_group[1],x,sep="")
result[1,3]<-x
n=0
for(i in 1:(colornumber-1)){
  for(k in 2:(colornumber)){
    if(i<=k-1){
      n = n+1
      result[(1+n),3]<-paste(list_group[i],"-",list_group[k],sep="")
    }
  }
}
#group_length<-n+1
result<-result[1:(n+1),3:6]
if (app116_select2==0){#Kruskal-Wallis检验
	methods1<-"Kruskal-Wallis Test"
	before<-kruskal.test(values~group,data=data)
	result[1,2]<-before$p.value
	result[1,4]<-methods1
}else{#ANOVA检验
	methods1<-"ANOVA Test"
	before<-aov(values~group,data=data)
	a<-summary(before)
	result[1,2]<-a[[1]]$`Pr(>F)`
	result[1,4]<-methods1
}
if (app116_select3==0){#Nemenyi检验
	after<-PMCMRplus::kwAllPairsNemenyiTest(data$values,as.factor(data$group))
	methods2<-"Nemenyi Test"
	m=0
	for(i in 1:(colornumber-1)){
	  for(k in 2:(colornumber)){
	    if(i<=k-1){
	      m = m+1
	      #y<-c(list_group[i],list_group[k])
	      #print(y)
	      result[(1+m),2]<-after$p.value[(k-1),i]
	    }
	  }
	}
	for (i in 2:(m+1)){
	  result[i,4]<-methods2
	}
}else{#TukeyHSD检验
	after<-TukeyHSD(before,"group")
	methods2<-"TukeyHSD Test"
	for (i in 2:(n+1)){
	  result[i,2]<-after$group[(i-1),4]
	  result[i,4]<-methods2
	}
}
for (i in 1:nrow(result)){
  if (result[i,2]<0.001){result[i,3]<-"***"}
  if (result[i,2]<0.01&result[i,2]>=0.001){result[i,3]<-"**"}
  if (result[i,2]<0.05&result[i,2]>=0.01){result[i,3]<-"*"}
  if (result[i,2]>=0.05){result[i,3]<-"-"}
}

write.table(result,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result/result.xls"),sep="\t",row.names = F, col.names=T)

pvalue_list<-as.vector(result[,2][-1])
pos_min<-which.min(pvalue_list)+1
comparison<-as.vector(strsplit(result[pos_min,1],split = "-"))

if (app116_select1==0){#箱线图
  p<-ggplot(data, aes(x=group, y=values, fill=group,colour=group))+scale_fill_manual(values=mycolors)+
  geom_boxplot(position = position_dodge(width = 0.75),width=0.6,outlier.shape = NA)+
  geom_signif(comparisons = comparison,map_signif_level = F,textsize = 5, aes(annotations = c(paste(round(result[pos_min,2],6)))))
}else{#柱状图
  p<-ggplot(data, aes(x=group, y=values, fill=group,colour=group))+geom_bar(stat="identity",position="dodge")+scale_fill_manual(values=mycolors)+
  geom_signif(comparisons = comparison,map_signif_level = F,textsize = 5, aes(annotations = c(paste(round(result[pos_min,2],6)))))
}
p<-p+theme_bw() +
theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+
theme(plot.title = element_text(vjust =1,hjust = 0.5,size=18,face="bold"))+
theme(axis.text.x = element_text(hjust=.5, vjust=.5))+theme(axis.title.y = element_text(margin = margin(r = 20)))+theme(axis.title.x = element_text(margin = margin(t = 20)))
plot(p)
}