#Creando el subset

data <- "household_power_consumption.txt"
df <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


datasub$datetime <- strptime(paste(datasub$Date, datasub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")



#Creando el gráfico
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(datasub,{
  plot(datasub$datetime, as.numeric(datasub$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
  plot(datasub$datetime, as.numeric(datasub$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datasub$datetime, datasub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    with(datasub, lines(datetime, as.numeric(Sub_metering_1)))
    with(datasub, lines(datetime, as.numeric(Sub_metering_2), col = "red"))
    with(datasub, lines(datetime, as.numeric(Sub_metering_3), col = "blue"))
    legend("topright", lty = 1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(datasub$datetime, as.numeric(datasub$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()