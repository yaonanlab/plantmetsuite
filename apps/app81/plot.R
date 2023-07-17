library(plyr)
library(Hmisc)

flattenCorrMatrix <- function(cormat, pmat) {
    ut <- upper.tri(cormat)
	data.frame(
		row = rownames(cormat)[row(cormat)[ut]],
		column = rownames(cormat)[col(cormat)[ut]],
		cor  =(cormat)[ut],
		p = pmat[ut]
    )
}

drawchart<-function(raw_rnatable,raw_mettable,app81_text1,app81_text2,app81_text3,app81_text4,app81_text5,app81_text6,app81_text7,app81_text8,app81_text9,app81_text10,app81_text11,app81_text12,app81_text13,app81_select1,app81_text14,app81_text15,app81_text16,taskidnow){

raw_rnatable2<-raw_rnatable[ , -which(colnames(raw_rnatable) %in% c("Gene","baseMean","Log2FoldChange","pval","padj","Up/Down","Significant"))]
row.names(raw_rnatable2)<-raw_rnatable$Gene
raw_mettable<-raw_mettable[!duplicated(raw_mettable[,1]),]
raw_mettable2<-raw_mettable[ , -which(colnames(raw_mettable) %in% c("ID","Compound","meanA","meanB","foldchange","log2foldchange","up_down","pvalue","qvalue","sig"))]
row.names(raw_mettable2)<-raw_mettable$Compound
mergetable<-rbind(raw_rnatable2,raw_mettable2)
mergetable2<-as.matrix(t(mergetable))
cor_result<-rcorr(mergetable2,type=app81_select1)
result<-data.frame(name=row.names(cor_result$r),cor_result$r,check.names=F)
cor_result2<-flattenCorrMatrix(cor_result$r, cor_result$P)
nineplot<-subset(cor_result2,(cor_result2$cor>=app81_text14&cor_result2$p<=app81_text15)|(cor_result2$cor<=(-app81_text14)&cor_result2$p<=app81_text15))
nineplot1<-nineplot[ which(nineplot$row %in% as.character(raw_rnatable$Gene)), ]
nineplot1<-nineplot1[ which(nineplot1$column %in% as.character(raw_mettable$Compound)), ]
nineplot2<-nineplot[ which(nineplot$row %in% as.character(raw_mettable$Compound)), ]
nineplot2<-nineplot2[ which(nineplot2$column %in% as.character(raw_rnatable$Gene)), ]
nineplot3<-data.frame(row=nineplot2$column,column=nineplot2$row,cor=nineplot2$cor,p=nineplot2$p)
nineplot4<-rbind(nineplot1,nineplot3)
names(nineplot4)<-c("gene","Compound","cor","pvalue")
nineplot5<-data.frame(Compound=raw_mettable$Compound,Compoundlog2foldchange=raw_mettable$log2foldchange)
nineplot6<-data.frame(gene=raw_rnatable$Gene,genelog2foldchange=raw_rnatable$Log2FoldChange)
nineplot7<-join(nineplot4,nineplot5,type="inner")
nineplot8<-join(nineplot7,nineplot6,type="inner")
part1<-subset(nineplot8,nineplot8$genelog2foldchange<(-app81_text12)& nineplot8$Compoundlog2foldchange>app81_text13)
part2<-subset(nineplot8,((nineplot8$genelog2foldchange>(-app81_text12))&(nineplot8$genelog2foldchange<app81_text12))& nineplot8$Compoundlog2foldchange>app81_text13)
part3<-subset(nineplot8,nineplot8$genelog2foldchange>app81_text12& nineplot8$Compoundlog2foldchange>app81_text13)
part4<-subset(nineplot8,nineplot8$genelog2foldchange<(-app81_text12)&((nineplot8$Compoundlog2foldchange>(-app81_text13))&(nineplot8$Compoundlog2foldchange<app81_text13)) )
part5<-subset(nineplot8,((nineplot8$genelog2foldchange>(-app81_text12))&(nineplot8$genelog2foldchange<app81_text12))& ((nineplot8$Compoundlog2foldchange>(-app81_text13))&(nineplot8$Compoundlog2foldchange<app81_text13)))
part6<-subset(nineplot8,((nineplot8$genelog2foldchange>app81_text12))& ((nineplot8$Compoundlog2foldchange>(-app81_text13))&(nineplot8$Compoundlog2foldchange<app81_text13)))
part7<-subset(nineplot8,nineplot8$genelog2foldchange<(-app81_text12)& nineplot8$Compoundlog2foldchange<(-app81_text13))
part8<-subset(nineplot8,((nineplot8$genelog2foldchange>(-app81_text12))&(nineplot8$genelog2foldchange<app81_text12))& nineplot8$Compoundlog2foldchange<(-app81_text13))
part9<-subset(nineplot8,nineplot8$genelog2foldchange>app81_text12& nineplot8$Compoundlog2foldchange<(-app81_text13))
plot(x =nineplot8$genelog2foldchange,y = nineplot8$Compoundlog2foldchange, xlab=app81_text10,ylab=app81_text11,main="",pch=20, cex=app81_text16,col="black",type="n")
points(part1$genelog2foldchange, part1$Compoundlog2foldchange, pch=20, col=app81_text1,cex=app81_text16)
points(part2$genelog2foldchange, part2$Compoundlog2foldchange, pch=20, col=app81_text2,cex=app81_text16)
points(part3$genelog2foldchange, part3$Compoundlog2foldchange, pch=20, col=app81_text3,cex=app81_text16)
points(part4$genelog2foldchange, part4$Compoundlog2foldchange, pch=20, col=app81_text4,cex=app81_text16)
points(part5$genelog2foldchange, part5$Compoundlog2foldchange, pch=20, col=app81_text5,cex=app81_text16)
points(part6$genelog2foldchange, part6$Compoundlog2foldchange, pch=20, col=app81_text6,cex=app81_text16)
points(part7$genelog2foldchange, part7$Compoundlog2foldchange, pch=20, col=app81_text7,cex=app81_text16)
points(part8$genelog2foldchange, part8$Compoundlog2foldchange, pch=20, col=app81_text8,cex=app81_text16)
points(part9$genelog2foldchange, part9$Compoundlog2foldchange, pch=20, col=app81_text9,cex=app81_text16)
abline(h=app81_text13,lty=2,lwd=2,col="grey")
abline(v=-app81_text12,lty=2,lwd=2,col="grey")
abline(v=app81_text12,lty=2,lwd=2,col="grey")
abline(h=-app81_text13,lty=2,lwd=2,col="grey")
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
