#
# plot4
#
library(sqldf)
# Loading data
cat ("Loading data\n")
df <- read.csv.sql("data/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",header = TRUE, sep = ";")
sqldf() # close connection

# Converting time
df$Time <- strptime(paste(df$Date,df$Time),"%d/%m/%Y%H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Creating plot file
fname = "plot4.png"
cat(sprintf("Creating '%s' file\n",fname))
png(filename=fname)
par(mfcol=c(2,2))
with(df,{
  # first
  plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatss)")

  # second
  plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black")
  lines(Time,Sub_metering_2,,col="red")
  lines(Time,Sub_metering_3, col="blue")
  legend("topright",bty="n", lty=1 ,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # third
  plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage")

  # fourth
  plot(Time,Global_reactive_power,type="l",xlab="datetime")
})
dev.off()
cat(sprintf("File '%s' created\n",fname))