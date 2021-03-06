data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
png(file = "plot1.png")
with(df, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()