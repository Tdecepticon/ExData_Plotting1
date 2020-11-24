# pls ceep in mind, that I already downloaded and uzipped data file to  WD

#setting the working directory of github repo
setwd("~/coursera/ExData_Plotting1") 

# creating data table to work
full_table <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

# subseting the two day period
period <- subset(full_table, Date %in% c("10/2/2007","11/2/2007")) 

#setting the date format
period$Date <- as.Date(period$Date, format="%d/%m/%Y") 

#creating histogram
hist(period$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red") 

png("plot1.png", width=480, height=480)

dev.off()

