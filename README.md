The headers in this readme will refer to function names in run_analysis.R script files.

##loadAndMergeData

This function loads the relevent data sets, and then uses rbind to glue them together.

##getFeatures

This function gets the features file, and assigns it as names to the experiment data set. 

##cleanData

This function removed unneeded columns from the experiment data set, and then glues everything together with cbind before writing the tidy data set.

##runAll

This function runs all of the other functions in the proper order to complete the task. 
