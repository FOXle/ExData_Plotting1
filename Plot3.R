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
Sys.setlocale(category = "LC_ALL", locale = "english")

## Plot3
with(period, plot(Date_Time, Sub_metering_1,
                  type = "l", 
                  ylim = c(0,38),
                  xlab = "",
                  ylab = "Energy sub metering"))
lines(period$Date_Time, period$Sub_metering_2, type = "l", col = "red")    
lines(period$Date_Time, period$Sub_metering_3, type = "l", col = "blue")
legend_col = c("black", "red", "blue")
legend_txt = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = 1, col = legend_col, legend_txt)

## Print png
dev.print(png, file = "Plot3.png", width = 480, height = 480)
dev.off()