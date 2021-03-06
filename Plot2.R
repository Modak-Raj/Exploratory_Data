##Read data and set time variable
##
setwd("~/MoDuck/Exploratory_Data")
plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Plot 2
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()