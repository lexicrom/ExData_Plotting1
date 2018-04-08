
# load data into R
power <- read.delim("household_power_consumption.txt", sep = ";")

# convert dates to date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# subset for only the 2 dates of interest
dayspower <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

# Convert Global active power to numeric values
dayspower$Global_active_power <- as.numeric(as.character(dayspower$Global_active_power))

# open a png object and create the plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(dayspower, hist(Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power"))
dev.off()