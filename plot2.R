#!/usr/bin/Rscript

library(data.table)
tab <- fread('household_power_consumption.txt', na.strings='?')
tab$Date <- as.Date(tab$Date, "%d/%m/%Y")
tab <- tab[tab$Date>='2007-02-01' & tab$Date<='2007-02-02']
tab$Timestamp <- as.POSIXct(paste(tab$Date, tab$Time), format="%Y-%m-%d %H:%M:%S")
png('plot2.png')
plot(tab$Timestamp, tab$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()

