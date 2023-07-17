library(fmsb)
library(RColorBrewer)
# app85_text1<-"#ACCD03"
# app85_text2<-"#E07EA0"
# app85_text3<-"#FFD101"
# app85_text4<-"#5EBED6"
# app85_text5<-"#776AAE"
# app85_text6<-0.5
# app85_text7<-"Rader Plot"
# app85_select1<-0
# app85_text8<-4
# app85_text9<-3
# app85_text10<-0.8
drawchart<-function(data,app85_text1,app85_text2,app85_text3,app85_text4,app85_text5,app85_text6,app85_text7,app85_select1,app85_text8,app85_text9,app85_text10){
col2alpha<-function (mycolor, app85_text6,...) {
mycolorframe<-as.data.frame(t(as.data.frame(col2rgb(mycolor))))
alphanew<-round(as.numeric(app85_text6)*2.55)
if((0<alphanew)&(alphanew<255)){
alphanew<-alphanew
}else{
alphanew<-255
}
red<-mycolorframe$red
green<-mycolorframe$green
blue<-mycolorframe$blue
mycoloralpha<-rgb(red,green,blue,alphanew, maxColorValue = 255)
return(mycoloralpha)
}

colorbase<-c(app85_text1,app85_text2,app85_text3,app85_text4,app85_text5)
colornumber<-(length(data[,1])-2)
if(colornumber<=5){
	mycolors<-head(colorbase,colornumber)
}else{
	mycolors <- colorRampPalette(colorbase)(colornumber) 
}
mycolor1<-col2alpha(colorRampPalette(mycolors)(nrow(data)-2),100)
mycolor2<-col2alpha(colorRampPalette(mycolors)(nrow(data)-2),50)
radarchart(data,axistype=app85_select1,seg=app85_text8,pty=16,pcol=mycolor1,plty=7,pfcol=mycolor2,plwd=app85_text9,cglcol="grey",cglty=1,axislabcol="black",cglwd=1.5,caxislabels=seq(min(data[2,]),max(data[1,]),10),vlcex=app85_text10,title=app85_text7)
legend(x=0.9,y=1.2,legend=rownames(data[3:nrow(data),]),bty = "n", pch=20 , col=mycolor1 , text.col=mycolor1, cex=1, pt.cex=1.5)

}