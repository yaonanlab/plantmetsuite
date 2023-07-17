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
library("factoextra")
library("FactoMineR")
library("plyr")
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-args[1]
app6_select1<-args[2]
app6_email<-args[3]

filename1<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="1")
filename2<-list.files(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata"),pattern="2")

if(length(grep(".csv",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),head=T)
}
if(length(grep(".xls",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename1))>0){
data1<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename1))>0){
data1<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename1),sep="\t",head=T)
}
if(length(grep(".csv",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),head=T)
}
if(length(grep(".xls",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".xlsx",filename2))>0){
data2<-as.data.frame(read_excel(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sheet = 1),check.names=F)
}
if(length(grep(".txt",filename2))>0){
data2<-read.csv(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",filename2),sep="\t",head=T)
}
data3<-data.frame(sample=(names(data1)[-1]))
data4<-data.frame(sample=data2[,1],group=data2[,2])
data5<-join(data3,data4,type="left")
pdf(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.pdf"))
data=data1[,2:(ncol(data1))]
data_t <- t(data)
result.pca <- PCA(data_t, graph = FALSE)
if(app6_select1=="yes"|app6_select1==""){
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=TRUE, ellipse.level=0.95)+labs(title ="")
}else{
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=FALSE, ellipse.level=0.95)+labs(title ="")
}
dev.off()
png(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.png"))
if(app6_select1=="yes"|app6_select1==""){
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=TRUE, ellipse.level=0.95)+labs(title ="")
}else{
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=FALSE, ellipse.level=0.95)+labs(title ="")
}
dev.off()
svglite(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","result.svg"))
if(app6_select1=="yes"|app6_select1==""){
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=TRUE, ellipse.level=0.95)+labs(title ="")
}else{
fviz_pca_ind(result.pca, label="none", habillage=data5$group, addEllipses=FALSE, ellipse.level=0.95)+labs(title ="")
}
dev.off()
finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)
if(app6_email!=""&("TRUE"%in%grepl("@",app6_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app6_email),attach=T,attach.file=attach.file)
}
