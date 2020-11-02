## read data
data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings="?", header=T)

## parse dates
data$dt = paste(data$Date, data$Time)
data$Date = strptime(data$Date, "%d/%m/%Y", tz="GMT")
data$dt = strptime(data$dt, "%d/%m/%Y %H:%M:%S", tz="GMT")
data = data[data$Date %in% c("2007-02-01", "2007-02-02"),]

## make graph
png("plot2.png")
plot(data$dt, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab = NA)
dev.off()
