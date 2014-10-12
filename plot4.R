source("getData.R")

plot4 <- function() {
  if (!exists("DF")) {
    DF <- getData()  
  }
  
  png(filename="plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))
  with(DF, {
    # First Graph
    plot(DF$Time, DF$Global_active_power,
         type="l",
         ylab="Global Active Power",
         xlab="")
    
    #Second graph
    plot(DF$Time, DF$Voltage,
         type="l",
         ylab="Voltage",
         xlab="datetime")
    
    # Third Graph
    plot(DF$Time, DF$Sub_metering_1,
         type="l",
         ylab="Energy sub metering",
         xlab="")
    lines(DF$Time, DF$Sub_metering_2, col="red")
    lines(DF$Time, DF$Sub_metering_3, col="blue")
    legend("topright",
           lty=c(1,1,1),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),
           bty="n"
    )
    
    #Fourth Graph
    plot(DF$Time, DF$Global_reactive_power,
         type="l",
         ylab="Global_reactive_power",
         xlab="datetime")
    
  })
  dev.off()  
}
