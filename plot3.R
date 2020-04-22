#Creando el subset

data <- "household_power_consumption.txt"
df <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


datasub$datetime <- strptime(paste(datasub$Date, datasub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Creando el gráfico
png("plot3.png", width = 480, height = 480)
plot(datasub$datetime, datasub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(datasub, lines(datetime, as.numeric(Sub_metering_1)))
with(datasub, lines(datetime, as.numeric(Sub_metering_2), col = "red"))
with(datasub, lines(datetime, as.numeric(Sub_metering_3), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
dev.off()