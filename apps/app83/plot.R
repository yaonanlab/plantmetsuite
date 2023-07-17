#library(ggtern)
library(ggplot2)
library(RColorBrewer)
#library(edgeR)
# app83_text1="#776AAE"
# app83_text2="#5EBED6"
# app83_text3="#ACCD03"
# app83_text4="#FFD101"
# app83_text5="#D43338"
# app83_text6=0.7
# app83_text7="x"
# app83_text8="y"
# app83_text9="z"
# app83_select1=0
# app83_text10=6
# app83_select2="relative"
# app83_text11=0.001
# app83_text12=10
# app83_text13=0.05

drawchart<-function(data1,design,app83_text1,app83_text2,app83_text3,app83_text4,app83_text5,app83_text6,app83_text7,app83_text8,app83_text9,app83_select1,app83_text10,app83_select2,app83_text11,app83_text12,app83_text13,taskidnow){
#definition of function
data_clean <- function(otu, design, type=app83_select2, threshold=app83_text11, times=100){
	if (type == "absolute"){
		otu_relative <- apply(otu, 2, function(x){x/sum(x)})
	}else {otu_relative <- otu}
		idx <- rowSums(otu_relative > threshold) >= 1
		otu_threshold <- as.data.frame(otu_relative[idx, ])
		otu_threshold$OTUs <- row.names(otu_threshold)
		otu_longer <- tidyr::pivot_longer(data=otu_threshold,
                             cols=-OTUs,
                             names_to="SampleID",
                             values_to="value")
	merge_data <- merge(otu_longer, design, by="SampleID")
	otu <- subset(merge_data, select=c("Group","OTUs","value"))
	otu_mean <- otu %>% dplyr::group_by(OTUs, Group) %>%
	dplyr::summarise(value=mean(value))
	otu_tern <- otu_mean %>%
    dplyr::group_by(Group, OTUs) %>%
    dplyr::mutate(index=dplyr::row_number()) %>%
    tidyr::pivot_wider(names_from=Group,values_from=value) %>%
    dplyr::select(-index)
         
  otu_tern$size <- (apply(otu_tern[2:4], 1, mean))*times
  return(otu_tern)
}

top_OTUs <- function(data, rank=app83_text12){
  data_order <- data[order(data$size, decreasing=T), ]
  top <- data_order[1:rank, ]
  otu_el <- data_order[-(1:rank), ]
  return(list(top, otu_el))
}

enrich_data <- function(otu, design, p.value=app83_text13, adjust.method="fdr"){
  dge_list <- edgeR::DGEList(counts=otu, group=design$Group)
  keep <- rowSums(dge_list$counts) >= 0
  dge_keep <- dge_list[keep, ,keep.lib.sizes=F]
  dge <- edgeR::calcNormFactors(dge_keep)
  design.mat <- stats::model.matrix(~ 0 + dge$samples$group)
  d2 <- edgeR::estimateGLMCommonDisp(dge, design.mat)
  d2 <- edgeR::estimateGLMTagwiseDisp(d2, design.mat)
  fit <- edgeR::glmFit(d2, design.mat)

  group_index <- as.character(design$Group[!duplicated(design$Group)])
  lrt_1_2 <- edgeR::glmLRT(fit, contrast=c(1, -1, 0))
  lrt_1_3 <- edgeR::glmLRT(fit, contrast=c(1, 0, -1))
 
  de_1_2 <- edgeR::decideTestsDGE(lrt_1_2, adjust.method=adjust.method,
                 p.value=p.value)
  de_1_3 <- edgeR::decideTestsDGE(lrt_1_3, adjust.method=adjust.method,
                           p.value=p.value)
 
  rich_1 <- rownames(otu)[de_1_2 == 1 & de_1_3 == 1]
  enrich_1 <- data.frame(OTUs=rich_1,
                               enrich=rep(group_index[1], length(rich_1)))
  lrt_2_3 <- edgeR::glmLRT(fit, contrast=c(0, 1, -1))
  lrt_2_1 <- edgeR::glmLRT(fit, contrast=c(-1, 1, 0))
 
  de_2_3 <- edgeR::decideTestsDGE(lrt_2_3, adjust.method=adjust.method,
                           p.value=p.value)
  de_2_1 <- edgeR::decideTestsDGE(lrt_2_1, adjust.method=adjust.method,
                           p.value=p.value)
 
  rich_2 <- rownames(otu)[de_2_3 == 1 & de_2_1 == 1]
  enrich_2 <- data.frame(OTUs=rich_2,
                         enrich=rep(group_index[2], length(rich_2)))
  lrt_3_1 <- edgeR::glmLRT(fit, contrast=c(-1, 0, 1))
  lrt_3_2 <- edgeR::glmLRT(fit, contrast=c(0, -1, 1))
 
  de_3_1 <- edgeR::decideTestsDGE(lrt_3_1, adjust.method=adjust.method,
                           p.value=p.value)
  de_3_2 <- edgeR::decideTestsDGE(lrt_3_2, adjust.method=adjust.method,
                           p.value=p.value)
 
  rich_3 <- rownames(otu)[de_3_1 == 1 & de_3_2 == 1]
  enrich_3 <- data.frame(OTUs=rich_3,
                         enrich=rep(group_index[3], length(rich_3)))
  enrich_index <- rbind(enrich_1, enrich_2, enrich_3)
  return(enrich_index)
}

# design <- read.csv("group.txt", header = T,sep="\t")
class <- data1[,1:2]
names(class)[1]<-"OTUs"
row.names(data1)=data1[,1]
otupre<-data1[,-1]
otu<-otupre[,-1]
otu_tern <- data_clean(otu, design, type=app83_select2, threshold=app83_text11, times=100)
colorbase<-c(app83_text1,app83_text2,app83_text3,app83_text4,app83_text5)
col<- colorRampPalette(colorbase)(app83_text12)

#对前十丰度的上色
if(app83_select1== 0){
	plot_data <- top_OTUs(otu_tern, rank = app83_text12)
	mycolor <- colorRampPalette(colorbase)(app83_text12)
p<- ggtern::ggtern(data = otu_tern, aes(x = get(as.character(unique(design[,2])[1])), y = get(as.character(unique(design[,2])[2])), z = get(as.character(unique(design[,2])[3])))) +
		ggtern::geom_mask() + 
		geom_point(data = plot_data[[2]], aes(size = size), color = "grey",alpha =app83_text6, show.legend = FALSE) +
		geom_point(data = plot_data[[1]], aes(size = size, color = OTUs), show.legend = TRUE) +
		scale_colour_manual(values = mycolor) +
		labs(x =app83_text7,y =app83_text8,z =app83_text9)+
		#scale_size(range = c(0, app83_text10)) 
		guides(size = "none") +
		theme_bw() +
		theme(axis.text = element_blank(), axis.ticks = element_blank())
	plot(p)
}

#对富集程度上色
if(app83_select1== 1){
	enrich_index <- enrich_data(otu, design, p.value =app83_text13)
	plot_data <- merge(otu_tern, enrich_index, by = "OTUs", all.x = TRUE)
	mycolor <- colorRampPalette(colorbase)(3)
	plot_data1<-plot_data[is.na(plot_data$enrich),]
	plot_data2<-plot_data[!is.na(plot_data$enrich),]
	p<- ggtern::ggtern(data=plot_data1,aes(x=get(as.character(unique(design[,2])[1])),y=get(as.character(unique(design[,2])[2])),z=get(as.character(unique(design[,2])[3]))))+
		ggtern::geom_mask() + 
		geom_point(aes(size = size), color = "grey",alpha =app83_text6)+
		geom_point(data = plot_data2,aes(size = size, color = enrich),alpha = app83_text6) +
		scale_colour_manual(values = mycolor)+ 
		#scale_size(range = c(0, app83_text10)) +
		labs(x =app83_text7,y =app83_text8,z =app83_text9)+
		guides(size = "none") +
		theme_bw() +
		theme(axis.text = element_blank(), axis.ticks = element_blank())
	plot(p)
}

#对分类上色
if(app83_select1== 2){
	library(RColorBrewer)
	mycolor <- colorRampPalette(colorbase)(length(unique(class$Class)))
	otu_tern_class<-plyr::join(as.data.frame(otu_tern),class,type="left")
	p<- ggtern::ggtern(data=otu_tern_class,aes(x=get(as.character(unique(design[,2])[1])),y=get(as.character(unique(design[,2])[2])),z=get(as.character(unique(design[,2])[3]))))+
		ggtern::geom_mask() + 
		geom_point(aes(size = size,color=Class),alpha =app83_text6, show.legend = TRUE) +
		scale_colour_manual(values = mycolor) +
		#scale_size(range = c(0, app83_text10)) +
		labs(x =app83_text7,y =app83_text8,z =app83_text9)+
		guides(size = "none") +
		theme_bw() +
		theme(axis.text = element_blank(), axis.ticks = element_blank())
	plot(p)
}
if(app83_select1== 3){
	p<- ggtern::ggtern(data=otu_tern,aes(x=get(as.character(unique(design[,2])[1])),y=get(as.character(unique(design[,2])[2])),z=get(as.character(unique(design[,2])[3]))))+
		ggtern::geom_mask() + 
		geom_point(aes(size = size), alpha =app83_text6, show.legend = TRUE) +
		#scale_size(range = c(0, app83_text10)) +
		labs(x =app83_text7,y =app83_text8,z =app83_text9)+
		guides(colour = "none") +
		theme_bw() +
		theme(axis.text = element_blank(), axis.ticks = element_blank())
	plot(p)
}
}
