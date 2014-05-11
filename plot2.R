electricity <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
data <- electricity[electricity$Date == "1/2/2007" | electricity$Date == "2/2/2007",]

date <- as.character(data$Date)
time <- as.character(data$Time)
datetime<-paste(date, time)
data$dateObj<-as.POSIXct(strptime(datetime, "%d/%m/%Y %T"))

png(filename = "plot2.png", width = 480, height = 480, units = "px") 
Sys.setlocale(locale = "C")
with(data, plot(Global_active_power ~ dateObj, ylab = "Global Active Power(kilowats)", xlab = "", type="l"))
dev.off()