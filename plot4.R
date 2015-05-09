plot4 <- function() {
    #read data
    d <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

    #filter by date ("We will only be using data from the dates 2007-02-01 and 2007-02-02")
    d <- subset(d, d$Date=="1/2/2007" | d$Date=="2/2/2007")

    #setup png device
    png(filename="plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

    #setup device for 4 plots
    par(mfcol=c(1,1))
    par(mfrow=c(2,2))
    par(oma = c(0,0,0,0), mar = c(5,4,2,2))

    ###############################################
    #Create the first plot
    plot(d$Global_active_power,
         type="l"
         , axes="F"
         , xlab="", ylab="Global Active Power"
    )
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)
    axis(2,at=c(0,2,4,6), lwd=0, lwd.ticks=1)
    box()
    #################################################

    ###############################################
    #Create the second plot
    plot(d$Voltage,
         type="l"
         , axes="F"
         , xlab="datetime", ylab="Voltage"
    )
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)
    axis(2,at=c(234,238,242,246), lwd=0, lwd.ticks=1)
    axis(2,at=c(236,240,244), lwd=0, lwd.ticks=1, labels=c("","",""))
    box()

    #################################################
    ###############################################
    #Create the third plot

    plot(d$Global_active_power, type="n", axes="F", xlab="", ylab="Energy sub metering", ylim=c(0,40))
    lines(d$Sub_metering_1, type = "l", col="black")
    lines(d$Sub_metering_2, type = "l", col="red")
    lines(d$Sub_metering_3, type = "l", col="blue")
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)
    axis(2,at=c(0,10,20,30), lwd=0, lwd.ticks=1)
    box()
    legend("topright"
           ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           ,lty=c(1,1,1)
           ,lwd=c(1,1,1)
           ,col=c("black","red","blue")
           ,bty="n"
           ,cex=0.9
    )

    #################################################
    ###############################################
    #Create the fourth plot

    plot(d$Global_reactive_power,
         type="l"
         , axes="F"
         , xlab="datetime", ylab="Global_reactive_power"
    )
    par(tcl= -0.5)
    axis(1, at=c(1,1440,2880), labels=c("Thurs","Fri","Sat"), lwd=0, lwd.ticks=1)
    axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5), lwd=0, lwd.ticks=1)
    box()

    #################################################

    #close device
    dev.off()
}