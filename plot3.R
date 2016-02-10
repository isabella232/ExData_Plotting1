dat <- setwd("/exdata_data_household_power_consumption")

dat <- read.csv2(file = "household_power_consumption.txt", header = T, na.strings = "?", stringsAsFactors=FALSE)
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")
dat <- subset(dat, dat$Date == "2007-02-01" | dat$Date == "2007-02-02")


png(filename = "Plot3.png", width = 480, height = 480, units = "px")
par(mfcol=c(1,1))

#plot the line diagram for the three sub meterings (and skip x-axis):
plot(as.numeric(dat$Sub_metering_1), type="l", ylab="Energy sub metering", xaxt="n", xlab="")
points(as.numeric(dat$Sub_metering_2), type="l", col="red")
points(as.numeric(dat$Sub_metering_3), type="l", col="blue")
#add the x-axis as in Plot2:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))
#add legend:
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)

dev.off()



