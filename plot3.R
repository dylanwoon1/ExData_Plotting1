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

## Generate Plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})

## Insert legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
