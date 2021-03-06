start <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
data <- read.table("household_power_consumption.txt", skip = start-1, nrows=end-
                    start, sep=";")

names(data) <-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3")

hist(data$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
