## Load the entire dataset
load1 <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                  na.strings = "?", nrows = 2075259, check.names = F, 
                  stringsAsFactors = F, comment.char = "", quote = '\"')

## Identify the date format in load1
load1$Date <- as.Date(load1$Date, format = "%d/%m/%Y")

## Subset the data
data <- subset(load1, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove load1 and focus on the new var, data.
rm(load1)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)

## Define the x-axis for Plot 3
data$Datetime <- as.POSIXct(datetime)

## Generate Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,1,0))

with(data, {
  
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power")
  
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ Datetime, col = "Red")
  lines(Sub_metering_3 ~ Datetime, col = "Blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
  
})