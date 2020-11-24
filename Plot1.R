setwd("~/coursera/ExData_Plotting1") #setting the working directory of github repo
full_table <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') # creating data table to work
period <- subset(full_table, Date %in% c("10/2/2007","11/2/2007")) # subseting the two day period
period$Date <- as.Date(period$Date, format="%d/%m/%Y") #setting the date format
hist(period$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") #creating histogram
png("plot1.png", width=480, height=480)
dev.off()

