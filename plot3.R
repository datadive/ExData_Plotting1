household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
house <- subset(household_power_consumption, as.Date(household_power_consumption$Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(household_power_consumption$Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))
house$datetime <- as.POSIXlt(paste(as.character(house$Date), as.character(house$Time),sep="-"),format="%d/%m/%Y-%H:%M:%S")

#Plot 3
png(file="plot3.png")
par(mfrow=c(1,1))
plot(house$datetime, as.numeric(as.character(house$Sub_metering_1)),type="l",xlab="", ylab="Energy sub metering")
points(house$datetime, as.numeric(as.character(house$Sub_metering_2)),type="l",col="red")
points(house$datetime, as.numeric(as.character(house$Sub_metering_3)),type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.65)
dev.off()
