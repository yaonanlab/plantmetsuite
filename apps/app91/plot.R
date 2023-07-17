library(RColorBrewer)
library(ComplexHeatmap)
library(circlize)
library(maftools)

drawchart<-function(laml,app91_text1,app91_text2,app91_text3,app91_text4,app91_text5,app91_text6,app91_text7,app91_text8,app91_text9,app91_text10,app91_select1,app91_select2){
	#生成色彩系列
	colorbase<-c(app91_text1,app91_text2,app91_text3,app91_text4,app91_text5,app91_text6,app91_text7,app91_text8)
	colornumber<-length(unique(laml@data$Variant_Classification))+1
	if(colornumber<=8){
		vc_cols<-head(colorbase,colornumber)
	}else{
		vc_cols<-colorRampPalette(colorbase)(colornumber) 
	}
	names(vc_cols) <- levels(laml@data$Variant_Classification)
	#绘制图形
	if(app91_select2==0){
		oncoplot(maf=laml, top=app91_text10, colors = vc_cols, altered=app91_select1, showTumorSampleBarcodes=TRUE, SampleNamefontSize=app91_text9)
	}
	if(app91_select2==1){
		oncoplot(maf=laml, top=app91_text10, colors = vc_cols, altered=app91_select1, drawColBar = FALSE, showTumorSampleBarcodes=TRUE, SampleNamefontSize=app91_text9)
	}
	if(app91_select2==2){
		oncoplot(maf=laml, top=app91_text10, colors = vc_cols, altered=app91_select1, drawRowBar = FALSE, showTumorSampleBarcodes=TRUE, SampleNamefontSize=app91_text9)
	}
	
}