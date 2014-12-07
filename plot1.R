data <- read.table(file = ".\\data\\household_power_consumption.txt", sep=";",
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?", header=TRUE) ## store raw data

data[[1]] <- as.Date(data[[1]],"%d/%m/%Y") ## Format date

data[[2]] <- strptime(data[[2]], "%H:%M:%S")

## extract required subset

powerConsum <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 

rm(data) ## drop raw data

par(mfrow=c(1,1))

hist(powerConsum$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red") ## draw histogram

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") ## save png

dev.off() ## close PNG device