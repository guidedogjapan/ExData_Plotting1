file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, "Proj1data.zip", method = "curl")
date()
unzip("Proj1data.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$datetime <- fast_strptime(paste(as.character(power$Date), as.character(power$Time)), format="%d/%m/%Y %H:%M:%S")

#subset to dates 2007-02-01 and 2007-02-02
powerdays <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "plot4.png")
par(mfcol = c(2,2))
#1st plot, Global Active Power
plot(powerdays$datetime, powerdays$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "l")
#2nd plot, Energy sub metering
plot(powerdays$datetime, powerdays$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(powerdays$datetime, powerdays$Sub_metering_2, type = "l", col = "red")
points(powerdays$datetime, powerdays$Sub_metering_3, type = "l", col = "blue")
        #creates legend
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#3rd plot, Voltage
plot(powerdays$datetime, powerdays$Voltage, ylab = "Voltage",
     type = "l", col = "black", xlab = "datetime")
#4th plot, Global reactive power
plot(powerdays$datetime, powerdays$Global_reactive_power, ylab = "Global_reactive_power",
     type = "l", col = "black", xlab = "datetime")
dev.off()
