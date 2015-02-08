## Plot1: histogram

## Download and unzip the data file

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="exdata_data_household_power_consumption.zip", method="curl")
untar('exdata_data_household_power_consumption.zip')


## Load the file, subset the data for the two days asked and print the histogram

hpc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, dec=".", fill=TRUE)
shpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hist(shpc$Global_active_power, breaks=12, col=2, border=1, main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Export the plot1 in a png file

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()