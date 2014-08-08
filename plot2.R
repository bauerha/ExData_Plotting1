# Project 1 - Plot 2
#

# Read Data (Assumes Data File in ./data/)
#  Convert Date/Time Fields
#  Subset to 01-Feb-2007 and 02-Feb-2007
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpcsub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

#  Chart Global Active Power
#  (Convert Global_active_power to numeric before charting)
hpcsub$Global_active_power <- as.numeric(as.character(hpcsub$Global_active_power))
png(file="plot2.png", width=480, height=480)
with(hpcsub, plot(DateTime, Global_active_power, 
                   type="l",
                   xlab = "",
                   ylab="Global Active Power (kilowatts)"))
dev.off()
