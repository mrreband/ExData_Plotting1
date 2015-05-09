plot1 <- function() {
    #read data
    d <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

    #filter by date ("We will only be using data from the dates 2007-02-01 and 2007-02-02")
    d <- subset(d, d$Date=="1/2/2007" | d$Date=="2/2/2007")

    #setup png device
    png(filename="plot1.png", width = 480, height = 480, units = "px", pointsize = 12)

    #create histogram
    hist(d$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         xlim=c(0,8),
         xaxp=c(0,6,3),
         ylim=c(0,1200),
         col="red",
         breaks=12)

    #close device
    dev.off()
}