setwd("/Users/JohnFoley/Desktop/Course_Project_1")

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

dat <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]

dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

with(dat, plot(Time, Global_active_power, ylab = 
                   "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.off()
