library(masstools)

# app92_select1=0 #绘图类型。0为单张图，1为两张图比较
# app92_text1=80 #Ms2质谱图的质荷比范围（下限）
# app92_text2=120 #Ms2质谱图的质荷比范围（上限）
# app92_text3=30 #Ms2片段匹配的ppm
# app92_text4=400 #质荷比误差计算的阈值
# app92_text5="#776AAE" #填充色
# app92_text6="#5EBED6"
# app92_text7="Mass to charge ratio (m/z)" #x轴标签
# app92_text8="Relative intensity" #y轴标签
# taskidnow<-"NQGAfqCs"
drawchart<-function(spectrum1,spectrum2,app92_select1,app92_text1,app92_text2,app92_text3,app92_text4,app92_text5,app92_text6,app92_text7,app92_text8){

	if(app92_select1==0){ #单张图
		p<-ms2_plot(spectrum1, range.mz=c(app92_text1,app92_text2), ppm.tol=app92_text3,mz.ppm.thr=app92_text4, xlab=app92_text7, ylab=app92_text8, col1=app92_text5, interactive_plot = FALSE)
	}
	 
	if(app92_select1==1){ #两张图对比
		p<-ms2_plot(spectrum1, spectrum2, range.mz=c(app92_text1,app92_text2), ppm.tol=app92_text3, mz.ppm.thr=app92_text4, xlab=app92_text7, ylab=,app92_text8, col1=app92_text5, col2=app92_text6, interactive_plot = FALSE)
	}
	plot(p)
}