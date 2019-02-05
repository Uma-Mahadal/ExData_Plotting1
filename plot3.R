#Coursera course #4
#Week1 Project submission for peer grading

#Set the current working directoryloading
setwd("F:/Coursera/Explatory Data Analysis/ExData_Plotting1");

#loading the data and convert the time for subsetting and analysis
analysisdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
analysisdata$Date <- as.Date(analysisdata$Date, format = "%d/%m/%Y")


#Loading only the data needed
analysisdata<- subset(analysisdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
analysisdata$datetime <- strptime(paste(analysisdata$Date, analysisdata$Time), "%Y-%m-%d %H:%M:%S")

#Print Plot 3
# mask the unwanted ones
analysisdata$datetime <- as.POSIXct(analysisdata$datetime)

attach(analysisdata)
plot(Sub_metering_1 ~ datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(analysisdata)