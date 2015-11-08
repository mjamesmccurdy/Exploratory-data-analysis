# reading data from data file
fullData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

# we only want a little bit of the data
Feb <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Changing dates to calender dates mon-sunday
datetime <- paste(as.Date(Feb$Date), Feb$Time)
Feb$datetime <- as.POSIXct(datetime)
#creating the png
png(file="plot4.png")
par(mfrow=c(2,2)) #2x2 plot matrix
with(Feb, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="") #top left
    plot(Voltage~datetime, type="l", 
         ylab="Voltage", xlab="datetime") #top right
    plot(Sub_metering_1~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="") #bot left
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
    plot(Global_reactive_power~datetime, type="l", 
         ylab="Global_Reactive_Power",xlab="datetime") # bot right
})

dev.off()