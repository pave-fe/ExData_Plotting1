## Michael Hulin
## Coursera Exploratory Data Analysis Week 1 Project
## Plot 2

library(data.table)


setwd("D:/My_Files/Documents/Coursera/Exploratory Data Analysis/Week 1/")

##  Read the data (assumes the file is already downloaded)
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## Subset the data to range of dates 2007-02-01 and 2007-02-02
wd <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] 


## creeate the time vector
datetime <- strptime(paste(wd$Date, wd$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Start the plot device witht the given parameters
png("plot2.png", width=480, height=480) 

plot(datetime, wd$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="" )

dev.off() 