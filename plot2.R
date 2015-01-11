## Create the data set with date and time for the two day period
data <- read.table("household_power_consumption.txt", 
                   sep = ";",header=TRUE,na.strings = "?")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data2 <- data[data$DateTime>"2007-01-31 23:59:00" & data$DateTime <"2007-02-03 00:00:00",]

##open graphics device
png(file = "Plot2.png")

##construct plot
par(mar=c(4,4,2,2))
plot(data2$DateTime,data2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data2$DateTime,data2$Global_active_power)

##close device
dev.off()