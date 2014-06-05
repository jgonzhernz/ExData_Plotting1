## Plot3
## code of the plot only change.
## Names of days are in spanish, the language of my windows license.

## Set repository as working dir
setwd("~/ExData_Plotting1")

## Read data into data frame
data <- read.table("/Users/amjgh/Documents/R_pruebas/household_power_consumption.txt", 
                   sep=";", header=T, 
                   colClasses = c("character", "character",
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric",
                                  "numeric"), 
                   na.strings="?")

## Convert Date column and time column from character to date.
## This time I need time column too. I need to do a paste before.
data$posixDate <- paste(data$Date, data$Time)
## Convert the new column with date and time
data$posixDate <- strptime(data$posixDate, "%d/%m/%Y %H:%M:%S")

## Prepare range of dates
date1 <- strptime("01-02-2007", "%d-%m-%Y")
date2 <- strptime("02-02-2007", "%d-%m-%Y")

## Subset data between dates. Overwrite original data frame
data <- subset(data, as.Date(posixDate) >= as.Date(date1) & 
                 as.Date(posixDate) <= as.Date(date2))

## Open the graphics file device for PNG
png("plot3.png", height=480, width=480)

## Make the plot. 
## You need init. xlab explicitly if you want nothing in the label 
plot(data$posixDate, data$Sub_metering_1, pch=NA, xlab="",
     ylab="Energy sub metering")
## add the lines
lines(data$posixDate, data$Sub_metering_1)
lines(data$posixDate, data$Sub_metering_2, col="red")
lines(data$posixDate, data$Sub_metering_3, col="blue")
## add the legend
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

## Close the graphics file device
dev.off()