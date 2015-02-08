## Plot4: timeline

## Download and unzip the data file

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="exdata_data_household_power_consumption.zip", method="curl")
untar('exdata_data_household_power_consumption.zip')


## Load the file and subset the data for the two days asked
## Create a new datetime column
## The same as plot2.R

hpc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, dec=".", fill=TRUE)
shpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
shpc$datetime <- as.POSIXlt(paste(as.Date(shpc$Date,format="%d/%m/%Y"), shpc$Time, sep=" "))


## Print the plots

par(mfrow= c(2,2))
with(shpc, {
    plot(shpc$datetime, shpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(shpc$datetime, shpc$Voltage, type="l", ylab="Voltage", xlab="datetime")
    
    plot(shpc$datetime, shpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    with(shpc, lines(datetime,Sub_metering_2, col="red"))
    with(shpc, lines(datetime,Sub_metering_3, col="blue"))
    legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       y.intersp=0.5, xjust=1, yjust=1)
    
    plot(shpc$datetime, shpc$Global_active_power, type="l", ylab="Global_active_power", xlab="datetime")
})

## Export the plot4 in a png file

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()