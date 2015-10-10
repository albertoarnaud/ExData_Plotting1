plot3 <- function() {
      
      file <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?", ""), sep=";")
      file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
      file$timetemp <- paste(file$Date, file$Time)
      file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
      
      data <- subset(file, file$Date == "2007-02-01" | file$Date == "2007-02-02")
      
      png("plot3.png", width = 480, height = 480, units = "px")
      plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(data$Time, data$Sub_metering_2, type = "l", col="red")     
      lines(data$Time, data$Sub_metering_3, type = "l", col="blue")
      legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      dev.off()
}