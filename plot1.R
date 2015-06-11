source('readData.R')

makePlot1 <- function(save=F) {
    
    par(bg='white')

    with(powData, hist(
        Global_active_power,
        main = 'Global Active Power',
        xlab = 'Global Active Power (kilowatts)',
        col  = 'red'
    ))

    if(save) {
        dev.copy(png,'plot1.png')
        q <- dev.off()
    }
}
