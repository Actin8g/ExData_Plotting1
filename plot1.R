require(tidyverse)
require(data.table)

tempdata<-fread("household_power_consumption.txt", na.strings = "?")

# Select only the rows that correspond to our dates of interest and remove NAs from Global Active Power
data <- filter(tempdata, (tempdata$Date == "1/2/2007" | tempdata$Date == "2/2/2007") & !is.na(tempdata$Global_active_power))

# Exclude outliers greater than 6, which are not to be plotted
global_active_pwr <- data$Global_active_power[data$Global_active_power <= 6]

png("plot1.png")
hist(global_active_pwr, freq = T, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
