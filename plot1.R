electricity <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
data <- electricity[electricity$Date == "1/2/2007" | electricity$Date == "2/2/2007",]

png(filename = "plot1.png", width = 480, height = 480, units = "px") 
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowats)", ylab = "Frequency", col = "red"))
dev.off()