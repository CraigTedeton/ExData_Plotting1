setwd("c:/datasciencecoursera/ExploringDataAnalysis/ExData_Plotting1")
## library(ggplot2)
## Getting data from source
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/power.zip")

unzip("./data/power.zip", exdir = "./data")
fpath <- file.path("./data")
filelist <- list.files(fpath, recursive = TRUE)
filelist
summary(mySubsetData)
rows <- nrow(mySubsetData)
cols <- ncol(mySubsetData)
estMem <- ((rows * cols) * 8000) * 2^20 ; estMem

## Subset source data, load data & strip time 
## Estimate memory usage, sum (lines, columns) * 8 bytes

myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
mySubsetData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]
summary(mySubsetData)
rows <- nrow(mySubsetData)
cols <- ncol(mySubsetData)
estMem <- ((rows * cols) * 8000) * 2^20 ; estMem

datetime <- paste(as.Date(mySubsetData$Date), mySubsetData$Time)
mySubsetData$Datetime <- as.POSIXct(datetime)

## There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
## When finished, push your git repository to the GitHub version of your repository is up to date.

####
## Plot 1 to PNG device, 480 x 480 (plot1.R, plot1.png)
## Get data, subset, and  
myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
mySubsetData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date
datetime <- paste(as.Date(mySubsetData$Date), mySubsetData$Time)
mySubsetData$Datetime <- as.POSIXct(datetime)

## plot histogram and output to PNG device
globActPwr <- as.numeric(mySubsetData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globActPwr, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

####
## Plot 2 to PNG device, 480 x 480 (plot2.R, plot2.png)
## Get and subset data
myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
mySubsetData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date
datetime <- strptime(paste(mySubsetData$Date, mySubsetData$Time, sep =" "), "%d/%m/%Y %H:%M:%S") 
mySubsetData$Datetime <- as.POSIXct(datetime)

## plot histogram and output to PNG device
globActPwr <- as.numeric(mySubsetData$Global_active_power)
plot(mySubsetData$Global_active_power~mySubsetData$Datetime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()

####
## Plot 3 to PNG device, 480 x 480 (plot3.R, plot3.png)
## Get and subset data
myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
mySubsetData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date
datetime <- strptime(paste(mySubsetData$Date, mySubsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
mySubsetData$Datetime <- as.POSIXct(datetime)

globActPwr <- as.numeric(mySubsetData$Global_active_power)
subMetering1 <- as.numeric(mySubsetData$Sub_metering_1)
subMetering2 <- as.numeric(mySubsetData$Sub_metering_2)
subMetering3 <- as.numeric(mySubsetData$Sub_metering_3)

## plot histogram and output to PNG device
globActPwr <- as.numeric(mySubsetData$Global_active_power)
png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, 
       col = c("black", "red", "blue"))
dev.off()

####
## Plot 4 to PNG device, 480 x 480 (plot4.R, plot4.png)
## Get and subset data
myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
mySubsetData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date
datetime <- strptime(paste(mySubsetData$Date, mySubsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
mySubsetData$Datetime <- as.POSIXct(datetime)

globActPwr <- as.numeric(mySubsetData$Global_active_power)
globReacPwr <- as.numeric(mySubsetData$Global_reactive_power)
voltage <- as.numeric(mySubsetData$Voltage)
subMetering1 <- as.numeric(mySubsetData$Sub_metering_1)
subMetering2 <- as.numeric(mySubsetData$Sub_metering_2)
subMetering3 <- as.numeric(mySubsetData$Sub_metering_3)

## plot histogram and output to PNG device
globActPwr <- as.numeric(mySubsetData$Global_active_power)
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
plot(datetime, globActPwr, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, 
       col = c("black", "red", "blue"), bty = "o")

plot(datetime, globReacPwr, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()



