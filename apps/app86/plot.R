library(RColorBrewer)
	# app86_text1<-"#ACCD03"
	# app86_text2<-"#ACCD03"
	# app86_text3<-"#ACCD03"
	# app86_text4<-"#ACCD03"
	# app86_text5<-"#ACCD03"
	# app86_text6<-60
	# app86_text7<-"Plot"
	# app86_text8<-2
	# app86_select1<-TRUE
	# app86_select2<-"0"
	# app86_select3<-"0"
	# app86_select4<-"p"
	# app86_select5<-"0"
drawchart<-function(data,app86_text1,app86_text2,app86_text3,app86_text4,app86_text5,app86_text6,app86_text7,app86_text8,app86_select1,app86_select2,app86_select3,app86_select4,app86_select5){
	app86_text1<-as.character(app86_text1)
	app86_text2<-as.character(app86_text2)
	app86_text3<-as.character(app86_text3)
	app86_text4<-as.character(app86_text4)
	app86_text5<-as.character(app86_text5)
	app86_text6<-as.numeric(app86_text6)
	app86_text7<-as.character(app86_text7)
	app86_text8<-as.numeric(app86_text8)
	app86_select1<-as.logical(app86_select1)
	app86_select2<-as.character(app86_select2)
	app86_select3<-as.character(app86_select3)
	app86_select4<-as.character(app86_select4)
	app86_select5<-as.character(app86_select5)
	#表格信息准备
	mygroup<-unique(data[,4])
	groupnumber<-(length(mygroup))
	#形状
	shapebase<-c(16,17,18,15,1,2,3,4,5,6,19,11,13,7,8,9,10,12,14,15)
	if(app86_select2=="0"){
		myshape<-head(shapebase,groupnumber)
	}else{
		myshape<-rep(head(shapebase,1),groupnumber)
	}
	#颜色
	colorbase<-c(app86_text1,app86_text2,app86_text3,app86_text4,app86_text5)
	if(app86_select3=="0"){
		if(groupnumber<=5){
			mycolors<-head(colorbase,groupnumber)
		}else{
			mycolors<-colorRampPalette(colorbase)(groupnumber) 
		}
	}else{
		mycolors<-rep(head(colorbase,1),groupnumber)
	}

	mygroup2<-data.frame(group=mygroup,myid=1:length(mygroup))
	#生成颜色与ID对应的关系dataframe（生成颜色系列，根据unique group）
	mycolor2<-data.frame(color=mycolors,myid=1:length(mycolors))
	#生成点的形状与ID对应的关系dataframe（定义常用点的优先顺序）
	myshape2<-data.frame(shape=myshape,myid=1:length(myshape))
	#在表格后加入新列
	data2<-plyr::join(data,mygroup2)
	data3<-plyr::join(data2,mycolor2)
	data4<-plyr::join(data3,myshape2)
	data<-as.data.frame(data4)
	#图形绘制
	#是否添加回归平面
	if(app86_select5=="0"){
		s3d<-scatterplot3d::scatterplot3d(data[,1:3], color=data$color, pch=data$shape, angle=app86_text6, cex.symbols =app86_text8, main=app86_text7, grid = TRUE, box=app86_select1, type=app86_select4)
		my.lm<-lm(data[,3] ~ data[,1] + data[,2])
		s3d$plane3d(my.lm)
		legend("bottom", legend = unique(data[,4]),
        col =mycolors, pch =myshape, 
		inset = -0.15, xpd = TRUE, horiz = TRUE,bty ="n" ,bg = "transparent" )	 
	}else{
		scatterplot3d::scatterplot3d(data[,1:3], color=data$color, pch=data$shape, angle=app86_text6, cex.symbols =app86_text8, main=app86_text7, grid = TRUE, box=app86_select1, type=app86_select4)
		legend("bottom", legend = unique(data[,4]),
        col =mycolors, pch =myshape, 
		inset = -0.15, xpd = TRUE, horiz = TRUE,bty ="n" ,bg = "transparent")	 
	}
}
