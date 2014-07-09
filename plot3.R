source("./readData.R")
data<-readData()
png(file="plot3.png")
par(bg="transparent")
with(data,
        {
        plot(datetime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lty=1)
dev.off()
