# Project 1 - Plot 1
#

# Read Data (Assumes Data File in ./data/)
#  Convert Date Field
#  Subset to 01-Feb-2007 and 02-Feb-2007
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpcsub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

# Histogram
#  Chart Global Active Power
#  (Convert Global_active_power to numeric before charting)
hpcsub$Global_active_power <- as.numeric(as.character(hpcsub$Global_active_power))
png(file="plot1.png", width=480, height=480)
hist(hpcsub$Global_active_power, 
      col="Red", 
      axes = FALSE,
      xlim=c(0,6), 
      ylim=c(0,1200),
      main="Global Active Power", 
      xlab="Global Active Power (kilowatts)")
axis(side=1, at=seq(0,6,by=2))
axis(side=2, at=seq(0,1200,by=200))
dev.off()
