plot4 <- function() {
      
      file <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?", ""), sep=";")
      file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
      file$timetemp <- paste(file$Date, file$Time)
      file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
      
      data <- subset(file, file$Date == "2007-02-01" | file$Date == "2007-02-02")
      
      png("plot4.png", width = 480, height = 480, units = "px")
     
      par(mfrow = c(2,2))
      with(data, {
      plot(Time, Global_active_power, type = "l", ylab="Global Active Power", xlab="")
      
      plot(Time, Voltage, type = "l", ylab="Voltage", xlab="datetime")
      
      plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(Time, Sub_metering_2, type = "l", col="red")     
      lines(Time, Sub_metering_3, type = "l", col="blue")
      legend("topright", bty= "n", lty=c(1,1,1), col=c("black", "red", "blue"), 
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      plot(Time, Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")
      })
      
      dev.off()
}