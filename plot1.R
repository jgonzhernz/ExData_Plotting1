## Plot1
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

## Convert Date column from character to date 
data$Date <- strptime(data$Date, "%d/%m/%Y")

## Prepare range of dates
date1 <- strptime("01-02-2007", "%d-%m-%Y")
date2 <- strptime("02-02-2007", "%d-%m-%Y")

## Subset data between dates
data2 <- subset(data, as.Date(Date) >= as.Date(date1) & 
                  as.Date(Date) <= as.Date(date2))

## Open the graphics file device for PNG
png("plot1.png", height=480, width=480)

## Make the plot
hist(data2$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

## Close the graphics file device
dev.off()
