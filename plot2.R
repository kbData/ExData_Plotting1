source("./readData.R")
data<-readData()
png(file="plot2.png")
par(bg="transparent")
with(data, plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
