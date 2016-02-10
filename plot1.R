dat <- setwd("/exdata_data_household_power_consumption")

dat <- read.csv2(file = "household_power_consumption.txt", header = T, na.strings = "?", stringsAsFactors=FALSE)
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")
dat <- subset(dat, dat$Date == "2007-02-01" | dat$Date == "2007-02-02")


png(filename = "Plot1.png", width = 480, height = 480, units = "px")
par(mfcol=c(1,1))

#plot the histogram:
hist(as.numeric(dat$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()


