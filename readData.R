readData<- function(){        
        require(R.cache)
        cacheKey = list("ELECTRICITY")
        dataCsv<-loadCache(key=cacheKey,removeOldCache=true, sources="./readData.R")
        if(!is.null(dataCsv))
        {
                message("loading data from cache")
                return (dataCsv)
        }
        require(sqldf)
        zipFileName<-"consumption.zip" 
        if(!file.exists(zipFileName))
        {
                download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              dest="consumption.zip", method="curl")
                
        }
        fileName<-"household_power_consumption.txt"
        if(!file.exists(fileName))
        {
                unzip(zipFileName)
        }
        
        dataCsv<-read.csv.sql("household_power_consumption.txt", sep=";", sql="select * from file where Date in (\"1/2/2007\",\"2/2/2007\")")
        library(lubridate)
        
        dataCsv$datetime<-dmy_hms(paste (dataCsv[,1], dataCsv[,2], sep=" "))
        dataCsv[,1]<-dmy(dataCsv[,1])
        dataCsv[,2]<-hms(dataCsv[,2])
        
        saveCache(dataCsv, key=cacheKey)
        message("saved data to cache")
        dataCsv
}