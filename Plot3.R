myData <- read.csv("household_power_consumption.txt", sep=";")
#myData[,1] <- as.Date(myData[,1], format="%d/%m/%Y")
myData[,3] <- as.numeric(as.character(myData[,3]))
myData[,4] <- as.numeric(as.character(myData[,4]))
myData[,5] <- as.numeric(as.character(myData[,5]))
myData[,6] <- as.numeric(as.character(myData[,6]))
myData[,7] <- as.numeric(as.character(myData[,7]))
myData[,8] <- as.numeric(as.character(myData[,8]))
myData[,9] <- as.numeric(as.character(myData[,9]))

#Add a DateTime column
myData$DateTime <- as.POSIXct(paste(myData[,1], myData[,2]), format="%d/%m/%Y %H:%M:%S")



#Subset only the data we want
dataSubset <- subset(myData, DateTime >= as.POSIXct("2007-02-01") & DateTime <= as.POSIXct("2007-02-02 23:59:59"))

#Save the plot as a PNG file
png(filename="plot3.png", width=480, height=480)
plot(dataSubset$DateTime, dataSubset$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xlab="")
points(dataSubset$DateTime, dataSubset$Sub_metering_2, type="l", col="red")
points(dataSubset$DateTime, dataSubset$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col= c("black", "red", "blue"), lty="solid")
dev.off()