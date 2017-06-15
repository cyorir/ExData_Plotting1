# assume dplyr is installed
suppressMessages(library(dplyr))
# household_power_consumption.csv should be in the working directory
dat <- read.csv("household_power_consumption.csv", sep = ";")
#dplyr used for filter and mutate
dat <- filter(dat, Date =="1/2/2007" | Date == "2/2/2007")
dat <- mutate(dat, Global_active_power = as.numeric(as.character(Global_active_power)))
# plot will be output to working directory
png("plot1.png")
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()