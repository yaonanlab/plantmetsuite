library(masstools)

# app106_select1=0 #绘图类型。0为单张图，1为两张图比较
# app106_text1=80 #Ms2质谱图的质荷比范围（下限）
# app106_text2=120 #Ms2质谱图的质荷比范围（上限）
# app106_text3=30 #Ms2片段匹配的ppm
# app106_text4=400 #质荷比误差计算的阈值
# app106_text5="#776AAE" #填充色
# app106_text6="#5EBED6"
# app106_text7="Mass to charge ratio (m/z)" #x轴标签
# app106_text8="Relative intensity" #y轴标签
# taskidnow<-"NQGAfqCs"
drawchart<-function(spectrum1,spectrum2,app106_select1,app106_text1,app106_text2,app106_text3,app106_text4,app106_text5,app106_text6,app106_text7,app106_text8){

	if(app106_select1==0){ #单张图
		p<-ms2_plot(spectrum1, range.mz=c(app106_text1,app106_text2), ppm.tol=app106_text3,mz.ppm.thr=app106_text4, xlab=app106_text7, ylab=app106_text8, col1=app106_text5, interactive_plot = FALSE)
	}
	 
	if(app106_select1==1){ #两张图对比
		p<-ms2_plot(spectrum1, spectrum2, range.mz=c(app106_text1,app106_text2), ppm.tol=app106_text3, mz.ppm.thr=app106_text4, xlab=app106_text7, ylab=,app106_text8, col1=app106_text5, col2=app106_text6, interactive_plot = FALSE)
	}
	plot(p)
}