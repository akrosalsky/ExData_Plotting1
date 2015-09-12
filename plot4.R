# plot4.R
# Alexa Rosalsky
# 12 September 2015
#
# This code creates a png file of a grid of four plots. It includes plot2,
# plot3, a time series plot of minute-averaged voltage (in volt) over the given
# days, and a time series plot of household global minute-averaged reactive
# power (in kilowatt) over the same two days: 2007-02-01 and 2007-02-02. These
# plots were created using data from the UC Irvine Machine Learning Repository.
#

# read data from .txt file
pc <- read.table("~/Documents/R_Stuff/household_power_consumption.txt", 
                 sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses 
                 = c("character","character","numeric","numeric","numeric",
                     "numeric","numeric","numeric","numeric"), na.strings = "?")

# gather data for chosen days
pc$Date <- as.Date(pc$Date, format = "%d/%m/%Y")
pc <- pc[(pc$Date=="2007-02-01") | (pc$Date=="2007-02-02"),]

# create a datetime item
pc <- transform(pc, datetime=as.POSIXct(paste(Date, Time), format = 
                                                "%Y-%m-%d %H:%M:%S"))
# Create grid of plots and save as .png file
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# plot 1
plot(pc$datetime, pc$Global_active_power, type = "l", ylab = 
             "Global Active Power (kilowatts)", xlab = "")

# plot 2
plot(pc$datetime, pc$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(pc$datetime, pc$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(pc$datetime, pc$Sub_metering_2, col = "red")
lines(pc$datetime, pc$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))

# plot 4
plot(pc$datetime,pc$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()