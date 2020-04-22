#Creando el subset

data <- "household_power_consumption.txt"
df <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


datasub$datetime <- strptime(paste(datasub$Date, datasub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Creando el gráfico
png("plot2.png", width = 480, height = 480)
plot(datasub$datetime, as.numeric(datasub$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()