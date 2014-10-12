source("getData.R")


plot2 <- function() {

  # Get data
  if (!exists("DF")) {
    DF <- getData()  
  }
  
  # Save to PNG
  png(filename="plot2.png", width=480, height=480)
  with(DF, {
    
    # Plot line graph, with x-axis blank and y-axis defined
    plot(DF$Time, DF$Global_active_power,
         type="l",
         ylab="Global Active Power (kilowatts)",
         xlab="")
    
  })
  dev.off()
}
