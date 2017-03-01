df <- read.csv('household_power_consumption.txt', sep=';', colClasses = c("character", "character", 'double', 'double', 'double', 'double', 'double', 'double', 'numeric'), na.strings='?')

df$DateTime <- strptime(paste(df$Date, ' ', df$Time), format='%d/%m/%Y %H:%M:%S')
df <- df[df$DateTime$year == 107 & df$DateTime$mon == 1 & (df$DateTime$mday == 1 | df$DateTime$mday == 2),] # number of years since 1900
png("plot1.png",width=480,height=480,units="px")
hist(df$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power' )
dev.off()