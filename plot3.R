#!/usr/bin/Rscript

library(data.table)
tab <- fread('household_power_consumption.txt', na.strings='?')
tab$Date <- as.Date(tab$Date, "%d/%m/%Y")
tab <- tab[tab$Date>='2007-02-01' & tab$Date<='2007-02-02']
tab$Timestamp <- as.POSIXct(paste(tab$Date, tab$Time), format="%Y-%m-%d %H:%M:%S")

png('plot3.png')

plot(tab$Timestamp, tab$Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering')
lines(tab$Timestamp, tab$Sub_metering_2, type='l', col='red')
lines(tab$Timestamp, tab$Sub_metering_3, type='l', col='blue')
legend('topright', lty=1, col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()

