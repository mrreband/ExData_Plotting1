plot2 <- function() {
    #read data
    d <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

    #filter by date ("We will only be using data from the dates 2007-02-01 and 2007-02-02")
    d <- subset(d, d$Date=="1/2/2007" | d$Date=="2/2/2007")

    #setup png device
    png(filename="plot2.png", width = 480, height = 480, units = "px", pointsize = 12)

    #create line graph
    plot(d$Global_active_power,
         type="l"
         , axes="F"
         , xlab="", ylab="Global Active Power (kilowatts)"
         )

    #set x-axis tick marks
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)

    #set y-axis tick marks
    axis(2,at=c(0,2,4,6), lwd=0, lwd.ticks=1)

    #add a box!
    box()

    #close device
    dev.off()
}