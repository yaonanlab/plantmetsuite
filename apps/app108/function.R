library(data.table)
library(DT)
library(ggridges)
library(rintrojs)
library(shiny)
library(shinyBS)
library(shinycssloaders)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(readr)
library(svglite)
library(R.utils)
library(readxl)
library(colourpicker)
library(mailR)
library(VennDiagram)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app108_text1<-args[2]
app108_text2<-args[3]
app108_text3<-args[4]
app108_text4<-args[5]
app108_text5<-args[6]
app108_text6<-args[7]
app108_text7<-args[8]
app108_email<-args[9]
app108_text1<-as.character(app108_text1)
app108_text2<-as.character(app108_text2)
app108_text3<-as.character(app108_text3)
app108_text4<-as.character(app108_text4)
app108_text5<-as.character(app108_text5)
app108_text6<-as.numeric(as.character((app108_text6)))
app108_text7<-as.numeric(as.character((app108_text7)))
app108_email <- as.character(app108_email)
filename<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"))
if(length(grep(".csv",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),head=T)
}
if(length(grep(".xls",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename))>0){
data<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename))>0){
data<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename),sep="\t",head=T)
}
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,rotation.degree=90,fill = c(app108_text1, app108_text2),alpha = c(0.5, 0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4, app108_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,rotation.degree=90,fill = c(app108_text1, app108_text2),alpha = c(0.5, 0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4, app108_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
if(ncol(data)==2){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
v <- venn.diagram(list(A=a, B=b),cat.pos = 0,rotation.degree=90,fill = c(app108_text1, app108_text2),alpha = c(0.5, 0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data),scale=F)
grid.newpage()
grid.draw(v)
}

if(ncol(data)==3){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
v <- venn.diagram(list(A=a, B=b,C=c),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3),alpha = c(0.5, 0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==4){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4),alpha = c(0.5, 0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}

if(ncol(data)==5){
a <- data[,1][!is.na(data[,1])]
b <- data[,2][!is.na(data[,2])]
c <- data[,3][!is.na(data[,3])]
d <- data[,4][!is.na(data[,4])]
e <- data[,5][!is.na(data[,5])]
v <- venn.diagram(list(A=a, B=b,C=c,D=d,E=e),cat.pos = 0,fill = c(app108_text1, app108_text2, app108_text3, app108_text4, app108_text5),alpha = c(0.5,0.5,0.5,0.5,0.5), cat.cex = app108_text6, cex=app108_text7,filename=NULL,category.names=names(data))
grid.newpage()
grid.draw(v)
}
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(length(list.files("/srv/myapps/keyandaydayup/",pattern="VennDiagram"))>0){
	system("rm /srv/myapps/keyandaydayup/VennDiagram* -f")	
}
if(app108_email!=""&("TRUE"%in%grepl("@",app108_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app108_email),attach=T,attach.file=attach.file)
}
