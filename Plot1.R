myData <- read.csv("household_power_consumption.txt", sep=";")
myData[,1] <- as.Date(myData[,1], format="%d/%m/%Y")
myData[,3] <- as.numeric(as.character(myData[,3]))
myData[,4] <- as.numeric(as.character(myData[,4]))
myData[,5] <- as.numeric(as.character(myData[,5]))
myData[,6] <- as.numeric(as.character(myData[,6]))
myData[,7] <- as.numeric(as.character(myData[,7]))
myData[,8] <- as.numeric(as.character(myData[,8]))
myData[,9] <- as.numeric(as.character(myData[,9]))

#Subset only the data we want
dataSubset <- subset(myData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


#Save the plot as a PNG file
png(filename="plot1.png", width=480, height=480)
hist(dataSubset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()