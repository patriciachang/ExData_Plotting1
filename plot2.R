start <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
data <- read.table("household_power_consumption.txt", skip = start-1, nrows=end-
                       start, sep=";")

names(data) <-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3")

data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time <- strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")
plot(data$Date_Time, data$Global_active_power, type="l", xlab= "", ylab="Global 
     Active Power(kilowatts)")

dev.copy(png, "plot2.png")
dev.off()