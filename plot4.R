require(tidyverse)
require(lubridate)

tempdata<-fread("household_power_consumption.txt", na.strings = "?")

# Select only the rows that correspond to our dates of interest ,
# then create a datetime column to use as the x variable in the plot
data <- filter(tempdata, (tempdata$Date == "1/2/2007" | tempdata$Date == "2/2/2007")) %>%
  mutate(datetime = dmy_hms(paste(Date, Time)))

png("plot4.png") 

par(mfcol = c(2,2))

# Top left plot (basically the same as plot2)
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# Bottom left plot (same as plot3)
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c(names(data)[7:9]), lty = 1, col = c("black", "red", "blue"))

# Top right plot
plot(data$datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Bottom right plot
plot(data$datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
