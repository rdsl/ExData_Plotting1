#!/usr/bin/Rscript

library(data.table)
tab <- fread('household_power_consumption.txt', na.strings='?')
tab$Date <- as.Date(tab$Date, "%d/%m/%Y")
tab <- tab[tab$Date>='2007-02-01' & tab$Date<='2007-02-02']
png('plot1.png')
hist(tab$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()

