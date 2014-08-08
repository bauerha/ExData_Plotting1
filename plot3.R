# Project 1 - Plot 3
#

# Read Data (Assumes Data File in ./data/)
#  Convert Date/Time Fields
#  Subset to 01-Feb-2007 and 02-Feb-2007
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpcsub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

#  Chart 
#  (Convert Sub_metering_n to numeric before charting)
hpcsub$Sub_metering_1 <- as.numeric(as.character(hpcsub$Sub_metering_1))
hpcsub$Sub_metering_2 <- as.numeric(as.character(hpcsub$Sub_metering_2))
hpcsub$Sub_metering_3 <- as.numeric(as.character(hpcsub$Sub_metering_3))
png(file="plot3.png", width=480, height=480)

with(hpcsub, {
       plot(DateTime, Sub_metering_1, 
                   type="l",
                   xlab = "",
                   ylab="Engery sub metering")
       lines(DateTime, Sub_metering_2, col="red")
       lines(DateTime, Sub_metering_3, col="blue")
       legend("topright", 
                   c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   lty=1, lwd=2, col=c("black", "red", "blue"))
     })

dev.off()

