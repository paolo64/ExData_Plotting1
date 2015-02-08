#
# plot1
#

# sqldf package required
if(!require('sqldf')){
  install.packages('sqldf')
}
library(sqldf)

# Loading data
df <- read.csv.sql("data/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",header = TRUE, sep = ";")
sqldf() # close connection

# Creating plot file
fname = "plot1.png"
png(filename=fname, width = 480, height = 480)
h1 <- hist(df$Global_active_power)
plot(h1,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
cat(sprintf("File '%s' created\n",fname))