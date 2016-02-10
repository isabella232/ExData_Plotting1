# Download and unzip data
if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
    
    download.file(url,destfile = "data.zip")
}

# Unzip the file
unzip("data.zip")

#read in the data:
dat <- read.csv2(file = "household_power_consumption.txt", header = T, na.strings = "?", stringsAsFactors=FALSE)
#change the date formate:
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")
#subset the data of interest:
dat <- subset(dat, dat$Date == "2007-02-01" | dat$Date == "2007-02-02")



png(filename = "Plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

#plot the line diagram for global active power over time as in Plot2:
plot(as.numeric(dat$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
#add the x-axis:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))

#plot the line diagram for the three sub meterings as in Plot3:
plot(as.numeric(dat$Sub_metering_1), type="l", ylab="Energy sub metering", xaxt="n", xlab="")
points(as.numeric(dat$Sub_metering_2), type="l", col="red")
points(as.numeric(dat$Sub_metering_3), type="l", col="blue")
#add the x-axis as in Plot2:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))
#add legend:
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1, bty = "n")

#plot the voltage:
plot(as.numeric(dat$Voltage), type="l", ylab="Voltage", xaxt="n", xlab="datetime")
#add the x-axis as in Plot2:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))

#plot the global reactive power:
plot(as.numeric(dat$Global_reactive_power), type="l", ylab="Global_reactive_power", xaxt="n", xlab="datetime")
#add the x-axis as in Plot2:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))

dev.off()




