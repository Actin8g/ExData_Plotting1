require(tidyverse)
require(lubridate)

tempdata<-fread("household_power_consumption.txt", na.strings = "?")

# Select only the rows that correspond to our dates of interest and remove NAs from Global Active Power,
# then create a datetime column to use as the x variable in the plot
data <- filter(tempdata, (tempdata$Date == "1/2/2007" | tempdata$Date == "2/2/2007") & !is.na(Global_active_power)) %>%
  mutate(datetime = dmy_hms(paste(Date, Time)))

png("plot2.png")  
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()


