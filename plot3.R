plot3 <- function() {
    #read data
    d <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

    #filter by date ("We will only be using data from the dates 2007-02-01 and 2007-02-02")
    d <- subset(d, d$Date=="1/2/2007" | d$Date=="2/2/2007")

    #setup png device
    png(filename="plot3.png", width = 480, height = 480, units = "px", pointsize = 12)

    #create an empty graph
    plot(d$Global_active_power,
         type="n"
         , axes="F"
         , xlab="", ylab="Energy sub metering"
         , ylim=c(0,40)
    )

    #add the line
    lines(d$Sub_metering_1, type = "l", col="black")
    lines(d$Sub_metering_2, type = "l", col="red")
    lines(d$Sub_metering_3, type = "l", col="blue")

    #set x-axis tick marks
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)

    #set y-axis tick marks
    axis(2,at=c(0,10,20,30), lwd=0, lwd.ticks=1)

    #add a box!
    box()

    #add a legend!
    legend("topright"
        ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        ,lty=c(1,1,1)
        ,lwd=c(1,1,1)
        ,col=c("black","red","blue")
    )

    #close device
    dev.off()
}