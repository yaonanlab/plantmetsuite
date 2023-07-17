library(ggplot2)
#library(ropls)
library(ggforce) # Accelerating 'ggplot2'
library(ggprism)
library(ggsci)
library(tidyverse)
#default
# app103_text1<-1 #VIP阈值

# data<-read.csv(file.path("C:/Users/verygenome/Desktop/Linux/collection/app115/scripts/data.txt"),sep="\t",head=T)
# group<-read.csv(file.path("C:/Users/verygenome/Desktop/Linux/collection/app115/scripts/group.txt"),sep="\t",head=T)

drawchart<-function(data,group,app103_text1,taskidnow){

data<-as.data.frame(data)
group<-as.data.frame(group)
row.names(data)<-data[,1]
X<-data[,-1]
Y<-group[,2]

sacurine.plsda<- ropls::opls(X, Y, orthoI = NA, predI=1, fig.pdfC=file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/oplsda.pdf",sep="")),info.txtC=file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/oplsda_result.txt",sep="")))

# sacurine.plsda <- ropls::opls(X, Y, orthoI = NA, predI=1, fig.pdfC=file.path("C:/Users/verygenome/Desktop/Linux/collection/app103/scripts/test.pdf"), info.txtC=file.path("C:/Users/verygenome/Desktop/Linux/collection/app103/scripts/test.txt"))

vipVn <- sacurine.plsda@vipVn  # getVipVn()
vipVn_select <- vipVn[vipVn > app103_text1]
#vipVn_select <- vipVn_select[order(vipVn_select$VIP, decreasing = TRUE), ]
write.table(vipVn_select,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/vip_select.xls",sep="")),sep="\t",row.names=T,quote=F)
write.table(vipVn,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/vip_all.xls",sep="")),sep="\t",row.names=T,quote=F)

data_VIP_select <- as.data.frame(cbind(vipVn_select,names(vipVn_select)))
names(data_VIP_select)<- c("VIP","meta")
data_VIP_select <- data_VIP_select[order(data_VIP_select$VIP, decreasing = TRUE), ]
data_VIP_select <- as.data.frame(data_VIP_select)
data_VIP_select[,1]<-as.character(data_VIP_select[,1])
data_VIP_select[,1]<-as.numeric(data_VIP_select[,1])
Lollipop <- ggplot(data_VIP_select) +
  geom_segment(aes(x=meta, xend=meta, y=0, yend=VIP), color="grey",linewidth=1.5,alpha=0.8) +
  geom_point( aes(x=meta, y=VIP), size=4,color='red',alpha=0.8) +
  theme_prism(palette = "pearl",
              base_fontface = "plain",
              base_family = "serif",
              base_line_size = 0.8,
              axis_text_angle = 45) +
  theme(legend.position = "none") +
  xlab(NULL) +
  ylab(NULL) +
  # scale_y_continuous(expand = c(0,0),limits = c(0,3)) +
  ggtitle("Lollipop Chart")
pdf(file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/Lollipop_Chart.pdf",sep="")),width=10,height=8)
plot(Lollipop)
dev.off()


sample.score = sacurine.plsda@scoreMN %>%  #得分矩阵
  as.data.frame() %>%
  mutate(gender = Y, o1 = sacurine.plsda@orthoScoreMN[,1])
x_lab <- round(sacurine.plsda@modelDF[1, "R2X"] * 100)
y_lab <- round(sacurine.plsda@modelDF[2, "R2X"] * 100)
score_orthoScoreMN_plot <- ggplot(sample.score, aes(p1, o1, color = gender)) +
  geom_hline(yintercept = 0, linetype = 'dashed', linewidth = 0.5) + 
  geom_vline(xintercept = 0, linetype = 'dashed', linewidth = 0.5) +
  geom_point() +
  #geom_point(aes(-10,-10), color = 'white') +
  labs(x=paste0("P1 (",x_lab,"%)"),
       y=paste0("O1 (",y_lab,"%)"))+
  stat_ellipse(level = 0.95, linetype = 'solid', 
               linewidth = 1, show.legend = FALSE) + 
  # scale_color_manual(values = c('#008000','#FFA74F')) +
  theme_bw() +
  theme(legend.position = c(0.1,0.85),
        legend.title = element_blank(),
        legend.text = element_text(color = 'black',size = 12, face = 'plain'),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.text = element_text(color = 'black',size = 15,  face = 'plain'),
        axis.title = element_text(color = 'black',size = 15,  face = 'plain'),
        axis.ticks = element_line(color = 'black'))
orthoScoreMN<-sacurine.plsda@orthoScoreMN
write.table(orthoScoreMN,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/orthoScoreMN.xls",sep="")),sep="\t",row.names=T,quote=F)
write.table(sample.score,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/sample_score.xls",sep="")),sep="\t",row.names=T,quote=F)
pdf(file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/score_orthoScoreMN_plot.pdf",sep="")),width=10,height=6)
plot(score_orthoScoreMN_plot)
dev.off()

orthoLoadingMN <- sacurine.plsda@orthoLoadingMN
write.table(orthoLoadingMN,file.path(paste("/srv/myapps/keyandaydayup/userdata/",taskidnow,"/result/orthoLoadingMN.xls",sep="")),sep="\t",row.names=T,quote=F)


}
