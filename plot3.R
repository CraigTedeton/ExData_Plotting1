## Prepatory steps, workink dir, getting/unzip data file, review file/data, estimate memory
## setwd("c:/datasciencecoursera/ExploringDataAnalysis/ExData_Plotting1")
## library(ggplot2)
## Getting data from source
## fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(fileUrl, destfile = "./data/power.zip")

## unzip("./data/power.zip", exdir = "./data")
## fpath <- file.path("./data")
## filelist <- list.files(fpath, recursive = TRUE)
## filelist
## summary(mySubsetData)
## rows <- nrow(mySubsetData)
## cols <- ncol(mySubsetData)
## estMem <- ((rows * cols) * 8000) / 2^20
## estMem

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