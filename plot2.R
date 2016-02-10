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



png(filename = "Plot2.png", width = 480, height = 480, units = "px")
par(mfcol=c(1,1))

#plot the line diagram for global active power over time (and skip x-axis):
plot(as.numeric(dat$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
#find the first entry with date == 2007-02-02
head(which(dat$Date=="2007-02-02"), n=1) #first 2007-02-02 entry is in line 1441
#add the x-axis:
axis(1, at=c(1, 1441, length(dat$Date)), labels=c("Thu", "Fri", "Sat"))

dev.off()



