png("plot4.png", width = 480, height = 480, unit = "px")
par(mfcol = c(2,2))
par(mar = c(4,4,1,3))
par(oma = c(3,0,2,0))
ePower <- read.table("household_power_consumption.txt", na.strings = "?", skip = 66637, nrows = (69517-66637),sep = ';',col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
ePower$Date <- paste(ePower$Date, ePower$Time)
ePower$Date <- strptime(ePower$Date, format = "%d/%m/%Y %H:%M:%S")

#Plot One
plot(ePower$Date,ePower$Global_active_power, type = "l", xlab = '',ylab = 'Global Active Power (kilowatts)')

#Plot Two
plot(ePower$Date,ePower$Sub_metering_1, type = "l",xlab = '',ylab = 'Energy sub metering')
lines(ePower$Date,ePower$Sub_metering_2, col = "red")
lines(ePower$Date,ePower$Sub_metering_3, col = "blue")
legend( "topright", lwd = .5, bty = "n", col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot Three
plot(ePower$Date,ePower$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

#Plot Four
plot(Date,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()