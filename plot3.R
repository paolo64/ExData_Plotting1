#
# plot3
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
fname = "plot3.png"
cat(sprintf("Creating '%s' file\n",fname))
png(filename=fname)
plot(df$Time,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black")
lines(df$Time,df$Sub_metering_2,,col="red")
lines(df$Time,df$Sub_metering_3, col="blue")

legend("topright",lty=1 ,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
cat(sprintf("File '%s' created\n",fname))