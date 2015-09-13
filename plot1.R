## Reads data, including missing values
y <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                na.strings=c("?"))

y <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                na.strings=c("?"))

## Creates combined date and time variable in readable format
y$DateTime <- paste(y$Date, y$Time)
y$DateTime <- strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")

## Converts date to more readable format
y$Date <- as.Date(y$Date, "%d/%m/%Y")

## Creates a subset with only the relevant dates
z <- subset(y, Date >= "2007-02-01" & Date <= "2007-02-02")

## Creates png of specified name and size
png(filename = "plot1.png", width = 480, height = 480)

## Creates histogram with red bars, specified titles
hist(z$Global_active_power, col="red", xlab = "Global Active Power
     (kilowatts)", main = "Global Active Power")

## Close graphic device
dev.off()
