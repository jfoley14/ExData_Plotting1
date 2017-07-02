setwd("/Users/JohnFoley/Desktop/Course_Project_1")

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

dat <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]

png(file = "plot1.png")

hist(dat$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
