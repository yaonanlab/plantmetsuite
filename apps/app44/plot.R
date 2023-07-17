drawchart<-function(data,app44_select1,app44_select2,app44_select3,app44_select4,app44_select5,app44_text1,app44_text2,app44_text3,app44_text4,app44_text5){	
library(RColorBrewer)
library(ggplot2)
library(Hmisc)
library(corrplot)
res<-rcorr(as.matrix(data))
res$P[is.na(res$P)]<-0
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
    )
}
app44_text5<-as.numeric(app44_text5)
mycol <- colorRampPalette(c(app44_text1,app44_text2 ,app44_text3),alpha = TRUE)(100)

if(app44_select4=="0"&app44_select5=="1"){
corrplot(res$r,col=mycol,title="",method=app44_select1,type=app44_select2, order=app44_select3,tl.cex=app44_text5,pch.cex=1, p.mat = res$P,sig.level = c(.001, .01, .05),outline="white",insig = "label_sig",tl.col = "black")

}

if(app44_select4=="0"&app44_select5=="0"){
corrplot(res$r,col=mycol,title="",method=app44_select1,type=app44_select2, order=app44_select3,tl.cex=app44_text5,pch.cex=1,tl.col = "black")

}

if(app44_select4=="1"&app44_select5=="1"){
corrplot(res$r,col=mycol,title="",method=app44_select1,type=app44_select2, order=app44_select3,tl.cex=app44_text5,pch.cex=1, p.mat = res$P,sig.level = c(.001, .01, .05),outline="white",insig = "label_sig",addCoef.col = "white",tl.col = "black")

}

if(app44_select4=="1"&app44_select5=="0"){
corrplot(res$r,col=mycol,title="",method=app44_select1,type=app44_select2, order=app44_select3,tl.cex=app44_text5,addCoef.col = "white",tl.col = "black")

}

}


