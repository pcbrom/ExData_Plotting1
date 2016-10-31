setwd("/home/pcbrom/Dropbox/Trabalho e Estudo/Cursos Livres/Exploratory Data Analysis/p_w1")
plotData = data.table::fread("household_power_consumption.txt", sep = ";", na.strings = "?")

## Adjust time variable

finalData = plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime = strptime(paste(finalData$Date, finalData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
finalData = cbind(SetTime, finalData)

## Generating Plot 2

plot(finalData$SetTime, finalData$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")

# Export plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(finalData$SetTime, finalData$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
