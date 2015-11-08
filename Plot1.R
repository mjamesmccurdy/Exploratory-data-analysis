#getting data
fullData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y") #Date ->date char

#what dates do we want?
Feb <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create png
png(file="plot1.png")
hist(Feb$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
