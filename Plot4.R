library(lubridate)
library(dplyr)

## Load Data
mydata <- read.delim("household_power_consumption.txt",
                     sep = ";",
                     na.strings = "?")
mydata <- mutate(mydata, Date_Time = paste(mydata$Date, mydata$Time))

## Format Date and Time into proper class and merge
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)
mydata$Date_Time <- dmy_hms(mydata$Date_Time)

## Filter 2day period in Februrary 2007
period <- filter(mydata, Date == "2007-02-01" | Date == "2007-02-02")

## set correct class for visuals
period$Global_active_power <- as.numeric(period$Global_active_power)
period$Sub_metering_1 <- as.numeric(as.character(period$Sub_metering_1))
period$Sub_metering_2 <- as.numeric(as.character(period$Sub_metering_2))
period$Sub_metering_3 <- as.numeric(as.character(period$Sub_metering_3))
period$Voltage <- as.numeric(as.character(period$Voltage))
period$Global_reactive_power <- as.numeric(as.character(period$Global_reactive_power))

## Prepare Plot Framework
par(mfrow = c(2,2))
Sys.setlocale(category = "LC_ALL", locale = "english")

## Plot1
plot(period$Date_Time, period$Global_active_power,  
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")

## Plot2
plot(period$Date_Time, period$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

## Plot3
with(period, plot(Date_Time, Sub_metering_1,
                  type = "l", 
                  ylim = c(0,40),
                  xlab = "",
                  ylab = "Energy sub metering"))
lines(period$Date_Time, period$Sub_metering_2, type = "l", col = "red")    
lines(period$Date_Time, period$Sub_metering_3, type = "l", col = "blue")
legend_col = c("black", "red", "blue")
legend_txt = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = 1, col = legend_col, legend_txt)

## Plot4
plot(period$Date_Time, period$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

## Print png
dev.print(png, file = "Plot4.png", width = 480, height = 480)
dev.off()