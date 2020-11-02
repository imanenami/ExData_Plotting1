## read data
data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings="?", header=T)

## parse dates
data$dt = paste(data$Date, data$Time)
data$Date = strptime(data$Date, "%d/%m/%Y", tz="GMT")
data$dt = strptime(data$dt, "%d/%m/%Y %H:%M:%S", tz="GMT")
data = data[data$Date %in% c("2007-02-01", "2007-02-02"),]

## make graph
png("plot4.png")
par(mfcol=c(2,2)
## top left plot
plot(data$dt, data$Global_active_power, type="l",
     ylab="Global Active Power", xlab = NA)
## bottom left plot
plot(data$dt, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab = NA, col="black")
lines(data$dt, data$Sub_metering_2, col="red")
lines(data$dt, data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1)
## top right plot
plot(data$dt, data$Voltage, type="l",
     ylab="Voltage", xlab = "datetime")
## bottom right plot
plot(data$dt, data$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab = "datetime")
     
## save
dev.off()
