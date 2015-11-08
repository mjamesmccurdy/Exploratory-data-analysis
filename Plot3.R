# reading data from datafile
fullData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

# what dates do we want?
Feb <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## putting into monday-sunday
datetime <- paste(as.Date(Feb$Date), Feb$Time)
Feb$datetime <- as.POSIXct(datetime)

#plot png
png(file="plot3.png")
with(Feb, {
    plot(Sub_metering_1~datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime,col='Red') #adding in second submeter
    lines(Sub_metering_3~datetime,col='Blue') #3rd sumbeeter
})
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1) # creating legend
dev.off()
