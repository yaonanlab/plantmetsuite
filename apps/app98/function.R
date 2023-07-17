library(tidymass)
library(massconverter)
library(mailR)
args <- commandArgs(T)
source("/srv/myapps/keyandaydayup/email.R",encoding = "UTF-8")
taskidnow<-as.character(args[1])
app98_select1<-as.character(args[2])
app98_select2<-as.character(args[3])
app98_email<-as.character(args[4])

# setwd(file.path("/srv/myapps/keyandaydayup/userdata",taskidnow))
parameter <-massconverter::create_msconvert_parameter(
    output_format = app98_select1,
    binary_encoding_precision = "32",
    zlib = TRUE,
    write_index = TRUE,
    peak_picking_algorithm = "cwt",
    vendor_mslevels = c(1, NA),
    cwt_mslevels = c(1, NA),
    cwt_min_snr = 0.1,
    cwt_min_peak_spacing = 0.1,
    subset_polarity =app98_select2,
    subset_scan_number = c(NA, NA),
    subset_scan_time = c(60, 300),
    subset_mslevels = c(1, 2),
    zero_samples_mode = "removeExtra",
    zero_samples_mslevels = c(1, NA),
    zero_samples_add_missing_flanking_zero_count = 5
  )

convert_raw_data(
  input_path = paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"rawdata",sep="/"),
  output_path =paste("/srv/myapps/keyandaydayup/userdata",taskidnow,"result",sep="/") ,
  msconvert_parameter = parameter,
  docker_parameters = c(),
  process_all = FALSE
)

finish<-"Job finished"
write.table(finish,file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result","Finish.txt"),row.names=F,col.names=F,quote=F)

if(app98_email!=""&("TRUE"%in%grepl("@",app98_email))){
setwd("/srv/myapps/keyandaydayup/")
tar(file.path("userdata",taskidnow,"result.zip"),files=file.path("userdata",taskidnow,"result"))
attach.file <- file.path("/srv/myapps/keyandaydayup/userdata",taskidnow,"result.zip")
sendmail(to=as.character(app98_email),attach=T,attach.file=attach.file)
}
