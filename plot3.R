require(tidyverse)
require(lubridate)

tempdata<-fread("household_power_consumption.txt", na.strings = "?")

# Select only the rows that correspond to our dates of interest ,
# then create a datetime column to use as the x variable in the plot
data <- filter(tempdata, (tempdata$Date == "1/2/2007" | tempdata$Date == "2/2/2007")) %>%
  mutate(datetime = dmy_hms(paste(Date, Time)))


png("plot3.png")  

# Initialize the plot with sub metering 1
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")

# Then add sub metering 2 and 3
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")

# Finally, add the legend
legend(x = "topright", legend = c(names(data)[7:9]), lty = 1, col = c("black", "red", "blue"))
dev.off()