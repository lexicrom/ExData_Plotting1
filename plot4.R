# load data into R
power <- read.delim("household_power_consumption.txt", sep = ";")

# convert dates to date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# subset for only the 2 dates of interest
dayspower <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

# create new date/time column
datetime <- paste(dayspower$Date, dayspower$Time)
dayspower$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# Convert factors to numeric values
dayspower$Global_active_power <- as.numeric(as.character(dayspower$Global_active_power))
dayspower$Sub_metering_1 <- as.numeric(as.character(dayspower$Sub_metering_1))
dayspower$Sub_metering_2 <- as.numeric(as.character(dayspower$Sub_metering_2))
dayspower$Sub_metering_3 <- as.numeric(as.character(dayspower$Sub_metering_3))
dayspower$Voltage <- as.numeric(as.character(dayspower$Voltage))
dayspower$Global_reactive_power <- as.numeric(as.character(dayspower$Global_reactive_power))

# make png object capable of plotting 4 subplots
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# plot 1st plot
with(dayspower, plot(datetime, Global_active_power, type = "n", xlab ="", ylab = "Global Active Power (kilowatts)"))
lines(dayspower$datetime, dayspower$Global_active_power)

# plot 2nd plot
with(dayspower, plot(datetime, Voltage, type = "n"))
with(dayspower, lines(datetime, Voltage))

# plot 3rd plot
with(dayspower, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(dayspower, lines(datetime, Sub_metering_1, col = "black"))
with(dayspower, lines(datetime, Sub_metering_2, col = "red"))
with(dayspower, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(2, 2, 2))

# plot 4th plot
with(dayspower, plot(datetime, Global_reactive_power, type = "n"))
with(dayspower, lines(datetime, Global_reactive_power))

dev.off()


