### Code Book
This code book summarizes the process of getting and cleaning data for this project including description of variables and data

1. Download the dataset from source described in `RawData.md`
2. Unzip data into your working directory

####Plot 1

####Plot 2

####Plot 3

####Plot 4


3. Run the R script `run_analysis.R`, which does the following:
    - Reading the data sets
    - Merging the data sets
    - Extracting measurements on mean and standard deviation
    - Add descriptive names to the activities
    - Labels the variable names
    - Creates an independent tidy dataset called `ProcessedData.txt`
    
The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

Variable name          | Description                       
-----------------------|-----------------------------------
Date                   | Date in format dd/mm/yyyy
Time                   | time in format hh:mm:ss
Global_active_power    | household global minute-averaged active power (in kilowatt)
Global_reactive_power | household global minute-averaged reactive power (in kilowatt)
Voltage | minute-averaged voltage (in volt)
Global_intensity | household global minute-averaged current intensity (in ampere)
Sub_metering_1 | energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2 | energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3 | energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
