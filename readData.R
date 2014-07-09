readData<- function(){
        require(sqldf)
        fileName<-"consumption.zip"
        if(!file.exists(fileName))
        {
                download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              dest="consumption.zip", method="curl")
                
        }    
        if(!file.exists("household_power_consumption.txt"))
        {
                unzip(fileName)
        }
        dataCsv<-read.csv.sql("household_power_consumption.txt", sep=";", sql="select * from file where Date in (\"1/2/2007\",\"2/2/2007\")")
        library(lubridate)
        
        dataCsv$datetime<-dmy_hms(paste (dataCsv[,1], dataCsv[,2], sep=" "))
        dataCsv[,1]<-dmy(dataCsv[,1])
        dataCsv[,2]<-hms(dataCsv[,2])
        
        dataCsv
}