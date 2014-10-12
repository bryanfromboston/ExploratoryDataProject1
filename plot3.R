source("getData.R")


plot3 <- function() {

  # Get data
  if (!exists("DF")) {
    DF <- getData()  
  }
  
  #Saving to PNG
  png(filename="plot3.png", width=480, height=480)
  
  with(DF, {
    # Line plot, with x-axis label defined and the x-axis label blanked
    plot(DF$Time, DF$Sub_metering_1,
         type="l",
         ylab="Energy sub metering",
         xlab="")
    # Second line (red)
    lines(DF$Time, DF$Sub_metering_2, col="red")
    
    # Third line (blue)
    lines(DF$Time, DF$Sub_metering_3, col="blue")
    
    # Add the legend to the top right
    legend("topright",
           lty=c(1,1,1),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"))
    
  })
  dev.off()
}