appServer<-function(input,output,session){
job.path <- reactiveValues(data = NULL)
    if(!is.null(input$app71_inputFile1)){
	load("userdata/jobid")
	load("userdata/taskid")
	jobid <- jobid + 1
	taskidnow<-taskid$id[jobid]
    dir.create(file.path("userdata",taskidnow))
    dir.create(file.path("userdata",taskidnow,"rawdata"))	
    dir.create(file.path("userdata",taskidnow,"result"))	
	dir.create(file.path("userdata",taskidnow,"cmd"))
	job.path.raw<-job.path$data<-file.path("userdata",taskidnow)
	job.path$data<-attach.file <- file.path("userdata",taskidnow,"result.zip")
	output$taskjobid<-renderText({paste("Your taskID is:", taskidnow)})
	output$taskjobidinfo<-renderText({paste("Please note down the task number and you can download the analysis results using the task number on the result download page on the left after the analysis is completed.","The analysis results will be retained for 24 hour, after which they will be automatically deleted, so please download them in time.！")})
	save(jobid,file="userdata/jobid")
	temp.file1 <- input$app71_inputFile1$datapath
	file.copy(temp.file1,file.path("userdata",taskidnow,"rawdata"))
	filename<-list.files(file.path("userdata",taskidnow,"rawdata"),pattern="0")
	filename1new<-gsub("0","1",filename)
	file.rename(file.path("userdata",taskidnow,"rawdata",filename), file.path("userdata",taskidnow,"rawdata",filename1new))

	if(!is.null(input$app71_select1)&(input$app71_select1)!=""){
	app71_select1 <- as.character(input$app71_select1)
	}else{
	app71_select1 <-"org.At.tair.db"}
	
	 if(!is.null(input$app71_select2)&(input$app71_select2)!=""){
	 app71_select2 <- as.character(input$app71_select2)
	 }else{
	 app71_select2 <-"TAIR"}
	
	 if(!is.null(input$app71_select3)&(input$app71_select3)!=""){
	 app71_select3 <- as.character(input$app71_select3)
	 }else{
	 app71_select3 <-"GO"}
	
    if(!is.null(input$app71_email)&(input$app71_email)!=""){
	app71_email <- as.character(input$app71_email)
	}else{
	app71_email <-"no"
	}
	
	ip <- "no"
	if(!is.null(ip)&ip!=""&!is.na(ip)){
	ipresult<-data.frame(myip=ip,myapp="app71",mytaskid=taskidnow,myemail=app71_email)
	write.table(ipresult, "userdata/userip.xls",append=T,row.names=F,col.names=F,sep="\t",quote=F)
	}
mycmdfirst<-paste(taskidnow,app71_email,app71_select1,app71_select2,app71_select3,sep="' '")
mycmdsecond<-paste("nohup ","/srv/R/bin/Rscript /srv/myapps/keyandaydayup/apps/app71/function.R ","'",mycmdfirst,"'"," 1>/dev/null 2>/dev/null &",sep="")
system(mycmdsecond)
write.table(mycmdsecond,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"cmd/mycmd"),sep="",row.names=F,col.names=F,quote=F)
    }
#definition of updatable SelectInput
#keytypes(org.At.tair.db)
keytypes1<-c("TAIR","ARACYC","ARACYCENZYME","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL")
#keytypes(org.Bt.eg.db)
keytypes2<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Ce.eg.db)
keytypes3<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIGENE","UNIPROT","WORMBASE")
#keytypes(org.Cf.eg.db)
keytypes4<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Dm.eg.db)
keytypes5<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","FLYBASE","FLYBASECG","FLYBASEPROT","GENENAME","GO","GOALL","MAP","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes("org.Dr.eg.db")
keytypes6<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UNIGENE","UNIPROT","ZFIN")
#keytypes(org.EcK12.eg.db)
keytypes7<-c("ACCNUM","ALIAS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL")
#keytypes(org.EcSakai.eg.db)
keytypes8<-c("ACCNUM","ALIAS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL")
#keytypes(org.Gg.eg.db)
keytypes9<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Hs.eg.db)
keytypes10<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","MAP","OMIM","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UCSCKG","UNIGENE","UNIPROT")
#keytypes(org.Mm.eg.db)
keytypes11<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","MGI","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Mmu.eg.db)
keytypes12<-c("ACCNUM","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIPROT")
#keytypes(org.Pt.eg.db)
keytypes13<-c("ACCNUM","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIPROT")
#keytypes(org.Rn.eg.db)
keytypes14<-c("ACCNUM","ALIAS","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","IPI","ONTOLOGY","ONTOLOGYALL","PATH","PFAM","PMID","PROSITE","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Sc.sgd.db)
keytypes15<-c("ALIAS","COMMON","DESCRIPTION","ENSEMBL","ENSEMBLPROT","ENSEMBLTRANS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","INTERPRO","ONTOLOGY","ONTOLOGYALL","ORF","PATH","PFAM","PMID","REFSEQ","SGD","SMART","UNIPROT")
#keytypes(org.Ss.eg.db)
keytypes16<-c("ACCNUM","ALIAS","ENTREZID","ENZYME","EVIDENCE","EVIDENCEALL","GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIGENE","UNIPROT")
#keytypes(org.Xl.eg.db)
keytypes17<-c("GENENAME","GO","GOALL","ONTOLOGY","ONTOLOGYALL","PATH","PMID","REFSEQ","SYMBOL","UNIGENE","UNIPROT")


observe({
    x <- input$app71_select1

    # Can use character(0) to remove all choices
    if (is.null(x)){
      x <- character(0)}
      y<-switch(x,"org.At.tair.db"=keytypes1,"org.Bt.eg.db"=keytypes2,"org.Ce.eg.db"=keytypes3,"org.Cf.eg.db"=keytypes4,"org.Dm.eg.db"=keytypes5,"org.Dr.eg.db"=keytypes6,"org.EcK12.eg.db"=keytypes7,"org.EcSakai.eg.db"=keytypes8,"org.Gg.eg.db"=keytypes9,"org.Hs.eg.db"=keytypes10,"org.Mm.eg.db"=keytypes11,"org.Mmu.eg.db"=keytypes12,"org.Pt.eg.db"=keytypes13,"org.Rn.eg.db"=keytypes14,"org.Sc.sgd.db"=keytypes15,"org.Ss.eg.db"=keytypes16,"org.Xl.eg.db"=keytypes17)	

    # Can also set the label and select items
    updateSelectInput(session, "app71_select2",
      label = "",
      choices = y,
      selected = ""
    )
    updateSelectInput(session, "app71_select3",
      label = "",
      choices = y,
      selected = ""
    )	
  }) 
 
 
 
}

