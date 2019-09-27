library(dplyr)

# read in FINAL file
runoff<-readr::read_csv('C:/Users/fdolan03/Box/gcam/query_results/runoff_FINAL.csv')


# make columns of all dimensions and use a numbering system to differentialte between them

runoff<-mutate(runoff,esm=ifelse(grepl('gfdl',runoff$scenario),1,ifelse(grepl('hadgem',runoff$scenario),2,ifelse(grepl('ipsl',runoff$scenario),3,ifelse(grepl('miroc',runoff$scenario),4,5)))))
runoff<-mutate(runoff,ssp=ifelse(grepl('ssp_socio',runoff$scenario),1,2))
runoff<-mutate(runoff,soc=ifelse(runoff$ssp==2,substr(runoff$scenario,12,12),substr(runoff$scenario,10,10)))
runoff<-mutate(runoff,ag=ifelse(runoff$ssp==2,substr(runoff$scenario,7,7),substr(runoff$scenario,14,14)))
runoff<-mutate(runoff,tax=ifelse(grepl('ffict',runoff$scenario),1,2))
runoff<-mutate(runoff,gw=ifelse(grepl('lo',runoff$scenario),1,ifelse(grepl('med',runoff$scenario),2,3)))
runoff<-mutate(runoff,res=ifelse(grepl('rs',runoff$scenario),1,2))

#make the basin names consistent with GCAM plotting tools
runoff$basin=substr(runoff$basin,1,nchar(runoff$basin)-18)