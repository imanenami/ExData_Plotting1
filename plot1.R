## read data
data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings="?", header=T)

## parse dates
data$dt = paste(data$Date, data$Time)
data$Date = strptime(data$Date, "%d/%m/%Y", tz="GMT")
data$dt = strptime(data$dt, "%d/%m/%Y %H:%M:%S", tz="GMT")
data = data[data$Date %in% c("2007-02-01", "2007-02-02"),]

## make histogram
png("plot1.png")
hist(sdata$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", ylab = "Frequency", 
     main="Global Active Power")
dev.off()
