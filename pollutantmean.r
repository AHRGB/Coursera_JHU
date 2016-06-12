pollutantmean<-function(directory , pollutant , id=1:332){
        
        # Vetor to hold file names 
        
        files<-character(length(id)) 
		
        for (i in 1:length(id)){
		files[i]<-paste(directory,"/",sprintf("%03d",id[i]),".csv",sep="")
			
                
                
        }
        # apply read.csv function to each file name then apply rbind to all dataframes 
        
        total<-do.call(rbind,lapply(files,read.csv))
        
        # vector to hold pollutant in questions 
        
	vector_poll = total[pollutant]
	
	# use colMeans function to get Mean for the column 
	
	ret_value = colMeans(vector_poll,na.rm=TRUE)
	
	return (ret_value)
        
}