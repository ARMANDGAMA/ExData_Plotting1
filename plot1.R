#Creando el subset

data <- "household_power_consumption.txt"
df <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

#Creando el gráfico
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(datasub$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
title(main = "Global Active Power")
dev.off()