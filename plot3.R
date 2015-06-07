start <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
data <- read.table("household_power_consumption.txt", skip = start-1, nrows=end-
                       start, sep=";")

names(data) <-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3")

data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time <- strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

plot(data$Date_Time, data$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
points(data$Date_Time, data$Sub_metering_2, type="l", col="red")
points(data$Date_Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
       ,lty=1, col=c("black","red", "blue"))

dev.copy(png, "plot3.png")
dev.off()