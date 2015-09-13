## Reads data, including missing values
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
png(filename = "plot3.png", width = 480, height = 480)

## Creates the chart, but with no actual data
plot(z$DateTime, z$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", main = "", type = "n")

## Joins the dots in each colour
lines(z$DateTime, z$Sub_metering_1)
lines(z$DateTime, z$Sub_metering_2, col = "red")
lines(z$DateTime, z$Sub_metering_3, col = "blue")

## Adds legend
legend("topright", col = c("black", "red", "blue"), legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)

## Close graphic device
dev.off()
