# requires dplyr
suppressMessages(library(dplyr))
# household_power_consumption.csv should be in the working directory
dat <- read.csv("household_power_consumption.csv", sep = ";")
# dplyr used for filter and mutate
# select only the desired dates
dat <- filter(dat, Date =="1/2/2007" | Date == "2/2/2007")
# global_active_power is read in as a factor
# convert it to character string, then numeric
dat <- mutate(dat, Global_active_power = as.numeric(as.character(Global_active_power)))
# first, paste together date and time variables
# second, interpret the resulting string as a POSiXct variable
dat <- mutate(dat, dtime = as.POSIXct(strptime(paste(as.character(Date), as.character(Time)), format = "%d/%m/%Y %H:%M:%S")))
# plot will be output to working directory
png("plot2.png")
plot(dat$dtime, dat$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()