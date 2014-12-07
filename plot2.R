data <- read.table(file = ".\\data\\household_power_consumption.txt", sep=";",
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?", header=TRUE) ## store raw data

## concatenate and format date and time 

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data[[1]] <- as.Date(data[[1]],"%d/%m/%Y") ## format date

data[[2]] <- strptime(data[[2]], "%H:%M:%S")

## store required subset

powerConsum <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 

rm(data) ## drop raw data

par(mfrow=c(1,1))

plot(powerConsum$DateTime,powerConsum$Global_active_power,type = "l",
     xlab="", ylab="Global Active Power (kilowatts)" ) ## create plot

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") ## save PNG

dev.off() ## close PNG device
