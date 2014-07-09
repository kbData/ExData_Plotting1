source("./readData.R")
data<-readData()
png(file="plot4.png")
#par(bg="transparent", mfrow=c(2,2))
par(mfrow=c(2,2))
with(data,
{
        plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(datetime, Voltage, type="l", ylab="Voltage")
        plot(datetime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright", bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lty=1)
        plot(datetime, Global_reactive_power, type="l")
})
dev.off()

