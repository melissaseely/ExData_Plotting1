#course 4 project 1

## read in data
filename<-"household_power_consumption.txt"
txtdata <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
txtdata$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Converting dates
datetime <- paste(as.Date(txtdata$Date), txtdata$Time)
txtdata$datetime <- as.POSIXct(datetime)

## Generating Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(txtdata$Global_active_power ~ txtdata$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()


