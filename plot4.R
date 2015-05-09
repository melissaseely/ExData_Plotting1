#course 4 project 1

## read in data
filename<-"household_power_consumption.txt"
txtdata <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
txtdata$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Converting dates
datetime <- paste(as.Date(txtdata$Date), txtdata$Time)
txtdata$datetime <- as.POSIXct(datetime)

## Generating Plot 4
png(filename = "plot4.png", width = 480, height = 480, units="px", bg="transparent")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#txtdata$datetime <- strptime(paste(txtdata$Date,txtdata$Time),"%d/%m/%Y %H:%M:%S")

#plot top left
plot(txtdata$datetime, txtdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot top right
plot(txtdata$datetime, txtdata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#plot bottom left
plot(txtdata$Sub_metering_1 ~ txtdata$datetime, type = "l", col="black", ylab = "Energy sub metering", xlab = "")
lines(txtdata$datetime, data$Sub_metering_2, col = "red")
lines(txtdata$datetime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lty=1, lwd=2, bty="n")
#plot bottom right
plot(txtdata$datetime, txtdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

