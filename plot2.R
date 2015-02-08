## Plot2: timeline

## Download and unzip the data file

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="exdata_data_household_power_consumption.zip", method="curl")
untar('exdata_data_household_power_consumption.zip')


## Load the file and subset the data for the two days asked
## The same as plot1.R

hpc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, dec=".", fill=TRUE)
shpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]

## Create a new datetime column and print the plot

shpc$datetime <- as.POSIXlt(paste(as.Date(shpc$Date,format="%d/%m/%Y"), shpc$Time, sep=" "))
plot(shpc$datetime, shpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Export the plot2 in a png file

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()