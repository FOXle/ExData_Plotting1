library(lubridate)
library(dplyr)

## Load Data
mydata <- read.delim("household_power_consumption.txt",
                     sep = ";",
                     na.strings = "?")

## Format Date and Time into proper class
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)

## Filter 2day period in Februrary 2007
period <- filter(mydata, Date == "2007-02-01" | Date == "2007-02-02" )

## Plot1
period$Global_active_power <- as.numeric(as.character(period$Global_active_power))
hist(period$Global_active_power, freq = TRUE,
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)",
     col = "red")

## Print png
dev.print(png, file = "Plot1.png", width = 480, height = 480)
dev.off()

