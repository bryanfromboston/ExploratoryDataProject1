# This function returns a data.frame created from parsing the
# "Individual household electric power consumption Data Set" from
# the UC Irvine Machine Learning Repository.

# TODO: Try to download using readLine() and only save the specific days needed

getData <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  temp <- tempfile()
  download.file(url,temp, method="curl")
  DF <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", na.strings = "?", header=TRUE)
  unlink(temp)
  
  #Convert time to a datetime string
  DF$Time <- paste(DF$Date, DF$Time)
  # Convert time to a Date object
  DF$Time <- strptime(DF$Time, "%d/%m/%Y %H:%M:%S")
  
  # Convert Date to a date object for subsetting
  DF$Date <- as.Date(DF$Date, "%d/%m/%Y")  
  
  #Subset from and to
  from <- as.Date("2007-02-01")
  to <- as.Date("2007-02-02")
  
  # Return the subset
  DF[which(DF$Date >= from & DF$Date <= to ), ]
  
}