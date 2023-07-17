library(RColorBrewer)
library(ggplot2)
library(plyr)

drawchart<-function(raw_rnatable,raw_protable,app80_text1,app80_text2,app80_text3,app80_text4,app80_text5,app80_text6,app80_text7,app80_text8,app80_text9,app80_text10,app80_text11,app80_text12,app80_text13,app80_text14,taskidnow){
names(raw_rnatable)<-paste(names(raw_rnatable),"_gene",sep="")
names(raw_rnatable)<-gsub("Gene_gene","Gene",names(raw_rnatable))
names(raw_protable)<-paste(names(raw_protable),"_protein",sep="")
names(raw_protable)<-gsub("Gene_protein","Gene",names(raw_protable))
nineplot<-join(raw_rnatable,raw_protable,type="inner")

part1<-subset(nineplot,nineplot$Log2FoldChange_gene<(-app80_text12)& nineplot$Log2FoldChange_protein>app80_text13)
part2<-subset(nineplot,((nineplot$Log2FoldChange_gene>(-app80_text12)&(nineplot$Log2FoldChange_gene<app80_text12))& nineplot$Log2FoldChange_protein>app80_text13))
part3<-subset(nineplot,nineplot$Log2FoldChange_gene>app80_text12& nineplot$Log2FoldChange_protein>app80_text13)
part4<-subset(nineplot,nineplot$Log2FoldChange_gene<(-app80_text12)&((nineplot$Log2FoldChange_protein>(-app80_text13))&(nineplot$Log2FoldChange_protein<app80_text13)) )
part5<-subset(nineplot,((nineplot$Log2FoldChange_gene>(-app80_text12)&(nineplot$Log2FoldChange_gene<app80_text12))& ((nineplot$Log2FoldChange_protein>(-app80_text13))&(nineplot$Log2FoldChange_protein<app80_text13))))
part6<-subset(nineplot,((nineplot$Log2FoldChange_gene>app80_text12))& ((nineplot$Log2FoldChange_protein>(-app80_text13))&(nineplot$Log2FoldChange_protein<app80_text13)))
part7<-subset(nineplot,nineplot$Log2FoldChange_gene<(-app80_text12)& nineplot$Log2FoldChange_protein<(-app80_text13))
part8<-subset(nineplot,((nineplot$Log2FoldChange_gene>(-app80_text12)&(nineplot$Log2FoldChange_gene<app80_text12))& nineplot$Log2FoldChange_protein<(-app80_text13)))
part9<-subset(nineplot,nineplot$Log2FoldChange_gene>app80_text12& nineplot$Log2FoldChange_protein<(-app80_text13))

plot(x =nineplot$Log2FoldChange_gene,y = nineplot$Log2FoldChange_protein, xlab=app80_text10,ylab=app80_text11,main="",pch=20, cex=app80_text14,col="black",type="n")
points(part1$Log2FoldChange_gene, part1$Log2FoldChange_protein, pch=20, col=app80_text1,cex=app80_text14)
points(part2$Log2FoldChange_gene, part2$Log2FoldChange_protein, pch=20, col=app80_text2,cex=app80_text14)
points(part3$Log2FoldChange_gene, part3$Log2FoldChange_protein, pch=20, col=app80_text3,cex=app80_text14)
points(part4$Log2FoldChange_gene, part4$Log2FoldChange_protein, pch=20, col=app80_text4,cex=app80_text14)
points(part5$Log2FoldChange_gene, part5$Log2FoldChange_protein, pch=20, col=app80_text5,cex=app80_text14)
points(part6$Log2FoldChange_gene, part6$Log2FoldChange_protein, pch=20, col=app80_text6,cex=app80_text14)
points(part7$Log2FoldChange_gene, part7$Log2FoldChange_protein, pch=20, col=app80_text7,cex=app80_text14)
points(part8$Log2FoldChange_gene, part8$Log2FoldChange_protein, pch=20, col=app80_text8,cex=app80_text14)
points(part9$Log2FoldChange_gene, part9$Log2FoldChange_protein, pch=20, col=app80_text9,cex=app80_text14)

abline(h=app80_text13,lty=2,lwd=2,col="grey")
abline(v=-app80_text12,lty=2,lwd=2,col="grey")
abline(v=app80_text12,lty=2,lwd=2,col="grey")
abline(h=-app80_text13,lty=2,lwd=2,col="grey")
part1$class<-"part1"
part2$class<-"part2"
part3$class<-"part3"
part4$class<-"part4"
part5$class<-"part5"
part6$class<-"part6"
part7$class<-"part7"
part8$class<-"part8"
part9$class<-"part9"
result<-rbind(part1,part2,part3,part4,part5,part6,part7,part8,part9)
write.table(result,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.xls"),sep="\t",quote=F,row.names=F)

}


