complete <- function(directory , id=1:332){
        
        # Vector to hold file names 
        
        files<-character(length(id)) 
        
        # create empty dataframe to hold observations 
        
        ObsFrame <- data.frame(ID=numeric(length(id)),nobs=numeric(length(id)))
        
        for (i in 1:length(id)){
                files[i]<-paste(directory,"/",sprintf("%03d",id[i]),".csv",sep="")
                
                
        }
        
        # apply read.csv function to each file name then apply rbind to all dataframes 
        
        total<-do.call(rbind,lapply(files,read.csv))
        
        complete_cases <-data.frame(ID=numeric(length(id)),nobs=numeric(length(id)))
        
        for (i in 1:length(id)){
                
                complete_cases$nobs[i] <- sum(complete.cases(subset(total,ID==id[i]))) 
                                                             
                complete_cases$ID[i]<-id[i]
        }

        return(complete_cases)
        
}
