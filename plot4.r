## Michael Hulin
## Coursera Exploratory Data Analysis Week 1 Project
## Plot 4

library(data.table)
library(dplyr)


setwd("D:/My_Files/Documents/Coursera/Exploratory Data Analysis/Week 1/")
##  Read the data (assumes the file is already downloaded)
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subset the data to range of dates 2007-02-01 and 2007-02-02
wd <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] 

## creeate the time vector
datetime <- strptime(paste(wd$Date, wd$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


## Start the plot device witht the given parameters
png("plot4.png", width=480, height=480) 
par(mfrow= c(2,2))

# first plot
plot(datetime, wd$Global_active_power, type="l", ylab="Global Active Power", xlab="" )

# Second Plot
plot(datetime, wd$Voltage , type="l", ylab="Voltage", xlab="datetime" )

# Third Plot  I used bty = "n" to remove the border and cex = 0.9 to shrink the legend to fit better

plot(datetime, wd$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab ="")
lines(datetime, wd$Sub_metering_2, type = "l", col = "red" )
lines(datetime, wd$Sub_metering_3, type = "l", col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       bty = "n",
       cex = 0.9,
       lty = 1, 
       lwd = 2)


# Fourth Plot
plot(datetime, wd$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()
