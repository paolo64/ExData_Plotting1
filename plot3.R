#
# plot3
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
fname = "plot3.png"
png(filename=fname, width = 480, height = 480)
plot(df$Datetime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black")
lines(df$Datetime,df$Sub_metering_2,col="red")
lines(df$Datetime,df$Sub_metering_3, col="blue")

legend("topright",lty=1 ,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
cat(sprintf("File '%s' created\n",fname))