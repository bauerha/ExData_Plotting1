# Project 1 - Plot 4
#

# Read Data (Assumes Data File in ./data/)
#  Convert Date/Time Fields
#  Subset to 01-Feb-2007 and 02-Feb-2007
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpcsub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

#  Charts
#  (Convert Sub_metering_n to numeric before charting)
hpcsub$Global_active_power <- as.numeric(as.character(hpcsub$Global_active_power))
hpcsub$Global_reactive_power <- as.numeric(as.character(hpcsub$Global_reactive_power))
hpcsub$Sub_metering_1 <- as.numeric(as.character(hpcsub$Sub_metering_1))
hpcsub$Sub_metering_2 <- as.numeric(as.character(hpcsub$Sub_metering_2))
hpcsub$Sub_metering_3 <- as.numeric(as.character(hpcsub$Sub_metering_3))
hpcsub$Voltage <- as.numeric(as.character(hpcsub$Voltage))

png(file="plot4.png", width=480, height=480)

par(mfrow = c(2, 2), cex = 0.8)

with(hpcsub, {
      plot(DateTime, Global_active_power, 
                   type="l",
                   xlab = "",
                   ylab="Global Active Power")

      plot(DateTime, Voltage, 
                   type="l",
                   xlab = "datetime")

      plot(DateTime, Sub_metering_1, 
                   type="l",
                   xlab = "",
                   ylab="Engery sub metering")
      lines(DateTime, Sub_metering_2, col="red")
      lines(DateTime, Sub_metering_3, col="blue")
      legend("topright", 
                   col=c("black", "red", "blue"), lwd=2, lty=1, bty = "n",
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

      plot(DateTime, Global_reactive_power, 
                   type="l",
                   xlab = "datetime")
    })

dev.off()

