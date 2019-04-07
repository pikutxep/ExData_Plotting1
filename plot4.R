png("plot4.png", width = 480, height = 480)
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSubset <- subset(data, Date >="2007-02-01" & Date < "2007-02-03")

par(mfrow=c(2,2))

dataSubset$Global_active_power<-as.numeric(as.character(sub("," , ".", dataSubset$Global_active_power)))
plot(dataSubset$Datetime,dataSubset$Global_active_power,  type="l", ylab="Global Active Power (kilowats)", xlab="")

plot(dataSubset$Datetime,dataSubset$Voltage,  type="l", ylab="Voltage", xlab="Datetime")

plot(dataSubset$Datetime, dataSubset$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
dataSubset$Sub_metering_2<-as.numeric(as.character(sub("," , ".", dataSubset$Sub_metering_2)))
lines(dataSubset$Datetime,dataSubset$Sub_metering_2, col = "red")
dataSubset$Sub_metering_3<-as.numeric(as.character(sub("," , ".", dataSubset$Sub_metering_3)))
lines(dataSubset$Datetime,dataSubset$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)

plot(dataSubset$Datetime, dataSubset$Global_reactive_power, type="l", ylab="Global reactive power", xlab="Datetime")
dev.off()