#
# plot2
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
fname = "plot2.png"
png(filename=fname, width = 480, height = 480)
plot(df$Datetime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
cat(sprintf("File '%s' created\n",fname))