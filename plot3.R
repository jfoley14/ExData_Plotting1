setwd("/Users/JohnFoley/Desktop/Course_Project_1")

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

dat <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]

dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

with(dat, plot(Time, Sub_metering_1, ylab = "Energy sub metering", 
               xlab = "", type = "l"))

with(dat, points(Time, Sub_metering_2, col = "red", type = "l"))

with(dat, points(Time, Sub_metering_3, col = "blue", type = "l"))

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
