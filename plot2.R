source('readData.R')

makePlot2 <- function(save=F) {
	
	par(bg='white', mar=c(3.0,5.0,1.0,1.0))
	
    with(powData, plot(
        x    = datetime,
        y    = Global_active_power,
        xlab = '',
        ylab = 'Global Active Power (kilowatts)',
        col  = 'black',
        type = 'l'
    ))
    
    if(save) {
    	dev.copy(png, 'plot2.png')
    	q <- dev.off()
    }
}
