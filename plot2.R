df <- read.csv('household_power_consumption.txt', sep=';', colClasses = c("character", "character", 'double', 'double', 'double', 'double', 'double', 'double', 'numeric'), na.strings='?')

df$DateTime <- strptime(paste(df$Date, ' ', df$Time), format='%d/%m/%Y %H:%M:%S')
df$Date = as.Date(df$Date, format='%d/%m/%Y')
df <- df[df$DateTime$year == 107 & df$DateTime$mon == 1 & (df$DateTime$mday == 1 | df$DateTime$mday == 2),] # number of years since 1900
df$Day <- as.factor(weekdays(df$Date))
png("plot2.png",width=480,height=480,units="px")
plot(df$DateTime, df$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type='l' )
dev.off()