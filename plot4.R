# Reading anf subsetting the data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".")
subData<-data[data$Date %in% c('1/2/2007','2/2/2007'),]

#converting to date format and into numeric type
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
submetering_1 <- as.numeric(subData$Sub_metering_1)
submetering_2 <- as.numeric(subData$Sub_metering_2)
submetering_3 <- as.numeric(subData$Sub_metering_3)

#png device
png("plot4.png", width=480, height=480)
#for multiple graphs in single plot row=2,column=2
par(mfrow = c(2, 2)) 
#plot1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(datetime, submetering_1, type="l", ylab="Energy_Submetering", xlab=" ")
lines(datetime, submetering_2, type="l", col="red")
lines(datetime, submetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot4
plot(datetime, globalReactivePower, type="l", xlab="DateTime", ylab="Global_Reactive_Power")

dev.off()
