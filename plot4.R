data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
df <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
png(file = "plot4.png")
par(mfrow = c(2,2))
#topleft
with(df, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
#topright
with(df, plot(datetime, Voltage, type = "l"))
#bottomleft
with(df, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(df, lines(datetime, Sub_metering_1))
with(df, lines(datetime, Sub_metering_2, col = "red"))
with(df, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#bottomright
with(df, plot(datetime, Global_reactive_power, type = "l"))
dev.off()