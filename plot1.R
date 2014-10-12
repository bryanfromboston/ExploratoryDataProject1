source("getData.R")

plot1 <- function() {
  
  # Get data
  if (!exists("DF")) {
    DF <- getData()  
  }
 
  #Saving to PNG
  png(filename="plot1.png", width=480, height=480)
  with(DF, {
    # Histogram plot, with the main title and the x-axis label defined
    # and colored red
    hist(DF$Global_active_power, 
         main=paste("Global Active Power"), 
         xlab=paste("Global Active Power (kilowatts)"), 
         col="red") 
  })
  dev.off()
}

