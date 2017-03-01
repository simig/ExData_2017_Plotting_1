df <- read.csv('household_power_consumption.txt', sep=';', colClasses = c("character", "character", 'double', 'double', 'double', 'double', 'double', 'double', 'numeric'), na.strings='?')

df$DateTime <- strptime(paste(df$Date, ' ', df$Time), format='%d/%m/%Y %H:%M:%S')
df$Date = as.Date(df$Date, format='%d/%m/%Y')
df <- df[df$DateTime$year == 107 & df$DateTime$mon == 1 & (df$DateTime$mday == 1 | df$DateTime$mday == 2),] # number of years since 1900
df$Day <- as.factor(weekdays(df$Date))
png("plot3.png",width=480,height=480,units="px")
plot(df$DateTime, df$Sub_metering_1, xlab='', ylab='Energy sub metering', type='l' )
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'blue', 'red'), lwd=c(1,1,1))
dev.off()