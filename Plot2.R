#reading data
fullData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

#what dates do we want?
Feb <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# putting into mon-sunday
datetime <- paste(as.Date(Feb$Date), Feb$Time)
Feb$datetime <- as.POSIXct(datetime)

# create png
png(file = "plot2.png")
plot(Feb$Global_active_power~Feb$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
