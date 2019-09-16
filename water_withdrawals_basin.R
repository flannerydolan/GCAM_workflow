library(rgcam)
library(dplyr)
queryName<-'water_withdrawals_basin'


dbs_unfiltered<-list.dirs("/cluster/tufts/lamontagnelab/fdolan03/GCAM/gcam-core/output/FINAL/")
dbs<-dbs_unfiltered[grepl("NDC",dbs_unfiltered)] %>% substr(.,71,nchar(.))

make_query<-function(scenario){
  dbLoc<-paste0('/cluster/tufts/lamontagnelab/fdolan03/GCAM/gcam-core/output/FINAL/db_',scenario)
  queryFile<-paste0('/cluster/tufts/lamontagnelab/fdolan03/GCAM/queries/',queryName,'.xml')
  queryData=paste0('/cluster/tufts/lamontagnelab/fdolan03/GCAM/temp_data_files/',queryName,'.dat')
  queryResult<-rgcam::addScenario(dbLoc,queryData,queryFile=queryFile)
  file.remove(queryData)
  queryResult[[1]][[1]]
}

bind_rows(lapply(dbs,make_query)) %>%
  readr::write_csv(paste0('/cluster/tufts/lamontagnelab/fdolan03/GCAM/query_results/',queryName,"_FINAL_noregions.csv"))
