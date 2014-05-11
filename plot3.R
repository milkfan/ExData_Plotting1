electricity <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
data <- electricity[electricity$Date == "1/2/2007" | electricity$Date == "2/2/2007",]

date <- as.character(data$Date)
time <- as.character(data$Time)
datetime<-paste(date, time)
data$dateObj<-as.POSIXct(strptime(datetime, "%d/%m/%Y %T"))

png(filename = "plot3.png", width = 480, height = 480, units = "px") 
with(data, plot(Sub_metering_1 ~ dateObj, ylab = "Engergy Sub metering", xlab = "", type="n"))
with(data, points(Sub_metering_1 ~ dateObj, type="l"))
with(data, points(Sub_metering_2 ~ dateObj, type="l", col = "red"))
with(data, points(Sub_metering_3 ~ dateObj, type="l", col = "blue"))
legend("topright", col= c("black", "blue", "red"), cex = 0.95, lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()