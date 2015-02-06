#
# plot2
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
fname = "plot2.png"
cat(sprintf("Creating '%s' file\n",fname))
png(filename=fname)
plot(df$Time,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatss)")
dev.off()
cat(sprintf("File '%s' created\n",fname))