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
png(filename = "plot4.png", width = 480, height = 480)

## Creates space for four charts, 2x2, filling by column
par(mfcol = c(2,2))

## Chart 1
## Chart 1: creates, no actual data
plot(z$DateTime, z$Global_active_power, xlab = "",
     ylab = "Global Active Power", main = "", type = "n")
## Chart 1: joins the dots
lines(z$DateTime, z$Global_active_power)

## Chart 2
## Chart 2: creates, no actual data
plot(z$DateTime, z$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", main = "", type = "n")
## Chart 2: joins the dots in each colour
lines(z$DateTime, z$Sub_metering_1)
lines(z$DateTime, z$Sub_metering_2, col = "red")
lines(z$DateTime, z$Sub_metering_3, col = "blue")
## Chart 2: adds legend
legend("topright", col = c("black", "red", "blue"), legend = 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1,
       bty = "n")

## Chart 3
## Chart 3: creates, no actual data
plot(z$DateTime, z$Voltage, xlab = "datetime",
     ylab = "Voltage", main = "", type = "n")
## Chart 4: joins the dots
lines(z$DateTime, z$Voltage)

## Chart 4
## Chart 4: creates, no actual data
plot(z$DateTime, z$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", main = "", type = "n")
## Chart 4: joins the dots
lines(z$DateTime, z$Global_reactive_power)

## Close graphic device
dev.off()
