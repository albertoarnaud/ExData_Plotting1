plot1 <- function() {

      #loads the dataset and casts date and time values
      file <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?", ""), sep=";")
      file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
      file$timetemp <- paste(file$Date, file$Time)
      file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
      
      #subsets the dataset on the 2 in scope dates 
      data <- subset(file, file$Date == "2007-02-01" | file$Date == "2007-02-02")
      
      # opens a png device, plots the graph and closes the device 
      png("plot1.png", width = 480, height = 480, units = "px")
      hist(data$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", 
           main = "Global Active Power")
      dev.off()
}
