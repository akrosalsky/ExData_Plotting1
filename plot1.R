# plot1.R
# Alexa Rosalsky
# 12 September 2015
#
# This code creates a png file of a histogram of household global
# minute-averaged active power (in kilowatts) on the dates of 2007-02-01 and
# 2007-02-02 using data from the UC Irvine Machine Learning Repository.

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
# create histogram and save as .png file
png("plot1.png", width = 480, height = 480)
hist(pc$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()

