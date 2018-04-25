## Michael Hulin
## Coursera Exploratory Data Analysis Week 1 Project
## Plot 3

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
png("plot3.png", width=480, height=480) 

# Third Plot  

plot(datetime, wd$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab ="")
lines(datetime, wd$Sub_metering_2, type = "l", col = "red" )
lines(datetime, wd$Sub_metering_3, type = "l", col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1, 
       lwd = 2)

dev.off()