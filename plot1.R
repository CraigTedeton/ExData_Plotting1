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

## Plot 1 to PNG device, 480 x 480 (plot1.R, plot1.png)
## Get and subset data
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