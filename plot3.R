setwd("C:/Users/cam7de/Desktop/Coursera/06192016")
import_file <- "household_power_consumption.txt"
import <- read.table(import_file, header=TRUE, sep=";", nrows=2075259, stringsAsFactors=FALSE, dec=".")
import$Date <- as.Date(import$Date, format="%d/%m/%Y")
#head(import)
#change working dir to the one from github, separate from import zip location
setwd("C:/Users/cam7de/Desktop/Coursera/06192016/ExData_Plotting1")

#now that date field is in correct format, will just overwrite import dataset with subset of interest

import <- subset(import, Date=="2007-02-01" | Date=="2007-02-02",)

#write the plot 

#how to convert date and time into a datetime
#as.POSIXct(paste(x$date, x$time), format="%Y-%m-%d %H:%M:%S")

plot(as.numeric(import$Sub_metering_1)~as.POSIXct(paste(as.Date(import$Date), import$Time)),
     type="l",
     ylab="Energy Sub Metering",
     xlab=""
)
lines(as.numeric(import$Sub_metering_2)~as.POSIXct(paste(as.Date(import$Date), import$Time)),
      col="red")
lines(as.numeric(import$Sub_metering_3)~as.POSIXct(paste(as.Date(import$Date), import$Time)),
      col="blue")
legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, 
       lwd=3,
       xjust=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the output
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()