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

#initiallize the graphic device:
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
par(mfcol=c(1,1))

#plot the histogram:
hist(as.numeric(dat$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#colse the graphic device:
dev.off()


