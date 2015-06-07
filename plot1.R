source('readData.R')

genPlot1 <- function(save=T) {
    
    xData = powData$Global_active_power
    title = 'Global Active Power'
    xLabel = 'Global Active Power (kilowatts)'
    color = 2
    w = 480
    h = 480

    par(bg='white')
    hist(xData, main=title, xlab=xLabel, col=color)
    if(save) {
        dev.copy(png,'plot1.png')
        dev.off()
    }
}
