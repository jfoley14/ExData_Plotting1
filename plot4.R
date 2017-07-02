setwd("/Users/JohnFoley/Desktop/Course_Project_1")

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

dat <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]

dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2, 2), mar = c(4,4,2,1))

# GRAPH ONE

with(dat, plot(Time, Global_active_power, ylab = "Global Active Power",
               xlab = "", type = "l"))

# GRAPH TWO

with(dat, plot(Time, Voltage, xlab = "datetime", type = "l"))

# GRAPH 3

with(dat, plot(Time, Sub_metering_1, ylab = "Energy sub metering", 
               xlab = "", type = "l"))

with(dat, points(Time, Sub_metering_2, col = "red", type = "l"))

with(dat, points(Time, Sub_metering_3, col = "blue", type = "l"))

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# GRAPH 4

with(dat, plot(Time, Global_reactive_power, xlab = "datetime", type = "l"))

dev.off()
