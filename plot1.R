#
# plot1
#
library(sqldf)
# Loading data
cat ("Loading data\n")
df <- read.csv.sql("data/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",header = TRUE, sep = ";")
sqldf() # close connection

# Creating plot file
fname = "plot1.png"
cat(sprintf("Creating '%s' file\n",fname))
png(filename=fname)
p1 <- hist(df$Global_active_power)
plot(p1,col="red",main="Global Active Power", xlab="Global Active Power (kilowatss)")
dev.off()
cat(sprintf("File '%s' created\n",fname))