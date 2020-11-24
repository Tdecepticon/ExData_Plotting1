setwd("~/coursera/ExData_Plotting1") #setting the working directory of github repo
full_table <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') # creating data table to work
period <- subset(full_table, Date %in% c("10/2/2007","11/2/2007")) # subseting the two day period
period$Date <- as.Date(period$Date, format="%d/%m/%Y") #setting the date format
datetime <- paste(as.Date(period$Date), period$Time)
period$Datetime <- as.POSIXct(datetime)

#plot 3
with(period, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #plot legend 

# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()