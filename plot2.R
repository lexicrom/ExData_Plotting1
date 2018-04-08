
# load data into R
power <- read.delim("household_power_consumption.txt", sep = ";")

# convert dates to date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# subset for only the 2 dates of interest
dayspower <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

# create new date/time column
datetime <- paste(dayspower$Date, dayspower$Time)
dayspower$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# Convert Global active power to numeric values
dayspower$Global_active_power <- as.numeric(as.character(dayspower$Global_active_power))

# open a png object and plot global active power by time
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(dayspower, plot(datetime, Global_active_power, type = "n", xlab ="", ylab = "Global Active Power (kilowatts)"))
lines(dayspower$datetime, dayspower$Global_active_power)
dev.off()

