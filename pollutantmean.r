pollutantmean<-function(directory , pollutant , id=1:332){
        files<-character(length(id))
		
        for (i in 1:length(id)){
		files[i]<-paste(directory,"/",sprintf("%03d",id[i]),".csv",sep="")
			
                
                
        }
        total<-do.call(rbind,lapply(files,read.csv))
		vector_poll = total[pollutant]
		
		ret_value = colMeans(vector_poll,na.rm=TRUE)
		return (ret_value)
        
}