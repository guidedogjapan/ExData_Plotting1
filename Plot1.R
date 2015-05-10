file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, "Proj1data.zip", method = "curl")
date()
unzip("Proj1data.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$datetime <- fast_strptime(paste(as.character(power$Date), as.character(power$Time)), format="%d/%m/%Y %H:%M:%S")

#subset to dates 2007-02-01 and 2007-02-02
powerdays <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "plot1.png")
hist(powerdays$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")
dev.off()
