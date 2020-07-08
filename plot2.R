# Reading and subsetting the data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".")
subData<-data[data$Date %in% c('1/2/2007','2/2/2007'),]
#converting into date and numeric
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
#png device
png("plot2.png", width=480, height=480)
#plotting
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
