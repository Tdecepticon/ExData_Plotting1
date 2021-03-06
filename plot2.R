setwd("~/coursera/ExData_Plotting1") #setting the working directory of github repo
full_table <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') # creating data table to work
period <- subset(full_table, Date %in% c("10/2/2007","11/2/2007")) # subseting the two day period
period$Date <- as.Date(period$Date, format="%d/%m/%Y") #setting the date format
datetime <- paste(as.Date(period$Date), period$Time)
period$Datetime <- as.POSIXct(datetime)

## Plot 2
with(period, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480) #saving to file

dev.off()
