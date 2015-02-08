#
# plot4
#

# sqldf package required
if(!require('sqldf')){
  install.packages('sqldf')
}
library(sqldf)

# Loading data
df <- read.csv.sql("data/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",header = TRUE, sep = ";")
sqldf() # close connection

# Converting date
datetime <- paste(as.Date(df$Date,"%d/%m/%Y"), df$Time)
df$Datetime <- as.POSIXct(datetime)

# Creating plot file
fname = "plot4.png"
png(filename=fname)
par(mfcol=c(2,2))
with(df,{
  # first
  plot(Datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

  # second
  plot(Datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black")
  lines(Datetime,Sub_metering_2,,col="red")
  lines(Datetime,Sub_metering_3, col="blue")
  legend("topright",bty="n", lty=1 ,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # third
  plot(Datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")

  # fourth
  plot(Datetime,Global_reactive_power,type="l",xlab="datetime")
})
dev.off()
cat(sprintf("File '%s' created\n",fname))