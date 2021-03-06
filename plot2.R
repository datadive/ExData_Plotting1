household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
house <- subset(household_power_consumption, as.Date(household_power_consumption$Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(household_power_consumption$Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))
house$datetime <- as.POSIXlt(paste(as.character(house$Date), as.character(house$Time),sep="-"),format="%d/%m/%Y-%H:%M:%S")

#Plot 2
png(file="plot2.png")
par(mfrow=c(1,1))
plot(house$datetime, as.numeric(as.character(house$Global_active_power)),type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()