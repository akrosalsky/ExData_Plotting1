# plot2.R
# Alexa Rosalsky
# 12 September 2015
#
# This code creates a png file of a time series plot of energy sub metering
# measurements 1, 2, and 3 for the dates of 2007-02-01 and 2007-02-02 using
# data from the UC Irvine Machine Learning Repository.


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

# create and annotate plot and save as .png file
png("plot3.png", width = 480, height = 480)
plot(pc$datetime, pc$Sub_metering_1, type = "l", ylab = "Energy sub metering",
       xlab = "")
lines(pc$datetime, pc$Sub_metering_2, col = "red")
lines(pc$datetime, pc$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
dev.off()