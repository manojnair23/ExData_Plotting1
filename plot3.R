data <- read.table(file = ".\\data\\household_power_consumption.txt", sep=";",
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?", header=TRUE) ## store raw data

## concatenate and format date and time

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data[[1]] <- as.Date(data[[1]],"%d/%m/%Y") ## format date

data[[2]] <- strptime(data[[2]], "%H:%M:%S")

## extract necessary sub set

powerConsum <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

rm(data) ## drop raw data

par(mfrow=c(1,1), cex=0.75)

## create plot
with(powerConsum,{
  plot(DateTime,Sub_metering_1,type = "l", col="black", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2,type = "l", col="red")
  lines(DateTime, Sub_metering_3,type = "l", col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),
         col = c("black", "red", "blue"), lty=1, cex=0.75, adj =0.1)
})
     
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px") ## save PNG

dev.off() ## close PNG device
