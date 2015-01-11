## Create the data set with date and time for the two day period
data <- read.table("household_power_consumption.txt", 
                   sep = ";",header=TRUE,na.strings = "?")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data2 <- data[data$DateTime>"2007-01-31 23:59:00" & data$DateTime <"2007-02-03 00:00:00",]

##open graphics device
png(file = "Plot4.png")

##construct plot margins and area for 4 plots
par(mar=c(4,4,2,2))
par(mfrow = c(2,2))

## add plot1
plot(data2$DateTime,data2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data2$DateTime,data2$Global_active_power)

## add plot2
plot(data2$DateTime,data2$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data2$DateTime,data2$Voltage)

## add plot3
plot(data2$DateTime,data2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data2$DateTime,data2$Sub_metering_1)
lines(data2$DateTime,data2$Sub_metering_2, col = "red")
lines(data2$DateTime,data2$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ),lty=c(1,1), bty = "n")

## add plot4
plot(data2$DateTime,data2$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(data2$DateTime,data2$Global_reactive_power)

##close device
dev.off()