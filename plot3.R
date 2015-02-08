## Plot3: timeline

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


## Print the plot in a png file

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(shpc$datetime, shpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
with(shpc, lines(datetime,Sub_metering_2, col="red"))
with(shpc, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()