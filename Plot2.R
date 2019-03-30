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
period <- filter(mydata, Date == "2007-02-01" | Date == "2007-02-02" )

## Plot2
period$Global_active_power <- as.numeric(period$Global_active_power)
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(period$Date_Time, period$Global_active_power,  
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")

## Print png
dev.print(png, file = "Plot2.png", width = 480, height = 480)
dev.off()
