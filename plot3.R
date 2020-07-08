#Reading data and subsetting
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".")
subData<-data[data$Date %in% c('1/2/2007','2/2/2007'),]

#converting into date format and numeric types
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
submetering_1 <- as.numeric(subData$Sub_metering_1)
submetering_2 <- as.numeric(subData$Sub_metering_2)
submetering_3 <- as.numeric(subData$Sub_metering_3)

#png device
png("plot3.png", width=480, height=480)
#plotting
plot(datetime, submetering_1, type="l", ylab="Energy Submetering", xlab="")
#Annotating
lines(datetime, submetering_2, type="l", col="red")
lines(datetime, submetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

