# requires dplyr
suppressMessages(library(dplyr))
# household_power_consumption.csv should be in the working directory
dat <- read.csv("household_power_consumption.csv", sep = ";")
# dplyr used for filter and mutate
# select only the desired dates
dat <- filter(dat, Date =="1/2/2007" | Date == "2/2/2007")
# sub_metering columns are read in as a factors
# convert them to character string, then numeric
dat <- mutate(dat, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
dat <- mutate(dat, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
dat <- mutate(dat, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
# first, paste together date and time variables
# second, interpret the resulting string as a POSiXct variable
dat <- mutate(dat, dtime = as.POSIXct(strptime(paste(as.character(Date), as.character(Time)), format = "%d/%m/%Y %H:%M:%S")))
# plot will be output to working directory
png("plot3.png")
plot(dat$dtime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$dtime, dat$Sub_metering_2, col = "red")
lines(dat$dtime, dat$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()