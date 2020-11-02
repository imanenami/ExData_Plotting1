## read data
data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings="?", header=T)

## parse dates
data$dt = paste(data$Date, data$Time)
data$Date = strptime(data$Date, "%d/%m/%Y", tz="GMT")
data$dt = strptime(data$dt, "%d/%m/%Y %H:%M:%S", tz="GMT")
data = data[data$Date %in% c("2007-02-01", "2007-02-02"),]

## make graph
png("plot3.png")
plot(data$dt, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab = NA, col="black")
lines(data$dt, data$Sub_metering_2, col="red")
lines(data$dt, data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1)
dev.off()
