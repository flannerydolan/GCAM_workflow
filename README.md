# GCAM_workflow
Code used to run and process 3000 GCAM scenarios


1. Make sure GCAM runs without errors using a specific broyden config file.
2. Make the file structure necessary for the config files. An example path is config_files/ssp_soc/ssp_socio1/ag1/ 
Alternatively, config_files/ssp_ag/ssp_ag1/soc1/and do this for all ssps 1-5. You should have 50 folders by the end.
3. Use WriteConfigFiles.ipynb (after changing paths of xml files) to write configuration files. 
4. Use job arrays per folder (see gcam-array_ag5soc5.sh for example) to run the 60 scenarios in each folder. NOTE: yes, this means you run 50 job arrays which may seem inefficient, but that makes it easier to see where errors occur and to fix said errors.
5. After all runs have completed successfully, move the runs from the hierarchical file structure into a single FINAL folder (this can be done quickly with a recursive mv)
6. Make a query xml file with a name matching its name in the MakeQueries xml.
7. Use water_withdrawals_basin.R to query the FINAL folder of all databases and append all queries to make a csv. Change the name in the script to match the query needed.
8. Submit the job using the water_withdrawals_basin.sh script.
9. To change the scenario names in the outputted csv to columns that reflect the dimensions, use postprocess_querieddata.R

10. To run all the unlimited scenarios, use the same methodology except without the groundwater, reservoir storage, and ESM forcing dimensions. I did this in a single job array (unlimited_water_array.sh) after making the config files.
11. Query the data using water_withdrawals_basin_unlimited.R and submit the job with water_withdrawals_basin_unlimited.sh. 
12. The post processing will be the same except for the missing dimensions. 

13. To run CART on the data, use the cart.R script
